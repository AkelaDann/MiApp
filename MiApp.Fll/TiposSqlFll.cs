using MiApp.Mod;
using System;
using System.Data;

namespace MiApp.Fll
{
    public class TiposSqlFll
    {
        public static DataTable ObtenerItems(DocumentoMod documento)
        {
            DataTable tablaItem = new DataTable();
            tablaItem.Columns.Add("itm_correlativo");
            tablaItem.Columns.Add("itm_glosa");
            tablaItem.Columns.Add("itm_valor");
            tablaItem.Columns.Add("doc_codigo");

            foreach (ItemMod item in documento.Items)
            {
                tablaItem.Rows.Add(item.Correlativo, item.Glosa, item.Valor,documento.Codigo);
            }

            return tablaItem;
        }

        public static DataTable Obteneretapas(DocumentoMod documento)
        {
            DataTable tablaEtapa = new DataTable();
            tablaEtapa.Columns.Add("eta_codigo");
            tablaEtapa.Columns.Add("eta_glosa");

            foreach (EtapaMod etapa in documento.Etapas)
            {
                tablaEtapa.Rows.Add(etapa.Codigo,documento.Codigo);
            }

            return tablaEtapa;
        }
    }

}
