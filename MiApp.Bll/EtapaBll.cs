﻿using MiApp.Dal;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;

namespace MiApp.Bll
{
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
}
