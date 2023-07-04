function ConfirmarUsuarioGuardar(AgvUsuario) {
    if (Confirmar('Se dispone a guardar el registro. ¿Está seguro?')) {
        AgvUsuario.UpdateEdit();
    }
}

function ConfirmarUsuarioCancelar(AgvUsuario) {
    if (Confirmar('Se dispone a cancelar cambios en el registro. ¿Está seguro?')){
        AgvUsuario.CancelEdit();
    }
}

function EndcallbackAgvUsuario(s) {
    if (s.cpCodigo != null) {
        EnviarMensaje(s.cpCodigo, s.cpMensaje);
        delete s.cpCodigo;
        delete s.cpMensaje;
    }
}

function UpdateGridHeight() {
    AgvUsuario.SetHeight(0);
    var containerHeight = ASPxClientUtils.GetDocumentClientHeight();
    if (document.body.scrollHeight>containerHeight) {
        containerHeight = document.body.scrollHeight;
    }
    AgvUsuario.SetHeight(containerHeight - AplTitulo.GetHeight() - 114);
}