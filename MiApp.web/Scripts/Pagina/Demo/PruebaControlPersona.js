function LlamarControlPersona() {
    if (AcbTipoDocumento.GetValue() != null) {
        AcpControlPersona.PerformCallback(['Levantar', AcbTipoDocumento.GetValue()]);
    }
    else {
        EnviarMensaje(0, "Seleccione un tipo de documento");
    }
}

function RespuestaControlPersona(datos) {
    if (datos!=null) {
        AbeRut.SetText(datos[0] + '-' + datos[1]);
        AtxNombre.SetText(datos[2]);
    }
}