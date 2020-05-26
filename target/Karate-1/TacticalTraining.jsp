<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--СПИСОК СПОРТСМЕНОВ--%>
<sql:query var="userList" dataSource="jdbc/poiu">
    select id, name from athletelist
</sql:query>

<%--ВЫБОРКА ДАННЫХ (НАЧАЛО ИССЛЕДОВАНИЯ)--%>
<sql:query var="userParameters" dataSource="jdbc/poiu">
    select * from staticalindicators
    where idAthlete = ${not empty userID ? userID : 0}
    AND IndicatorsDate BETWEEN '${not empty time_begin ? time_begin : '2000-05-10'}' AND concat('${not empty time_begin ? time_begin : '2020-05-10'}',' 23:59:59')
</sql:query>
<c:set var="userListParameters" value="${userParameters.rows[0]}"/>

<%--ВЫБОРКА ДАННЫХ (КОНЕЦ ИССЛЕДОВАНИЯ)--%>
<sql:query var="userParametersEnd" dataSource="jdbc/poiu">
    select * from staticalindicators
    where idAthlete = ${not empty userID ? userID : 0}
    AND IndicatorsDate BETWEEN '${not empty time_end ? time_end : '2000-05-10'}' AND concat('${not empty time_end ? time_end : '2020-05-10'}',' 23:59:59')
</sql:query>
<c:set var="userListParametersEnd" value="${userParametersEnd.rows[0]}"/>

<%--ДОБАВЛЕНИЕ ДАННЫХ В БД--%>
<c:choose>
    <c:when test="${not empty param.scope_action}">
        <c:set var="values" value="${param.scope_action}"/>
        <sql:update var="timeUp" dataSource="jdbc/poiu">
            INSERT INTO staticalindicators(idAthlete,IndicatorsDate,scope_action) 
            VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${values}) 
            ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), scope_action = ${values};
        </sql:update>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<c:if test="${not empty param.versatility_technical_actions}">
    <c:set var="val" value="${param.versatility_technical_actions}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,versatility_technical_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), versatility_technical_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.attack_efficiency}">
    <c:set var="val" value="${param.attack_efficiency}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,attack_efficiency) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), attack_efficiency = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.protective_actions}">
    <c:set var="val" value="${param.protective_actions}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,protective_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), protective_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.warfare_ratio}">
    <c:set var="val" value="${param.warfare_ratio}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,warfare_ratio) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), warfare_ratio = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.performance_ratio}">
    <c:set var="val" value="${param.performance_ratio}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,performance_ratio) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), performance_ratio = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.technical_readiness}">
    <c:set var="val" value="${param.technical_readiness}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,technical_readiness) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), technical_readiness = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.scope_tactical_action}">
    <c:set var="val" value="${param.scope_tactical_action}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,scope_tactical_action) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), scope_tactical_action = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.versatility_actions}">
    <c:set var="val" value="${param.versatility_actions}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,versatility_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), versatility_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.chosen_tactics}">
    <c:set var="val" value="${param.chosen_tactics}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,chosen_tactics) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), chosen_tactics = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.adjustment_factor}">
    <c:set var="val" value="${param.adjustment_factor}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,adjustment_factor) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), adjustment_factor = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.preparatory_actions}">
    <c:set var="val" value="${param.preparatory_actions}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,preparatory_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), preparatory_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.situational_actions}">
    <c:set var="val" value="${param.situational_actions}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,situational_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), situational_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.tactical_action}">
    <c:set var="val" value="${param.tactical_action}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,tactical_action) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), tactical_action = ${val};
    </sql:update>
</c:if>
<%---------------------------%>

