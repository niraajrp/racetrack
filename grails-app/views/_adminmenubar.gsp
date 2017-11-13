<g:if test="${!session.username}">
    <span class="menuButton">
        <g:link controller="user" action="login">Login</g:link>
    </span>
</g:if>
<g:else>
    <span class="menuButton">
        <g:link controller="race" action="index">
            Manage Races & Registrations
        </g:link>
    </span>
    <span class="menuButton">
        <g:link controller="user" action="index">
            Manage Administrators
        </g:link>
    </span>
    <span class="menuButton">
        <g:link controller="user" action="logout">Log out</g:link>
    </span>
</g:else>