


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <r:require module="tagit"/>
        <script type="text/javascript">
            $(document).ready(function()
            {
                $("#entry").datepicker({dateFormat: 'yy/mm/dd'});
                $("#modified").datepicker({dateFormat: 'yy/mm/dd'});
                $("#completion").datepicker({dateFormat: 'yy/mm/dd'});
            })
        </script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${taskInstance}">
            <div class="errors">
                <g:renderErrors bean="${taskInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="task.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taskInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${taskInstance?.description}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="entry"><g:message code="task.entry.label" default="Entry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taskInstance, field: 'entry', 'errors')}">
                                    <input type="text" id="entry" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="modified"><g:message code="task.modified.label" default="Modified" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taskInstance, field: 'modified', 'errors')}">
                                    <input type="text" id="modified" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="completion"><g:message code="task.completion.label" default="Completion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taskInstance, field: 'completion', 'errors')}">
                                    <input type="text" id="completion" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="task.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taskInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${User.list()}" optionKey="id" value="${taskInstance?.user?.id}"  />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <fieldset class="form">
                <r:script>
                    $(function() {
                    $("ul[name='tags']").tagit({select:true, tagSource: "${g.createLink(action: 'tags')}"});
                    });
                </r:script>

                <h3>Tags</h3>
                <div class="fieldcontain">
                    <ul name="tags">
                    <g:each in="${taskInstance.tags}">
                        <li>${it}</li>
                    </g:each>
                    </ul>
                </div>
                </fieldset>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
