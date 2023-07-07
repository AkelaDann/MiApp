using MiApp.Dal;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;

namespace MiApp.Bll
{
    public class DocumentoBll
    {
        public static void Eliminar(int codigo,out SalidaMod salida)
        {
            try
            {
                DocumentoDal.Eliminar(codigo, out salida);
            }
            catch (Exception ex)
            {
               salida = LogFll.RegistrarExcepcion(ex);
            }
        }
        public static List<DocumentoMod> Listar(out SalidaMod salida)
        {
            try
            {   
                return DocumentoDal.Listar(out salida);
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                return new List<DocumentoMod>();
            }
        }
        public static void Insertar(
            int codigo, string glosa, DateTime fecha, DateTime fechaMaxima, DateTime fechaMinima, 
            int referencia,Int16 descuento, string clasificacion, bool marcado,double total,
            PersonaMod persona, TipoDocumentoMod tipoDocumento,List<EtapaMod> etapas,List<ItemMod> items ,
            out SalidaMod salida)
        {
            try
            {
                
                DocumentoMod documento = new DocumentoMod(codigo,glosa,fecha,fechaMinima,fechaMaxima,referencia,descuento,
                                              clasificacion,marcado,total, persona,tipoDocumento,etapas,items);
                DocumentoDal.Insertar( documento, out salida);
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
            }
        }
    }
}
