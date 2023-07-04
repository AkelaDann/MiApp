using MiApp.Dal;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;

namespace MiApp.Bll
{
    public class PerfilBll
    {
        public static List<PerfilMod> ListarPerfiles(out SalidaMod salida)
        {
            try
            {
                return PerfilDal.ListarPerfil(out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                string error = e.Message;
                throw;
            }
        }
    }
}
