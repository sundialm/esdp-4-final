<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h2>Registration</h2>
<div>
    <form action="/register" method="post">
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'no-token'}">
        </#if>
        <div class="form-row">
            <label for="name" class="flex flex-v-center">
                <p class="label-input-text">Your Fist name</p>
                <input id="firstName" name="firstName" placeholder="input your first name" type="text" value="${(dto.firstName)}">

            </label>
        </div>
        <div class="form-row">
            <label for="name" class="flex flex-v-center">
                <p class="label-input-text">Your Surname</p>
                <input id="surName" name="surName" placeholder="input your surname" type="text" value="${(dto.surName)}">

            </label>
        </div>
        <div class="form-row">
            <label for="name" class="flex flex-v-center">
                <p class="label-input-text">Your Email</p>
                <input id="email" name="email" placeholder="input your email" type="text" value="${(dto.email)}">
            </label>
        </div>
        <div class="form-row">
            <label for="email" class="flex flex-v-center">
                <p class="label-input-text">Your Firm name</p>
                <input id="firmName" name="firmName" placeholder="input your firmName" type="text" value="${(dto.firmName)}">
            </label>
        </div>
        <div class="form-row">
            <label for="password" class="flex flex-v-center">
                <p class="label-input-text">Your password</p>
                <input id="password" name="password" placeholder="input your password" type="password" value="${(dto.password)}">
            </label>
        </div>
        <div class="form-row">
            <input type="submit" value="Register">
        </div>
        <#if errors??>
            <p>Incorrect register data</p>
            <#list errors as fieldError>
                <p>${fieldError.field} - ${fieldError.defaultMessage!'no message'}</p>
            </#list>
        </#if>
    </form>
</div>
<div class="bottom-box"><a href="/">Main page</a></div>
</body>
</html>