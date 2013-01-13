<%@ page import="pubcup.Location" %>
<%@ page import="pubcup.Game" %>
<%@ page import="pubcup.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="<g:message code='event.label' default='Event'/>" />
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<title><g:message code="default.create.label" args="[entityName]" /></title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<r:require module="jquery"/>
	</head>
	<body class="associate-event">
		<a href="#create-location" class="skip" tabindex="-1">Skip to content&hellip;</a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/pubcup/">Home</a></li>
				<li><a href="/pubcup/location/list" class="list">Event List</a></li>
			</ul>
		</div>
		<div id="create-location" class="content scaffold-create" role="main">
			<h1 class="tit">Create Event</h1>
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
			<g:form action="eventSave" class="well">
				<fieldset>
					<h2 class="stit">${location?.name?.encodeAsHTML()}</h2>
					<g:hiddenField name="id" value="${location?.id }"/>
					<ul class="event-list">
						<g:each in="${gameList}" var="game" status="i">
							<li>
								<input type="checkbox" name="gameId" value="${game?.id}" id="gam${i}"/>
								<label for="gam${i}">
									<g:game value="${game}" />
								</label>
							</li>
						</g:each>
					</ul>
					<span class="create-event">
						<input class="bt" type="submit" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</span>
				</fieldset>
			</g:form>
		</div>
		<script type="text/javascript">
			$(document).ready( function() {
				$("body").addClass("associate-event");
			});
		</script>
	</body>
</html>