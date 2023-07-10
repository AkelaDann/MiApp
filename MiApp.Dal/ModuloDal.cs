using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;

namespace MiApp.Dal
{
    public class ModuloDal
    {
        public static List<ModuloMod> Listar(out SalidaMod salida)
        {
            List<ModuloMod> modulos = new List<ModuloMod>();

            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros();
                    modulos = db.Query<ModuloMod>(
                        sql: @"[dbo].[SP_Modulo_Select]",
                        param: parametros,
                        commandType: CommandType.StoredProcedure
                        ).AsList();
                    salida = ConexionFll.ObtenerSalida(parametros);
                }

                return modulos;
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                return modulos;
            }
        }
    }
}
