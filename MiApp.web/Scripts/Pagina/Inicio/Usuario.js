async function ConfirmarUsuarioGuardar(AgvUsuario) {
    if (ASPxClientEdit.ValidateEditorsInContainerById(AgvUsuario)) {
        if (await Confirmar('Se dispone a guardar el registro. ¿Está seguro?')) {
            AgvUsuario.UpdateEdit();
        }
    }
}
 

async function ConfirmarUsuarioCancelar(AgvUsuario) {
    if (await Confirmar('Se dispone a cancelar cambios en el registro. ¿Está seguro?')){
        AgvUsuario.CancelEdit();
    }
}

async function OnToolbarItemClick(s, e) {
    if (e.item.name == "Delete") {
        if (await Confirmar("Se dispone a eliminar este Usuario ¿Esta segunro?")) {
            s.DeleteRow(s.focusedRowIndex);
        }
    }
    if (e.item.name=="Print") {
        e.processOnServer = true;
    }
}

function EndcallbackAgvUsuario(s) {
    if (s.cpCodigo != null) {
        EnviarMensaje(s.cpCodigo, s.cpMensaje);
        delete s.cpCodigo;
        delete s.cpMensaje;
    }

    Imprimir(s);
}

function UpdateGridHeight() {
    AgvUsuario.SetHeight(0);
    var containerHeight = ASPxClientUtils.GetDocumentClientHeight();
    if (document.body.scrollHeight>containerHeight) {
        containerHeight = document.body.scrollHeight;
    }
    AgvUsuario.SetHeight(containerHeight - AplTitulo.GetHeight() - 114);
}