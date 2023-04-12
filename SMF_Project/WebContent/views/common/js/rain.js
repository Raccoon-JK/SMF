/**
 * 비내리는 기능 구현
 */

function rain() {
	let amount = 60;
	let body = document.querySelector("body");
	let count = 0;
	while (count < amount) {
		let drop = document.createElement("i");
		let size = Math.random() * 3;
		let posX = Math.floor(Math.random() * window.innerWidth);
		let delay = Math.random() * -10;
		let duration = Math.random() * 1;
		drop.style.width = `${0.1 + size}px`;
		drop.style.left = `${posX}px`;
		drop.style.animationDelay = `${delay}s`;
		drop.style.animationDuration = `${1 + duration}s`;
		body.appendChild(drop);
		count++;
	}
}
rain();