using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;

namespace MiApp.Dal
{
    public class ArbolDal
    {
        public static List<ArbolMod> Listar(out SalidaMod salida)
        {
            List<ArbolMod> arbol = new List<ArbolMod>();

            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros(); 
                    arbol = db.Query<ArbolMod>(
                        sql: @"[dbo].[SP_Arbol_Select]",
                        param: parametros,
                        commandType: CommandType.StoredProcedure
                        ).AsList();
                    salida = ConexionFll.ObtenerSalida(parametros);
                }

                return arbol;
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                return arbol;
            }
        }
    }
}
