﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiApp.web.ControlUsuario
{
    public partial class ControlPersona : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AcpControlPersona_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string[] datos = e.Parameter.Split(',');
            switch (datos[0])
            {
                case "Levantar":
                    OdsControlPersona.SelectParameters[0].DefaultValue = datos[1];
                    Session["OdsControlPersonaTipoDocumento"] = datos[1];
                    ApcControlPersona.ShowOnPageLoad = true;
                    break;
                default:
                    break;
            }
        }
    }
}