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
    <c:when test="${not empty param.pullups}">
        <c:set var="values" value="${param.pullups}"/>
        <sql:update var="timeUp" dataSource="jdbc/poiu">
            INSERT INTO staticalindicators(idAthlete,IndicatorsDate,pullups) 
            VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${values}) 
            ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), pullups = ${values};
        </sql:update>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<c:if test="${not empty param.push_ups}">
    <c:set var="val" value="${param.push_ups}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,push_ups) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), push_ups = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.sit_up}">
    <c:set var="val" value="${param.sit_up}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,sit_up) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), sit_up = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.long_jump}">
    <c:set var="val" value="${param.long_jump}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,long_jump) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), long_jump = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.acceleration}">
    <c:set var="val" value="${param.acceleration}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,acceleration) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), acceleration = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.six_minute_run}">
    <c:set var="val" value="${param.six_minute_run}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,six_minute_run) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), six_minute_run = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.shuttle_run}">
    <c:set var="val" value="${param.shuttle_run}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,shuttle_run) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), shuttle_run = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.bridge}">
    <c:set var="val" value="${param.bridge}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,bridge) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), bridge = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.twine}">
    <c:set var="val" value="${param.twine}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,twine) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), twine = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.mawashi_geri}">
    <c:set var="val" value="${param.mawashi_geri}}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,mawashi_geri) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), mawashi_geri = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.blow_strength}">
    <c:set var="val" value="${param.blow_strength}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,blow_strength) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), blow_strength = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.endurance}">
    <c:set var="val" value="${param.endurance}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,endurance) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), endurance = ${val};
    </sql:update>
</c:if> 
<c:if test="${not empty param.flexibility}">
    <c:set var="val" value="${param.flexibility}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,flexibility) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), flexibility = ${val};
    </sql:update>
</c:if> 
<c:if test="${not empty param.coordination}">
    <c:set var="val" value="${param.coordination}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,coordination) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), coordination = ${val};
    </sql:update>
</c:if> 
<c:if test="${not empty param.physical_fitness}">
    <c:set var="val" value="${param.physical_fitness}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,physical_fitness) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), physical_fitness = ${val};
    </sql:update>
</c:if>
<%---------------------------%>
<c:choose>
    <c:when test="${not empty param.pullups_end}">
        <c:set var="values" value="${param.pullups_end}"/>
        <sql:update var="timeUp" dataSource="jdbc/poiu">
            INSERT INTO staticalindicators(idAthlete,IndicatorsDate,pullups) 
            VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${values}) 
            ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), pullups = ${values};
        </sql:update>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<c:if test="${not empty param.push_ups_end}">
    <c:set var="val" value="${param.push_ups_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,push_ups) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), push_ups = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.sit_up_end}">
    <c:set var="val" value="${param.sit_up_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,sit_up) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), sit_up = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.long_jump_end}">
    <c:set var="val" value="${param.long_jump_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,long_jump) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), long_jump = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.acceleration_end}">
    <c:set var="val" value="${param.acceleration_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,acceleration) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), acceleration = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.six_minute_run_end}">
    <c:set var="val" value="${param.six_minute_run_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,six_minute_run) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), six_minute_run = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.shuttle_run_end}">
    <c:set var="val" value="${param.shuttle_run_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,shuttle_run) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), shuttle_run = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.bridge_end}">
    <c:set var="val" value="${param.bridge_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,bridge) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), bridge = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.twine_end}">
    <c:set var="val" value="${param.twine_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,twine) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), twine = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.mawashi_geri_end}">
    <c:set var="val" value="${param.mawashi_geri_end}}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,mawashi_geri) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), mawashi_geri = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.blow_strength_end}">
    <c:set var="val" value="${param.blow_strength_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,blow_strength) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), blow_strength = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.endurance_end}">
    <c:set var="val" value="${param.endurance_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,endurance) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), endurance = ${val};
    </sql:update>
</c:if> 
<c:if test="${not empty param.flexibility_end}">
    <c:set var="val" value="${param.flexibility_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,flexibility) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), flexibility = ${val};
    </sql:update>
</c:if> 
<c:if test="${not empty param.coordination_end}">
    <c:set var="val" value="${param.coordination_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,coordination) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), coordination = ${val};
    </sql:update>
</c:if> 
<c:if test="${not empty param.physical_fitness_end}">
    <c:set var="val" value="${param.physical_fitness_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,physical_fitness) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), physical_fitness = ${val};
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
    <p><input type="hidden" name="viewid" value="/PhysicalTraining.jsp"></p>
    <input type="submit" value="Выбрать" name = "done"/>
