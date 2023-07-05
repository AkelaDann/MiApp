using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;

namespace MiApp.Dal
{
    public class TipoDocumentoDal
    {
        public static List<TipoDocumentoMod> Listar(out SalidaMod salida)
        {
            List<TipoDocumentoMod> tipoDocumentos = new List<TipoDocumentoMod>();

            try
            {

                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros();
                    tipoDocumentos = db.Query<TipoDocumentoMod>(
                        sql: @"[dbo].[SP_Tipo_Documento_Select]",
                        param: parametros,
                        commandType: CommandType.StoredProcedure
                        ).AsList();
                    salida = ConexionFll.ObtenerSalida(parametros);
                }

                return tipoDocumentos;
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                string error = e.Message;
                return tipoDocumentos;
            }
        }
    }
}
