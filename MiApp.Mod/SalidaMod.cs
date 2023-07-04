namespace MiApp.Mod
{
    public class SalidaMod
    {
        public int Codigo { get;  }
        public string Mensaje { get; }

        public SalidaMod(int codigo,string mensaje)
        {
            Codigo = codigo;
            Mensaje = mensaje;
        }
    }
}
