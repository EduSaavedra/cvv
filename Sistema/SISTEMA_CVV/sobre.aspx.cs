using SISTEMA_CVV;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV
{
    public partial class sobre1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AtualizarGrid();
            }
        }

        public void AtualizarGrid()
        {
            ServicosDB s = new ServicosDB();
            string SQL = "select * from t_modificacoes";

            SqlDataReader dr = s.Consultar(SQL, Cone);
            gvModificacoes.DataSource = dr;
            gvModificacoes.DataBind();
        }
    }
}