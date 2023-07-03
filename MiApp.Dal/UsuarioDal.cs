using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiApp.Dal
{
    public class UsuarioDal
    {
        public static List<UsuarioMod> ListarUsuarios() 
        {
            List<UsuarioMod> usuarios = new List<UsuarioMod>();

            try
            {

                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    usuarios = db.Query<UsuarioMod, PerfilMod, UsuarioMod>(
                        sql: @"SP_Usuario_Select",
                        map: (UsuarioMod, PerfilMod) => { UsuarioMod.Perfil = PerfilMod; return UsuarioMod; },
                        splitOn:"CodigoPerfil",
                        commandType: CommandType.StoredProcedure).AsList();
                }

                return usuarios;
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                return usuarios;
            }
        }

        public static void InsertarActualizar(int codigo, string nombre)
        {
            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    db.Execute(
                        sql: "SP_Usuario_Insert_Update",
                        param: new { codigo, nombre },
                        commandType: CommandType.StoredProcedure
                        );
                }
            }
            catch (Exception EX)
            {
                string error = EX.Message;
                throw;
            }
        }

        public static void EliminarUsuario(int codigo)
        {
            //SP_Usuario_Delete
            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    db.Execute(
                        sql: "SP_Usuario_Delete",
                        param: new { codigo },
                        commandType: CommandType.StoredProcedure
                        );
                }
            }
            catch (Exception EX)
            {
                string error = EX.Message;
                throw;
            }   
        }
    }
}
