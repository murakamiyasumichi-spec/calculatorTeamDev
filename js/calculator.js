const currentOperandDisplay = document.getElementById('current-operand');

let inputFormula = currentOperandDisplay.textContent;

const buttons = document.querySelectorAll('button');

buttons.forEach(button => {
  button.addEventListener('click', () => {

    if (button.dataset.value) {
      
      const value = button.dataset.value;
      const lastCharacter = inputFormula.slice(-1);
      // 1.1.1 バリデーション
      if (/[+\-*/]/.test(value) && /[+\-*/]/.test(lastCharacter)) {
        return;
      }

      //　メモ：入力値が0でかつ最後の一文字も0書きたい
      if (value === '0' && lastCharacter === '0') {
        return;
      }

      // 1.1.2 文字列追加 
      if (inputFormula === '0' && value === '-') {
        inputFormula = '-';
      }

      //　メモ：初期表示の0を置き換える処理を書きたい

      
      else {
        inputFormula = inputFormula + value;
      }

      currentOperandDisplay.textContent = inputFormula;
    }

    // 1.2 イコールを押したとき
    else if (button.dataset.action === 'equals') {
        const lastCharacter = inputFormula.slice(-1);
        
        if (!/[0-9.]/.test(lastCharacter)) {
            return;
        }
        if (!/[+\-*/]/.test(inputFormula)) {
            return;
        }
        if (inputFormula.endsWith('.')) {
            inputFormula = inputFormula.slice(0, -1);
        }

        const numberArray = inputFormula.split(/[+\-*/]/);
        const operatorArray = inputFormula.split(/[0-9.]+/).filter(Boolean);

        document.getElementById('numbers').value = numberArray.join(',');
        document.getElementById('operators').value = operatorArray.join(',');
        document.getElementById('formula').value = inputFormula;
        document.getElementById('calcForm').submit();
    }

    // 一文字ずつ削除
    else if (button.dataset.action === 'delete') {
      if (inputFormula.length >= 2) {
        inputFormula = inputFormula.slice(0, -1);
      } else {
        inputFormula = '0';
      }
      currentOperandDisplay.textContent = inputFormula;
    }

    // オールクリア
    else if (button.dataset.action === 'clear') {
      inputFormula = '0';
      currentOperandDisplay.textContent = inputFormula;
    }

  });
});