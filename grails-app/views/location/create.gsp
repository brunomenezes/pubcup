<%@ page import="pubcup.Location" %>
<%@ page import="pubcup.Game" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<!--temp / colocar essa classe no body e tirar essa div-->
		<div class="register-pub">
			

		<h1 class="tit"><g:message code='create.location' default="Register Pub"/></h1>
		
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
		
		<form action="save" class="form reg-pub" method="post">
			<g:render template="form"/>
			<strong class="tit">Associate Events</strong>
			<ul class="lst-el-rp">
				<g:each in="${Game.list()}" var="game" status="i">
					<li class="it-el-rp">
						<input type="checkbox" name="gameId" value="${game?.id}" id="gam${i}"/>
						<label for="gam${i}">
							<g:game value="${game}" />
						</label>
					</li>
				</g:each>
			</ul>
			<div class="bts">
				<span class="back">
					<a href="javascript:history.back()" class="bt">Voltar</a>
				</span>				
				<span class="regist-pub">
					<input type="submit" class="bt" value="<g:message code='create.location' default='Register Pub'/> ">
				</span>	
			</div>
		</form>
		
		<!--/temp-->
		</div>
	</body>
</html>
