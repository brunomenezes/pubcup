<div class="event-info" itemscope itemtype="http://schema.org/Event">
	<div class="local-data" itemprop="location" itemscope itemtype="http://schema.org/Place">
		<h2 class="tit" itemprop="name">${location?.name}</h2>
		<div class="adr" itemprop="address">
			<address>
				<span class="street"> ${location.address}</span>
				<g:if test="${location.phone}">
					<span class="phone"> ${location.phone}</span>
				</g:if>
			</address>
		</div>
		<g:if test="${event}">
			<div class="toastDateGroup">
				<span id="toastDate">
					<span class="lbl-td"><g:message code="date" default="Date" />:</span> ${event?.game?.formattedDate()}
				</span> /
				<span id="toastTime">
					<span class="lbl-td"><g:message code="time" default="Time" />:</span> ${event?.game?.formattedTime()}
				</span>
			</div>
		</g:if>
	</div>

	<g:if test="${event}">
		<div class="event-data">
			<div class="ev-data">

				<div class="event">
					<meta itemprop="startDate" content="${event?.game?.formattedDate()}T${event?.game?.formattedTime()}">
					<meta itemprop="name" content="${event.game?.teamA?.name?.encodeAsHTML()} vs ${event.game?.teamB?.name?.encodeAsHTML()}">
					<span class="vs1">
						<span class="flag-ev">
							<span class="f-ev ${event.game?.teamA?.code?.toLowerCase()}"></span>
							<strong class="name"> ${event.game?.teamA?.name?.encodeAsHTML()} </strong>
						</span>
					</span>

					<span class="score"> 
						<span class="scr"></span>
						<span class="vs">x</span>
						<span class="scr"></span>
					</span>

					<span class="vs2">
						<span class="flag-ev">
							<span class="f-ev ${event.game?.teamB?.code?.toLowerCase()}"></span>
							<strong class="name"> ${event.game?.teamB?.name?.encodeAsHTML()} </strong>
						</span>
					</span>

				</div>

				<div class="countdown">
					<span time="${event.game?.date.getTime() - new Date().getTime()}" class="kkcount-down"></span>.
				</div>

				<div class="ev-list">
					<h3 class="tit">Próximos Eventos</h3>
					<ul class="event-list">
						<g:if test="${!events}">
							<li>
								<g:message code="game.extras.no.registered" default="There is no item registered." />
							</li>
						</g:if>
						<g:each in="${events}" var="event">
							<li class="it-evl">
								<span class="event-date-hour">${event?.game?.formattedDate()} / ${event?.game?.formattedTime()}</span>
								<span class="vs1">
									<span class="flag-evl">
										<span class="f-evl ${event.game?.teamA?.code?.toLowerCase()}"></span>
										<strong	class="name">${event.game.teamA?.name?.encodeAsHTML()}</strong>
									</span>
								</span> 
								<span class="score">
									<span class="vs">x</span>
								</span>
								<span class="vs2">
									<span class="flag-evl">
										<span class="f-evl ${event?.game?.teamB?.code?.toLowerCase()}"></span>
										<strong class="name">${event?.game?.teamB?.name?.encodeAsHTML()}</strong>
									</span>
								</span>
							</li>
						</g:each>
					</ul>
				</div>
			</div>
		</div>
	</g:if>
</div>
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