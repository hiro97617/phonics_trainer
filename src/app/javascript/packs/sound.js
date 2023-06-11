

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



document.addEventListener("DOMContentLoaded", function () {
const trigger = document.getElementById('sound')
if (trigger) {
  trigger.addEventListener('click',pronounce)
}
});

document.addEventListener("DOMContentLoaded", function () {
const checkCorrectChoice = document.getElementById('correct-choice')
if (checkCorrectChoice) {
  checkCorrectChoice.addEventListener('click', checkCorrectChoicePronounce())
}
});

document.addEventListener("DOMContentLoaded", function () {
const checkIncorrectChoice = document.getElementById('incorrect-choice')
if (checkIncorrectChoice){
  checkIncorrectChoice.addEventListener('click', checkIncorrectChoicePronounce())
}
});