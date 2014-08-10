// Your validation code will go in there.
// Write your validation functions, and bind events
// in a jQuery DOM ready callback
$(function() {
  $(".form-control").focusout(function () {
    is_empty(this);
    if ($(this).is('#zip_code')) {
      validate_zip(this);
    }
    if ($(this).is('#email')) {
      validate_email(this);
    }
    if ($(this).is('#mobile_phone')) {
      validate_phone(this);
    }
    validate_form();
  });
});

function has_error (e) {
  $(e).parent().removeClass("has-success");
  $(e).parent().addClass("has-error");
};

function has_success (e) {
  $(e).parent().removeClass("has-error");
  $(e).parent().addClass("has-success");
};

function is_empty (e) {
  if ($(e).val() == "") {
      has_error(e);
    }
  else
    {
      has_success(e);
    }
};

function validate_email (e) {
  var email = $(e).val();
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  if (!emailReg.test(email)) {
    has_error(e);
  }
  else {
    has_success(e);
  }
};

function validate_phone (e) {
  var phone = $(e).val();
  var phoneReg = /^[0-9]+$/;
  if (!phoneReg.test(phone)) {
    has_error(e);
  }
  else {
    has_success(e);
  }
};

function validate_zip (e) {
  var zip = $(e).val();
  var zipReg = /^\d{4,5}$/;
  if (!zipReg.test(zip)) {
    has_error(e);
  }
  else {
    has_success(e);
  }
};

function validate_form () {
  if ($(".form-group.has-success").length == $(".form-group").length) {
      $("button").removeAttr('disabled');
    }
};





