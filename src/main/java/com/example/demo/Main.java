package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Main {

    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
    }

//    @Bean
//    CommandLineRunner run (WorkService workService){
//        return args -> {
//            workService.saveWork(new Work(null,"Подготовительные работы", new ArrayList<>(), null));
//            workService.saveWork(new Work(null,"Монолитные работы", new ArrayList<>(), null));
//            workService.saveWork(new Work(null,"Монтаж оборудования", new ArrayList<>(), null));
//            workService.saveWork(new Work(null,"Сантехника ОВВК", new ArrayList<>(), null));
//            workService.saveWork(new Work(null,"Электрика", new ArrayList<>(), null));
//            workService.saveWork(new Work(null,"Наружные сети", new ArrayList<>(), null));
//            workService.saveWork(new Work(null,"Благоустройства", new ArrayList<>(), null));
//            workService.saveWork(new Work(null,"Демонтаж", new ArrayList<>(), null));
//
//            workService.addSubWorkToParentWork("Подготовительные работы", "Строительство временных: дорог; площадок; инженерных сетей и сооружений");
//            workService.addSubWorkToParentWork("Подготовительные работы", "Устройство рельсовых подкрановых путей и фундаментов (опоры) стационарных кранов");
//            workService.addSubWorkToParentWork("Подготовительные работы", "Установка инвентарных наружных и внутренних лесов, технологических мусоропроводов");
//
//            workService.addSubWorkToParentWork("Монолитные работы", "Опалубочные работы");
//            workService.addSubWorkToParentWork("Монолитные работы", "Арматурные работы");
//            workService.addSubWorkToParentWork("Монолитные работы", "Устройство монолитных бетонных и железобетонных конструкций");
//
//            workService.addSubWorkToParentWork("Монтаж оборудования", "Монтаж подъемно-транспортного оборудования");
//            workService.addSubWorkToParentWork("Монтаж оборудования", "Монтаж оборудования тепловых электростанций");
//            workService.addSubWorkToParentWork("Монтаж оборудования", "Монтаж оборудования котельных");
//            workService.addSubWorkToParentWork("Монтаж оборудования", "Монтаж компрессорных установок, насосов и вентиляторов");
//            workService.addSubWorkToParentWork("Монтаж оборудования", "Монтаж электротехнических установок, оборудования");
//            workService.addSubWorkToParentWork("Монтаж оборудования", "Монтаж слаботочных систем");
//
//            workService.addSubWorkToParentWork("Сантехника ОВВК", "Устройство сетей водопровода");
//            workService.addSubWorkToParentWork("Сантехника ОВВК", "Устройство сетей канализации");
//            workService.addSubWorkToParentWork("Сантехника ОВВК", "Устройство сетей теплоснабжения");
//            workService.addSubWorkToParentWork("Сантехника ОВВК", "Устройство сетей газоснабжения");
//
//            workService.addSubWorkToParentWork("Электрика", "Устройство системы электроснабжения");
//
//            workService.addSubWorkToParentWork("Наружные сети", "Устройство наружных электрических сетей");
//            workService.addSubWorkToParentWork("Наружные сети", "Устройство иных сетей управления системами жизнеобеспечения зданий и сооружений");
//            workService.addSubWorkToParentWork("Наружные сети", "Укладка трубопроводов водопроводных");
//            workService.addSubWorkToParentWork("Наружные сети", "Монтаж запорной арматуры и оборудования водопроводных сетей");
//            workService.addSubWorkToParentWork("Наружные сети", "Устройство водопроводных колодцев, оголовков, гасителей водосборов");
//            workService.addSubWorkToParentWork("Наружные сети", "Устройство наружных линий связи, в том числе телефонных, радио и телевидения");
//
//            workService.addSubWorkToParentWork("Благоустройства", "Обустройство для стоянок автомобилей");
//            workService.addSubWorkToParentWork("Благоустройства", "Установка детских и спортивных площадок");
//            workService.addSubWorkToParentWork("Благоустройства", "Озеленение территории");
//            workService.addSubWorkToParentWork("Благоустройства", "Установка ограждений");
//            workService.addSubWorkToParentWork("Благоустройства", "Установка малых архитектурных форм");
//
//            workService.addSubWorkToParentWork("Демонтаж", "Демонтаж монолита");
//            workService.addSubWorkToParentWork("Демонтаж", "Демонтаж ОВВК");
//            workService.addSubWorkToParentWork("Демонтаж", "Демонтаж электрики");
//
//        };
//    }
}
