<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //「画面表示」「結果表示」の変数を受け取る
    String previousOperand = (String) request.getAttribute("previousOperand");
    if (previousOperand == null) previousOperand = "";

    String currentOperand = (String) request.getAttribute("currentOperand");
    if (currentOperand == null || currentOperand.isEmpty()) currentOperand = "0";
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Java電卓アプリ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/calculator.css">
</head>
<body>

<div class="calculator">
    <!-- ＝押下時にJSからsubmit()でJava(CalculatorController)へ送信するフォーム -->
    <form id="calcForm" action="${pageContext.request.contextPath}/calculator" method="POST">
        <!-- JavaのdoPostへ渡す3つのデータ（JSで値をセットする） -->
        <input type="hidden" id="numbers" name="numbers" value="">
        <input type="hidden" id="operators" name="operators" value="">
        <input type="hidden" id="formula" name="formula" value="">

        <!-- 2段表示ディスプレイ -->
        <div class="display-container">
            <div id="previous-operand" class="previous-operand"><%= previousOperand %></div>
            <div id="current-operand" class="current-operand"><%= currentOperand %></div>
        </div>

        <div class="buttons">
            <!-- 1行目: ×(1文字削除), AC, (空白), ÷ -->
            <button type="button" class="btn-top" data-action="delete">×</button>
            <button type="button" class="btn-top" data-action="clear">AC</button>
            <div class="btn-empty"></div>
            <button type="button" class="btn-op" data-value="/">÷</button>

            <!-- 2行目 -->
            <button type="button" class="btn-num" data-value="7">7</button>
            <button type="button" class="btn-num" data-value="8">8</button>
            <button type="button" class="btn-num" data-value="9">9</button>
            <button type="button" class="btn-op" data-value="*">×</button>

            <!-- 3行目 -->
            <button type="button" class="btn-num" data-value="4">4</button>
            <button type="button" class="btn-num" data-value="5">5</button>
            <button type="button" class="btn-num" data-value="6">6</button>
            <button type="button" class="btn-op" data-value="-">-</button>

            <!-- 4行目 -->
            <button type="button" class="btn-num" data-value="1">1</button>
            <button type="button" class="btn-num" data-value="2">2</button>
            <button type="button" class="btn-num" data-value="3">3</button>
            <button type="button" class="btn-op" data-value="+">+</button>

            <!-- 5行目 -->
            <button type="button" class="btn-num btn-zero" data-value="0">0</button>
            <button type="button" class="btn-num" data-value=".">.</button>
            <button type="button" class="btn-opn" data-action="equals">=</button>
        </div>
    </form>
</div>

<!-- 入力値制御用JavaScriptの読み込み -->
<script src="${pageContext.request.contextPath}/js/calculator.js"></script>
</body>
</html>