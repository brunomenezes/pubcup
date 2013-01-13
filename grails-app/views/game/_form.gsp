<%@ page import="pubcup.Game" %>

	<r:require module="games" />

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="game.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<div style="display:none"><g:datePicker name="date" precision="minute" value="${gameInstance?.date}" /></div>
	<input type="text" class="datepicker" value="${formatDate(date:gameInstance?.date, format:"dd/MM/yyyy hh:mm")}"  />
</div>

