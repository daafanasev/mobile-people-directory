<c:if test="<%= skypeEnabled %>">
	<div class="skype-users-to-call" style="display:none">
		<span class="action-header"><liferay-ui:message key="skype-actions"/></span>
		<ul id="users"></ul>
		<div class="portlet-msg-error"><liferay-ui:message key="error.message.select.one.user"/></div>
		<hr>
		<aui:button-row>
			<aui:button name="skype-open" icon="icon-skype" value="action.open.skype"/>
			<aui:button name="skype-call" icon="icon-phone" value="action.call.skype"/>
		</aui:button-row>
		<div class="alredy-in-list-msg">
			<h3 class="header"><liferay-ui:message key="error"/></h3>
			<p class="content"><liferay-ui:message key="already-in-list"/></p>							    
		</div>
	</div>
</c:if>
<c:if test="<%= hangoutsEnabled %>">
	<div class="hangouts-users-to-call" style="display:none">
		<span class="action-header"><liferay-ui:message key="hangouts-actions"/></span>
		<ul id="hangouts-users">
		</ul>
		<hr>
		<aui:button-row>
			<div id="hangouts-button-placeholder"></div>
		</aui:button-row>
		<div class="alredy-in-list-msg">
			<h3 class="header"><liferay-ui:message key="error"/></h3>
			<p class="content"><liferay-ui:message key="already-in-list"/></p>							    
		</div>
	</div>
</c:if>