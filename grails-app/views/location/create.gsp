<%@ page import="pubcup.Location" %>
<%@ page import="pubcup.Game" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require module="bootstrapcss"/>
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<h2 style=""><g:message code='create.location' default="Register Pub"/></h2>
		<hr>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${locationInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${locationInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
		<form action="save" class="form-horizontal" method="post">
			<g:render template="form"/>
			<ul>
				<g:each in="${Game.list()}" var="game" status="i">
					<li>
						<input type="checkbox" name="gameId" value="${game?.id}" id="gam${i}"/>
						<label for="gam${i}">
							<g:game value="${game}" />
						</label>
					</li>
				</g:each>
			</ul>
			<hr>
			<div class="form-actions well">
				<input type="submit" class="bt" value="<g:message code='create.location' default='Register Pub'/> ">
			</div>	
		</form>
	</body>
</html>
