﻿const { Toast } = require("../../Bootstrap/bootstrap.esm");

function Confirmar(mensaje) {
    return confirm(mensaje);
}

function EnviarMensaje(codigo,mensaje) {
    toastr.options={
        "closeButton": true,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "timeOut":"10000"
    }
    if (mensaje != undefined && mensaje != null && codigo <= -1 && codigo != null) {
        Command: toastr["error"](mensaje);
    }
    if (mensaje != undefined && mensaje != null && codigo === 0 && codigo != null) {
        Command: toastr["info"](mensaje);
    }
    if (mensaje != undefined && mensaje != null && codigo >= 1 && codigo != null) {
        Command: toastr["success"](mensaje);
    }
}

ASPxClientControl.GetControlCollection().ControlsInitialized.AddHandlers(function( s, e ){
    if(window.UpdateGridHeight)
    {
    UpdateGridHeight();
    }
});

ASPxClientControl.GetControlCollection().BrowserWindowResized.AddHandlers(function (s, e) {
    if (window.UpdateGridHeight) {
        UpdateGridHeight();
    }
});