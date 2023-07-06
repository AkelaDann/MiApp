using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;

namespace MiApp.Dal
{
    public class DocumentoDal
    {
        public static void Insertar(DocumentoMod documento, out SalidaMod salida)
        {
            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros(new
                    {
                        doc_codigo = documento.Codigo,
                        doc_glosa = documento.Glosa,
                        doc_fecha=documento.Fecha,
                        doc_fecha_minima = documento.FechaMinima,
                        doc_fecha_maxima = documento.FechaMaxima,
                        doc_referencia = documento.Referencia,
                        doc_descuento = documento.Descuento,
                        doc_clasificacion = documento.Clasificacion,
                        doc_marcado = documento.Marcado,
                        doc_total = documento.Total,
                        per_rut = documento.Persona.Rut,
                        tpd_codigo = documento.TipoDocumento.Codigo
                    });
                    parametros.Add("@tipo_item", dbType: DbType.Object, value: TiposSqlFll.ObtenerItems(documento));
                    parametros.Add("@tipo_etapa_documento", dbType: DbType.Object, value: TiposSqlFll.Obteneretapas(documento));
                    db.Execute(
                        sql: "[dbo].[SP_Documento_Insert]",
                        param: parametros,
                        commandType: CommandType.StoredProcedure
                        );
                    salida = ConexionFll.ObtenerSalida(parametros);
                }
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                throw;
            }
        }
    }
}
