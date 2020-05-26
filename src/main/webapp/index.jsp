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
    <c:when test="${not empty param.pulse_rate}">
        <c:set var="values" value="${param.pulse_rate}"/>
        <sql:update var="timeUp" dataSource="jdbc/poiu">
            INSERT INTO staticalindicators(idAthlete,IndicatorsDate,pulse_rate) 
            VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${values}) 
            ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), pulse_rate = ${values};
        </sql:update>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<c:if test="${not empty param.index_of_rufe}">
    <c:set var="val" value="${param.index_of_rufe}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,index_of_rufe) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), index_of_rufe = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.blood_circulation}">
    <c:set var="val" value="${param.blood_circulation}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,blood_circulation) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), blood_circulation = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.coefficient_of_endurance}">
    <c:set var="val" value="${param.index_of_rufe}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,coefficient_of_endurance) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), coefficient_of_endurance = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.orthostatic_test}">
    <c:set var="val" value="${param.orthostatic_test}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,orthostatic_test) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), orthostatic_test = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.clinostatic_test}">
    <c:set var="val" value="${param.clinostatic_test}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,clinostatic_test) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), clinostatic_test = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.rosenthal_test}">
    <c:set var="val" value="${param.rosenthal_test}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,rosenthal_test) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), rosenthal_test = ${val};
    </sql:update>
</c:if>
<%---------------------------%>
<c:choose>
    <c:when test="${not empty param.pulse_rate_end}">
        <c:set var="values" value="${param.pulse_rate_end}"/>
        <sql:update var="timeUp" dataSource="jdbc/poiu">
            INSERT INTO staticalindicators(idAthlete,IndicatorsDate,pulse_rate) 
            VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${values}) 
            ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), pulse_rate = ${values};
        </sql:update>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<c:if test="${not empty param.index_of_rufe_end}">
    <c:set var="val" value="${param.index_of_rufe_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,index_of_rufe) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), index_of_rufe = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.blood_circulation_end}">
    <c:set var="val" value="${param.blood_circulation_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,blood_circulation) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), blood_circulation = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.coefficient_of_endurance_end}">
    <c:set var="val" value="${param.coefficient_of_endurance_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,coefficient_of_endurance) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), coefficient_of_endurance = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.orthostatic_test_end}">
    <c:set var="val" value="${param.orthostatic_test_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,orthostatic_test) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), orthostatic_test = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.clinostatic_test_end}">
    <c:set var="val" value="${param.clinostatic_test_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,clinostatic_test) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), clinostatic_test = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.rosenthal_test_end}">
    <c:set var="val" value="${param.rosenthal_test_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,rosenthal_test) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), rosenthal_test = ${val};
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
    <p><input type="hidden" name="viewid" value="/index.jsp"></p>
    <input type="submit" value="Выбрать" name = "done"/>
