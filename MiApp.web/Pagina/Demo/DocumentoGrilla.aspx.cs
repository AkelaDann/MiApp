using DevExpress.Spreadsheet;
using DevExpress.Web;
using MiApp.Bll;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace MiApp.web.Pagina.Demo
{
    public partial class DocumentoGrilla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AcpDocumentoGrilla_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
                if (e.Parameter.Split(',')[0].Equals("InyectaItems"))
                {
                    List<ItemMod> items = new List<ItemMod>();
                    CellRange rango = AsdItem.Document.Worksheets.ActiveWorksheet.GetUsedRange();
                    if (rango != null && rango.RowCount > 1)
                    {
                        for (int i = 1; i < rango.RowCount; i++)
                        {
                            items.Add(
                                new ItemMod(
                                    Convert.ToInt32(rango[i, 0].Value.NumericValue),
                                    rango[i, 1].Value.TextValue,
                                    Convert.ToDouble(rango[i, 2].Value.NumericValue)
                                    )
                                );
                        }
                        if (items.Count > 0)
                        {
                            int documentoCodigo = (int)AgvDocumentoGrilla.GetRowValues(AgvDocumentoGrilla.FocusedRowIndex,AgvDocumentoGrilla.KeyFieldName);
                            ItemBll.Inyectar(items, documentoCodigo, out SalidaMod salida);
                            if (salida.Codigo>0)
                            {
                                AcpDocumentoGrilla.JSProperties["cpItemsInyectados"] = true;
                                AsdItem.Document.CreateNewDocument();
                            }
                            VistaFll.AgregarSalida(AcpDocumentoGrilla, salida);
                        }
                        else
                        {
                            VistaFll.AgregarSalida(AcpDocumentoGrilla,new SalidaMod (0,"El documento no tiene items."));
                        }
                    }
                    else
                    {
                        VistaFll.AgregarSalida(AcpDocumentoGrilla,new SalidaMod(0,"Cargue un documento."));
                    }

                }
            }
            catch (Exception ex)
            {
                VistaFll.AgregarSalida(AcpDocumentoGrilla, LogFll.RegistrarExcepcion(ex));
            }
        }

        protected void Agv_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["documentoCodigo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void Ods_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            SalidaMod salida;
            try
            {
                salida = e.OutputParameters["salida"] as SalidaMod;
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);                
            }
            if (salida.Codigo<=0)
            {
                VistaFll.AgregarSalida(AgvDocumentoGrilla, salida);
            }
        }

        protected void OdsDocumentosGrilla_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {            
            SalidaMod salida ;
            try
            {
                salida = e.OutputParameters["salida"] as SalidaMod;
            }
            catch (Exception ex)
            {
                salida = LogFll.RegistrarExcepcion(ex);
                VistaFll.AgregarSalida(AgvDocumentoGrilla, salida);
            }
        }

        protected void UplItem_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            string ruta = null;
            try
            {
                if (e.UploadedFile.IsValid)
                {
                    FileInfo nombreArchivo = new FileInfo(e.UploadedFile.FileName);
                    ruta = HttpContext.Current.Server.MapPath("~/App_Data/") + nombreArchivo.Name;
                    e.UploadedFile.SaveAs(ruta);
                }
                Session["ruta"] = ruta;
            }
            catch (Exception ex)
            {
                Session["ruta"] = ruta;
                LogFll.RegistrarExcepcion(ex);
            }
        }

        protected void AsdItem_Callback(object sender, CallbackEventArgsBase e)
        {
            if (Session["ruta"] != null)
            {
                string ruta = Session["ruta"].ToString();
                AsdItem.Document.History.Clear();
                AsdItem.Open(ruta);
            }
        }
    }
}