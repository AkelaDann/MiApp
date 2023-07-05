﻿using Dapper;
using MiApp.Mod;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MiApp.Fll
{
    public class ConexionFll
    {
        public static SqlConnection ConectarPrueba()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["ConnDb1"].ConnectionString);
        }

        public static DynamicParameters ObtenerParametros(object parametrosEntrada = null)
        {
            DynamicParameters parametros = new DynamicParameters(parametrosEntrada);
            parametros.Add("@Codigo_Salida", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parametros.Add("@Mensaje_Salida", dbType: DbType.String, direction: ParameterDirection.Output, size: 800);
            return parametros;
        }

        public static SalidaMod ObtenerSalida(DynamicParameters parametros)
        {
            SalidaMod salida = new SalidaMod(parametros.Get<int>("Codigo_Salida"), parametros.Get<string>("Mensaje_Salida"));
            if (salida.Codigo <= -1)
            {
                return LogFll.RegistroExcepcionBaseDatos(salida);
            }
            else
            {
                return salida;
            }
        }
    }

}
