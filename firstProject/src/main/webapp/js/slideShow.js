let slides = document.querySelector(".slides");
let slideImg = document.querySelectorAll(".slides li");
let slideShow = document.querySelector("#slideShow");

console.log(slideShow);

//인터벌변수
let myInterval

currentIdx = -1;
slideCount = slideImg.length;

//이전 버튼
prev = document.querySelector(".prev");
//다음 버튼
next = document.querySelector(".next");

// 슬라이드 이미지 넓이
slideWidth = 300;

// 슬라이드 간의 마진
slideMargin = 100;

//처음 이미지와 마지막 이미지 복사 함수
makeClone();

//슬라이드 넓이와 위치값 초기화 함수
initfunction();



// 자동 슬라이드 함수
slidingTimer();

stopSlide();
// function makeClone2(){ 
//     //slideImg.firstElementChild.cloneNode(true);
//     let cloneSlide_first = slideImg[0].cloneNode(true);
//     let cloneSlide_last = slides.lastElementChild.cloneNode(true);
//     slides.append(cloneSlide_first);
//     slides.insertBefore(cloneSlide_last,slides.firstElementChild);
// }


function makeClone(){
    let cloneSlide_first = slideImg[0].cloneNode(true);
    let cloneSlide_last = slides.lastElementChild.cloneNode(true);

    slides.append(cloneSlide_first);
    slides.insertBefore(cloneSlide_last, slides.firstElementChild);
};

// function initfunction2(){
//     slides.style.width = (slideWidth + slideMargin) * (slideCount+2) + "px";
//     slides.style.left = -(slideWidth + slideMargin) + "px";
// }

function initfunction(){
    slides.style.width = (slideWidth + slideMargin) * (slideCount+2) + "px";
    // slides.style.bottom = -(slideWidth + slideMargin) + "px";
    slides.style.left = -(slideWidth + slideMargin) + "px";
};

//다음 버튼 눌렀을 때
next.addEventListener('click', function(){
    if(currentIdx <= slideCount-1){
        //슬라이드 이동
        slides.style.left = -(currentIdx+2) * (slideWidth + slideMargin) + "px";
        // slides.style.bottom = -(currentIdx+2) * (slideWidth + slideMargin) + "px";
        //이동 속도
        slides.style.transition = `${0.5}s ease-out`;
    }
    //마지막 슬라이드 일때
    if(currentIdx === slideCount-1){
        //0.5초 동안 복사한 첫번째 이미지에서, 진짜 첫번째 위치로 이동
        setTimeout(()=>{
            slides.style.left = -(slideWidth + slideMargin) + "px";
            // slides.style.bottom = -(slideWidth + slideMargin) + "px";
            slides.style.transition = `${0}s ease-out`;
        },500);
        currentIdx = -1;
    }
    currentIdx += 1;
});

function nextSlide(){
    if(currentIdx <= slideCount-1){
        //슬라이드 이동
        slides.style.left = -(currentIdx+2) * (slideWidth + slideMargin) + "px";
        // slides.style.bottom = -(currentIdx+2) * (slideWidth + slideMargin) + "px";
        //이동 속도
        slides.style.transition = `${0.5}s ease-out`;
    }
    //마지막 슬라이드 일때
    if(currentIdx === slideCount-1){
        //0.5초 동안 복사한 첫번째 이미지에서, 진짜 첫번째 위치로 이동
        setTimeout(()=>{
            slides.style.left = -(slideWidth + slideMargin) + "px";
            // slides.style.bottom = -(slideWidth + slideMargin) + "px";
            slides.style.transition = `${0}s ease-out`;
        },500);
        currentIdx = -1;
    }
    currentIdx += 1;
};




prev.addEventListener('click', ()=>{
    console.log(currentIdx);
    if(currentIdx >= 0){
        slides.style.left = -(currentIdx) * (slideWidth + slideMargin) + "px";
        slides.style.transition = `${0.5}s ease-out`;
    }if(currentIdx === 0){
        setTimeout(()=>{
            slides.style.left = -(slideCount) * (slideWidth + slideMargin) + "px";
            slides.style.transition = `${0}s ease-out`;
        },500);
        currentIdx = slideCount;
    }
    currentIdx -= 1;
    }
);
// let $slides = document.querySelectorAll('.swiper-slide');
//         for (let i of $slides) {
//             i.addEventListener('mouseover', function(){
//             swiper.autoplay.stop();
//         });
//         i.addEventListener('mouseout', function(){
//             swiper.autoplay.start();
//         });
//   }

function slidingTimer(){
    //setInterval(nextSlide() ,1000);    
    myInterval = setInterval(()=>{
        nextSlide();
    },1000);
}


function stopSlide(){
    slideShow.addEventListener('mouseover', function(){
        clearInterval(myInterval);
    });
    slideShow.addEventListener('mouseout', function(){
        slidingTimer();
    });
}

// setInterval(nextSlide(),1000);

//     let interval = setInterval(nextSlide(),1000);

//         for(let i of slideImg){
//             i.addEventListener('mouseover', function() {
//                 // mouse on 
//                 clearInterval(interval);
//             });
//             i.addEventListener('mouseout', function() {
//                 // mouse off
//                 setInterval(nextSlide(),1000);
//             });
//         }