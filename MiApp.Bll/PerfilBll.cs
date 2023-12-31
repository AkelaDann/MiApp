﻿using MiApp.Dal;
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
