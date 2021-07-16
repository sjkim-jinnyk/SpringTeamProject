
const star1 = document.querySelector('#star1'); 
const star2 = document.querySelector('#star2'); 
const star3 = document.querySelector('#star3'); 
const star4 = document.querySelector('#star4'); 
const star5 = document.querySelector('#star5'); 
let star_score;

 

star1.addEventListener('click', function() {
	star1.classList.replace('off','on');
	star2.classList.replace('on','off');
	star3.classList.replace('on','off');
	star4.classList.replace('on','off');
	star5.classList.replace('on','off');
	star_score = 1;
	document.review_form.review_star.value = star_score;
	
});

star2.addEventListener('click', function() {
	star2.classList.replace('off','on');
	star1.classList.replace('off','on');
	star3.classList.replace('on','off');
	star4.classList.replace('on','off');
	star5.classList.replace('on','off');
	star_score= 2;
	document.review_form.review_star.value = star_score;
});

star3.addEventListener('click', function() {
	star3.classList.replace('off','on');
	star2.classList.replace('off','on');
	star1.classList.replace('off','on');
	star4.classList.replace('on','off');
	star5.classList.replace('on','off');
	star_score= 3;
	document.review_form.review_star.value = star_score;
});

star4.addEventListener('click', function() {
	star4.classList.replace('off','on');
	star3.classList.replace('off','on');
	star2.classList.replace('off','on');
	star1.classList.replace('off','on');
	star5.classList.replace('on','off');
	star_score= 4;
	document.review_form.review_star.value = star_score;
});

star5.addEventListener('click', function() {
	star5.classList.replace('off','on');
	star4.classList.replace('off','on');
	star3.classList.replace('off','on');
	star2.classList.replace('off','on');
	star1.classList.replace('off','on');
	star_score= 5;
	document.review_form.review_star.value = star_score;
});

