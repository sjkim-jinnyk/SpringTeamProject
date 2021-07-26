let qna_title = []; /*= document.querySelector('#qna_title');*/
/*const qna_cont = document.querySelector('#qna_cont');*/
let qna_cont = [];
let qna_reply = [];
const listsize = document.getElementById("listsize").value
console.log(listsize);

for(let i=0; i<listsize; i++){
	 qna_title[i] = document.querySelector('#qna_title' + [i]);
	 qna_cont[i] = document.querySelector('#qna_cont' + [i]);
	 qna_reply[i] = document.querySelector('#qna_reply' + [i]);
	 
	 qna_title[i].addEventListener('click', function() {
		 qna_cont[i].classList.toggle('off');
		 qna_reply[i].classList.toggle('off');
	 });
}

