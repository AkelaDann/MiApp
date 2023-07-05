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
            int referencia,int descuento, char clasificacion, bool marcado,float total,
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
    public class EtapaBll
    {
        public static List<EtapaMod> Listar(out SalidaMod salida)
        {
            try
            {
                return EtapaDal.Listar( out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                return new List<EtapaMod>();
            }
        }
    }
    public class PersonaBll
    {
        public static List<PersonaMod> Listar(int tipoDocumento, out SalidaMod salida)
        {
            try
            {
                return PersonaDal.Listar(tipoDocumento,out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                return new List<PersonaMod>();
            }
        }
    }
    public class TipoDocumentoBll
    {
        public static List<TipoDocumentoMod> Listar(out SalidaMod salida)
        {
            try
            {
                return TipoDocumentoDal.Listar(out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                return new List<TipoDocumentoMod>();
            }
        }
    }
    public class PerfilBll
    {
        public static List<PerfilMod> ListarPerfiles(out SalidaMod salida)
        {
            try
            {
                return PerfilDal.Listar(out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);

                return new List<PerfilMod>();
            }
        }
    }
}
