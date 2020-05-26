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
    <c:when test="${not empty param.thermometer_test}">
        <c:set var="values" value="${param.thermometer_test}"/>
        <sql:update var="timeUp" dataSource="jdbc/poiu">
            INSERT INTO staticalindicators(idAthlete,IndicatorsDate,thermometer_test) 
            VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${values}) 
            ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), thermometer_test = ${values};
        </sql:update>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<c:if test="${not empty param.test_seconds}">
    <c:set var="val" value="${param.test_seconds}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,test_seconds) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), test_seconds = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.emotional_stability}">
    <c:set var="val" value="${param.emotional_stability}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,emotional_stability) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), emotional_stability = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.persistence_ratio}">
    <c:set var="val" value="${param.persistence_ratio}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,persistence_ratio) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), persistence_ratio = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.courage_ratio}">
    <c:set var="val" value="${param.courage_ratio}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,courage_ratio) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeBegin : '2000-05-10'}',' 05:00:00'), courage_ratio = ${val};
    </sql:update>
</c:if>
<%---------------------------%>

<c:choose>
    <c:when test="${not empty param.thermometer_test_end}">
        <c:set var="values" value="${param.thermometer_test_end}"/>
        <sql:update var="timeUp" dataSource="jdbc/poiu">
            INSERT INTO staticalindicators(idAthlete,IndicatorsDate,thermometer_test) 
            VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${values}) 
            ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), thermometer_test = ${values};
        </sql:update>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<c:if test="${not empty param.test_seconds_end}">
    <c:set var="val" value="${param.test_seconds_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,test_seconds) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), test_seconds = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.emotional_stability_end}">
    <c:set var="val" value="${param.emotional_stability_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,emotional_stability) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), emotional_stability = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.persistence_ratio_end}">
    <c:set var="val" value="${param.persistence_ratio_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,persistence_ratio) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), persistence_ratio = ${val};
    </sql:update>
</c:if>
<c:if test="${not empty param.courage_ratio_end}">
    <c:set var="val" value="${param.courage_ratio_end}"/>
    <sql:update var="t" dataSource="jdbc/poiu">
        INSERT INTO staticalindicators(idAthlete,IndicatorsDate,courage_ratio) 
        VALUES(${not empty cookieUserID ? cookieUserID : 0}, concat('${not empty cookieTimeEnd ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), ${val}) 
        ON DUPLICATE KEY UPDATE IndicatorsDate = concat('${not empty cookieTimeBegin ? cookieTimeEnd : '2000-05-10'}',' 05:00:00'), courage_ratio = ${val};
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
    <p><input type="hidden" name="viewid" value="/PsychologicalTraining.jsp"></p>
    <input type="submit" value="Выбрать" name = "done"/>
</form>
<p></p>
<p></p>
<div class="row">
    <p><form action="UserServlet">  
        <div class="column">

            <strong>НАЧАЛЬНЫЕ ДАННЫЕ</strong>
            <p data-tooltip="Каратэку предлагается оценить различные компоненты психического состояния: настроение, состояние здоровья, возбуждение, желание соревноваться, значимость предстоящей деятельности, готовность к высшим достижениям, уверенность в себе. Шкалы самооценки – отрезки прямой линии длиной 100 мм, без делений. Рядом с левым (для испытуемого) полюсом надпись – «очень низкая», рядом с правым надпись – «очень высокая». Для самооценки психического состояния спортсменам предлагается чистая шкала. Количество сантиметров на шкале, отмеченное ручкой в виде крестика, определяет уровень собственных ощущений спортсмена.">&nbsp;[?] Тест "Градусник" (см):</p>           
            <input type="text" name="thermometer_test"  value="${userListParameters.thermometer_test}" size="12" /> 
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="С помощью этого теста определяется способность субъективного отсчета времени, которая, как известно, под влиянием усиления возбуждения обнаруживает тенденцию к его недооценке (укорочению), а при развитии процесса торможения – к переоценке (удлинению). Процедура тестирования: спортсмену предлагается, не глядя на секундомер, максимально точно оценить отрезок времени, равный десяти секундам 3 раза.">&nbsp;[?] Тест "10 секунд" (разница в с):</p>
            <input type="text" name="test_seconds"  value="${userListParameters.test_seconds}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент эмоциональной устойчивости в бою это средняя арифметическая каждого вида экстремальных ситуаций">&nbsp;[?] Коэффициент эмоциональной устойчивости:</p>
            <input type="text" name="emotional_stability"  value="${userListParameters.emotional_stability}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент настойчивости – это отношение количества ситуаций, где спортсмен проявил настойчивость, к количеству всех ситуаций в которых спортсмен должен проявить это качество за время проведения всего поединка, умноженное на 100% ">&nbsp;[?] Коэффициент настойчивости:</p>
            <input type="text" name="persistence_ratio"  value="${userListParameters.persistence_ratio}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
            <p data-tooltip="Коэффициент смелости – это отношение количества ситуаций, где спортсмен проявил смелость, к количеству всех ситуаций, в которых спорт-смен обычно проявлял за время проведения всего поединка, умноженное на 100%  ">&nbsp;[?] Коэффициент смелости:</p>
            <input type="text" name="courage_ratio"  value="${userListParameters.courage_ratio}"" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: 100%</span></p>
        </div>
        <div class="column">  
            <strong>КОНЕЦ ИССЛЕДОВАНИЯ</strong>
            <p>&nbsp;Тест "Градусник" (см):</p>
            <input type="text" name="thermometer_test_end"  value="${userListParametersEnd.thermometer_test}" size="12" />  
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.thermometer_test*100)/userListParameters.thermometer_test}"/>%</span></p>
            <p>&nbsp;Тест "10 секунд" (разница в с):</p>
            <input type="text" name="test_seconds_end"  value="${userListParametersEnd.test_seconds}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.test_seconds*100)/userListParameters.test_seconds}"/>%</span></p>
            <p>&nbsp;Коэффициент эмоциональной устойчивости:</p>
            <input type="text" name="emotional_stability_end"  value="${userListParametersEnd.emotional_stability}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.emotional_stability*100)/userListParameters.emotional_stability}"/>%</span></p>
            <p>&nbsp;Коэффициент настойчивости:</p>
            <input type="text" name="persistence_ratio_end"  value="${userListParametersEnd.persistence_ratio}" size="12" />
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.persistence_ratio*100)/userListParameters.persistence_ratio}"/>%</span></p>
            <p>&nbsp;Коэффициент смелости:</p>
            <input type="text" name="courage_ratio_end"  value="${userListParametersEnd.courage_ratio}"" size="12" />  
            <p><span style="font-style:italic; font-size:75%; font-weight: bold">Процент: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(userListParametersEnd.courage_ratio*100)/userListParameters.courage_ratio}"/>%</span></p>
            <p><input type="hidden" name="viewid" value="/PsychologicalTraining.jsp"></p>
            <p><input type="submit" value="Внести данные" name = "done"/></p>
        </div>
</div>
</form></p>
</table
</body>
</html>