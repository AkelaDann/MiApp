namespace MiApp.Mod
{
    public class TipoDocumentoMod
    {
        public int Codigo { get; set; }
        public string  Glosa { get; set; }
        public bool CargoAbono { get; set; }

        public TipoDocumentoMod(int tpd_codigo)
        {
            Codigo = tpd_codigo;
        }
        public TipoDocumentoMod(int tpd_codigo,string tpd_glosa, bool tpd_cargo_abono):this(tpd_codigo)
        {            
            Glosa = tpd_glosa;
            CargoAbono = tpd_cargo_abono;
        }
    }
}
