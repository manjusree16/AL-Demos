import $ from "jquery";
$(function () {
  const input_value = $("#password");

  //disable input from typing

  $("#password").keypress(function () {
    return false;
  });

  //add password
  $(".calc").click(function () {
    let value = $(this).val();
    field(value);
    console.log(value);
  });
  function field(value) {
    input_value.val(input_value.val() + value);
  }
  $("#clear").click(function () {
    input_value.val("");
  });
  $("#enter").click(function () {
    alert("Your password " + input_value.val() + " added");
  });
});
