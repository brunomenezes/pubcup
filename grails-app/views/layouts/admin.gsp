<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'admin.css')}">
		<r:require module="functions"/>

		<script type="text/javascript">
			var config = {contextPath: "${request.contextPath}"};
		</script>
		
		<g:layoutHead/>
		<r:layoutResources />
		<title>
			<g:layoutTitle default="PubCup" />
		</title>
	</head>
	<body class="admin">
		<div id="page">
			<header id="header">
				<div class="header" role="banner">
					<h1 class="logo"><a href="${createLink(uri: '/') }" class="lnk" style="height:100%;display:block">PubCup</a></h1>
					<div class="help">
						<a href="#" class="btn">Ajuda?</a>
					</div>
				</div>
			</header>


			<div id="content">
				<g:layoutBody />
			</div>

			<footer id="footer" role="contentinfo">
				<div class="footer" style="padding: 10px">
					<p class="tx-footer">PubCup - A great way not to lose any match of 2014 FIFA World Cup</p>
					<iframe class="fb-footer" src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fpubcupoficial&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;font=arial&amp;colorscheme=light&amp;action=like&amp;height=21&amp;appId=110043989105314" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
				</div>
			</footer>
		</div>
		

		<div class="helper-page">
			<span id="close" class="close-helper">[x]</span>
			<h1 class="logo-big"><span class="lnk">PubCup</span></h1>
			<hr  />
			<p><g:message code="index.helper.welcome.text" default="Address" /></p>
		</div>
		<div id="spinner" class="spinner" style="display:none;">Loading&hellip;</div>
		
		<r:layoutResources />
	</body>
</html>