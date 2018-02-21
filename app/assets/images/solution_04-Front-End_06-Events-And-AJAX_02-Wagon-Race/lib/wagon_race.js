const player1row = document.querySelector('#player1_race');
const player2row = document.querySelector('#player2_race');
const td1 = player1row.querySelectorAll('td');
const td2 = player2row.querySelectorAll('td');
const allTds = document.querySelectorAll('td');
const h1 = document.querySelector('.banner');

const drawWinner = (player) => {
  h1.insertAdjacentHTML('beforeEnd', `<h1 class='text-center'>Player ${player} wins!</h1>`);
};

const drawRestartButton = () => {
  h1.insertAdjacentHTML(
    'beforeend',
    '<div class="text-center"><a href="" class="button btn btn-primary">Play again?</a></div>',
  );
};

const moveCars = (e) => {
  if (e.keyCode === 81) {
    const selected = player1row.querySelector('td.active');
    const next = player1row.querySelector('td.active + td');
    selected.classList.remove('active');
    next.classList.add('active');
  } else if (e.keyCode === 80) {
    const selected = player2row.querySelector('td.active');
    const next = player2row.querySelector('td.active + td');
    selected.classList.remove('active');
    next.classList.add('active');
  }
};

const checkWinner = (e) => {
  if (td1[td1.length - 1].classList.contains('active')) {
    drawWinner(1);
    window.removeEventListener('keyup', checkWinner);
    window.removeEventListener('keyup', moveCars);
    drawRestartButton();
  } else if (td2[td2.length - 1].classList.contains('active')) {
    drawWinner(2);
    window.removeEventListener('keyup', checkWinner);
    window.removeEventListener('keyup', moveCars);
    drawRestartButton();
  }
};

const restartGame = () => {
  window.addEventListener('keyup', moveCars);
  window.addEventListener('keyup', checkWinner);
  allTds.forEach(td => td.classList.remove('active'));
  td1[0].classList.add('active');
  td2[0].classList.add('active');
};

window.addEventListener('keyup', moveCars);
window.addEventListener('keyup', checkWinner);
