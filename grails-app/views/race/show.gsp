
<%@ page import="racetrack.Race" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
		<g:javascript library="racetrack" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-race" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-race" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list race">
			
				<g:if test="${raceInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="race.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${raceInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.startDateTime}">
				<li class="fieldcontain">
					<span id="startDateTime-label" class="property-label"><g:message code="race.startDateTime.label" default="Start Date Time" /></span>
					
						<span class="property-value" aria-labelledby="startDateTime-label"><g:formatDate date="${raceInstance?.startDateTime}" format="dd-MMM-yyyy HH:mm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="race.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${raceInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="race.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${raceInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.distance}">
				<li class="fieldcontain">
					<span id="distance-label" class="property-label"><g:message code="race.distance.label" default="Distance" /></span>
					
						<span class="property-value" aria-labelledby="distance-label"><g:formatNumber number="${raceInstance?.distance}" format="##0.0 km"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="race.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:formatNumber number="${raceInstance?.cost}" format="₹ ###,##0.00"/></span>

					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.winnerPrizeAmount}">
				<li class="fieldcontain">
					<span id="winnerPrizeAmount-label" class="property-label"><g:message code="race.winnerPrizeAmount.label" default="Winner Prize Amount" /></span>
					
						<span class="property-value" aria-labelledby="winnerPrizeAmount-label"><g:formatNumber number="${raceInstance?.winnerPrizeAmount}" format="₹ ###,##0.00"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.maxRunners}">
				<li class="fieldcontain">
					<span id="maxRunners-label" class="property-label"><g:message code="race.maxRunners.label" default="Max Runners" /></span>
					
						<span class="property-value" aria-labelledby="maxRunners-label"><g:formatNumber number="${raceInstance?.maxRunners}" format="###,##0"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.registrations}">
				<li class="fieldcontain">
					<span id="registrations-label" class="property-label"><g:message code="race.registrations.label" default="Registrations" /></span>
					
						<g:each in="${raceInstance.registrations}" var="r">
						<span class="property-value" aria-labelledby="registrations-label"><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:raceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${raceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return warnBeforeRaceDelete();" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
