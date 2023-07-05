namespace MiApp.Mod
{
    public class TipoDocumentoMod
    {
        public int Codigo { get; set; }
        public string  Glosa { get; set; }
        public bool CargoAbono { get; set; }

        public TipoDocumentoMod(int tpd_codigo,string tpd_glosa, bool tpd_cargo_abono)
        {
            Codigo = tpd_codigo;
            Glosa = tpd_glosa;
            CargoAbono = tpd_cargo_abono;
        }
    }
}
