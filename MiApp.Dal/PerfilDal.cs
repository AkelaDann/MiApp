using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;

namespace MiApp.Dal
{
    public class PerfilDal
    {
        public static List<PerfilMod> ListarPerfil()
        {
            List<PerfilMod> perfiles = new List<PerfilMod>();

            try
            {

                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    perfiles = db.Query<PerfilMod>(
                        sql: @"[dbo].[SP_Perfil_Select]",
                        commandType: CommandType.StoredProcedure
                        ).AsList();
                }

                return perfiles;
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                return perfiles;
            }
        }
    }
}
