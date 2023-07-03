namespace MiApp.Mod
{
    public class PerfilMod
    {
        public int CodigoPerfil { get; set; }
        public string  Glosa { get; set; }

        public PerfilMod(int codigoPerfil)
        {
            CodigoPerfil = codigoPerfil;
        }

        public PerfilMod(int codigoPerfil,string glosa ):this(codigoPerfil)
        {
            Glosa = glosa;
        }
    }
}
