<%@ page import="pubcup.Game" %>
<%@ page import="pubcup.TeamsEnum" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require module="bootstrapcss"/>
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<style type="text/css">
			#error{
				color:red;
			}
		</style>
	</head>
	<body>
		<hr>
		<form action="validateAuth" class="form-horizontal" method="post">
			<div class="control-group">
				<label  class="control-label">Email:</label>
				<div class="controls">
					<input type="text" name="email" placeholder="email" required="required">
					<g:if test="${messageError}">
						<span id='error'>${messageError}</span>
					</g:if>
				</div>	
			</div>
			<div class="form-actions well">
				<input type="submit" class="btn" value="ok">
			</div>	
		</form>
	</body>
</html>
