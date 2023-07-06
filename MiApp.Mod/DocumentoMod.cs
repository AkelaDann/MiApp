using System;
using System.Collections.Generic;

namespace MiApp.Mod
{
    public class DocumentoMod
    {
        public int Codigo { get; set; }
        public string Glosa { get; set; }
        public DateTime Fecha { get; set; }
        public DateTime FechaMinima { get; set; }
        public DateTime FechaMaxima { get; set; }
        public int Referencia { get; set; }
        public int Descuento { get; set; }
        public string Clasificacion { get; set; }
        public bool Marcado { get; set; }
        public double Total { get; set; }

        public PersonaMod Persona { get; set; }
        public TipoDocumentoMod TipoDocumento { get; set; }
        public List<EtapaMod> Etapas { get; set; }
        public List<ItemMod> Items { get; set; }

        public DocumentoMod( int codigo,string glosa, DateTime fecha,DateTime fechaMinima,DateTime fechaMaxima, 
            int referencia,int descuento,string clasificacion,bool marcado,double total)
        {
            Codigo = codigo;
            Glosa = glosa;
            Fecha = fecha;
            FechaMaxima = fechaMaxima;
            FechaMinima = fechaMinima;
            Referencia = referencia;
            Descuento = descuento;
            Clasificacion = clasificacion;
            Marcado = marcado;
            Total = total;
        }
        public DocumentoMod(int codigo, string glosa, DateTime fecha, DateTime fechaMinima, DateTime fechaMaxima,
            int referencia, int descuento, string clasificacion, bool marcado, double total,
            PersonaMod persona,TipoDocumentoMod tipoDocumento,List<EtapaMod> etapas,List<ItemMod> items):
            this(codigo,glosa,fecha,fechaMinima,fechaMaxima,referencia,descuento,clasificacion,marcado,total)
        {
            Persona = persona;
            TipoDocumento = tipoDocumento;
            Etapas = etapas;
            Items = items;
        }
    }
}
