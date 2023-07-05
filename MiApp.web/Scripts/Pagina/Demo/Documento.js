function OnTipoDocumentoChanged(s) {
    if (!AcbPersona.InCallback()) {
        AcbPersona.PerformCallback(s.GetValue().toString());
    }
}

function OnItemsClick() {
    ApcItem.show();
}