</form>
<p></p>
<p></p>
<div class="row">
    <p><form action="UserServlet">  
        <div class="column">

            <strong>НАЧАЛЬНЫЕ ДАННЫЕ</strong>
            <p>&nbsp;Подтягивания (кол-во):</p>
            <input type="text" name="pullups"  value="${userListParameters.pullups}" size="12" /> 
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Отжимания(кол-во):</p>
            <input type="text" name="push_ups"  value="${userListParameters.push_ups}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Пресс - "складка":</p>
            <input type="text" name="sit_up"  value="${userListParameters.sit_up}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Прыжок в длину с места (см):</p>               
            <input type="text" name="long_jump"  value="${userListParameters.long_jump}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Ускорение 100м (с):</p> 
            <input type="text" name="acceleration"  value="${userListParameters.acceleration}"" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;6-ти минутный бег (м):</p>
            <input type="text" name="six_minute_run"  value="${userListParameters.six_minute_run}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Челночный бег 4х9м (с):</p>
            <input type="text" name="shuttle_run"  value="${userListParameters.shuttle_run}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;"Мостик" (см):</p>
            <input type="text" name="bridge"  value="${userListParameters.bridge}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;"Шпагат" (см):</p>
            <input type="text" name="twine"  value="${userListParameters.twine}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Маваси-гери за 10 с (кол-во):</p>
            <input type="text" name="mawashi-geri"  value="${userListParameters.mawashi-geri}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Сила ударов (%):</p>
            <input type="text" name="blow_strength"  value="${userListParameters.blow_strength}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Выносливость (%):</p>
            <input type="text" name="endurance"  value="${userListParameters.endurance}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Гибкость (%):</p>
            <input type="text" name="flexibility"  value="${userListParameters.flexibility}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;Ккс (%):</p>
            <input type="text" name="coordination"  value="${userListParameters.coordination}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p>&nbsp;КсФП (%):</p>
            <input type="text" name="physical_fitness"  value="${userListParameters.physical_fitness}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
        </div>
        <div class="column">  
            <strong>КОНЕЦ ИССЛЕДОВАНИЯ</strong>
            <p>&nbsp;Подтягивания (кол-во):</p>

            <input type="text" name="pullups_end"  value="${userListParametersEnd.pullups}" size="12" /> 
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.pullups*100)/userListParameters.pullups}"/>%</span></p>

            <p>&nbsp;Отжимания(кол-во):</p>

            <input type="text" name="push_ups_end"  value="${userListParametersEnd.push_ups}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.push_ups*100)/userListParameters.push_ups}"/>%</span></p>

            <p>&nbsp;Пресс - "складка":</p>

            <input type="text" name="sit_up_end"  value="${userListParametersEnd.sit_up}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.sit_up*100)/userListParameters.sit_up}"/>%</span></p>

            <p>&nbsp;Прыжок в длину с места (см):</p>               
            <input type="text" name="long_jump_end"  value="${userListParametersEnd.long_jump}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.long_jump*100)/userListParameters.long_jump}"/>%</span></p>

            <p>&nbsp;Ускорение 100м (с):</p> 
            <input type="text" name="acceleration_end"  value="${userListParametersEnd.acceleration}"" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.acceleration*100)/userListParameters.acceleration}"/>%</span></p>

            <p>&nbsp;6-ти минутный бег (м):</p>
            <input type="text" name="six_minute_run_end"  value="${userListParametersEnd.six_minute_run}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.six_minute_run*100)/userListParameters.six_minute_run}"/>%</span></p>

            <p>&nbsp;Челночный бег 4х9м (с):</p>
            <input type="text" name="shuttle_run_end"  value="${userListParametersEnd.shuttle_run}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.shuttle_run*100)/userListParameters.shuttle_run}"/>%</span></p>

            <p>&nbsp;"Мостик" (см):</p>
            <input type="text" name="bridge_end"  value="${userListParametersEnd.bridge}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.bridge*100)/userListParameters.bridge}"/>%</span></p>

            <p>&nbsp;"Шпагат" (см):</p>
            <input type="text" name="twine_end"  value="${userListParametersEnd.twine}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.twine*100)/userListParameters.twine}"/>%</span></p>

            <p>&nbsp;Маваси-гери за 10 с (кол-во):</p>
            <input type="text" name="mawashi-geri_end"  value="${userListParametersEnd.mawashi-geri}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.mawashi-geri*100)/userListParameters.mawashi-geri}"/>%</span></p>

            <p>&nbsp;Сила ударов (%):</p>
            <input type="text" name="blow_strength_end"  value="${userListParametersEnd.blow_strength}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.blow_strength*100)/userListParameters.blow_strength}"/>%</span></p>

            <p>&nbsp;Выносливость (%):</p>
            <input type="text" name="endurance_end"  value="${userListParametersEnd.endurance}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.endurance*100)/userListParameters.endurance}"/>%</span></p>

            <p>&nbsp;Гибкость (%):</p>
            <input type="text" name="flexibility_end"  value="${userListParametersEnd.flexibility}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.flexibility*100)/userListParameters.flexibility}"/>%</span></p>

            <p>&nbsp;Ккс (%):</p>
            <input type="text" name="coordination_end"  value="${userListParametersEnd.coordination}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.coordination*100)/userListParameters.coordination}"/>%</span></p>

            <p>&nbsp;КсФП (%):</p>
            <input type="text" name="physical_fitness_end"  value="${userListParametersEnd.physical_fitness}" size="12" />           
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.physical_fitness*100)/userListParameters.physical_fitness}"/>%</span></p>
            <p><input type="hidden" name="viewid" value="/PhysicalTraining.jsp"></p>
            <p><input type="submit" value="Внести данные" name = "done"/></p>

        </div>

</div>
</form></p>
</table
</body>
</html>