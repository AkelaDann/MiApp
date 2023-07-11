using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiApp.web.Pagina.Varios
{
    public partial class Reporte : System.Web.UI.Page
    {
        protected void  Page_Load(object sender, EventArgs e)
        {
            if (Session["reporte"]!=null)
            {
                CargarReporte();
            }        
        }

        private void CargarReporte()
        {
            var cachedReportSource = new CachedReportSourceWeb((XtraReport)Session["reporte"]);
            AwdReporte.OpenReport(cachedReportSource);
        }
    }
}