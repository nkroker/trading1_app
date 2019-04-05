// Create an instance of the card Element.
var target = document.getElementById("testname");

// Handle real-time validation errors from the card Element.
target.addEventListener('change', function(event) {
  var displayError = document.getElementById('card-errors');
  if (event.error) {
    displayError.innerHTML = event.error.message;
  } else {
    displayError.textContent = '';
  }
});

$(document).ready(function() {
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));

    $(document).on('submit', "#stripe-form", function(event) {
      $('.submit').attr("disabled", "disabled");

      Stripe.createToken({
          number: $('.credit-number').val(),
          cvc: $('.credit-security').val(),
          exp_month: $('.card-expiry-month').val(),
          exp_year: $('.card-expiry-year').val()
      }, stripeResponseHandler);

      alert("ping ping");
      // prevent the form from submitting with the default action
      return false;
  });
});

function stripeResponseHandler(status, response) {
  if (response.error) {
      $(".payment-errors").text(response.error.message);
  } 
  else {
      var form$ = $("#stripe-form");
      var token = response['id'];
      form$.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
      form$.get(0).submit();
  }
}