<c:choose>
    <c:when test="${not empty param.scope_action_end}">
        <c:set var="values" value="${param.scope_action_end}"/>
        <sql:update var="timeUp" dataSource="jdbc/poiu">
            INSERT INTO staticalindicators(idAthlete,IndicatorsDate,scope_action) 
            VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${values}) 
            ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), scope_action = ${values};
        </sql:update>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<c:if test="${not empty param.versatility_technical_actions_end}">
    <c:set var="val" value="${param.versatility_technical_actions_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,versatility_technical_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), versatility_technical_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.attack_efficiency_end}">
    <c:set var="val" value="${param.attack_efficiency_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,attack_efficiency) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), attack_efficiency = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.protective_actions_end}">
    <c:set var="val" value="${param.protective_actions_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,protective_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), protective_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.warfare_ratio_end}">
    <c:set var="val" value="${param.warfare_ratio_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,warfare_ratio) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), warfare_ratio = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.performance_ratio_end}">
    <c:set var="val" value="${param.performance_ratio_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,performance_ratio) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), performance_ratio = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.technical_readiness_end}">
    <c:set var="val" value="${param.technical_readiness_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,technical_readiness) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), technical_readiness = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.scope_tactical_action_end}">
    <c:set var="val" value="${param.scope_tactical_action_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,scope_tactical_action) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), scope_tactical_action = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.versatility_actions_end}">
    <c:set var="val" value="${param.versatility_actions_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,versatility_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), versatility_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.chosen_tactics_end}">
    <c:set var="val" value="${param.chosen_tactics_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,chosen_tactics) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), chosen_tactics = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.adjustment_factor_end}">
    <c:set var="val" value="${param.adjustment_factor_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,adjustment_factor) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), adjustment_factor = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.preparatory_actions_end}">
    <c:set var="val" value="${param.preparatory_actions_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,preparatory_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), preparatory_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.situational_actions_end}">
    <c:set var="val" value="${param.situational_actions_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,situational_actions) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), situational_actions = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.tactical_action_end}">
    <c:set var="val" value="${param.tactical_action_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,tactical_action) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), tactical_action = ${val};
    </sql:update>
</c:if>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <style>.column {
                float: left;
                width: 50%;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }</style>
        <style>
            [data-tooltip] {
                position: relative; /* Относительное позиционирование */ 
            }
            [data-tooltip]::after {
                white-space: pre-line;
                content: attr(data-tooltip); /* Выводим текст */
                position: absolute; /* Абсолютное позиционирование */
                width: 300px; /* Ширина подсказки */
                left: 0; top: 0; /* Положение подсказки */
                background: #3989c9; /* Синий цвет фона */
                color: #fff; /* Цвет текста */
                padding: 0.5em; /* Поля вокруг текста */
                box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* Параметры тени */
                pointer-events: none; /* Подсказка */
                opacity: 0; /* Подсказка невидима */
                transition: 1s; /* Время появления подсказки */
            } 
            [data-tooltip]:hover::after {
                opacity: 1; /* Показываем подсказку */
                top: 2em; /* Положение подсказки */
            }
        </style>
    <a href="index.jsp">ФУНКЦИОНАЛЬНАЯ ПОДГОТОВЛЕННОСТЬ</a>   &nbsp;&nbsp; &nbsp;&nbsp;  
    <a href="PhysicalTraining.jsp">ФИЗИЧЕСКАЯ ПОДГОТОВКА</a>   &nbsp;&nbsp; &nbsp;&nbsp;
    <a href="TacticalTraining.jsp">ТЕХНИКО-ТАКТИЧЕСКАЯ ПОДГОТОВКА</a>   &nbsp;&nbsp; &nbsp;&nbsp;
    <a href="PsychologicalTraining.jsp">ПСИХОЛОГИЧЕСКАЯ ПОДГОТОВКА</a>   &nbsp;&nbsp; &nbsp;&nbsp;
</head>
<body>


    <div id="somediv"></div>
    <%--СПИСОК ПОКАЗАТЕЛЕЙ--%>
    <form action="UserServlet"> 
        <p>Спортсмен:&nbsp; 
            <select name="user_id">
                <c:forEach var="row" items="${userList.rows}">
                    <option value="${row.id}">${row.name}</option>
                </c:forEach>
            </select>
        <p>Временной период: </p>
        <input type="date" name="time_begin"  value="${not empty time_begin ? time_begin : '2020-05-10'}" size="12" /> -
        <input type="date" name="time_end"  value="${not empty time_end ? time_end : '2020-05-10'}" size="12" /> 
    </p>
    <p><input type="hidden" name="viewid" value="/TacticalTraining.jsp"></p>
    <input type="submit" value="Выбрать" name = "done"/>
