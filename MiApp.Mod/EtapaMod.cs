namespace MiApp.Mod
{
    public class EtapaMod
    {
        public int Codigo { get; set; }
        public string  Glosa { get; set; }

        public EtapaMod(int eta_codigo,string eta_glosa )
        {
            Codigo = eta_codigo;
            Glosa = eta_glosa;
        }
    }
}
