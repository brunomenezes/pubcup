<div class="local-data">
	<h2 class="tit">
		${location?.name}
	</h2>
	<div class="adr">
		<address>
			<span class="street"> ${location.address}
			</span>
			<g:if test="${location.phone}">
				<span class="phone"> ${location.phone}
				</span>
			</g:if>
		</address>
	</div>
	<g:if test="${event}">
		<div class="toastDateGroup">
			<span id="toastDate"><g:message code="date" default="Date" />
				: ${event?.game?.formattedDate()}</span> <span id="toastTime"><g:message
					code="time" default="Time" /> : ${event?.game?.formattedTime()}</span>
		</div>
	</g:if>
</div>

<g:if test="${event}">
	<div class="event-data">
		<div class="ev-data">

			<div class="event">
				<span class="vs1"> <span class="flag"> <span
						class="${event.game?.teamA()?.code?.toLowerCase()}"></span> <strong
						class="name"> ${event.game?.teamA()?.code?.encodeAsHTML()}
					</strong>
				</span>
				</span> <span class="score"> <span class="vs">x</span>
				</span> <span class="vs2"> <span class="flag"> <span
						class="${event.game?.teamB()?.code?.toLowerCase()}"></span> <strong
						class="name"> ${event.game?.teamB()?.code?.encodeAsHTML()}
					</strong>
				</span>
				</span>
			</div>
			<div class="countdown">
				<span time="${event.game?.date.getTime() - new Date().getTime()}"
					class="kkcount-down"></span>.
			</div>
			<div class="ev-list">
				<ul class="event-list">
					<g:if test="${!events}">
						<li>
							<g:message code="game.extras.no.registered" default="There is no item registered." />
						</li>
					</g:if>
					<g:each in="${events}" var="event">
						<li>
							<span class="vs1">
								<span class="flag">
									<span class="${event.game?.teamA()?.code?.toLowerCase()}"></span>
									<strong	class="name">${event.game.teamA()?.code?.encodeAsHTML()}</strong>
								</span>
							</span> 
							<span class="score">
								<span class="vs">x</span>
							</span>
							<span class="vs2">
								<span class="flag">
									<span class="${event?.game?.teamB()?.code?.toLowerCase()}"></span>
									<strong class="name">${event?.game?.teamB()?.code?.encodeAsHTML()}</strong>
								</span>
							</span>
						</li>
					</g:each>
				</ul>
			</div>
		</div>
	</div>
</g:if>
<div class="event-action">
	<span class="add-event">
		<g:link controller="location" action="associate" id="${location.id}" class="bt">
			<g:message default="Add Event" code="add.event" />
		</g:link>
	</span>
	<span class="more-info">
		<g:link controller="location" action="show" id="${location.id}" class="bt">
			<g:message default="About the pub" code="more.info" />
		</g:link>
	</span>
</div>