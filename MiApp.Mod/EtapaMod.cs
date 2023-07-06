namespace MiApp.Mod
{
    public class EtapaMod
    {
        public int Codigo { get; set; }
        public string  Glosa { get; set; }

        public EtapaMod(int eta_codigo)
        {
            Codigo = eta_codigo;
        }
        public EtapaMod(int eta_codigo,string eta_glosa ): this(eta_codigo)
        {            
            Glosa = eta_glosa;
        }
    }
}
