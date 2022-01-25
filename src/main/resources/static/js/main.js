document.addEventListener("DOMContentLoaded", function() {

    //Отображение даты в таймлайне
    gantt.config.scales = [
        {unit: "day", step:1, format: "%j, %D" },
        {unit: "month", step: 1, format: "%F, %Y"}
    ];

    //Статические данные
    var data = {
        tasks:[
            {id:11, text:"Project #1", type:"project"},
            {id:12, text:"Task #1", start_date:"03-04-2021", duration: "10", parent:"11"},
            {id:13, text:"Task #2", start_date:"03-04-2021", type:"project", parent:"11"},
            {id:16, text:"Final milestone", start_date:"08-04-2021", type:"milestone",
                rollup: true, parent:"11"},
            {id:17, text:"Task #2.1", start_date:"03-04-2021", duration:"2",
                parent:"13"},
            {id:18, text:"Task #2.2", start_date:"06-04-2021", duration:"1",
                parent:"13"}],
        links:[{id:1,source:11, target:12, type:"1"},
            {id:2,source:13, target:17, type:"1"},
            {id:3,source:17, target:18, type:"1"}]
    };

    //Рисунок + для добавления
    var addLabel = [
        "<div class='gantt-text-label'>"+
        "<img src='/images/plus.png' style='width: 10px; height: 10px'>"+
        "</div>"
    ].join("");

    gantt.config.columns =  [
        {name:"text", label:"Название",  tree:true, width:"*" },
        {name: "my_add", label:addLabel, width: 44}
    ];

    //Полноэкранный режим
    gantt.plugins({
        fullscreen: true
    });

    var button = document.getElementById("fullscreen_button");
    button.addEventListener("click", function(){
        if (!gantt.getState().fullscreen) {
            gantt.expand();
        }
        else {
            gantt.collapse();
        }
    }, false);

    //Локализация
    gantt.i18n.setLocale("ru");


    //Инициализация и парсинг статических данных, здесь происходит отрисовка на странице
    gantt.init("gantt_here");
    gantt.parse(data);
});