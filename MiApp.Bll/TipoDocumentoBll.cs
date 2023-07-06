using MiApp.Dal;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;

namespace MiApp.Bll
{
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
}
