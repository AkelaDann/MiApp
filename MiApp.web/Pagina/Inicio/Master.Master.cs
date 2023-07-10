using MiApp.Bll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace MiApp.web.Pagina.Inicio
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.AppRelativeVirtualPath.Contains("Tarjeta.aspx"))
            {
                AplSuperior.Visible = false;
                AplIzquierdo.Visible = false;
            }
        }

    

        protected void menu_Init(object sender, EventArgs e)
        {
            List<ModuloMod> modulos = ModuloBll.Listar(out SalidaMod salida);
            menu.Items.Clear();
            foreach (ModuloMod modulo in modulos)
            {
                menu.Items.Add(modulo.Nombre, modulo.Nombre , modulo.Icono, modulo.UrlPrincipal).Image.Width = 16;
            }

        }

        protected void AnrMenuIzq_Init(object sender, EventArgs e)
        {
            string url = Page.AppRelativeVirtualPath;

            List<FormularioMod> formularios = FormularioBll.Listar(url, out SalidaMod salida);
            AnrMenuIzq.Groups.Clear();
            AnrMenuIzq.Groups.Add("Formularios", "Formularios");
            foreach (FormularioMod formulario in formularios)
            {
                AnrMenuIzq.Groups[0].Items.Add(formulario.Nombre, formulario.Nombre, null, formulario.Url);
            }
        }
    }
}