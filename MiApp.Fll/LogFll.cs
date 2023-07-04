using MiApp.Mod;
using Newtonsoft.Json;
using System;
using System.IO;

namespace MiApp.Fll
{
    public class LogFll
    {
        public static SalidaMod RegistrarExcepcion(Exception e)
        {
            string targetSite = $"Clase : {e.TargetSite.DeclaringType.Name}, {e.TargetSite.MemberType}: {e.TargetSite.Name}";
            Registro registro = new Registro(e.HResult, e.Message, e.Source, targetSite, e.StackTrace);
            string registroJson = JsonConvert.SerializeObject(registro, Formatting.Indented);
            GuardarRegistro(registroJson);
            return new SalidaMod(-1, $"Se ha producido una excepcion, contacte a soporte e indique el codigo:[{registro.Codigo}].");
        }
        internal static SalidaMod RegistroExcepcionBaseDatos(SalidaMod salida)
        {
            Registro registro = new Registro(salida);
            string registroJson = JsonConvert.SerializeObject(registro, Formatting.Indented);
            GuardarRegistro(registroJson);
            return new SalidaMod(-1, $"Se ha producido una excepcion desde la base de datos, contacte a soporte e indique el codigo:[{registro.Codigo}].");
        }

        private static void GuardarRegistro(string registroJson)
        {
            string ruta = AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "LogError.json";
            StreamWriter sw = new StreamWriter(ruta,true);
            sw.WriteLine(registroJson);
            sw.Close();
        }

        protected class Registro
        {
            public long Codigo { get; set; }
            public DateTime Fecha { get; set; }
            public int CodigoExcepcion { get; set; }
            public string Mensaje { get; set; }
            public string Objeto { get; set; }
            public string Destino { get; set; }
            public string SeguimientoPila { get; set; }

            public Registro(int codigoExcepcion, string mensaje, string objeto, string destino, string seguimientoPila)
            {
                Fecha = DateTime.Now;
                Codigo = Fecha.Ticks;
                CodigoExcepcion = codigoExcepcion;
                Mensaje = mensaje;
                Objeto = objeto;
                Destino = destino;
                SeguimientoPila = seguimientoPila;
            }

            public Registro(SalidaMod salida)
            {
                Fecha = DateTime.Now;
                Codigo = Fecha.Ticks;
                CodigoExcepcion = salida.Codigo;
                Mensaje = salida.Mensaje;
            }
        }
    }
}
