
<%@ page import="pubcup.Game" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-game" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-game" class="content scaffold-show" role="main">
			<h1 class="tit"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list game">
			
				<g:if test="${gameInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="game.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${gameInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.teamA}">
				<li class="fieldcontain">
					<span id="teamA-label" class="property-label"><g:message code="game.teamA.label" default="Team A" /></span>
					
						<span class="property-value" aria-labelledby="teamA-label"><g:link controller="team" action="show" id="${gameInstance?.teamA?.id}">${gameInstance?.teamA?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.teamB}">
				<li class="fieldcontain">
					<span id="teamB-label" class="property-label"><g:message code="game.teamB.label" default="Team B" /></span>
					
						<span class="property-value" aria-labelledby="teamB-label"><g:link controller="team" action="show" id="${gameInstance?.teamB?.id}">${gameInstance?.teamB?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gameInstance?.id}" />
					<g:link class="bt edit" action="edit" id="${gameInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="bt delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
