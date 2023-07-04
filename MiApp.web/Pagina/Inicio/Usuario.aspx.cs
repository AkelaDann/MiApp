using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiApp.web.Pagina.Inicio
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            OdsUsuario.Insert();
        }

        protected void OdsUsuario_IUing(object sender, ObjectDataSourceMethodEventArgs e)
        {
            try
            {
                VistaFll.NormalizarLLave(e);
            }
            catch (Exception ex)
            {
                SalidaMod salida = LogFll.RegistrarExcepcion(ex);
                VistaFll.AgregarSalida(AgvUsuarios, salida);
            }
            
        }
        

        protected void OdsUsuario_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            SalidaMod salida;
            try
            {
                salida = e.OutputParameters["salida"] as SalidaMod;
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                throw;
            }

            if(salida.Codigo <= 0)
            {
                VistaFll.AgregarSalida(AgvUsuarios, salida);
            }
        }

        protected void OdsUsuario_IUDed(object sender, ObjectDataSourceStatusEventArgs e)
        {
            SalidaMod salida;
            try
            {
                salida = e.OutputParameters["salida"] as SalidaMod;
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                throw;
            }

            VistaFll.AgregarSalida(AgvUsuarios, salida);
        }
    }
}