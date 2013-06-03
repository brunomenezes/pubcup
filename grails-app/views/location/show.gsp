<%@ page import="pubcup.Location" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="" args="[entityName]" /></title>
		<r:require module="showLocation" />
	</head>
	<body>
		<div class="local-data-sl">
			<h1 class="tit">${locationInstance.name}</h1>
			<div class="description">
				<p class="tx-desc" onclick="turnEditable(this)" id="originalDescription">${locationInstance.description}</p>
				<span id="editMessage"><g:message code="location.description.edit" /></span>
			</div>
			<g:hiddenField name="locationId" value="${locationInstance.id}" id="locationId"/>
		</div>
		<div class="events">
			<div class="event-head">
				<h2 class="tit">Outros jogos</h2>
				<span class="add-event">
					<g:link controller="location" action="associate" id="${locationInstance?.id }" class="bt">
						<g:message code="add.event" default="Add event"/>
					</g:link>
				</span>
			</div>
			<ul class="event-list">
				<g:each in="${locationInstance.events}" var="event">
					<li class="it-el-sl">
						<span class="vs1">
							<span class="flag">
								<span class="${event.game?.teamA?.code?.toLowerCase()}"></span>
								<strong class="name">${event.game.teamA?.name?.encodeAsHTML()}</strong>
							</span>
						</span>
						<span class="score">
							<span class="vs">x</span>
						</span>
						<span class="vs2">
							<span class="flag">
								<span class="${event?.game?.teamB?.code?.toLowerCase()}"></span>
								<strong class="name">${event?.game?.teamB?.name?.encodeAsHTML()}</strong>
							</span>
						</span>
					</li>
				</g:each>
			</ul>
			<div class="bts">
				<span class="back">
					<a href="javascript:history.back()" class="bt">Voltar</a>
				</span>
			</div>
		</div>
	</body>
</html>