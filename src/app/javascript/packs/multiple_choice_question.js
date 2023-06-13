

function pronounce() {
  let word = document.getElementById('word').textContent
  let utterance = new SpeechSynthesisUtterance();
  utterance.lang = 'en-US';
  utterance.text = word;
  speechSynthesis.speak(utterance)
}

function checkCorrectChoicePronounce() {
  let word = document.getElementById('correct-choice-body').textContent
  let utterance = new SpeechSynthesisUtterance();
  utterance.lang = 'en-US';
  utterance.text = word;
  speechSynthesis.speak(utterance)
}

function checkIncorrectChoicePronounce() {
  let word = document.getElementById('incorrect-choice-body').textContent
  let utterance = new SpeechSynthesisUtterance();
  utterance.lang = 'en-US';
  utterance.text = word;
  speechSynthesis.speak(utterance)
}

function removeLinksFromText(linkedText) {
  const tempElement = document.createElement('div');
  tempElement.innerHTML = linkedText;

  // a要素を取得してリンクを削除する
  const linkElements = tempElement.getElementsByTagName('a');
  for (let i = linkElements.length - 1; i >= 0; i--) {
    const link = linkElements[i];
    const textNode = document.createTextNode(link.textContent);
    link.parentNode.replaceChild(textNode, link);
  }

  // リンクを削除した文字列を返す
  return tempElement.innerHTML;
}

function showAnswer() {
  const correct = document.getElementById("correct-choice")
  correct.className = "bg-green-200 rounded-2xl shadow-xl px-3 py-3 sm:px-3 lg:px-3"

  const incorrect = document.getElementById("incorrect-choice")
  incorrect.className = "bg-red-200 rounded-2xl shadow-xl px-3 py-3 sm:px-3 lg:px-3"

  const word = document.getElementById("word")
  word.style.display = "block";

};




document.addEventListener("DOMContentLoaded", function () {
const trigger = document.getElementById('sound')
if (trigger) {
  trigger.addEventListener('click',pronounce)
  speechSynthesis.onvoiceschanged = e => {
    pronounce()
  }
}
const checkCorrectChoice = document.getElementById('correct-body-sound')
if (checkCorrectChoice) {
  checkCorrectChoice.addEventListener('click', checkCorrectChoicePronounce)
  speechSynthesis.onvoiceschanged = e => {
    checkCorrectChoicePronounce()
  }
}
const checkIncorrectChoice = document.getElementById('incorrect-body-sound')
if (checkIncorrectChoice){
  checkIncorrectChoice.addEventListener('click', checkIncorrectChoicePronounce)
  speechSynthesis.onvoiceschanged = e => {
    checkIncorrectChoicePronounce()
  }
}
});

document.addEventListener("DOMContentLoaded", function () {
  const selectCorrect = document.getElementById("correct-choice");
  selectCorrect.addEventListener('click', showAnswer)
});

document.addEventListener("DOMContentLoaded", function () {
  const selectIncorrect = document.getElementById("incorrect-choice");
  selectIncorrect.addEventListener('click', showAnswer)
});