</form>
<p></p>
<p></p>
<div class="row">
    <p><form action="UserServlet">  
        <div class="column">

            <strong>НАЧАЛЬНЫЕ ДАННЫЕ</strong>
            <p data-tooltip="Среднее арифметическое коэффициента плотности ударных действий и коэффициента плотности передвижения">&nbsp;[?] Коэффициент объема технических действий (%):</p>
            <input type="text" name="scope_action"  value="${userListParameters.scope_action}" size="12" /> 
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Отношение всех видов технических действий, которые спортсмен выполнил в тестовом поединке, к техническим действиям, выполняемых этой возрастной группой спортсменов на соревнованиях, умноженное на 100%">&nbsp;[?]Коэффициент разносторонности технических действий (%):</p>
            <input type="text" name="versatility_technical_actions"  value="${userListParameters.versatility_technical_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент эффективности атакующих действий показывает процентную долю ударов, дошедших до цели, к числу всех ударов, нанесенных спортсменом, умноженное на 100% ">&nbsp;[?] Коэффициент эффективности атакующих действий (%):</p>
            <input type="text" name="attack_efficiency"  value="${userListParameters.attack_efficiency}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент эффективности защитных действий показывает процентную долю удавшихся защит, т.е. отношение числа парированных ударов к общему числу ударов, нанесенных атакующим, умноженное на 100% ">&nbsp;[?] Коэффициент эффективности защитных действий (%):</p>
            <input type="text" name="protective_actions"  value="${userListParameters.protective_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент эффективности боевых действий представляет собой среднюю арифметическую суммы коэффициентов эффективности атакующих и защитных действий">&nbsp;[?] Коэффициент эффективности боевых действий (%):</p>
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <input type="text" name="warfare_ratio"  value="${userListParameters.warfare_ratio}"" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Коэффициент результативности (%)</p>
            <input type="text" name="performance_ratio"  value="${userListParameters.performance_ratio}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
             <p data-tooltip="Сумма коэффициента объема действий, коэффициента разносторонности технических действий, коэффициента эффективности боевых действий и коэффициента эффктивности защитных действий">&nbsp;[?]  Техническая подготовленность:</p>
            <input type="text" name="technical_readiness"  value="${userListParameters.technical_readiness}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            
            <p data-tooltip="Данный коэффициент представляет собой  отношение всех ударных действий, которые единоборец выполнил в бою, ко времени, за которое проходит весь поединок, умноженное на 100%">&nbsp;[?] Коэффициент объема тактических действий:</p>
            <input type="text" name="scope_tactical_action"  value="${userListParameters.scope_tactical_action}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Данный коэффициент показывает процентную долю всех разновидностей тактических действий, которые спортсмен выполнил за время соревнований. Это отношение всех видов тактических действий, выполненных спортсменом в соревновательных поединках, к техническим действиям, выполненных всеми участниками соревнований за весь турнир, умноженное на 100%">&nbsp;[?] Разносторонность тактических действий:</p>
            <input type="text" name="versatility_actions"  value="${userListParameters.versatility_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент избранной тактики показывает процентную долю тактических действий, которые спортсмен должен выполнить в соревновательном поединке. Определяется отношением всех тактических действий, которые использовал спортсмен в бою, к тактическим действиям, которые он обычно выполняет за весь поединок, умноженное на 100%">&nbsp;[?] Коэффициент избранной тактики (%):</p>
            <input type="text" name="chosen_tactics"  value="${userListParameters.chosen_tactics}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент перестройки тактики показывает процентную долю тактических действий, которые спортсмен должен перестроить в соревновательном поединке. Показатель определяется отношением всех тактических действий, которые спортсмен перестроил в бою, к тактическим действиям, которые он обычно выполняет за весь поединок, умноженное на 100% ">&nbsp;[?] Коэффициент перестройки тактики (%):</p>
            <input type="text" name="adjustment_factor"  value="${userListParameters.adjustment_factor}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент подготовительных тактических действий тактики показывает процентную долю тактических действий, которые спортсмен использовал в соревновательном поединке, т.е. отношение всех тактических действий, которые спортсмен использовал в бою, к тактическим действиям, которые он должен выполнить за весь поединок, умноженное на 100% ">&nbsp;[?] Коэффициент подготовительных тактических действий (%):</p>
            <input type="text" name="preparatory_actions"  value="${userListParameters.preparatory_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент ситуативных тактических действий показывает процент-ную долю тактических действий, которые спортсмен использовал в соревновательном поединке ">&nbsp;[?] Коэффициент ситуативных тактических действий (%):</p>
            <input type="text" name="situational_actions"  value="${userListParameters.situational_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Сумма коэффициента объема действий, коэффициента разносторонности тактических действий, коэффициента эффективности боевых действий и коэффициента эффктивности защитных действий">&nbsp;[?] Тактическая подготовленность (%):</p>
            <input type="text" name="tactical_action"  value="${userListParameters.tactical_action}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
        </div>
        <div class="column">  
            <strong>КОНЕЦ ИССЛЕДОВАНИЯ</strong>
            <p>&nbsp;Коэффициент объема технических действий (%):</p>
            <input type="text" name="scope_action_end"  value="${userListParametersEnd.scope_action}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.scope_action*100)/userListParameters.scope_action}"/>%</span></p>
            <p>&nbsp;Коэффициент разносторонности технических действий (%):</p>
            <input type="text" name="versatility_technical_actions_end"  value="${userListParametersEnd.versatility_technical_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.versatility_technical_actions*100)/userListParameters.versatility_technical_actions}"/>%</span></p>
            <p>&nbsp;Коэффициент эффективности атакующих действий (%):</p>
            <input type="text" name="attack_efficiency_end"  value="${userListParametersEnd.attack_efficiency}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.attack_efficiency*100)/userListParameters.attack_efficiency}"/>%</span></p>
            <p>&nbsp;Коэффициент эффективности защитных действий (%):</p>
            <input type="text" name="protective_actions_end"  value="${userListParametersEnd.protective_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.protective_actions*100)/userListParameters.protective_actions}"/>%</span></p>

            <p>&nbsp;Коэффициент эффективности боевых действий (%):</p>
            <input type="text" name="warfare_ratio_end"  value="${userListParametersEnd.warfare_ratio}"" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.warfare_ratio*100)/userListParameters.warfare_ratio}"/>%</span></p>
            <p>&nbsp;Коэффициент результативности (%)</p>
            <input type="text" name="performance_ratio_end"  value="${userListParametersEnd.performance_ratio}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.performance_ratio*100)/userListParameters.performance_ratio}"/>%</span></p>
            <p>&nbsp;Техническая подготовленность:</p>
            <input type="text" name="technical_readiness_end"  value="${userListParametersEnd.technical_readiness}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.technical_readiness*100)/userListParameters.technical_readiness}"/>%</span></p>

            <p>&nbsp;Коэффициент объема тактических действий:</p>
            <input type="text" name="scope_tactical_action_end"  value="${userListParametersEnd.scope_tactical_action}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.scope_tactical_action*100)/userListParameters.scope_tactical_action}"/>%</span></p>

            <p>&nbsp;Разносторонность тактических действий:</p>
            <input type="text" name="versatility_actions_end"  value="${userListParametersEnd.versatility_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.versatility_actions*100)/userListParameters.versatility_actions}"/>%</span></p>

            <p>&nbsp;Коэффициент избранной тактики (%):</p>
            <input type="text" name="chosen_tactics_end"  value="${userListParametersEnd.chosen_tactics}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.chosen_tactics*100)/userListParameters.chosen_tactics}"/>%</span></p>

            <p>&nbsp;Коэффициент перестройки тактики (%):</p>
            <input type="text" name="adjustment_factor_end"  value="${userListParametersEnd.adjustment_factor}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.adjustment_factor*100)/userListParameters.adjustment_factor}"/>%</span></p>

            <p>&nbsp;Коэффициент подготовительных тактических действий (%):</p>
            <input type="text" name="preparatory_actions_end"  value="${userListParametersEnd.preparatory_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.preparatory_actions*100)/userListParameters.preparatory_actions}"/>%</span></p>

            <p>&nbsp;Коэффициент ситуативных тактических действий (%):</p>
            <input type="text" name="situational_actions_end"  value="${userListParametersEnd.situational_actions}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.situational_actions*100)/userListParameters.situational_actions}"/>%</span></p>

            <p>&nbsp;Тактическая подготовленность (%):</p>
            <input type="text" name="tactical_action_end"  value="${userListParametersEnd.tactical_action}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.tactical_action*100)/userListParameters.tactical_action}"/>%</span></p>
            <p><input type="hidden" name="viewid" value="/TacticalTraining.jsp"></p>
            <p><input type="submit" value="Внести данные" name = "done"/></p>
        </div>
</div>
</form></p>
</table
</body>
</html>