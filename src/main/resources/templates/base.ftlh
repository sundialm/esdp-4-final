<#macro layout custom_scripts="" custom_css = "" page_name = "" scripts=[]>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../style/base.css">
        <link rel="stylesheet" href="../style/modal.css">
        <link rel="stylesheet" href="/style/projectStructure.css">
        <link rel="stylesheet" href="/style/jquery-ui.min.css">
        <link rel="stylesheet" href="/style/diagram.css">
        <link rel="stylesheet" href="/style/dhtmlxgantt_material.css">
        <link rel="stylesheet" href="/style/production_plan.css">
        <link rel="stylesheet" href="/style/analytic.css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

        <script src="/js/dhtmlxgantt.js"></script>
        <script src="/js/multicheckbox.js"></script>
        <script src="/js/plan.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="/js/jquery-ui.min.js"></script>
        <script src="/js/datepicker.js"></script>
        <script src="/js/production_plan.js"></script>
        <script src="/js/gantt_export_api.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        ${custom_css}
        <title>${page_name}</title>
    </head>
    <body>
    <header class="container">
        <div class="menuStructure">


            <svg  class="logo2" xmlns="http://www.w3.org/2000/svg" width="117" height="48" viewBox="0 0 117 48" fill="none">
                <g clip-path="url(#clip0_256_119)">
                    <path d="M32.8715 3.47815V8.03938H5.38413V21.1529H26.6373V25.7142H5.38413V38.8277H33.4383V43.389H0V3.47815H32.8715Z" fill="white"/>
                    <path d="M80.751 28.981L62.4336 47.4197L51.3196 47.8359L33.1836 29.591L33.5973 18.4103L51.9147 -0.0170898L55.2075 3.2955L38.5621 20.0523L38.358 26.8942L54.0003 42.6305L60.8013 42.4252L77.4695 25.6569L80.751 28.981Z" fill="white"/>
                    <path d="M81.8271 18.5929V10.3257L89.1949 3.4838H114.699V8.04504H91.4619L87.2113 12.0361V16.5973L91.7453 20.8735H109.315L116.682 27.7154V36.5527L109.315 43.3946H82.3939V38.8334H107.019L111.27 34.8423V29.4258L107.019 25.4347H89.1665L81.8271 18.5929Z" fill="white"/>
                    <path d="M56.7261 31.6493V29.3686L50.9396 27.088V24.3342L55.0428 26.0903V24.1175L50.8659 22.3786L50.8205 20.3146L56.6751 22.4356V20.6225L49.2109 18.1024V17.709L50.2651 17.3498L57.3892 19.8585L59.2084 19.2199L53.4049 17.327L57.5365 15.9871L62.9546 18.0226L64.4848 17.4809L65.7034 17.7603V18.1024L58.1713 20.5598L58.2449 24.0149L60.0868 25.7254L63.4307 24.8074L64.5302 25.2807V26.3525L63.8331 27.4643L58.3526 29.4029L58.1996 31.6208L57.5535 32.1168L56.7261 31.6493Z" fill="white"/>
                    <path d="M65.6696 19.8128L65.6582 23.821L64.3207 23.1026L60.9769 24.0148L60.0191 23.3021L59.9907 21.7627L65.6696 19.8128Z" fill="white"/>
                </g>
                <defs>
                    <clipPath id="clip0_256_119">
                        <rect width="117" height="48" fill="white"/>
                    </clipPath>
                </defs>
            </svg>

            <div class="mrg p_menu_structure_link" >
                <a  class="nav_bar_link"  href="/diagram">Диаграмма</a>
            </div>

            <div class="mrg p_menu_structure_link" >
                <a class="nav_bar_link"  href="/projectStructure">Структура проекта</a>
            </div>

            <div class="mrg p_menu_structure_link" >
                <a  class="nav_bar_link"  href="/analytic">Аналитика</a>
            </div>

            <div class="mrg p_menu_structure_link" >
                <a  class="nav_bar_link"  href="/plan">План производства</a>
            </div>





        </div>
        <ul class="logout">
            <a href="/"><label  style="color: #60FFFF" for="">${username}</label></a>
            <form action="/logout" method="post">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                </#if>
                <button type="submit" class="exit_button">Выход</button>
            </form>
        </ul>

    </header>
    </div>
    <div class="col-10 ">
        <div class="content">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'no-token'}">
            </#if>
            <#nested/>
        </div>
    </div>

    </div>

    <#list scripts as scriptSource>
        <script src="${scriptSource}"></script>
    </#list>

    ${custom_scripts}

    </body>
    </html>
</#macro>
