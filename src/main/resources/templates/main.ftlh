<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="../style/main.css">
    <link rel="stylesheet" href="../style/modal.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap" rel="stylesheet">
    <title>Main</title>
</head>
<body>
<header class="header">
    <svg class="logo__2" width="117" height="48" viewBox="0 0 117 48" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g clip-path="url(#clip0)">
            <path d="M32.8715 3.47815V8.03938H5.38413V21.1529H26.6373V25.7142H5.38413V38.8277H33.4383V43.389H0V3.47815H32.8715Z" fill="white"/>
            <path d="M80.7513 28.981L62.4338 47.4197L51.3199 47.8359L33.1838 29.591L33.5976 18.4103L51.915 -0.0170898L55.2078 3.2955L38.5623 20.0523L38.3583 26.8942L54.0006 42.6305L60.8016 42.4252L77.4697 25.6569L80.7513 28.981Z" fill="white"/>
            <path d="M81.8271 18.5929V10.3256L89.1949 3.48376H114.699V8.045H91.4619L87.2113 12.0361V16.5973L91.7453 20.8735H109.315L116.682 27.7153V36.5527L109.315 43.3946H82.3939V38.8333H107.019L111.27 34.8422V29.4258L107.019 25.4347H89.1665L81.8271 18.5929Z" fill="white"/>
            <path d="M56.7261 31.6493V29.3687L50.9396 27.0881V24.3342L55.0428 26.0903V24.1176L50.8659 22.3786L50.8205 20.3147L56.6751 22.4356V20.6225L49.2109 18.1024V17.7091L50.2651 17.3499L57.3892 19.8585L59.2084 19.22L53.4049 17.327L57.5365 15.9872L62.9546 18.0226L64.4848 17.481L65.7034 17.7604V18.1024L58.1713 20.5598L58.2449 24.015L60.0868 25.7254L63.4307 24.8075L64.5302 25.2807V26.3526L63.8331 27.4644L58.3526 29.4029L58.1996 31.6208L57.5535 32.1168L56.7261 31.6493Z" fill="white"/>
            <path d="M65.6698 19.8127L65.6585 23.8209L64.3209 23.1025L60.9771 24.0148L60.0193 23.3021L59.991 21.7627L65.6698 19.8127Z" fill="white"/>
        </g>
        <defs>
            <clipPath id="clip0">
                <rect width="117" height="48" fill="white"/>
            </clipPath>
        </defs>
    </svg>
    <div class="login__modal"  id="login__modal">
        <a class="white " href="" data-btn="login" >Вход</a>
    </div>
    <form class=" cd-form" action="/login" method="post" id="cd-form">
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
        </#if>
        <p class="fieldset">
            <input class="full" name="username" type="email" placeholder="Логин">
        <hr >
        </p>
        <p class="fieldset ">
            <input class="full "  id="signin-password" name="password" type="password"  placeholder="Пароль" style="color: gray">
        </p>
        <hr>
        <p class="fieldsett ">
            <button class="btnStyle item"  type="submit" >Вход</button>
        </p>
        <p class="fieldsett " >
            <a href="/resetPassword" id="reset__modal"> Забыли пароль?</a>
        </p>
    </form>
    <form class="reset__modal" >
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
        </#if>
        <div class="cd-form-reset" action="/login" method="get" id="reset">
            <p class="fieldset">
                <input class="full"  type="email" placeholder="Ваша почта">
            <hr >
            </p>
            <hr>
            <p class="fieldsett ">
                <input class="btnStyle item"  type="submit" value="Отправить  ">
            </p>
            <p class="resetField " >Для восстанавления пароля отправьте вашу почту</p>
        </div>
    </form>
</header>
<main>
    <div class="text_forecast_production_control">
        <h1 class="text one">Forecast</h1>
        <h1 class="text two">Production</h1>
        <h1 class="text three">Control</h1>
    </div>
    <div class="vector">
        <svg width="600" height="580" viewBox="0 0 901 878" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path opacity="0.05" d="M410.148 850.666V850.959L410.403 851.102L455.507 876.436L455.793 876.597L456.055 876.397L491.274 849.52L491.454 849.382L491.469 849.157L499.788 729.305L798.219 624.374L798.384 624.316L798.477 624.169L836.475 563.925L836.552 563.803V563.658V505.578V505.248L836.249 505.118L776.313 479.475L776.153 479.407L775.985 479.452L593.98 529.12L493.936 436.769L489.936 250.134L900.154 117.093L900.5 116.981V116.618V98.0817V97.6829L900.111 97.5943L833.689 82.4554L833.548 82.4233L833.412 82.4713L750.172 111.761L454.999 1.5316L454.836 1.47077L454.67 1.52412L229.459 74.126L227.987 74.6005L229.458 75.0775L544.394 177.189L446.795 211.243L58.6268 75.3659L58.4642 75.309L58.3012 75.3643L0.839591 94.8278L0.5 94.9428V95.3014V116.618V116.977L0.840911 117.092L407.369 253.53V350.703L88.906 236.017L88.2206 235.77L88.2367 236.499L90.7105 348.336L90.7177 348.662L91.0192 348.787L318.395 442.887V548.691L95.4223 453.833L94.7266 453.537V454.293V603.512V603.853L95.0442 603.978L410.148 727.43V850.666ZM898.647 209.302L898.649 208.601L897.986 208.828L588.433 314.486L588.088 314.604L588.094 314.969L589.639 398.383L589.644 398.63L589.842 398.776L642.051 437.394L642.246 437.538L642.48 437.475L824.56 388.096L897.294 426.929L898.027 427.32L898.029 426.489L898.647 209.302Z" fill="white" stroke="white"/>
        </svg>
    </div>
</main>
<script src="../js/loginIndex.js"></script>
<script src="../js/resetIndex.js"></script>
</body>
</html>