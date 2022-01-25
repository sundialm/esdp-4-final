<#import "base.ftlh" as base >
<@base.layout>


<#--    ________________________________-->
<#--    ********************************-->
<#--    ********************************-->
<#--              РАЗДЕЛ АРЕА-->
<#--    ********************************-->
<#--    ********************************-->
<#--    ________________________________-->

    <div class="form">
        <div class="project_structure_list_tab form p-3">
            <div class="row">
                <div class="col-10 header_structure">
                    <b class="header_structure">Area structure</b>
                </div>
                <#if areas?size==0>
                    <div class="col-10">
                        <button class="project_modal_btn colored_btn" data-bs-toggle="modal" data-bs-target="#areaAddModal">Добавить место работы</button>
                    </div>
                    <div class="col-2 d-flex justify-content-end">
                        <button class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#areaAddModal">+</button>
                    </div>
                <#else >
                    <div class="col-2">
                        <button type="button" class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#areaAddModal">+</button>
                    </div>

                </#if>

                <!-- Modal for area with parent==null -->

                <div class="modal fade" id="areaAddModal" tabindex="-1" aria-labelledby="areaAddModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header my_modal-content">
                                <h5 class="modal-title modal_title" id="areaAddModalLabel">Добавить area structure:</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="/addArea" method="post">
                                <#if _csrf??>
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                </#if>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-9">
                                            <input type="text" name="name" value="${(area_form.name)!''}" placeholder="Наименование">
                                        </div>
                                        <div class="col-3">
                                            <input type="text" name="height" value="${(area_form.height)!''}" placeholder="Метры">
                                        </div>
                                        <div class="col-3">
                                            <input type="hidden" name="parentId" value="${0}" >
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer my_modal-content">
                                    <button type="submit" class="btn btn-dark">Добавить</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <#-- Modal END-->

                <div>
                    <#list areas as a>
                        <div class="">
                            <div class="flex_parent_name_and_icon">

                                <#--parent name + dropdown-->
                                <div class="padding_parent_name_and_icon svg_area" data-wrap="${a.id}">
                                    <svg width="10px" height="10px" viewBox="0 0 8 6" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M1 1.5L4 4.5L7 1.5" stroke="#393939" stroke-width="2" stroke-linecap="round"/>
                                    </svg>
                                </div>
                                <div class="padding_parent_name_and_icon">
                                    <p class="section-guidelines__link">${a.name}</p>
                                </div>

                                <#--CRUD icons-->

                                <div class="flex_parent_name_and_icon flex_parent_name_and_icons">
                                    <div class="padding_parent_name_and_icon">
                                        <button type="button" class="areaStructureLink project_modal_btn"
                                                data-bs-toggle="modal" data-bs-target="#areaAddModal${a.id}">+</button>
                                    </div>
                                    <div class="padding_parent_name_and_icon">
                                        <button type="button" class="areaStructureLink project_modal_btn"
                                                data-bs-toggle="modal" data-bs-target="#areaUpdateModal${a.id}">
                                            <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M2.53492 9.20563L0.258077 9.99985L1.05214 7.72285L7.72467 1.05031C8.13413 0.640848 8.798 0.640849 9.20746 1.05031C9.61692 1.45977 9.61692 2.12364 9.20746 2.5331L2.53492 9.20563Z" fill="#393939"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="padding_parent_name_and_icon">
                                        <a href="/deleteArea/${a.id}"  class="delete" data-confirm="Are you sure you want to delete this item?">
                                            <svg width="10" height="8" viewBox="0 0 10 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M2.82277 7.103L1.45021 0.583328H8.55109L7.17853 7.103C7.12982 7.33437 6.9257 7.49999 6.68926 7.49999H3.31205C3.0756 7.49999 2.87148 7.33437 2.82277 7.103Z" stroke="#393939"/>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <#-- Update modal-->

                            <div class="modal fade" id="areaUpdateModal${a.id}" tabindex="-1" aria-labelledby="areaUpdateModalLabel${a.id}" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header my_modal-content">
                                            <h5 class="modal-title modal_title" id="areaAddModalLabel${a.id}">Редактировать в area structure: ${a.name}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="/updateArea/${a.id}" method="post">
                                            <#if _csrf??>
                                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                            </#if>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <input type="text" name="name" value="${a.name}" placeholder="${a.name}">
                                                    </div>
                                                    <div class="col-3">
                                                        <input type="text" name="height" value="${a.height}" placeholder="${a.height}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer my_modal-content">
                                                <button type="submit" class="btn btn-dark">Редактировать</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <#--addition modal-->

                            <div class="modal fade" id="areaAddModal${a.id}" tabindex="-1" aria-labelledby="areaChildrenAddModalLabel${a.id}" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header my_modal-content">
                                            <h5 class="modal-title modal_title" id="areaChildrenAddModalLabel${a.id}">Добавить в area structure: ${a.name}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="/addArea" method="post">
                                            <#if _csrf??>
                                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                            </#if>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <input type="text" name="name" placeholder="Наименование">
                                                    </div>
                                                    <div class="col-3">
                                                        <input type="text" name="height"  placeholder="Метры">
                                                    </div>
                                                    <div class="col-3">
                                                        <input type="hidden" name="parentId" value="${a.id}" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer my_modal-content">
                                                <button type="submit" class="btn btn-dark">Добавить</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div id="children_area${a.id}">
                                <#list a.children as ac>
                                    <#if ac.parentId == a.id>
                                        <ul class="flex_parent_name_and_icon">
                                            <div class="padding_parent_name_and_icon flex_child_name_and_icon">
                                                <li class="area_child_li">
                                                    <p class=" section-guidelines__link">${ac.name}</p>
                                                </li>
                                            </div>
                                            <div class=" flex_parent_name_and_icon flex_parent_name_and_icons">
                                                <div class="padding_parent_name_and_icon">
                                                    <button type="button" class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#areaChildrenAddModal${ac.id}">+</button>
                                                </div>
                                                <div class="padding_parent_name_and_icon">
                                                    <button type="button" class="areaStructureLink project_modal_btn"
                                                            data-bs-toggle="modal" data-bs-target="#areaChildUpdateModal${ac.id}">
                                                        <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M2.53492 9.20563L0.258077 9.99985L1.05214 7.72285L7.72467 1.05031C8.13413 0.640848 8.798 0.640849 9.20746 1.05031C9.61692 1.45977 9.61692 2.12364 9.20746 2.5331L2.53492 9.20563Z" fill="#393939"/>
                                                        </svg>
                                                    </button>
                                                </div>
                                                <div class="padding_parent_name_and_icon">
                                                    <a href="/deleteArea/${ac.id}"  class="delete" data-confirm="Are you sure you want to delete this item?">
                                                        <svg width="10" height="8" viewBox="0 0 10 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M2.82277 7.103L1.45021 0.583328H8.55109L7.17853 7.103C7.12982 7.33437 6.9257 7.49999 6.68926 7.49999H3.31205C3.0756 7.49999 2.87148 7.33437 2.82277 7.103Z" stroke="#393939"/>
                                                        </svg>
                                                    </a>
                                                </div>
                                            </div>
                                        </ul>

                                        <div class="modal fade" id="areaChildUpdateModal${ac.id}" tabindex="-1" aria-labelledby="areaChildrenUpdateModalLabel${ac.id}" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header my_modal-content">
                                                        <h5 class="modal-title modal_title" id="areaChildrenAddModalLabel${ac.id}">Редактировать в area structure: ${ac.name}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form action="/updateArea/${ac.id}" method="post">
                                                        <#if _csrf??>
                                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                                        </#if>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="col-9">
                                                                    <input type="text" name="name"  placeholder="${ac.name}">
                                                                </div>
                                                                <div class="col-3">
                                                                    <input type="text" name="height"  placeholder="${ac.height}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer my_modal-content">
                                                            <button type="submit" class="btn btn-dark">Редактировать</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal fade" id="areaChildrenAddModal${ac.id}" tabindex="-1" aria-labelledby="areaChildAddModalLabel${ac.id}" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header my_modal-content">
                                                        <h5 class="modal-title modal_title" id="areaChildAddModalLabel${ac.id}">Добавить work structure: ${ac.name}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form action="/addArea" method="post">
                                                        <#if _csrf??>
                                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                                        </#if>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="col-9">
                                                                    <input type="text" name="name" value="${(area_form.name)!''}" placeholder="Наименование">
                                                                </div>
                                                                <div class="col-3">
                                                                    <input type="text" name="height" value="${(area_form.height)!''}" placeholder="Метры">
                                                                </div>
                                                                <div class="col-3">
                                                                    <input type="hidden" name="parentId" value="${ac.id}" placeholder="Метры">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer my_modal-content">
                                                            <button type="submit" class="btn btn-dark">Добавить</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </#if>
                                </#list>
                            </div>
                        </div>
                        <hr>
                    </#list>
                </div>
            </div>
        </div>
    </div>


