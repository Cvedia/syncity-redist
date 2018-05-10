/*===============================
* Images Gallery v 1.0.3
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
		slideTime = 500;
	
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
	boxButton = $('.galTopRight button', gal).on('click', onShowBoxes);
	input = $('.galTopMid input', gal).on('change', onInputChange);
	playButton = $('.iconPlay', gal).on('click', onPlayClick);
	$('.iconLeft', gal).on('click', onLeftClick);
	$('.iconRight', gal).on('click', onRightClick);
	$(window).on('keydown', onKeyDown);
	
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
				murl = meta_fn[meta2idx[curImage-1]];
		
		name.html('<a href="'+url+'" target="_blank">'+url+'</a>');
		meta_name.html('<a href="'+murl+'" target="_blank">'+murl+'</a>');
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
			t, l, b, r, c;
		
		boxes.find('.bbox').remove();
		for (var i = 0; i < arr.length; i++) {
			if (typeof arr[i].boxMin == 'string')
				arr[i].boxMin = arr[i].boxMin.split(',');
			if (typeof arr[i].boxMax == 'string')
				arr[i].boxMax = arr[i].boxMax.split(',');
			
			l = arr[i].boxMin[0]*100;
			t = arr[i].boxMin[1]*100;
			r = arr[i].boxMax[0]*100;
			b = arr[i].boxMax[1]*100;
			c = classColors[arr[i].classId];
			
			boxes.append(
				'<div class="bbox tooltip" data-tooltip="id: '+arr[i].id+', classId: '+
				arr[i].classId+', numPoints: '+arr[i].numPoints+
				'" style="bottom: '+t+'%; left: '+l+'%; width: '+(r-l)+
				'%; height: '+(b-t)+'%; border-color: '+c+';"></div>'
			);
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
