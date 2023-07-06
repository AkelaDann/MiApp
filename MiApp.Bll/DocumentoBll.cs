using MiApp.Dal;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;

namespace MiApp.Bll
{
    public class DocumentoBll
    {
        public static void Insertar(
            int codigo, string glosa, DateTime fecha, DateTime fechaMaxima, DateTime fechaMinima, 
            int referencia,int descuento, string clasificacion, bool marcado,double total,
            PersonaMod persona, TipoDocumentoMod tipoDocumento,List<EtapaMod> etapas,List<ItemMod> items ,
            out SalidaMod salida)
        {
            try
            {
                
                DocumentoMod documento = new DocumentoMod(codigo,glosa,fecha,fechaMinima,fechaMaxima,referencia,descuento,
                                              clasificacion,marcado,total, persona,tipoDocumento,etapas,items);
                DocumentoDal.Insertar( documento, out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);                
            }
        }
    }
}
