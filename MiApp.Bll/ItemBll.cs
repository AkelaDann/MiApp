using MiApp.Fll;
using MiApp.Mod;
using MiApp.Dal;
using System;
using System.Collections.Generic;

namespace MiApp.Bll
{
    public class ItemBll
    {
        public static List<ItemMod> Listar(int documentoCodigo, out SalidaMod salida)
        {
            try
            {  
                return ItemDal.Listar(documentoCodigo,out salida);
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                return new List<ItemMod>();
            }
        }

        public static void Inyectar(List<ItemMod> items,int documentoCodigo,out SalidaMod salida)
        {
            try
            {
                ItemDal.Inyectar(items, documentoCodigo, out salida);
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
            }
        }
    }
}
