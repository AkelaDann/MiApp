namespace MiApp.Mod
{
    public class ItemMod
    {
        public int Correlativo { get; set; }
        public string Glosa { get; set; }
        public double Valor { get; set; }

        public ItemMod(int itm_correlativo,string itm_glosa, double itm_valor)
        {
            Correlativo = itm_correlativo;
            Glosa = itm_glosa;
            Valor = itm_valor;
        }
    }
}
