using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;

namespace MiApp.Dal
{
    public class EtapaDal
    {
        public static List<EtapaMod> Listar(out SalidaMod salida)
        {
            List<EtapaMod> etapas = new List<EtapaMod>();

            try
            {

                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros();
                    etapas = db.Query<EtapaMod>(
                        sql: @"[dbo].[SP_Etapa_Select]",
                        param: parametros,
                        commandType: CommandType.StoredProcedure
                        ).AsList();
                    salida = ConexionFll.ObtenerSalida(parametros);
                }

                return etapas;
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                string error = e.Message;
                return etapas;
            }
        }
    }
}
