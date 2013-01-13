<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en" class="no-js">
<!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<title>
			<g:layoutTitle default="PubCup" />
		</title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		
		<r:require module="bootstrap"/>
		<r:require module="jquery"/>
		<r:require module="functions"/>

		<script type="text/javascript">
			var config = {contextPath: "${request.contextPath}"};
		</script>
		
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="page">
			<div id="header">
				<div class="header">
					<h1 class="logo"><a href="${createLink(uri: '/') }" class="lnk" style="height:100%;display:block">PubCup</a></h1>
					<div class="help">
						<a href="#" class="btn">Ajuda?</a>
					</div>
				</div>
			</div>
			<div id="content">
				<g:layoutBody />
			</div>
			<div id="footer" role="contentinfo">
				<div id="fb-root"></div>
				<div class="fb-like" data-href="http://pubcup.com" data-send="true" data-layout="button_count" data-width="450" data-show-faces="true"></div>
			</div>
			<div class="helper-page">
				<span id="close-helper">[x]</span>
				<h1 class="logo-big"><span class="lnk">PubCup</span></h1>
				<hr  />
				<p><g:message code="index.helper.welcome.text" default="Address" /></p>
			</div>
		</div>

		<div id="spinner" class="spinner" style="display:none;">Loading&hellip;</div>
		
		<r:layoutResources />
		<div id="fb-root"></div>
		<script>
		(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=107271416014120";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		</script>
	</body>
</html>