/*===============================
* Images Gallery v 1.3.2
* Copyright: Cvedia (C) 2018-2019
*================================*/

var gallery,
	ifocus = false,
	images2idx = {},
	meta2idx = [];

$(init);

function init() {
	try {
		for (var i in images) {
			images2idx[i] = [];
			
			for (var j in images[i])
				images2idx[i].push(j);
		}
	} catch (z) {}
	
	try {
		for (var i in meta)
			meta2idx.push(i);
	} catch (z) {}
	
	$('input')
		.on('focus', function(){ ifocus = true; })
		.on('blur', function(){ ifocus = false; });
	
	gallery = new ImagesGallery();
}

function ImagesGallery() {
	var gal, viewButtons, image, boxButton, input, name, meta_name, boxes, playButton, timer,
		centerPoint, canvasCtx,
		sortedPoints = {},
		iwidth = 0,
		iheight = 0,
		curImage = 1,
		curType = 'rgb',
		showBox = false,
		playing = false,
		showPoints = true,
		spread = 100, // graph spread
		slideTime = 33.34; // 30 fps
	
	if (typeof images[curType] == 'undefined') {
		for (var i in images) {
			curType = i;
			break;
		}
	}
	
	// Init gallery
	
	gal = $('.galWrapper');
	image = $('.galImage img', gal).on('load', onImageLoad);
	name = $('.galBotLeft', gal);
	meta_name = $('.galBotRight', gal);
	boxes = $('.galBoxes', gal);
	canvasCtx = $('#galCanvas')[0].getContext('2d');
	viewButtons = $('.galTopLeft button', gal).on('click', onViewType);
	boxButton = $('.galTopRight #btnBBox', gal).on('click', onShowBoxes);
	input = $('.galTopMid input', gal).on('change', onInputChange);
	playButton = $('.iconPlay', gal).on('click', onPlayClick);
	$('.iconLeft', gal).on('click', onLeftClick);
	$('.iconRight', gal).on('click', onRightClick);
	$(window).on('keydown', onKeyDown);
	$('.galTopRight #btnPoints', gal).on('click', onShowPoints);
	
	$('#btnGraphs').on('click', function(){
		graphsVisible = !graphsVisible;
		
		if (graphsVisible) {
			$('#btnGraphs').addClass('act');
			$('.graphContainer').removeClass('dct');
		} else {
			$('#btnGraphs').removeClass('act');
			$('.graphContainer').addClass('dct');
		}
	});
	
	graphs = [];
	graphHighlight = null;
	graphsVisible = false;
	initGraphs();
	
	function initGraphs() {
		if (typeof meta_other == 'undefined')
			return;
		
		var data = {},
				t = 0, w = 0,
				html = "";
		
		for (var k in meta_other) {
			html += "<div id=\"" + k + "\"></div>";
			data[k] = { graph: [], label: []};
			t++;
			for (var i in meta_other[k]) {
				var bit = [ new Date(parseFloat(i)) ],
						label = [ "Date" ];
				
				for (var j in meta_other[k][i]) {
					if (j == "timestamp")
						continue;
					label.push(j);
					bit.push(parseFloat(meta_other[k][i][j]))
					
					/*
					if (meta_other[k][i][j].constructor == Array) {
						for (var m in meta_other[k][i][j]) {
							label.push(j + m);
							bit.push(parseFloat(meta_other[k][i][j][m]))
						}
					} else {
						label.push(j);
						bit.push(parseFloat(meta_other[k][i][j]))
					}
					*/
				}
				
				data[k]["graph"].push(bit);
				if (data[k]["label"].length == 0)
					for (var j = 0;j < label.length;j++)
						data[k]["label"].push(label[j]);
			}
		}
		
		$('.graphContainer').html(html);
		
		for (var k in data) {
			w++;
			var series = {}, axes = {y: { independentTicks: true, drawGrid: true } };
			
			for (var j = 1, m = data[k]["label"].length;j < m;j++) {
				series['Y' + j] = { axis: 'y'+ j };
				axes['y'+j] = { drawGrid: false, independentTicks: true }
			}
			
			//console.log("Series:", series, "axes:", axes);
			
			graphs.push(new Dygraph(
				$(".graphContainer > #" + k)[0],
				data[k]["graph"],
				{
					title: k,
					labels: data[k]["label"],
					legend: false,
					height: 100,
					showRangeSelector:false, // t == w,
					series: series,
					axes: axes,
					underlayCallback: function(canvas, area, g) {
						if (graphHighlight == null)
							return;
						
						var bottom_left = g.toDomCoords(graphHighlight, -20),
								top_right = g.toDomCoords(graphHighlight, +20),
								left = Math.ceil(bottom_left[0]),
								right = Math.ceil(top_right[0]);
						
						canvas.fillStyle = "rgba(255, 255, 102, 1.0)";
						canvas.fillRect(left, area.y, Math.max(1, right - left), area.h);
					}
				}
			));
		}
		
		if (graphs.length > 0) {
			Dygraph.synchronize(graphs, { selection: true, zoom: false, range: true });
			$('#btnGraphs').show();
			graphsVisible = true;
		} else {
			graphsVisible = false;
			$('.graphContainer').addClass('dct');
		}
	}
	
	viewButtons.eq(0).trigger('click');

	// Main functionality
	
	function onViewType(e) {
		viewButtons.removeClass('act');
		$(this).addClass('act');
		curType = $(this).data('type');
		updateImage();
	}
	
	function onShowBoxes(e) {
		showBox = !showBox;
		$(this).toggleClass('act');
		
		if (showBox) drawBoxes();
		else boxes.find('.bbox').remove();
	}
	
	function onShowPoints(e) {
		showPoints = !showPoints;
		$(this).toggleClass('act');
		
		if (showPoints) {
			drawPoints();
		} else {
			boxes.find('.point').remove();
			canvasCtx.clearRect(0, 0, iwidth, iheight);
		}
	}
	
	function onInputChange(e) {
		var val = parseInt(input.val());
		if (isNaN(val) || val < 1 || val > total_images) {
			input.val(curImage);
			return;
		}
		curImage = val;
		updateImage();
	}
	
	function updateMetaCol() {
		if (typeof meta_col == 'undefined' || typeof meta_col[curImage] == 'undefined')
			return;
		
		var pMeta = {}, bbs = {};
		
		for (var k in meta_col[curImage]) {
			// analyze data against plotting tools
			pMeta[k] = [];
			for (var m in meta_col[curImage][k]) {
				var hasMatch = false;
				pMeta[k].push(m + ':' + meta_col[curImage][k][m])
				
				// 3d bounding box
				try {
					var x = meta_col[curImage][k][m].match(/(\(\d+.\d+,\d+.\d+\)){8}/g)[0];
					hasMatch = true;
					x = x.slice(1,-1).split(')(');
					var bb = []
					for (var l in x) {
						var v2 = x[l].split(',');
						bb.push({x: parseFloat(v2[0]), y: parseFloat(v2[1])});
					}
					
					bbs[k] = bb;
				} catch (z) {}
			}
		}
		
		drawPoints3DBB(bbs);
		console.log('pMeta:', pMeta);
	}
	
	function updateImage() {
		var url = images[curType][images2idx[curType][curImage-1]],
				murl = meta_fn[meta2idx[curImage-1]],
				fancy_url, fancy_murl;
		
		try {
			fancy_url = url.split(url.indexOf('/') == -1 ? '\\' : '/').slice(-1)[0];
		} catch (z) {
			fancy_url = url;
		}
		
		if (meta2idx[curImage-1] != undefined) {
			try {
				fancy_murl = murl.split(murl.indexOf('/') == -1 ? '\\' : '/').slice(-1)[0];
			} catch (z) {
				fancy_murl = murl;
			}
		}
		
		try {
			if (graphs.length > 0 && graphsVisible) {
				var r = [ Math.max(0, curImage-spread-1), Math.min(curImage+spread,total_images-1)];
				if (total_images-1 > (spread * 2) && Math.abs(r[0] - r[1]) < (spread * 2)) {
					if (r[0] == 0)
						r[1] += (spread * 2) - (r[0] + r[1]);
					else if (r[1] >= total_images-1)
						r[0] = Math.max(0, total_images -(spread*2)-1);
					else
						r[0] = Math.max(0, r[0] - (spread * 2) - (r[0] + r[1]));
				}
				graphHighlight = new Date(parseFloat(images2idx[curType][curImage-1]));
				
				for (var i = 0, j = graphs.length;i < j;i++)
					graphs[i].updateOptions({
						dateWindow: [
							new Date(parseFloat(images2idx[curType][r[0]])),
							new Date(parseFloat(images2idx[curType][r[1]]))
						],
						valueRange: null
					});
			}
		} catch(z) {}
		
		name.html('<a href="'+url+'" target="_blank">'+fancy_url+'</a>');
		meta_name.html(meta2idx[curImage-1] == undefined ? '' : '<a href="'+murl+'" target="_blank">'+fancy_murl+'</a>');
		image.attr('src', url);
		
		if (showBox) drawBoxes();
		if (showPoints) drawPoints();
		
		updateMetaCol();
	}
	
	function onLeftClick() {
		if (curImage <= 1) return;
		curImage--;
		input.val(curImage);
		updateImage();
	}
	
	function onRightClick() {
		if (curImage >= total_images) return;
		curImage++;
		input.val(curImage);
		updateImage();
	}
	
	function onPlayClick() {
		playButton.toggleClass('playing');
		playing = playButton.hasClass('playing');
		
		if (playing) {
			timer = setTimeout(onSliderTimer, slideTime);
		} else {
			clearTimeout(timer);
		}
	}

	function onSliderTimer() {
		if (curImage < total_images) {
			onRightClick();
			timer = setTimeout(onSliderTimer, slideTime);
		} else {
			onPlayClick();
		}
	}
	
	function onImageLoad() {
		var redraw = false;
		
		if (iwidth != image[0].naturalWidth || iheight != image[0].naturalHeight)
			redraw = true;
		iwidth = image[0].naturalWidth;
		iheight = image[0].naturalHeight;
		
		if (redraw && showPoints) {
			canvasCtx.canvas.width = iwidth;
			canvasCtx.canvas.height = iheight;
			drawPoints();
		}
		
		boxes.css({
			width: iwidth+'px',
			height: iheight+'px'
		});
	}
	
	function drawBoxes() {
		var arr = meta[meta2idx[curImage-1]],
			t, l, b, r, c, j, field;
		
		boxes.find('.bbox').remove();
		
		// check if arr is valid
		if (arr == undefined)
			return;
		
		try {
			j = arr.length;
		} catch (z) {
			return;
		}
		
		for (var i = 0; i < j; i++) {
			if (typeof arr[i]['boxMin'] != 'undefined') { // old school bbox_* types
				if (typeof arr[i].boxMin == 'string')
					arr[i].boxMin = arr[i].boxMin.split(',');
				if (typeof arr[i].boxMax == 'string')
					arr[i].boxMax = arr[i].boxMax.split(',');
				
				unit = '%';
				if (
					arr[i].boxMin[0] <= 1 &&
					arr[i].boxMin[1] <= 1 &&
					arr[i].boxMax[0] <= 1 &&
					arr[i].boxMax[1] <= 1
				) {
					l = arr[i].boxMin[0]*100;
					t = arr[i].boxMin[1]*100;
					r = arr[i].boxMax[0]*100;
					b = arr[i].boxMax[1]*100;
				} else {
					unit = 'px';
					l = arr[i].boxMin[0];
					t = arr[i].boxMin[1];
					r = arr[i].boxMax[0];
					b = arr[i].boxMax[1];
				}
				
				c = classColors[arr[i].classId];
				
				boxes.append(
					'<div class="bbox tooltip" data-tooltip="x: ' + l + ',' + r + ' y: ' + t + ',' + b + ' w: ' + Math.abs(r-l) + ' h: ' + Math.abs(b-t) + ' id: '+arr[i].id+', classId: '+
					arr[i].classId + (typeof arr[i].visibility != 'undefined' ? ', visibility: ' + arr[i].visibility : '') + (typeof arr[i].numPoints != 'undefined' ? ', numPoints: '+arr[i].numPoints : '') + (typeof arr[i].confidence != 'undefined' ? ', confidence: ' + arr[i].confidence : '' )+
					'" style="' + (invert_bboxx ? 'bottom' : 'top') + ': '+t+unit+'; left: '+l+unit+'; width: '+(r-l)+
					unit+'; height: '+(b-t)+unit+'; border-color: '+c+';"></div>'
				);
			} else if (typeof arr[i]['xmin'] != 'undefined') { // SCBoundingBox structure
				unit = '%';
				if (
					arr[i].xmax <= 1 &&
					arr[i].xmin <= 1 &&
					arr[i].ymax <= 1 &&
					arr[i].ymin <= 1
				) {
					l = arr[i].xmin*100;
					t = arr[i].ymin*100;
					r = arr[i].xmax*100;
					b = arr[i].ymax*100;
				} else {
					unit = 'px';
					l = arr[i].xmin;
					t = arr[i].ymin;
					r = arr[i].xmax;
					b = arr[i].ymax;
				}
				
				c = classColors[arr[i].label];
				
				boxes.append(
					'<div class="bbox tooltip" data-tooltip="x: ' + l + ',' + r + ' y: ' + t + ',' + b + ' w: ' + Math.abs(r-l) + ' h: ' + Math.abs(b-t) + ' id: '+arr[i].timestamp+', classId: '+
					arr[i].label + (typeof arr[i].visibility != 'undefined' ? ', visibility: ' + arr[i].visibility : '') + (typeof arr[i].numPoints != 'undefined' ? ', numPoints: '+arr[i].numPoints : '') + (typeof arr[i].confidence != 'undefined' ? ', confidence: ' + arr[i].confidence : '' )+
					'" style="' + (invert_bboxx ? 'bottom' : 'top') + ': '+t+unit+'; left: '+l+unit+'; width: '+(r-l)+
					unit+'; height: '+(b-t)+unit+'; border-color: '+c+';"></div>'
				);
			} else {
				console.log('WARNING: Unknown bounding box structure:', arr[i]);
			}
		}
	}
	
	function drawPoints3DBB(objs) {
		var cnum = 0,
			arr, x, y, j, x1, y1;
		
		canvasCtx.clearRect(0, 0, iwidth, iheight);
		
		for (var key in objs) {
			arr = objs[key];
			if (arr == undefined) continue;
			
			try {
				j = arr.length;
			} catch (err) {
				continue;
			}
			
			x = arr[j-1].x * iwidth;
			y = arr[j-1].y * iheight;
			c = classColors[cnum];
			
			canvasCtx.strokeStyle = c;
			canvasCtx.beginPath();
			//canvasCtx.moveTo(x, invert_bboxx ? iheight-y : y);
						
			for (var i = 0; i < j; i++) {
				if (typeof arr[i]['x'] != 'undefined') {
					unit = '%';
					
					if (i == 0 || i == 4) {
						x = arr[i+4-1].x * iwidth;
						y = arr[i+4-1].y * iheight;
						canvasCtx.moveTo(x, invert_bboxx ? iheight-y : y);
					}
					
					x = arr[i].x * iwidth;
					y = arr[i].y * iheight;
					canvasCtx.lineTo(x, invert_bboxx ? iheight-y : y);
					
					if (i < 4) {
						x1 = arr[i+4].x * iwidth;
						y1 = arr[i+4].y * iheight;
						canvasCtx.lineTo(x1, invert_bboxx ? iheight-y1 : y1);
						canvasCtx.moveTo(x, invert_bboxx ? iheight-y : y);
					}
										
					x = arr[i].x * 100;
					y = arr[i].y * 100;
					
					if (x < 0 || y < 0 || x > 100 || y > 100)
						continue;
					
					var tData = [];
					for (var k in meta_col[curImage][key])
						tData.push(k + ':' + meta_col[curImage][key][k]);
					
					boxes.append(
						'<div class="point tooltip" data-tooltip="x: ' + x + unit + ' y: ' + y + unit + ' data: ' + tData.join('\n') +
						'" style="'+ (invert_bboxx ? 'bottom: ' : 'top: ') + y + unit +'; left: '+ x + unit +'; background-color: '+ c +';"></div>'
					);
				} else {
					console.log('WARNING: Unknown points structure:', arr[i]);
				}
			}
			
			cnum++;
			canvasCtx.closePath();
			canvasCtx.stroke();
		}
	}
	
	function drawPoints() {
		var idx = images2idx[curType][curImage-1],
			cnum = 0,
			prevAbsent = false,
			nextAbsent = false,
			arr, x, y, j;
		
		boxes.find('.point').remove();
		canvasCtx.clearRect(0, 0, iwidth, iheight);
		
		for (var key in meta_points) {
			arr = meta_points[key][idx];
			if (arr == undefined) continue;
			
			try {
				j = arr.length;
			} catch (err) {
				continue;
			}
			
			// disabled sorting to avoid (-1, -1) points loosing their original position in array
			// which results in drawing invalid connections between points
			
			/*if (!sortedPoints[key]) sortedPoints[key] = [];
			if (!sortedPoints[key][idx]) {
				sortedPoints[key][idx] = true;
				sortPointsClockwise(arr);
			}*/
			
			x = arr[j-1].x;
			y = arr[j-1].y;
			c = classColors[cnum];
			canvasCtx.strokeStyle = c;
			canvasCtx.beginPath();
			canvasCtx.moveTo(x, invert_bboxx ? iheight-y : y);
			prevAbsent = (x == -1 && y == -1);
			
			for (var i = 0; i < j; i++) {
				if (typeof arr[i]['x'] != 'undefined') {
					unit = 'px';
					x = arr[i].x;
					y = arr[i].y;
					nextAbsent = (x == -1 && y == -1);
					
					if (prevAbsent || nextAbsent)
						canvasCtx.moveTo(x, invert_bboxx ? iheight-y : y);
					else
						canvasCtx.lineTo(x, invert_bboxx ? iheight-y : y);
					
					prevAbsent = nextAbsent;
					
					if (x < 0 || y < 0 || x > iwidth || y > iheight)
						continue;
					
					boxes.append(
						'<div class="point tooltip" data-tooltip="x: ' + x + ' y: ' + y + ' type: '+ key +
						'" style="'+ (invert_bboxx ? 'bottom: ' : 'top: ') + y + unit +'; left: '+ x + unit +'; background-color: '+ c +';"></div>'
					);
				} else {
					console.log('WARNING: Unknown points structure:', arr[i]);
				}
			}
			
			cnum++;
			canvasCtx.closePath();
			canvasCtx.stroke();
		}
		
	}
	
	function onKeyDown(e) {
		switch (e.which) {
			case 32:
				e.preventDefault();
				e.stopPropagation();
				onPlayClick();
				break;
			case 37:
			case 65:
				e.preventDefault();
				onLeftClick();
				break;
			case 39:
			case 68:
				e.preventDefault();
				onRightClick();
				break;
			case 49: // 1
				if (!ifocus) { 
					e.preventDefault();
					try { $('.galTopLeft button').eq(0).click(); } catch (z) {}
				}
				break;
			case 50: // 2
				if (!ifocus) {
					e.preventDefault();
					try { $('.galTopLeft button').eq(1).click(); } catch (z) {}
				}
				break;
			case 51: // 3
				if (!ifocus) {
					e.preventDefault();
					try { $('.galTopLeft button').eq(2).click(); } catch (z) {}
				}
				break;
			case 52: // 4
				if (!ifocus) {
					e.preventDefault();
					try { $('.galTopLeft button').eq(3).click(); } catch (z) {}
				}
				break;
			case 53: // 5
				if (!ifocus) {
					e.preventDefault();
					try { $('.galTopLeft button').eq(4).click(); } catch (z) {}
				}
				break;
			case 66:
				try { $('.galTopRight button').click(); } catch (z) {}
				break;
		}
	}
	
	function sortPointsClockwise(points) {
		centerPoint = {x: 0, y: 0};
		for (var i = 0; i < points.length; i++) {
			centerPoint.x += points[i].x;
			centerPoint.y += points[i].y;
		}
		centerPoint.x /= points.length;
		centerPoint.y /= points.length;
		
		points.sort(pointsCompare);
	}
	
	function pointsCompare(a, b) {
		if (a.x >= 0 && b.x < 0) return 1;
	    else if (a.x == 0 && b.x == 0) return a.y - b.y;

	    var det = (a.x - centerPoint.x) * (b.y - centerPoint.y) - (b.x - centerPoint.x) * (a.y - centerPoint.y);
	    if (det < 0) return 1;
	    else if (det > 0) return -1;

	    var d1 = (a.x - centerPoint.x) * (a.x - centerPoint.x) + (a.y - centerPoint.y) * (a.y - centerPoint.y);
	    var d2 = (b.x - centerPoint.x) * (b.x - centerPoint.x) + (b.y - centerPoint.y) * (b.y - centerPoint.y);
	    return d1 - d2;
	}
}
