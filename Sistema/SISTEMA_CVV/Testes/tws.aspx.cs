using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV
{
    public partial class tws : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPesquisar_Click(object sender, EventArgs e)
        {
            var webService = new localhost.ServiceCS();
            var resposta = webService.ConsultarUnidade();
            gvwFuncionarios.DataSource = resposta.DefaultView;
            gvwFuncionarios.DataBind();
        }
    }
}