<%@ page import="se.su.it.vaulttool.VaultRestService" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${session.applicationName?:'Vaulttool'} - Policy Administration</title>
    <asset:javascript src="inputrules.js"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>

<body>

    <div class="card bottom-margin-large">
        <div class="card-header">
            <h3>Policy Administration</h3>
        </div>
        <div class="card-body">
            <g:form action="createPolicy">
                <div class="row bottom-margin-small">
                    <div class="col-md-2">
                        <label for="name"><strong>Policy name</strong></label>
                    </div>
                    <div class="col-md-10">
                        <input class="allowonly7bit form-control" type="text" id="name" name="name" value=""/>
                    </div>
                </div>
                <div class="row bottom-margin-small">
                    <div class="col-md-2">
                        <label for="path"><strong>Path</strong></label>
                    </div>
                    <div class="col-md-3">
                        <g:select class="form-control" id="path" name="path" from="${paths}" value="" noSelection="${['':'Root']}"/>
                    </div>
                    <div class="col-md-7">
                        <span>
                            <g:checkBox name="create" id="read"/>
                            <label for="create">Create</label>
                        </span>
                        <span>
                            <g:checkBox name="read" id="read"/>
                            <label for="read">Read</label>
                        </span>
                        <span>
                            <g:checkBox name="update" id="read"/>
                            <label for="update">Update</label>
                        </span>
                        <span>
                            <g:checkBox name="delete" id="read"/>
                            <label for="delete">Delete</label>
                        </span>
                        <span>
                            <g:checkBox name="list" id="read"/>
                            <label for="list">List</label>
                        </span>
                    </div>
                </div>
                <div class="pull-right">
                    <g:submitButton class="btn btn-primary" name="submit" value="Create/Update Policy"/>
                </div>
            </g:form>
        </div>
    </div>

    <div class="card bottom-margin-large">
        <div class="card-header">
            <h3>Policies</h3>
        </div>
        <div class="card-body top-padding-none bottom-padding-none cardBodyItemsListPadding">
            <g:each in="${policies}" var="policy" status="i">
                <div class="row ${(i < policies.size() - 1) ? 'itemListBorder':''} top-padding-xsmall bottom-padding-xsmall">
                    <div class="col-lg-11 col-md-10 col-sm-9 col-9">
                        <div class="row">
                            <div class="col-md-3">
                                <strong class="cardBodyListItem">${policy.policy}</strong>
                            </div>
                            <div class="col-md-9">
                                <g:if test="${policy.rules.contains("secret/${se.su.it.vaulttool.VaultRestService.VAULTTOOLSECRETSPATHNAME}")}">
                                    <g:if test="${policy.rules.contains("secret/${se.su.it.vaulttool.VaultRestService.VAULTTOOLSECRETSPATHNAME}/")}">
                                        <span class="cardBodyListItem">${policy.rules.replace("secret/${se.su.it.vaulttool.VaultRestService.VAULTTOOLSECRETSPATHNAME}/","")}</span>
                                    </g:if>
                                    <g:else>
                                        <span class="cardBodyListItem">${policy.rules.replace("secret/${se.su.it.vaulttool.VaultRestService.VAULTTOOLSECRETSPATHNAME}","")}</span>
                                    </g:else>
                                </g:if>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1 col-md-2 col-sm-3 col-3">
                        <g:link class="btn btn-danger button-danger-small pull-right" action="deletePolicy" params='[policy: "${policy.policy}"]'>Delete</g:link>
                    </div>
                </div>
            </g:each>
        </div>
    </div>

</body>
</html>