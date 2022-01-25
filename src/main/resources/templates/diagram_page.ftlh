<#import "base.ftlh" as base>
<@base.layout>

    <script>
        $(document).ready(function() {
            $(".js-example-tokenizer").select2({
                tags: true,
                tokenSeparators: [',', ' ']
            })
            $('#mySelect').select2({
                dropdownParent: $('#myModal')
            })
            $('#mySelectMaterials').select2({
                dropdownParent: $('#myModal')
            });});
    </script>
    <div class="row diagram">
        <div class="col-12">
            <div class="diagram_header">
                <div class="row">
                    <div class="col-2 m-2 add_ghant">
                        <img src="/images/plus.png" class="img_properties">
                        <button class="diagram_btn" data-bs-toggle="modal" data-bs-target="#taskAddModal">Добавить</button>

                        <div class="modal fade" id="taskAddModal" tabindex="-1" aria-labelledby="taskAddModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header my_modal-content">
                                        <h5 class="modal-title modal_title" id="taskAddModalLabel">Создать</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form action="/addTask" method="post" autocomplete="off">
                                        <#if _csrf??>
                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                        </#if>
                                        <div class="modal-body" id="myModal">
                                            <div class="row">
                                                <div class="col-3">
                                                    <select name="taskType" id="taskType">
                                                        <option value=""disabled selected>Тип</option>
                                                        <option value=0>Задание</option>
                                                        <option value=1>Вехо</option>
                                                    </select>
                                                    <div>
                                                        <p>Зависит от</p>
                                                    <select id="mySelect" name="parents" multiple="multiple"  class="js-example-tokenizer" id="parents">

                                                        <#list tasks as t>
                                                            <option value="${t.id}">${t.name}</option>
                                                        </#list>
                                                    </select>
                                                    </div>
                                                    <select name="work" id="work">
                                                        <option value=""disabled selected>Тип работ</option>
                                                        <#list works as w>
                                                            <option value="${w.id}">${w.name}</option>
                                                        </#list>
                                                    </select>
                                                    <select name="area" id="area">
                                                        <option value=""disabled selected>Место работ</option>
                                                        <#list areas as a>
                                                            <option value="${a.id}">${a.name}</option>
                                                        </#list>
                                                    </select>
                                                    <div class="col-9">
                                                        <p>Материалы</p>
                                                    <select id="mySelectMaterials" name="materials" multiple="multiple" id="area" class="js-example-tokenizer" >
                                                        <#list materials as m>
                                                            <option value="${m.id}">${m.name}</option>
                                                        </#list>
                                                    </select>
                                                    </div>
                                                </div>
                                                <div class="col-9">
                                                    <input type="text" name="name" placeholder="Название">
                                                </div>
                                                <div class="col-9">
                                                    <input type="text" name="user" placeholder="Ответственный">
                                                </div>
                                                <div class="col-9">
                                                    <input type="text" name="brigade" placeholder="бригада">
                                                </div>
                                                <div class="col-9">
                                                    <input type="text" name="equipment" placeholder="экипировка">
                                                </div>
                                                <div class="col-9">
                                                    <input type="number" name="numberOfPeople" placeholder="Количество людей">
                                                </div>
                                                <div class="col-3">
                                                    <img src="/images/date_icon.png" class="diagram_calendar_icon"><p>Запланировано на</p>
                                                    <input type="text" name="date" id="datepicker">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer my_modal-content">
                                            <button type="submit" class="btn btn-dark">Сохранить</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 m-2">
                        <img src="/images/edit_icon_pen.png" class="img_properties">
                        <button class="diagram_btn">Редактировать</button>
                    </div>

                    <div class="col-2 m-2 ">
                        <img src="/images/export_icon.png" class="img_properties">
                        <button class="diagram_btn" data-bs-toggle="modal" data-bs-target="#taskExportModal">Экспортировать</button>

                        <div class="modal fade" id="taskExportModal" tabindex="-1" aria-labelledby="taskExportModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header my_modal-content">
                                        <h5 class="modal-title modal_title" id="taskExportModalLabel">Выберите формат экспорта</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-6">
                                                <input class="btn btn-dark" value="PDF" type="button" onclick='gantt.exportToPDF()'>
                                            </div>
                                            <div class="col-6">
                                                <input class="btn btn-dark" value="PNG" type="button" onclick='gantt.exportToPNG()'>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 m-2">
                        <img src="/images/opened_icon.png" class="diagram_icons">
                        <span class="status_words">Открытый</span>
                    </div>
                    <div class="col-1 m-2">
                        <img src="/images/inprocess_icon.png" class="diagram_icons">
                        <span class="status_words ">В процессе</span>
                    </div>
                    <div class="col-1 m-2">
                        <img src="/images/done_icon.png" class="diagram_icons">
                        <span class="status_words">Выполнено</span>
                    </div>
                    <div class="col-2 m-2">
                        <img src="/images/out_of_plan_icon.png" class="diagram_icons">
                        <span class="status_words">Выполнено вне плана</span>
                    </div>
                    <div class="col-2 mt-3 ms-2">
                        <svg xmlns="http://www.w3.org/2000/svg" class="filter_icon" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M4.68572 4C4.42213 4 4.18187 4.15109 4.06768 4.38867C3.9535 4.62625 3.9856 4.90825 4.15027 5.11408L9.25696 11.4974V17.9682C9.25696 18.1373 9.3503 18.2926 9.49963 18.3719L14.0711 20.8005C14.3755 20.9622 14.7427 20.7415 14.7427 20.3968V11.4979L19.8497 5.11408C20.0144 4.90825 20.0465 4.62625 19.9323 4.38867C19.8181 4.15109 19.5779 4 19.3143 4H4.68572ZM10.4991 11.7714H13.4991V19.1017L10.4991 17.6017V11.7714ZM10 10.5L6 5.5H18L14 10.5H10Z" fill="#848484"/>
                            <path d="M4.06768 4.38867L4.15781 4.43199L4.06768 4.38867ZM4.15027 5.11408L4.22835 5.05161H4.22835L4.15027 5.11408ZM9.25696 11.4974H9.35696C9.35696 11.4747 9.34923 11.4527 9.33505 11.435L9.25696 11.4974ZM9.49963 18.3719L9.54655 18.2836L9.49963 18.3719ZM14.0711 20.8005L14.0241 20.8888H14.0241L14.0711 20.8005ZM14.7427 11.4979L14.6646 11.4354C14.6504 11.4532 14.6427 11.4752 14.6427 11.4979H14.7427ZM19.8497 5.11408L19.9278 5.17655L19.8497 5.11408ZM19.9323 4.38867L19.8422 4.43199L19.8422 4.43199L19.9323 4.38867ZM13.4991 11.7714H13.5991C13.5991 11.7162 13.5544 11.6714 13.4991 11.6714V11.7714ZM10.4991 11.7714V11.6714C10.4439 11.6714 10.3991 11.7162 10.3991 11.7714H10.4991ZM13.4991 19.1017L13.4544 19.1911C13.4854 19.2066 13.5222 19.205 13.5517 19.1868C13.5812 19.1685 13.5991 19.1364 13.5991 19.1017H13.4991ZM10.4991 17.6017H10.3991C10.3991 17.6396 10.4205 17.6742 10.4544 17.6911L10.4991 17.6017ZM6 5.5V5.4C5.96156 5.4 5.92652 5.42203 5.90987 5.45668C5.89322 5.49133 5.8979 5.53245 5.92191 5.56247L6 5.5ZM10 10.5L9.92191 10.5625C9.94089 10.5862 9.96962 10.6 10 10.6V10.5ZM18 5.5L18.0781 5.56247C18.1021 5.53245 18.1068 5.49133 18.0901 5.45668C18.0735 5.42203 18.0384 5.4 18 5.4V5.5ZM14 10.5V10.6C14.0304 10.6 14.0591 10.5862 14.0781 10.5625L14 10.5ZM4.15781 4.43199C4.25535 4.22906 4.46057 4.1 4.68572 4.1V3.9C4.38369 3.9 4.10839 4.07313 3.97755 4.34535L4.15781 4.43199ZM4.22835 5.05161C4.0877 4.87579 4.06028 4.63492 4.15781 4.43199L3.97755 4.34535C3.84672 4.61757 3.8835 4.9407 4.07218 5.17655L4.22835 5.05161ZM9.33505 11.435L4.22835 5.05161L4.07218 5.17655L9.17887 11.5599L9.33505 11.435ZM9.15696 11.4974V17.9682H9.35696V11.4974H9.15696ZM9.15696 17.9682C9.15696 18.1743 9.27072 18.3635 9.45272 18.4602L9.54655 18.2836C9.42988 18.2216 9.35696 18.1003 9.35696 17.9682H9.15696ZM9.45272 18.4602L14.0241 20.8888L14.118 20.7122L9.54655 18.2836L9.45272 18.4602ZM14.0241 20.8888C14.3952 21.0859 14.8427 20.817 14.8427 20.3968H14.6427C14.6427 20.6661 14.3558 20.8385 14.118 20.7122L14.0241 20.8888ZM14.8427 20.3968V11.4979H14.6427V20.3968H14.8427ZM19.7716 5.05161L14.6646 11.4354L14.8208 11.5604L19.9278 5.17655L19.7716 5.05161ZM19.8422 4.43199C19.9397 4.63492 19.9123 4.87579 19.7716 5.05161L19.9278 5.17655C20.1165 4.9407 20.1533 4.61757 20.0224 4.34535L19.8422 4.43199ZM19.3143 4.1C19.5394 4.1 19.7447 4.22906 19.8422 4.43199L20.0224 4.34535C19.8916 4.07313 19.6163 3.9 19.3143 3.9V4.1ZM4.68572 4.1H19.3143V3.9H4.68572V4.1ZM13.4991 11.6714H10.4991V11.8714H13.4991V11.6714ZM13.5991 19.1017V11.7714H13.3991V19.1017H13.5991ZM10.4544 17.6911L13.4544 19.1911L13.5439 19.0123L10.5439 17.5123L10.4544 17.6911ZM10.3991 11.7714V17.6017H10.5991V11.7714H10.3991ZM5.92191 5.56247L9.92191 10.5625L10.0781 10.4375L6.07809 5.43753L5.92191 5.56247ZM18 5.4H6V5.6H18V5.4ZM14.0781 10.5625L18.0781 5.56247L17.9219 5.43753L13.9219 10.4375L14.0781 10.5625ZM10 10.6H14V10.4H10V10.6Z" fill="#848484"/>
                        </svg>
                        <a href="" class="show_filters full_screen">Показать фильтры</a>
                    </div>
                    <div class="col-2 mt-3">
                        <input id="fullscreen_button" class="full_screen" type="button" value="Полноэкранный режим"/>
                    </div>
                    <div class="col-2 mt-3">
                        <input class="full_screen" type=button  value="Скрыть проекты" onclick="toggle_grid()">
                    </div>
                    <div class="col-2 mt-3">
                        <input class="full_screen" type=button value="Скрыть чарт" onclick="toggle_chart()">
                    </div>
                    <div class="col-3 mt-3">
                        <div class="btn-group d-flex  right_radio justify-content-end" role="group" >
                            <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                            <label class="btn btn-outline-dark" for="btnradio1">Неделя</label>

                            <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                            <label class="btn btn-outline-dark" for="btnradio2">Месяц</label>

                            <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                            <label class="btn btn-outline-dark" for="btnradio3">Весь проект</label>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-12">
            <div id="gantt_here" class="gantt_div">
                <script src="/js/main.js"></script>
            </div>
        </div>
    </div>
    <script>
        function toggle_grid(){
            gantt.config.show_grid = !gantt.config.show_grid;
            gantt.render()
        }

        function toggle_chart(){
            gantt.config.show_chart = !gantt.config.show_chart;
            gantt.render()
        }
    </script>

</@base.layout>