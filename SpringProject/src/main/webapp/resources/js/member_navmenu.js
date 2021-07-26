const info_click = document.querySelector('#info_click');
const info_display = document.querySelector('#info_display');

const orderClick = document.querySelector('#orderClick');
const qnaClick = document.querySelector('#qnaClick');
const recentClick = document.querySelector('#recentClick');

info_click.addEventListener('click', function() {
	
	info_display.classList.toggle('off');
});

orderClick.addEventListener('click', function() {
	
	orderClick.classList.replace('n','y');
	qnaClick.classList.replace('y','n');
	recentClick.classList.replace('y','n');
	info_display.classList.replace('y','n');
	
});

qnaClick.addEventListener('click', function() {
	
	qnaClick.classList.replace('n','y');
	orderClick.classList.replace('y','n');
	recentClick.classList.replace('y','n');
	info_display.classList.replace('y','n');
	
});

recentClick.addEventListener('click', function() {
	
	recentClick.classList.replace('n','y');
	qnaClick.classList.replace('y','n');
	orderClick.classList.replace('y','n');
	info_display.classList.replace('y','n');
	
});