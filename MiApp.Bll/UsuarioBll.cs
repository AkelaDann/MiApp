using MiApp.Dal;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiApp.Bll
{
    public class UsuarioBll
    {
        public static List<UsuarioMod> ListarUsuarios(out SalidaMod salida)
        {
            try
            {
                return UsuarioDal.ListarUsuarios(out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                return new List<UsuarioMod>();
            }
            
        }

        public static void InsertarActualizarUsuario(int Codigo, string Nombre, int CodigoPerfil, out SalidaMod salida)
        {
            try
            {
                UsuarioMod usuario = new UsuarioMod(Codigo, Nombre, new PerfilMod(CodigoPerfil));
                UsuarioDal.InsertarActualizar(usuario, out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                string error = e.Message;
                throw;
            }
        }

        public static void EliminarUsuario(int Codigo, out SalidaMod salida)
        {
            try
            {
                UsuarioDal.EliminarUsuario(Codigo, out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                string error = e.Message;
                throw;
            }
        }
    }
}
