using MiApp.Dal;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiApp.Bll
{
    public class PerfilBll
    {
        public static List<PerfilMod> ListarPerfiles()
        {
            try
            {
                return PerfilDal.ListarPerfil();
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                throw;
            }
        }
    }
    public class UsuarioBll
    {
        public static List<UsuarioMod> ListarUsuarios()
        {
            try
            {
                return UsuarioDal.ListarUsuarios();
            }
            catch (Exception)
            {

                return new List<UsuarioMod>();
            }
            
        }

        public static void InsertarActualizarUsuario(int Codigo, string Nombre)
        {
            try
            {
                UsuarioDal.InsertarActualizar(Codigo, Nombre);
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                throw;
            }
        }

        public static void EliminarUsuario(int Codigo)
        {
            try
            {
                UsuarioDal.EliminarUsuario(Codigo);
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                throw;
            }
        }
    }
}
