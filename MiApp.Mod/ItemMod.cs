namespace MiApp.Mod
{
    public class ItemMod
    {
        public int Correlativo { get; set; }
        public string Glosa { get; set; }
        public float Valor { get; set; }

        public ItemMod(int correlativo,string glosa, float valor)
        {
            Correlativo = correlativo;
            Glosa = glosa;
            Valor = valor;
        }
    }
}
