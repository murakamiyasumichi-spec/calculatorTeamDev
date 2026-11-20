<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String formula = (String) request.getAttribute("formula");
    if (formula == null) formula = "0";

    String acOrC = (String) request.getAttribute("acOrC");
    if (acOrC == null) acOrC = "AC";
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Java電卓アプリ</title>
    <!-- 外部CSSの読み込み -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/calculator.css">
</head>
<body>

<div class="calculator">
    <!-- サーブレットへPOST送信するフォーム -->
    <form action="${pageContext.request.contextPath}/calculator" method="POST">
        <!-- Javaに引き継ぐための現在の計算式 -->
        <input type="hidden" name="formula" value="<%= formula %>">

        <!-- 画面表示用のディスプレイ -->
        <div class="display-container">
            <input type="text" class="current-input" value="<%= formula %>" readonly>
        </div>

        <div class="buttons">
            <!-- 1行目: Servletから渡された acOrC 変数でボタンの文字を切り替え -->
            <button type="submit" name="inputValue" value="✖" class="btn-top">×</button>
            <button type="submit" name="inputValue" value="<%= acOrC %>" class="btn-top"><%= acOrC %></button>
            <button type="submit" name="inputValue" value="hugou" class="btn-top">+/-</button>
            <button type="submit" name="inputValue" value="÷" class="btn-op">÷</button>

            <!-- 2行目 -->
            <button type="submit" name="inputValue" value="7" class="btn-num">7</button>
            <button type="submit" name="inputValue" value="8" class="btn-num">8</button>
            <button type="submit" name="inputValue" value="9" class="btn-num">9</button>
            <button type="submit" name="inputValue" value="×" class="btn-op">×</button>

            <!-- 3行目 -->
            <button type="submit" name="inputValue" value="4" class="btn-num">4</button>
            <button type="submit" name="inputValue" value="5" class="btn-num">5</button>
            <button type="submit" name="inputValue" value="6" class="btn-num">6</button>
            <button type="submit" name="inputValue" value="minus" class="btn-op">－</button>

            <!-- 4行目 -->
            <button type="submit" name="inputValue" value="1" class="btn-num">1</button>
            <button type="submit" name="inputValue" value="2" class="btn-num">2</button>
            <button type="submit" name="inputValue" value="3" class="btn-num">3</button>
            <button type="submit" name="inputValue" value="plus" class="btn-op">＋</button>

            <!-- 5行目 -->
            <button type="submit" name="inputValue" value="0" class="btn-num btn-zero">0</button>
            <button type="submit" name="inputValue" value="." class="btn-num">.</button>
            <button type="submit" name="inputValue" value="＝" class="btn-opn">＝</button>
        </div>
    </form>
</div>

</body>
</html>