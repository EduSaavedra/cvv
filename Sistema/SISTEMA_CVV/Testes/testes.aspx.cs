using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV
{
    public partial class testes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Customer oC = new Customer();
                //BindGrid(oC.PopulateData());
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            
        }

        /*
        private void BindGrid(List<Customer> customers)
        {
            gvCustomers.DataSource = customers;
            gvCustomers.DataBind();
        }
        */
        protected void txtCEP_TextChanged(object sender, EventArgs e)
        {
            var valor = txtCEP.Text;
            try
            {
                var ws = new WSCorreios.AtendeClienteClient();
                var resposta = ws.consultaCEP(valor);
                txtEstado.Text = resposta.uf;
                txtCidade.Text = resposta.cidade;
                txtEndereco.Text = resposta.end;
                txtBairro.Text = resposta.bairro;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Erro ao efetuar busca do CEP: ');</script" + ex.Message);
            }
        }
    }
}