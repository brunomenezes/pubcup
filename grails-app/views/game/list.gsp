
<%@ page import="pubcup.Game" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-game" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-game" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th class="sortable">Game</th>
						<g:sortableColumn property="date" title="${message(code: 'game.date.label', default: 'Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gameInstanceList}" status="i" var="gameInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${gameInstance.id}">${gameInstance}</g:link>
						</td>
						<td><g:link action="show" id="${gameInstance.id}">${fieldValue(bean: gameInstance, field: "date")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gameInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
