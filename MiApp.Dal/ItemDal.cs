using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;

namespace MiApp.Dal
{
    public class ItemDal
    {
        public static List<ItemMod> Listar(int documentoCodigo,out SalidaMod salida)
        {
            List<ItemMod> items = new List<ItemMod>();

            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros(new {doc_codigo=documentoCodigo });
                    items = db.Query<ItemMod>(
                        sql: @"[dbo].[SP_Item_Documento_Select]",
                        param: parametros,
                        commandType: CommandType.StoredProcedure
                        ).AsList();
                    salida = ConexionFll.ObtenerSalida(parametros);
                }
                return items;
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                return items;
            }
        }

        public  static void Inyectar(List<ItemMod> items, int documentoCodigo, out SalidaMod salida)
        {
            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters documentos = ConexionFll.ObtenerParametros();
                    documentos.Add("@tipo_item", dbType: DbType.Object, value: TiposSqlFll.ObtenerItems(items, documentoCodigo));
                    db.Execute(
                        sql: @"[dbo].[SP_Item_Insert]",
                        param: documentos,
                        commandType: CommandType.StoredProcedure
                        );
                    salida = ConexionFll.ObtenerSalida(documentos);
                }

            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
            }
        }
    }
}
