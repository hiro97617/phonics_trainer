function pronounce() {
  let word = document.getElementById('word').textContent
  let utterance = new SpeechSynthesisUtterance();
  utterance.lang = 'en-US';
  utterance.text = word;
  speechSynthesis.speak(utterance)
}

function checkChoicePronounceFirst() {
  let word = document.getElementById('choice-body1').textContent
  let utterance = new SpeechSynthesisUtterance();
  utterance.lang = 'en-US';
  utterance.text = word;
  speechSynthesis.speak(utterance)
}

function checkChoicePronounceSecond() {
  let word = document.getElementById('choice-body2').textContent
  let utterance = new SpeechSynthesisUtterance();
  utterance.lang = 'en-US';
  utterance.text = word;
  speechSynthesis.speak(utterance)
}

function checkChoicePronounceThird() {
  let word = document.getElementById('choice-body3').textContent
  let utterance = new SpeechSynthesisUtterance();
  utterance.lang = 'en-US';
  utterance.text = word;
  speechSynthesis.speak(utterance)
}

document.addEventListener("DOMContentLoaded", function () {
const trigger = document.getElementById('sound')
if (trigger) {
  trigger.addEventListener('click',pronounce)
  speechSynthesis.onvoiceschanged = e => {
    pronounce()
  }
}
const choiceFirst = document.getElementById('body-sound1')
if (choiceFirst) {
  choiceFirst.addEventListener('click', checkChoicePronounceFirst)
  speechSynthesis.onvoiceschanged = e => {
    checkChoicePronounceFirst()
  }
}
const choiceSecond = document.getElementById('body-sound2')
if (choiceSecond){
  choiceSecond.addEventListener('click', checkChoicePronounceSecond)
  speechSynthesis.onvoiceschanged = e => {
    checkChoicePronounceSecond()
  }
}

const choiceThird = document.getElementById('body-sound3')
if (choiceThird){
  choiceThird.addEventListener('click', checkChoicePronounceThird)
  speechSynthesis.onvoiceschanged = e => {
    checkChoicePronounceThird()
  }
}
});
