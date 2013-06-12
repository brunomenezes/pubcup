<!DOCTYPE html>
<html>
	<head>
		<g:set var="loc" value="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-').toLowerCase()}" />
		<meta name="layout" content="main">
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4IksXZ28CC_-yj4212aQ9WlVeq2RbbPA&sensor=true"></script>
		<r:require modules="index, countdown, kkcountdown" />
		<script src="js/moment.min.js"></script>
		<g:if test="${loc != 'en-us' }">
			<script src="js/lang/${loc }.js"></script>
			<script type="text/javascript">
				var locale = "${loc}";
				moment.lang(locale);
			</script>
		</g:if>
		
		<script type="text/javascript">
			function reloadCountDown(){
				var min = 60;
				var hor = 60 * min;
				var dia = hor * 24;
				var diffTime;
				var targetDate;
				$(".kkcount-down").each(function(){
					diffTime = parseInt($(this).attr("time"));
					targetDate = new Date((new Date().getTime() + diffTime));
				});
				setInterval(function(){
					$(".kkcount-down").each(function(){
						var b = moment();
						var a = moment(targetDate);
						var seconds = a.diff(b, 'seconds');
						if(seconds > 0){
							var dd = Math.floor(seconds / dia);
							seconds = seconds % dia;
							var hh = Math.floor(seconds / hor);
							seconds = seconds % hor;
							var mm = Math.floor(seconds / min);
							seconds = seconds % min;
							
							var ss = seconds;
							var msg = '';
							if(dd > 0){
								msg += moment.relativeTime.dd.replace('%d', dd) + ' ';
							}
							if(hh > 0){
								msg += moment.relativeTime.hh.replace('%d', hh) + ' ';
							}
							if(mm > 0){
								msg += moment.relativeTime.mm.replace('%d', mm) + ' ';
							}
							msg += ss + ' ' + moment.relativeTime.s;
							$(this).text(msg);
						}
					});
				}, 1000);
			}
		</script>
	</head>
	<body>
		<form action="" method="get" onsubmit="return false;">
			<div class="search-area">
				<fieldset role="search">
					<label for="searchKey">
						<span class="lbl">Search</span>
						<input type="hidden" id="txtLatitude" name="txtLatitude" />
						<input type="hidden" id="txtLongitude" name="txtLongitude" />
						<input type="text" id="searchKey" class="searchKey" name="searchKey" placeholder="Digite um endereço ou nome de local" />
					</label>
					<span class="search">
						<input class="btn" type="button" value="<g:message code="search.button" default="Search"/>" />
					</span>
				</fieldset>
			</div>
			<div class="content-area">
				<div class="infobar">
					<div id="toaster">
						<span id="close">[x]</span>
						<div id="toasterPlace"></div>
					</div>
					<div class="event-action" id="new-location-template" style="display: none">
						<div class="local-data">
							<h2 class="tit address"></h2>
							<a href="#replaceMe" class="bt btn-create">
								<g:message code="create.location" default="Register Pub" />
							</a>
						</div>
					</div>						
				</div>
				<div class="map">
					<div id="map_canvas" style="width: 100%; height: 100%;">&nbsp;</div>
				</div>
				<div class="actions">
					<span class="my-local">
						<input class="btn" type="button" id="center" value="<g:message code="center.map" default="Get Location"/>"/>
					</span>
					<span class="show-event">
						<a id="bt_show_game_list" class="bt"><g:message code="next.events" default="Next Games"/></a>
					</span>
					<div id="games-list">
						<span class="bt-close" id="close-game-list">[x]</span>
						<ul class="lst-games">
							<li class="it-gl"><a href="#" id="all_games"><g:message code="all.events" default="All Matches"/></a></li>
							<g:each in="${games}" status="i" var="game">
								<li class="it-gl">
									<a href="#" id="game_${game.id}"><g:game value="${game}"/></a>
								</li>
							</g:each>
						</ul>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
