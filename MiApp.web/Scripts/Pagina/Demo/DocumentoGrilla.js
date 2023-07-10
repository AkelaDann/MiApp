function EndCallbackAgvDocumentoGrilla(s) {
    if (s.cpCodigo != null) {
        EnviarMensaje(s.cpCodigo, s.cpMensaje);
        delete s.cpCodigo;
        delete s.cpMensaje;
    }
    if (s.cpItemsInyectados) {
        delete s.cpItemsInyectados;
        ApcItem.Hide();
        AgvDocumentoGrilla.ExpandDetailRow(AgvDocumentoGrilla.focusedRowIndex);
    }
}

function Desenfocar() {
    AgvDocumentoGrilla.SetFocusedRowIndex(-1);
}

async function EliminarDesdeFuera() {
    if (AgvDocumentoGrilla.focusedRowIndex >= 0) {
        async function datosGrilla(valores) {
            if (await Confirmar('¿Seguro que desea eliminar el documento con el codigo'+ valores[0]+ 'y la glosa: '+valores[1]+'?')) {
                AgvDocumentoGrilla.DeleteRow(AgvDocumentoGrilla.focusedRowIndex);
            }
        }
        AgvDocumentoGrilla.GetRowValues(AgvDocumentoGrilla.focusedRowIndex, 'Codigo;Glosa', datosGrilla);
        
    } else {
        EnviarMensaje(0, 'Seleccione un documento');
    } 
}

function LevantaPopUpInyectarItems(s, e) {
    ApcItem.Show();
}

function LlamarAsdItem() {
    AsdItem.PerformCallback();
}

function InyectarDocumento() {
    AcpDocumentoGrilla.PerformCallback('InyectaItems')
}

function UpdateGridHeight() {
    AgvDocumentoGrilla.SetHeight(0);
    var containerHeight = ASPxClientUtils.GetDocumentClientHeight();
    if (document.body.scrollHeight > containerHeight) {
        containerHeight = document.body.scrollHeight;
    }
    AgvDocumentoGrilla.SetHeight(containerHeight - AplTitulo.GetHeight() - 137);
}
