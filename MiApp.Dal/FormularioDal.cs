using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;

namespace MiApp.Dal
{
    public class FormularioDal
    {
        public static List<FormularioMod> Listar(string url, out SalidaMod salida)
        {
            List<FormularioMod> formularios = new List<FormularioMod>();

            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros(new
                    {
                        frm_url = url
                    }); 
                    formularios = db.Query<FormularioMod>(
                        sql: @"[dbo].[SP_Formularios_Select]",
                        param: parametros,
                        commandType: CommandType.StoredProcedure
                        ).AsList();
                    salida = ConexionFll.ObtenerSalida(parametros);
                }

                return formularios;
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                return formularios;
            }
        }
    }
}
