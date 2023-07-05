using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;

namespace MiApp.Dal
{
    public class PersonaDal
    {
        public static List<PersonaMod> Listar(int tipoDocumento,out SalidaMod salida)
        {
            List<PersonaMod> personas = new List<PersonaMod>();

            try
            {

                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros(
                        new
                        {
                            tpd_codigo = tipoDocumento
                        }
                        ); ;
                        personas = db.Query<PersonaMod>(
                        sql: @"[dbo].[SP_Persona_Select]",
                        param: parametros,
                        commandType: CommandType.StoredProcedure
                        ).AsList();
                    salida = ConexionFll.ObtenerSalida(parametros);
                }

                return personas;
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                string error = e.Message;
                return personas;
            }
        }
    }
}
