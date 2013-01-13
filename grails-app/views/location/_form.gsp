<%@ page import="pubcup.Location" %>

<div class="control-group fieldcontain ${hasErrors(bean: locationInstance, field: 'name', 'error')} ">
	<label class="control-label" for="name">
		<g:message code="location.name.label" default="Name" />
	</label>
	<div class="controls">
		<g:textField name="name" value="${locationInstance?.name}" required="required"/>
	</div>	
</div>

<div class="control-group fieldcontain ${hasErrors(bean: locationInstance, field: 'description', 'error')} ">
	<label  class="control-label" for="description">
		<g:message code="location.description.label" default="Description" />
	</label>
	<div class="controls">
		<g:textField name="description" value="${locationInstance?.description}" required="required"/>
	</div>	
</div>

<div class="control-group fieldcontain ${hasErrors(bean: locationInstance, field: 'address', 'error')} ">
	<label for="address" class="control-label">
		<g:message code="location.address.label" default="Address" />
	</label>
	<div class="controls">
		<g:textField name="address" value="${params?.address}" />
	</div>		
</div>

<input type="hidden" name="lng" value="${params?.lng}"/>
<input type="hidden" name="lat" value="${params?.lat}"/>
