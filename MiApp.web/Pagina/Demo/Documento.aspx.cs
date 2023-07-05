using MiApp.Bll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiApp.web.Pagina.Demo
{
    public partial class Documento : System.Web.UI.Page
    {
        private List<PersonaMod> personaBll;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AcbPersona_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
                if (!string.IsNullOrEmpty(e.Parameter))
                {
                    int tipoDocumento = Convert.ToInt32(e.Parameter);
                    List<PersonaMod> personas = PersonaBll.Listar(tipoDocumento,out SalidaMod salida);
                    AcbPersona.DataSource = personas;
                    AcbPersona.DataBind();
                }
            }
            catch (Exception ex)
            {

                
            }
        }
    }
}