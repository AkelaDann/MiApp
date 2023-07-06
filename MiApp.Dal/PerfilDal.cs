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
        public static List<PerfilMod> Listar(out SalidaMod salida)
        {
            List<PerfilMod> perfiles = new List<PerfilMod>();

            try
            {

                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros();
                    perfiles = db.Query<PerfilMod>(
                        sql: @"[dbo].[SP_Perfil_Select]",
                        param: parametros,
                        commandType: CommandType.StoredProcedure
                        ).AsList();
                    salida = ConexionFll.ObtenerSalida(parametros);
                }

                return perfiles;
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                return perfiles;
            }
        }
    }
}
