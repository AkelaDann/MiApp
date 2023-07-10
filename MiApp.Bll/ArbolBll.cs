using MiApp.Dal;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;

namespace MiApp.Bll
{
    public class ArbolBll
    {
        public static List<ArbolMod> Listar( out SalidaMod salida)
        {
            try
            {
                return ArbolDal.Listar( out salida);
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                return new List<ArbolMod>();
            }
        }
    }
}
