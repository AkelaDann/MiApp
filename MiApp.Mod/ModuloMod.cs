using System.Collections.Generic;

namespace MiApp.Mod
{
    public class ModuloMod
    {
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Icono { get; set; }
        public string UrlPrincipal { get; set; }
        public List<FormularioMod> Formularios { get; set; }

        public ModuloMod(int mdo_codigo, string mdo_nombre, string mdo_descripcion, string mdo_icono, string mdo_url_principal)
        {
            Codigo = mdo_codigo;
            Nombre = mdo_nombre;
            Descripcion = mdo_descripcion;
            Icono = mdo_icono;
            UrlPrincipal = mdo_url_principal;
        }

        public ModuloMod(int mod_codigo, string mod_nombre, string mod_descripcion, string mod_icono, string mod_url_principal, 
            List<FormularioMod> formularios) :this(mod_codigo, mod_nombre, mod_descripcion, mod_icono, mod_url_principal)
        {
            Formularios = formularios;
        }
    }
}
