<%@ page import="pubcup.Game" %>



<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="game.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" value="${gameInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'teamA', 'error')} required">
	<label for="teamA">
		<g:message code="game.teamA.label" default="Team A" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teamA" name="teamA.id" from="${pubcup.Team.list()}" optionKey="id" required="" value="${gameInstance?.teamA?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'teamB', 'error')} required">
	<label for="teamB">
		<g:message code="game.teamB.label" default="Team B" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teamB" name="teamB.id" from="${pubcup.Team.list()}" optionKey="id" required="" value="${gameInstance?.teamB?.id}" class="many-to-one"/>
</div>

