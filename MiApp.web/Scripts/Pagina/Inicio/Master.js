//const { Toastr }  = require("../../Bootstrap/bootstrap.esm");

function Confirmar(mensaje) {
    return Swal.fire({
        icon: 'question',
        title: 'Pregunta',
        text: mensaje,
        showConfirmButton: true,
        confirmButtonText: 'Si, estoy seguro',
        showDenyButton: true,
        denyButtonText: 'No, ya me arrepntí',
        allowOutsideClick: false
    }).then(response => {
        return response.value;
    });
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

ASPxClientControl.GetControlCollection().ControlsInitialized.AddHandler(function (s, e) {
    if(window.UpdateGridHeight)
    {
        UpdateGridHeight();
    }
});

ASPxClientControl.GetControlCollection().BrowserWindowResized.AddHandler(function (s, e) {
    if (window.UpdateGridHeight) {
        UpdateGridHeight();
    }
});