</form>
<p></p>
<p></p>
<div class="row">
    <p><form action="UserServlet">  
        <div class="column">

            <strong>НАЧАЛЬНЫЕ ДАННЫЕ</strong>
            <p data-tooltip="<table></table>">&nbsp;ЧПП - в покое (уд/мин):</p>
            <input type="text" name="pulse_rate"  value="${userListParameters.pulse_rate}" size="12" /> 
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip=
               "Р1 + Р2 + Р3 = Проба Руффье
               
               Р1 - пульс за 15 секунд в положении лежа на спине
               Р2 - пульс за 15 секунд в положении лежа на спине после 30 приседаний в течении 45 секунд
               Р3 - пульс в последние 15 секунд первой минуты восстановительного периода">
                &nbsp;[?] Проба Руффье: </p>
            <input type="text" name="index_of_rufe"  value="${userListParameters.index_of_rufe}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip=
               "КВ = ЧСС(покой) + систолическое давление + диосистолическое давление
               
               В норме коэффициент выносливости должен равняться 16. При улучшении выносливости этот показатель уменьшается">&nbsp;[?] Коэффициент выносливости:</p>
            <input type="text" name="blood_circulation"  value="${userListParameters.blood_circulation}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip=
               "КЭК = ЧСС + систолическое давление + диосистолическое давление
               
               В норме равен 2600. При утомлении увеличивается, а с ростом тренированности сердечно-сосудистой системы уменьшается">&nbsp;[?] Коэффициент экономичности кровообращения:</p>
            <input type="text" name="coefficient_of_endurance"  value="${userListParameters.coefficient_of_endurance}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip=
               "Ортостатическая проба = Р1 - Р2
               
               Р1 - частота пульса в течении 15 секунд через 1-3 минуты после того как спортсмен ложится на скамейку
               Р2 - частота пульса в течении 15 секунд после того как спортсмен встал и перешел в вертикальное положение
               
               Разница от 0 до 12 ударов - хорошая физическая подготовленность
               Разница от 18 до 25 ударов - показатель отсутствия физической тренированности
               Разница более 25 ударов - переутомление или заболевание, следует обратиться к врачу">&nbsp;[?] Ортостатическая проба:</p>
            <input type="text" name="orthostatic_test"  value="${userListParameters.orthostatic_test}"" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip=
               "Клиностатическая проба = Р1 + Р2
               
               Р1 - частота пульса в течении 15 секунд через 1-3 минуты после того как спортсмен ложится на скамейку
               Р2 - частота пульса в течении 15 секунд после того как спортсмен встал и перешел в вертикальное положение
               
               В норме равен 2600, при утомлении увеличивается, а с ростом тренированности сердечно-сосудистой системы уменьшается">&nbsp;[?] Клиностатическая проба:</p>
            <input type="text" name="clinostatic_test"  value="${userListParameters.clinostatic_test}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
                      <p data-tooltip=
               "Выполняется трехкратное измерение ЖЕЛ, проводимое через каждые 15 секунд">&nbsp;[?] Проба Розенталя:</p>
            <input type="text" name="rosenthal_test"  value="${userListParameters.rosenthal_test}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>

        </div>
        <div class="column">  
            <strong>КОНЕЦ ИССЛЕДОВАНИЯ</strong>
            <p>&nbsp;ЧПП - в покое (уд/мин):</p>
            <%--<p><span style="font-style:italic; font-size:75%">Процент: ${100+((userListParametersEnd.pulse_rate-userListParameters.pulse_rate)/userListParameters.pulse_rate)*100}</span></p>--%>
            <input type="text" name="pulse_rate_end"  value="${userListParametersEnd.pulse_rate}" size="12" /> 
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.pulse_rate*100)/userListParameters.pulse_rate}"/>%</span></p>

            <p>&nbsp;Проба Руффье:</p>
            <input type="text" name="index_of_rufe_end"  value="${userListParametersEnd.index_of_rufe}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.index_of_rufe*100)/userListParameters.index_of_rufe}"/>%</span></p>

            <p>&nbsp;КВ:</p>
            <input type="text" name="blood_circulation_end"  value="${userListParametersEnd.blood_circulation}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.blood_circulation*100)/userListParameters.blood_circulation}"/>%</span></p>

            <p>&nbsp;КЭК:</p>
            <input type="text" name="coefficient_of_endurance_end"  value="${userListParametersEnd.coefficient_of_endurance}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.coefficient_of_endurance*100)/userListParameters.coefficient_of_endurance}"/>%</span></p>

            <p>&nbsp;Ортостатическая проба:</p>
            <input type="text" name="orthostatic_test_end"  value="${userListParametersEnd.orthostatic_test}"" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.orthostatic_test*100)/userListParameters.orthostatic_test}"/>%</span></p>

            <p>&nbsp;Клиностатическая проба:</p>
            <input type="text" name="clinostatic_test_end"  value="${userListParametersEnd.clinostatic_test}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.clinostatic_test*100)/userListParameters.clinostatic_test}"/>%</span></p>

            <p>&nbsp;Проба Розенталя:</p>
            <input type="text" name="rosenthal_test_end"  value="${userListParametersEnd.rosenthal_test}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.rosenthal_test*100)/userListParameters.rosenthal_test}"/>%</span></p>
            <p><input type="hidden" name="viewid" value="/index.jsp"></p>
            <p><input type="submit" value="Внести данные" name = "done"/></p>

        </div>
</div>
</form></p>
</table
</body>
</html>