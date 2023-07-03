using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiApp.Fll
{
    public class ConexionFll
    {
        public static SqlConnection ConectarPrueba()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["ConnDb1"].ConnectionString);
        }
    }
}
