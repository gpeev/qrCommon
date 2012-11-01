!function ($) {

  $(function(){

    // submit button
    $('#submit-button')
      .click(function () {
        var btn = $(this)
        btn.button('loading')
      })

    // submit button2
    $('#submit-button2')
      .click(function () {
        var btn = $(this)
        btn.button('loading')
      })
			
		//login input tooltips
		$('#email').tooltip({
				trigger: 'focus'
			,	placement: 'bottom'
    })	
		$('#pass').tooltip({
				trigger: 'focus'
			,	placement: 'bottom'
    })	
			
		//close an alert message
		$(".alert-message").alert()
		
		// tooltip demo
    $('.tooltip-demo.well').tooltip({
      selector: "a[rel=tooltip]"
    })

    $('.tooltip-test').tooltip()
    $('.popover-test').popover()

    // popover demo
    $("a[rel=popover]")
      .popover()
      .click(function(e) {
        e.preventDefault()
      })

    

    // carousel demo
    $('#propertyPhotoCarousel').carousel({
				interval: 999999999
		})

  })


}(window.jQuery)