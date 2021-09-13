Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Ready', '');
var controlAddIn = document.getElementById("controlAddIn");
var bcform = document.createElement("form");
bcform.id = "PINcode";
controlAddIn.appendChild(bcform);


$("#PINcode").html(
    "<form action='' method='' name='PINform' id='PINform' autocomplete='off'>" +
    "</form>"
);

$('<input>').attr({ type: 'password', id: 'PINbox', name: 'PINbox', disabled: true, }).appendTo("#PINcode");
$('<br>').appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton1', name: '1', class: 'pinButton', value: '1' }).appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton2', name: '2', class: 'pinButton', value: '2' }).appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton3', name: '3', class: 'pinButton', value: '3' }).appendTo("#PINcode");
$('<br>').appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton4', name: '4', class: 'pinButton', value: '4' }).appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton5', name: '5', class: 'pinButton', value: '5' }).appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton6', name: '6', class: 'pinButton', value: '6' }).appendTo("#PINcode");
$('<br>').appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton7', name: '7', class: 'pinButton', value: '7' }).appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton8', name: '8', class: 'pinButton', value: '8' }).appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton9', name: '9', class: 'pinButton', value: '9' }).appendTo("#PINcode");
$('<br>').appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: '-', name: '-', class: 'clear', value: 'clear' }).appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: 'PINbutton0', name: '0', class: 'pinButton', value: '0' }).appendTo("#PINcode");
$('<input>').attr({ type: 'button', id: '+', name: '+', class: 'enter', value: 'enter' }).appendTo("#PINcode");

$(".pinButton").on('click', '', function () {
    var v = $("#PINbox").val();
    $("#PINbox").val(v + this.value);
});


$(".clear").on('click', '', function () {
    $("#PINbox").val("");
});

$(".enter").on('click', '', function () {
    if ($("#PINbox").val() == "") {
        alert("Enter a PIN");
    } else {
        data = [{
            pin: $("#PINbox").val()
        }];
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnInvoke', data, false, () => { "This is javascript talking" });
        $("#PINbox").val("");
    };
});