<#--    ________________________________-->
<#--    ********************************-->
<#--    ********************************-->
<#--              РАЗДЕЛ ВОРК-->
<#--    ********************************-->
<#--    ********************************-->
<#--    ________________________________-->


    <div class="form">
        <div class="project_structure_list_tab form p-3">
            <div class="row">


                <div class="col-10 header_structure">
                    <b class="header_structure">Work structure</b>
                </div>
                <#if works?size==0>
                    <div class="col-10">
                        <button class="project_modal_btn colored_btn" data-bs-toggle="modal" data-bs-target="#workAddModal">Добавить тип работы</button>
                    </div>
                    <div class="col-2 d-flex justify-content-end">
                        <button class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#workAddModal">+</button>
                    </div>
                <#else >
                    <div class="col-2">
                        <button type="button" class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#workAddModal">+</button>
                    </div>

                </#if>




                <#--work modal add work with parent ==0 -->

                <div class="modal fade" id="workAddModal" tabindex="-1" aria-labelledby="workAddModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header my_modal-content">
                                <h5 class="modal-title modal_title" id="workAddModalLabel">Добавить work structure:</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="/addWork" method="post">
                                <#if _csrf??>
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                </#if>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <input type="text" name="name" value="${(work_form.name)!''}" placeholder="Наименование">
                                        </div>
                                        <div class="col-3">
                                            <input type="hidden" name="parentId" value="${0}" >
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer my_modal-content">
                                    <button type="submit" class="btn btn-dark">Добавить</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>




                <div>
                    <#list works as p>
                        <div>
                            <div class="flex_parent_name_and_icon">

                                <div class="padding_parent_name_and_icon  svg_work" data-wrap="${p.id}">
                                    <svg width="10px" height="10px" viewBox="0 0 8 6" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M1 1.5L4 4.5L7 1.5" stroke="#393939" stroke-width="2" stroke-linecap="round"/>
                                    </svg>
                                </div>

                                <div class=" padding_parent_name_and_icon ">
                                    <p class="section-guidelines__link">${p.name}</p>
                                </div>

                                <#--CRUD icons-->

                                <div class="flex_parent_name_and_icon flex_parent_name_and_icons">
                                    <div class="padding_parent_name_and_icon">
                                        <button type="button" class=" workStructureLink project_modal_btn" data-bs-toggle="modal" data-bs-target="#workAddModal${p.id}">+</button>
                                    </div>
                                    <div class="padding_parent_name_and_icon">
                                        <button type="button" class=" workStructureLink project_modal_btn" data-bs-toggle="modal" data-bs-target="#workUpdateModal${p.id}">
                                            <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M2.53492 9.20563L0.258077 9.99985L1.05214 7.72285L7.72467 1.05031C8.13413 0.640848 8.798 0.640849 9.20746 1.05031C9.61692 1.45977 9.61692 2.12364 9.20746 2.5331L2.53492 9.20563Z" fill="#393939"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="padding_parent_name_and_icon">
                                        <a href="/deleteWork/${p.id}"  class="delete delete_button" data-confirm="Are you sure you want to delete this item?">
                                            <svg width="10" height="x8" viewBox="0 0 10 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M2.82277 7.103L1.45021 0.583328H8.55109L7.17853 7.103C7.12982 7.33437 6.9257 7.49999 6.68926 7.49999H3.31205C3.0756 7.49999 2.87148 7.33437 2.82277 7.103Z" stroke="#393939"/>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <#--modal create work child-->

                            <div class="modal fade" id="workAddModal${p.id}" tabindex="-1" aria-labelledby="workAddModalLabel${p.id}" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header my_modal-content">
                                            <h5 class="modal-title modal_title" id="workAddModalLabel${p.id}">Добавить work structure: ${p.name}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="/addWork" method="post">
                                            <#if _csrf??>
                                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                            </#if>
                                            <div class="modal-body">
                                                <div class="col-9">
                                                    <input type="text" name="name" placeholder="Наименование">
                                                </div>
                                                <div class="col-3">
                                                    <input type="hidden" name="parentId" value="${p.id}" >
                                                </div>
                                            </div>
                                            <div class="modal-footer my_modal-content">
                                                <button type="submit" class="btn btn-dark">Добавить</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <#--modal update work child-->

                            <div class="modal fade" id="workUpdateModal${p.id}" tabindex="-1" aria-labelledby="workUpdateModalLabel${p.id}" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header my_modal-content">
                                            <h5 class="modal-title modal_title" id="workUpdateModalLabel${p.id}">Добавить work structure: ${p.name}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="/updateWork/${p.id}" method="post">
                                            <#if _csrf??>
                                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                            </#if>
                                            <div class="modal-body">
                                                <div class="col-9">
                                                    <input type="text" name="name" value="${p.name}" placeholder="Наименование">
                                                </div>
                                            </div>
                                            <div class="modal-footer my_modal-content">
                                                <button type="submit" class="btn btn-dark">Добавить</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>


                            <div id="children_work${p.id}">
                                <#list p.children as c>
                                    <#if c.parentId == p.id>
                                        <ul class="flex_parent_name_and_icon">
                                            <div class="padding_parent_name_and_icon flex_child_name_and_icon">
                                                <li class="work_child_li">
                                                    <p class="section-guidelines__link">${c.name}</p>
                                                </li>
                                            </div>
                                            <div class="flex_parent_name_and_icon flex_parent_name_and_icons">
                                                <div class="padding_parent_name_and_icon">
                                                    <button type="button" class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#workChildAddModal${c.id}">+</button>
                                                </div>
                                                <div class="padding_parent_name_and_icon">
                                                    <button type="button" class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#workChildUpdateModal${c.id}">
                                                        <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M2.53492 9.20563L0.258077 9.99985L1.05214 7.72285L7.72467 1.05031C8.13413 0.640848 8.798 0.640849 9.20746 1.05031C9.61692 1.45977 9.61692 2.12364 9.20746 2.5331L2.53492 9.20563Z" fill="#393939"/>
                                                        </svg>
                                                    </button>
                                                </div>
                                                <div class="padding_parent_name_and_icon">
                                                    <a href="/deleteWork/${c.id}"  class="delete" data-confirm="Are you sure you want to delete this item?">
                                                        <svg width="10" height="8" viewBox="0 0 10 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M2.82277 7.103L1.45021 0.583328H8.55109L7.17853 7.103C7.12982 7.33437 6.9257 7.49999 6.68926 7.49999H3.31205C3.0756 7.49999 2.87148 7.33437 2.82277 7.103Z" stroke="#393939"/>
                                                        </svg>
                                                    </a>
                                                </div>
                                            </div>
                                        </ul>


                                    <#--modal create work child-->

                                        <div class="modal fade" id="workChildAddModal${c.id}" tabindex="-1" aria-labelledby="workChildAddModalLabel${c.id}" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header my_modal-content">
                                                        <h5 class="modal-title modal_title" id="workChildAddModalLabel${c.id}">Добавить work structure: ${c.name}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form action="/addWork" method="post">
                                                        <#if _csrf??>
                                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                                        </#if>
                                                        <div class="modal-body">
                                                            <div class="col-9">
                                                                <input type="text" name="name" placeholder="Наименование">
                                                            </div>
                                                            <div class="col-3">
                                                                <input type="hidden" name="parentId" value="${c.id}" >
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer my_modal-content">
                                                            <button type="submit" class="btn btn-dark">Добавить</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                    <#--modal update work child-->

                                        <div class="modal fade" id="workChildUpdateModal${c.id}" tabindex="-1" aria-labelledby="workChildUpdateModalLabel${c.id}" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header my_modal-content">
                                                        <h5 class="modal-title modal_title" id="workChildUpdateModalLabel${c.id}">Добавить work structure: ${c.name}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form action="/updateWork/${c.id}" method="post">
                                                        <#if _csrf??>
                                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                                        </#if>
                                                        <div class="modal-body">
                                                            <div class="col-9">
                                                                <input type="text" name="name" value="${c.name}" placeholder="Наименование">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer my_modal-content">
                                                            <button type="submit" class="btn btn-dark">Добавить</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>




                                    </#if>
                                </#list>
                            </div>
                        </div>
                        <hr>
                    </#list>
                </div>
            </div>
        </div>
    </div>



