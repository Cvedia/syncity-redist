<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<title>{{ title }}</title>
	<style type='text/css'>
{{ css_static }}
	</style>
	<script type="text/javascript">
{{ js_static }}
		
		var images = {{ fc }},
			total_images = {{ total_images }},
			meta = {{ fm }},
			classColors = [
				'#ffffff',
				'#e6194b',
				'#0906eb',
				'#3cb44b'
			];
	</script>
</head>
	<body>
		<div class="galWrapper">
			<div class="galTop">
				<div class="galTopLeft">
					{% if "rgb" in features %}<button class="btn" data-type="rgb">RGB</button>{% endif %}
					{% if "seg" in features %}<button class="btn" data-type="seg">Segmentation</button>{% endif %}
					{% if "depth" in features %}<button class="btn" data-type="depth">Depth</button>{% endif %}
					{% if "thermal" in features %}<button class="btn" data-type="thermal">Thermal</button>{% endif %}
				</div>
				<div class="galTopMid">
					Image <input type="text" value="1" /> / {{ total_images }}
				</div>
				{% if "bbox" in features %}
				<div class="galTopRight">
					<button class="btn act">Bounding Boxes</button>
				</div>
				{% endif %}
			</div>
			<div class="galImage">
				<img src="">
				<div class="galBoxes"></div>
			</div>
			<div class="galBottom">
				<div class="galBotLeft"></div>
				<div class="galBotMid">
					<button class="icon iconLeft"></button>
					<button class="icon iconPlay"></button>
					<button class="icon iconRight"></button>
				</div>
			</div>
		</div>
	</body>
</html>
