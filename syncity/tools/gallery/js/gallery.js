/*===============================
* Images Gallery v 1.2.5
* Copyright: Cvedia (C) 2018
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
		curImage = 1,
		curType = 'rgb',
		showBox = false,
		playing = false,
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
	viewButtons = $('.galTopLeft button', gal).on('click', onViewType);
	boxButton = $('.galTopRight #btnBBox', gal).on('click', onShowBoxes);
	input = $('.galTopMid input', gal).on('change', onInputChange);
	playButton = $('.iconPlay', gal).on('click', onPlayClick);
	$('.iconLeft', gal).on('click', onLeftClick);
	$('.iconRight', gal).on('click', onRightClick);
	$(window).on('keydown', onKeyDown);
	
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
		boxes.toggle();
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
		drawBoxes();
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
		boxes.css({
			width: image[0].naturalWidth+'px',
			height: image[0].naturalHeight+'px'
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
}