<#--    ________________________________-->
<#--    ********************************-->
<#--    ********************************-->
<#--              РАЗДЕЛ МАТЕРИАЛЫ-->
<#--    ********************************-->
<#--    ********************************-->
<#--    ________________________________-->



    <div class="form ">
        <div class="project_structure_list_tab form p-3 ">
            <div class="row">
                <div class="col-10 header_structure">
                    <b class="header_structure">Материалы</b>
                </div>
                <#if materials?size=0>
                    <div class="col-10">
                        <button class="project_modal_btn colored_btn" data-bs-toggle="modal" data-bs-target="#materialAddModal">Добавить материалы</button>
                    </div>
                    <div class="col-2 d-flex justify-content-end">
                        <button class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#materialAddModal">+</button>
                    </div>

                <#else>
                    <div class="col-2">
                        <button type="button" class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#materialAddModal">+</button>
                    </div>
                </#if>


                <!-- Modal for material with parent==null -->

                <div class="modal fade" id="materialAddModal" tabindex="-1" aria-labelledby="materialAddModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header my_modal-content">
                                <h5 class="modal-title modal_title" id="materialAddModalLabel">Добавить материал в раздел:</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="/addMaterial" method="post">
                                <#if _csrf??>
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                </#if>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-6">
                                            <input type="text" name="name" value="${(area_form.name)!''}" placeholder="Наименование">
                                        </div>
                                        <div class="col-3">
                                            <input type="hidden" name="qty" value=0 >
                                        </div>
                                        <div class="col-3">
                                            <input type="hidden" name="measurement" value="" >
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <input type="hidden" name="parent" value="" >
                                    </div>
                                </div>
                                <div class="modal-footer my_modal-content">
                                    <button type="submit" class="btn btn-dark">Добавить</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <#-- Modal END-->






                <div>
                    <#list materials as p>
                        <div>
                            <div class="flex_parent_name_and_icon">

                                <div class="padding_parent_name_and_icon  svg_material" data-wrap="${p.id}">
                                    <svg width="10px" height="10px" viewBox="0 0 8 6" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M1 1.5L4 4.5L7 1.5" stroke="#393939" stroke-width="2" stroke-linecap="round"/>
                                    </svg>
                                </div>

                                <div class=" padding_parent_name_and_icon ">
                                    <p class="section-guidelines__link">${p.name}</p>
                                </div>

                                <#--CRUD icons-->

                                <div class="flex_parent_name_and_icon flex_parent_name_and_icons">
                                    <div class="padding_parent_name_and_icon">
                                        <button type="button" class=" workStructureLink project_modal_btn" data-bs-toggle="modal" data-bs-target="#materialsAddModal${p.id}">+</button>
                                    </div>
                                    <div class="padding_parent_name_and_icon">
                                        <button type="button" class=" workStructureLink project_modal_btn" data-bs-toggle="modal" data-bs-target="#materialsUpdateModal${p.id}">
                                            <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M2.53492 9.20563L0.258077 9.99985L1.05214 7.72285L7.72467 1.05031C8.13413 0.640848 8.798 0.640849 9.20746 1.05031C9.61692 1.45977 9.61692 2.12364 9.20746 2.5331L2.53492 9.20563Z" fill="#393939"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="padding_parent_name_and_icon">
                                        <a href="/deleteMaterial/${p.id}"  class="delete" data-confirm="Are you sure you want to delete this item?">
                                            <svg width="10" height="x8" viewBox="0 0 10 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M2.82277 7.103L1.45021 0.583328H8.55109L7.17853 7.103C7.12982 7.33437 6.9257 7.49999 6.68926 7.49999H3.31205C3.0756 7.49999 2.87148 7.33437 2.82277 7.103Z" stroke="#393939"/>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <#--modal create material child-->

                            <div class="modal fade" id="materialsAddModal${p.id}" tabindex="-1" aria-labelledby="materialsAddModalLabel${p.id}" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header my_modal-content">
                                            <h5 class="modal-title modal_title" id="materialsAddModalLabel${p.id}">Добавить work structure: ${p.name}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="/addMaterial" method="post">
                                            <#if _csrf??>
                                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                            </#if>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <input type="text" name="name" value="${(area_form.name)!''}" placeholder="Наименование">
                                                    </div>

                                                    <div class="col-3">
                                                        <select name="measurement">
                                                            <option value="кг">●кг</option>
                                                            <option value="м2">●м2</option>
                                                            <option value="м3">●м3</option>
                                                            <option value="мешок">●мешок</option>
                                                            <option value="поддон">●поддон</option>
                                                            <option value="тонн">●тонн</option>
                                                            <option value="шт">●шт</option>
                                                            <option value="литры">●литры</option>
                                                            <option value="метры">●метры</option>
                                                            <option value="погонные метры">●погонные метры</option>

                                                        </select>
                                                    </div>
                                                    <div class="col-3">
                                                        <input type="number" name="qty" value="${(area_form.height)!''}" placeholder="Количество">
                                                    </div>
                                                </div>

                                                <div class="col-3">
                                                    <input type="hidden" name="parentId" value="${p.id}" >
                                                </div>
                                            </div>
                                            <div class="modal-footer my_modal-content">
                                                <button type="submit" class="btn btn-dark">Добавить</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <#--modal update material child-->

                            <div class="modal fade" id="materialsUpdateModal${p.id}" tabindex="-1" aria-labelledby="materialsUpdateModalLabel${p.id}" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header my_modal-content">
                                            <h5 class="modal-title modal_title" id="materialsUpdateModalLabel${p.id}">Добавить work structure: ${p.name}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="/updateMaterial/${p.id}" method="post">
                                            <#if _csrf??>
                                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                            </#if>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <input type="text" name="name" value="${p.name}" placeholder="Наименование">
                                                    </div>
                                                    <div class="col-3">
                                                        <select name="measurement">
                                                            <option value="кг">●кг</option>
                                                            <option value="м2">●м2</option>
                                                            <option value="м3">●м3</option>
                                                            <option value="мешок">●мешок</option>
                                                            <option value="поддон">●поддон</option>
                                                            <option value="тонн">●тонн</option>
                                                            <option value="шт">●шт</option>
                                                            <option value="литры">●литры</option>
                                                            <option value="метры">●метры</option>
                                                            <option value="погонные метры">●погонные метры</option>

                                                        </select>
                                                    </div>
                                                    <div class="col-3">
                                                        <input type="number" name="qty"  placeholder="Количество">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer my_modal-content">
                                                <button type="submit" class="btn btn-dark">Добавить</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>


                            <div id="children_material${p.id}">

                                <#list p.children as c>
                                    <#if c.parentId == p.id>
                                        <ul class="flex_parent_name_and_icon">
                                            <div class="padding_parent_name_and_icon flex_child_name_and_icon">
                                                <li class="work_child_li">
                                                    <p class="section-guidelines__link">${c.name}</p>
                                                </li>
                                            </div>
                                            <div class="flex_parent_name_and_icon flex_parent_name_and_icons">
                                                <div class="padding_parent_name_and_icon">
                                                    <button type="button" class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#materialsChildAddModal${c.id}">+</button>
                                                </div>
                                                <div class="padding_parent_name_and_icon">
                                                    <button type="button" class="project_modal_btn" data-bs-toggle="modal" data-bs-target="#materialsChildUpdateModal${c.id}">
                                                        <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M2.53492 9.20563L0.258077 9.99985L1.05214 7.72285L7.72467 1.05031C8.13413 0.640848 8.798 0.640849 9.20746 1.05031C9.61692 1.45977 9.61692 2.12364 9.20746 2.5331L2.53492 9.20563Z" fill="#393939"/>
                                                        </svg>
                                                    </button>
                                                </div>
                                                <div class="padding_parent_name_and_icon">
                                                    <a href="/deleteMaterial/${c.id}" class="delete" data-confirm="Are you sure you want to delete this item?">
                                                        <svg width="10" height="8" viewBox="0 0 10 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M2.82277 7.103L1.45021 0.583328H8.55109L7.17853 7.103C7.12982 7.33437 6.9257 7.49999 6.68926 7.49999H3.31205C3.0756 7.49999 2.87148 7.33437 2.82277 7.103Z" stroke="#393939"/>
                                                        </svg>
                                                    </a>
                                                </div>
                                            </div>
                                        </ul>


                                    <#--modal create material child-->

                                        <div class="modal fade" id="materialsChildAddModal${c.id}" tabindex="-1" aria-labelledby="materialsChildAddModalLabel${c.id}" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header my_modal-content">
                                                        <h5 class="modal-title modal_title" id="materialsChildAddModalLabel${c.id}">Добавить work structure: ${c.name}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form action="/addWork" method="post">
                                                        <#if _csrf??>
                                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                                        </#if>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <input type="text" name="name" placeholder="Наименование">
                                                                </div>
                                                                <div class="col-3">
                                                                    <select name="measurement">
                                                                        <option value="кг">●кг</option>
                                                                        <option value="м2">●м2</option>
                                                                        <option value="м3">●м3</option>
                                                                        <option value="мешок">●мешок</option>
                                                                        <option value="поддон">●поддон</option>
                                                                        <option value="тонн">●тонн</option>
                                                                        <option value="шт">●шт</option>
                                                                        <option value="литры">●литры</option>
                                                                        <option value="метры">●метры</option>
                                                                        <option value="погонные метры">●погонные метры</option>

                                                                    </select>
                                                                </div>
                                                                <div class="col-3">
                                                                    <input type="number" name="" placeholder="Количество">
                                                                </div>
                                                            </div>
                                                            <div class="col-3">
                                                                <input type="hidden" name="parentId" value="${c.id}" >
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer my_modal-content">
                                                            <button type="submit" class="btn btn-dark">Добавить</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                    <#--modal update material child-->

                                        <div class="modal fade" id="materialsChildUpdateModal${c.id}" tabindex="-1" aria-labelledby="materialsChildUpdateModalLabel${c.id}" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header my_modal-content">
                                                        <h5 class="modal-title modal_title" id="materialsChildUpdateModalLabel${c.id}">Добавить work structure: ${c.name}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form action="/updateMaterial/${c.id}" method="post">
                                                        <#if _csrf??>
                                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                                        </#if>
                                                        <div class="modal-body">

                                                            <div class="row">
                                                                <div class="col-9">
                                                                    <input type="text" name="name" value="${c.name}" placeholder="Наименование">
                                                                </div>
                                                                <div class="col-3">
                                                                    <select name="measurement">
                                                                        <option value="кг">●кг</option>
                                                                        <option value="м2">●м2</option>
                                                                        <option value="м3">●м3</option>
                                                                        <option value="мешок">●мешок</option>
                                                                        <option value="поддон">●поддон</option>
                                                                        <option value="тонн">●тонн</option>
                                                                        <option value="шт">●шт</option>
                                                                        <option value="литры">●литры</option>
                                                                        <option value="метры">●метры</option>
                                                                        <option value="погонные метры">●погонные метры</option>

                                                                    </select>
                                                                </div>
                                                                <div class="col-3">
                                                                    <input type="number" name=""  placeholder="Количество">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer my_modal-content">
                                                            <button type="submit" class="btn btn-dark">Добавить</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>




                                    </#if>
                                </#list>

                            </div>
                        </div>
                        <hr>
                    </#list>
                </div>



            </div>
        </div>
    </div>

