$(function(){

    setInterval(function(){
        $('.slideWrap').animate({'margin-top':'300'},function(){
            $('.slide:first').appendTo('.slideWrap')
            $('.slideWrap').css({'margin-top':'0'})
        })
    }, 3000)


});//window.onload