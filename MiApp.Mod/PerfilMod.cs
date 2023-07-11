namespace MiApp.Mod
{
    public class PerfilMod
    {
        public int Codigo { get; set; }
        public string  Glosa { get; set; }

        public PerfilMod(int perfilCodigo)
        {
            Codigo = perfilCodigo;
        }

        public PerfilMod(int perfilCodigo, string glosa ):this(perfilCodigo)
        {
            Glosa = glosa;
        }
    }
}
