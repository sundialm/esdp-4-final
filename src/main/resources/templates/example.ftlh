<#import "base.ftlh" as base>
<@base.layout>
    <#if area1??>
        <table class="table table-hover">
            <thead>
            <tr>
                <th class="link" scope="col">id</th>
                <th class="link" scope="col">Название</th>
                <th class="link" scope="col">Parent id</th>
                <th class="link" scope="col">Добавление</th>
            </tr>
            </thead>
            <tbody>
            <#list area1 as a>
                <tr>
                <td>${a.id}</td>
                <td>${a.name}</td>
            <#--                <#if a.parentArea??>-->
            <#--                    <td>${a.parentArea.id}</td>-->
            <#--                <#else>-->
                <td></td>
            <#--                </#if>-->
                <td>
                    <div id="areaBtn">
                        <button>Добавить</button>
                    </div>
                </td>
                <#if area2??>
                    <#list area2 as a2>
                        <#if a2.parentArea.id == a.id>
                            <tr>
                            <td>${a2.id}</td>
                            <td>${a2.name}</td>
                            <td>${a2.parentArea.id}</td>
                            <td>
                                <button id="area1">Добавить</button>
                            </td>
                            <#if area3??>
                                <#list area3 as a3>
                                    <#if a3.parentArea.id == a2.id>
                                        <tr>
                                            <td>${a3.id}</td>
                                            <td>${a3.name}</td>
                                            <td>${a3.parentArea.id}</td>
                                            <td>
                                                <button id="areaBtn">Добавить</button>
                                            </td>
                                        </tr>
                                    </#if>
                                </#list>
                            </#if>
                            </tr>
                        </#if>
                    </#list>
                </#if>
                </tr>
            </#list>
            </tbody>
        </table>
    <#else>
        <h1>Места работ не найдены </h1>
    </#if>

<#--    <form action="/example" method="post">-->
<#--        <h4>Добавить Area structure</h4>-->
<#--        <div class="modal-body">-->
<#--            <input class="modal-input" name="name" value="${form.name}" type="text"-->
<#--                   placeholder="Наименование">-->
<#--            <hr>-->
<#--        </div>-->
<#--        <div class="modal-body">-->
<#--            <input class="modal-input" name="height" value="${form.height}" type="text"-->
<#--                   placeholder="метры">-->
<#--            <hr>-->
<#--        </div>-->

<#--        <div class="modal-body">-->
<#--            <input class="modal-input" name="parentArea" type="text" placeholder="id">-->
<#--            <hr>-->
<#--        </div>-->
<#--        <button class="modal-button">Добавить</button>-->
<#--    </form>-->


<#--    <form action="/exampleRemove" method="post">-->
<#--        <h4>Удалить Area structure по id</h4>-->
<#--        <div class="modal-body">-->
<#--            <input class="modal-input" name="parentArea" type="text" placeholder="id">-->
<#--            <hr>-->
<#--        </div>-->
<#--        <button class="modal-button">Удалить</button>-->
<#--    </form>-->

<#--    <form action="/exampleEdit" method="post">-->
<#--        <h4>Изменить Area structure по id</h4>-->
<#--        <div class="modal-body">-->
<#--            <input class="modal-input" name="name" type="text"-->
<#--                   placeholder="Наименование">-->
<#--            <hr>-->
<#--        </div>-->
<#--        <div class="modal-body">-->
<#--            <input class="modal-input" name="height" type="text"-->
<#--                   placeholder="метры">-->
<#--            <hr>-->
<#--        </div>-->
<#--        <div class="modal-body">-->
<#--            <input class="modal-input" name="id" type="text" placeholder="id">-->
<#--            <hr>-->
<#--        </div>-->
<#--        <button class="modal-button">Изменить</button>-->
<#--    </form>-->

<#--    <#list area1 as a>-->
<#--        <div class="vmodal" id="vmodalArea" data-areaBtn="${a.id}">-->
<#--            <form class=" modal-overlay " action="/example" method="post" data-close="true">-->
<#--                <#if _csrf??>-->
<#--                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"-->
<#--                           value="${(_csrf.token)!'--no-token--'}"/>-->
<#--                </#if>-->
<#--                <#if errors??>-->
<#--                    <p>Incorrect register data</p>-->
<#--                    <#list error as fieldError>-->
<#--                        <p>${fieldError.field} - ${fieldError.defaultMessage!"_no defaultMessage_"}</p>-->
<#--                    </#list>-->
<#--                </#if>-->
<#--                <div class="modalWindow">-->
<#--                    <div class="vmodal-header" id="vmodal-header">-->
<#--                        <#if a.parentArea??>-->
<#--                            <input class="modal-input" name="parentArea" type="hidden"-->
<#--                                   value="${a.id}">-->
<#--                            <h4>-->
<#--                                Добавить Area structure:${a.parentArea.name} / ${a.name}-->
<#--                                <input class="modal-input" name="parentArea" type="hidden">-->
<#--                            </h4>-->
<#--                        <#else>-->
<#--                            <h4>Добавить Area structure</h4>-->
<#--                            <input class="modal-input" name="parentArea" type="hidden" value="0">-->
<#--                        </#if>-->

<#--                        <span class="modal-close" data-close="true"> &times;</span>-->
<#--                    </div>-->
<#--                    <div class="modal-body">-->
<#--                        <input class="modal-input" name="name" value="${form.name}" type="text"-->
<#--                               placeholder="Наименование">-->
<#--                        <hr>-->
<#--                    </div>-->
<#--                    <div class="modal-body">-->
<#--                        <input class="modal-input" name="height" value="${form.height}" type="text"-->
<#--                               placeholder="метры">-->
<#--                        <hr>-->
<#--                    </div>-->
<#--                    <div class="modal-footer">-->
<#--                        <button class="modal-button">Добавить</button>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </form>-->
<#--        </div>-->
<#--    </#list>-->


<#--<div class="vmodal">-->
<#--    <button  id="areaBtn" name="parentArea">Добавить</button>-->
<#--</div>-->

<#--<div class="vmodalArea" id="vmodalArea">-->
<#--    <form class=" modal-overlay " action="/example" method="post" data-close="true">-->
<#--        <#if _csrf??>-->
<#--            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>-->
<#--        </#if>-->
<#--        <div class="modalWindow">-->
<#--            <div class="vmodal-header" id="vmodal-header">-->
<#--                    <#if area1.parentArea??>-->
<#--                <h4 name="parentArea">-->
<#--                    Добавить Area structure:${area1.parentArea.name}-->
<#--                </h4>-->
<#--                 <#else>-->
<#--                        <h4>Добавить Area structure</h4>-->
<#--                </#if>-->
<#--                <span class="modal-close" data-close="true"> &times;</span>-->
<#--            </div>-->
<#--            <div class="modal-body">-->
<#--                <input class="modal-input" name="name" type="text" placeholder="Наименование">-->
<#--                <hr>-->
<#--            </div>-->
<#--            <div class="modal-body">-->
<#--                <input class="modal-input" name="height" type="text" placeholder="метры">-->
<#--                <hr>-->
<#--            </div>-->
<#--            <div class="modal-footer">-->
<#--                <button class="modal-button">Добавить</button>-->
<#--            </div>-->
<#--        </div>-->
<#--    </form>-->
<#--</div>-->
    <script src="js/modalProjectStructure.js"></script>
</@base.layout>