
<%@ page import="pubcup.Location" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-location" class="content scaffold-list" role="main">
			<h1 class="tit"><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'location.name.label', default: 'Name')}" />
						<g:sortableColumn property="description" title="${message(code: 'location.description.label', default: 'Description')}" />
						<th class="acts">Ações</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${locationInstanceList}" status="i" var="locationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: locationInstance, field: "name")}</td>
						<td><g:link action="show" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "description")}</g:link></td>
						<td><g:link elementId="a${i}" action="associate" id="${locationInstance.id}">Associar</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${locationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
