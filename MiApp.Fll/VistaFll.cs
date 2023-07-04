using DevExpress.Web;
using MiApp.Mod;
using System;
using System.Web.UI.WebControls;

namespace MiApp.Fll
{
    public class VistaFll
    {
        public static void NormalizarLLave(ObjectDataSourceMethodEventArgs e)
        {
            int largo= e.InputParameters.Count;
            string[] llaves = new string[largo];
            Object[] valores = new object[largo];
            e.InputParameters.Keys.CopyTo(llaves,0);
            e.InputParameters.Values.CopyTo(valores, 0);
            e.InputParameters.Clear();

            for (int i = 0; i < largo; i++)
            {
                e.InputParameters.Insert(i, llaves[i].Replace("Perfil.", string.Empty),valores[i]);
            }
            
        }

        public static void AgregarSalida(object control, SalidaMod salida)
        {
            Type type = control.GetType();
            if (type.Name.Equals("ASPxGridView"))
            {
                ASPxGridView gridview = (ASPxGridView)control;
                gridview.JSProperties["cpCodigo"] = salida.Codigo;
                gridview.JSProperties["cpMensaje"] = salida.Mensaje;
            }
            else if (type.Name.Equals("ASPxCallbackPanel"))
            {
                ASPxCallbackPanel callbackPanel = (ASPxCallbackPanel)control;
                callbackPanel.JSProperties["cpCodigo"] = salida.Codigo;
                callbackPanel.JSProperties["cpMensaje"] = salida.Mensaje;
            }
        }
    }
}