<#--    <div>-->
<#--        <div id="test_display"></div>-->
<#--    </div>-->

    <script >

        $(document).on("click", 'div.svg_area', (e) => {
            const div = $(e.currentTarget);
            const id = div.data().wrap;
            $('#children_area'+ id).toggle();
        })

        $(document).on("click", 'div.svg_work', (e) => {
            const div = $(e.currentTarget);
            const id = div.data().wrap;
            $('#children_work'+ id).toggle();
        })


        $(document).on("click", 'div.svg_material', (e) => {
            const div = $(e.currentTarget);
            const id = div.data().wrap;
            $('#children_material'+ id).toggle();
        })

        let deleteLinks = document.querySelectorAll('.delete');

        for (let i = 0; i < deleteLinks.length; i++) {
            deleteLinks[i].addEventListener('click', function(event) {
                event.preventDefault();

                const choice = confirm(this.getAttribute('data-confirm'));

                if (choice) {
                    window.location.href = this.getAttribute('href');
                }
            });
        }

        const buildWorks = (obj) => {
            console.log("*************")
            console.log(obj["name"])
            console.log(obj["workParent"])
            let target_div= document.getElementById("test_display")
            let div = document.createElement('div');
            div.id = 'work'+obj["id"];
            div.innerHTML ="<p>"+ obj["name"]+"</p>";
            target_div.append(div);
            if (obj["workParent"]==null){
                div.className = 'svg_work_collapsable';

            }
            if (obj["workChild"]) {
                console.log("=============")
                let childDiv= document.createElement('div')
                childDiv.id=''
                childDiv.className='children_work'

                //innerHtml
                obj["workChild"].forEach(function (e) {
                    buildWorks(e);
                });
                // buildWorks(obj["workChild"])
            }
            //</div>
        }

        const getWorks = async () => {
            const response = await axios.get('http://localhost:8000/api/getWorks')
            response.data.map(el => {
                buildWorks(el)
            })
        }
        getWorks()

    </script>

<#--    <script >-->
<#--        const port = 8060-->
<#--        $(document).on("click", 'div.svg', (e) => {-->
<#--            const div = $(e.currentTarget);-->
<#--            const id = div.data().wrap;-->
<#--            $('#product_'+ id).toggle();-->
<#--        })-->

<#--        const buildWorks = (obj) => {-->
<#--            console.log("*************")-->
<#--            console.log(obj["name"])-->
<#--            // <div>-->
<#--            if (obj["workChild"]) {-->
<#--                console.log("=============")-->
<#--                //innerHtml-->
<#--                obj["workChild"].forEach(function (e) {-->
<#--                    buildWorks(e);-->
<#--                });-->
<#--                // buildWorks(obj["workChild"])-->
<#--            }-->
<#--            //</div>-->
<#--        }-->

<#--        const getWorks = async () => {-->
<#--            const response = await axios.get('http://localhost:8060/api/getWorks')-->
<#--            response.data.map(el => {-->
<#--                buildWorks(el)-->
<#--            })-->
<#--        }-->
<#--        getWorks()-->

<#--    </script>-->


</@base.layout>