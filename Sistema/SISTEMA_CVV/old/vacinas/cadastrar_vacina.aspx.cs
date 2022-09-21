using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV.vacinas
{
    public partial class cadastrar_vacina : System.Web.UI.Page
    {
        public c_Vacina oVacina
        {
            get
            {
                return Session["vacina"] as c_Vacina;
            }
            set
            {
                Session["vacina"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                oVacina = new c_Vacina();
            }
        }

        public void limpaCampos()
        {
            //ddLoteVacina.SelectedValue = "0";
            //txtFabricacao.Text = "";
            //txtFabricante.Text = "";
            //txtNomeVacina.Text = "";
            //txtTetano.Text = "";
            //txtValidade.Text = "";
        }

        protected void btnIncluirVacina_Click(object sender, EventArgs e)
        {
            try
            {
                //oVacina.
            }
            catch
            {

            }
        }

        protected void lbIncluirDoenca_Click(object sender, EventArgs e)
        {
            if (lbDoencas.Items.Count > 0)
            {
                lbDoencasAplicaveis.Items.Add(lbDoencas.SelectedItem);
                lbDoencas.Items.Remove(lbDoencas.SelectedItem);
                lbDoencas.ClearSelection();
                lbDoencasAplicaveis.ClearSelection();
            }
            else
            {
                Response.Write("<script>alert('Selecione um item do painel 1.')</script>");
            }
        }

        protected void lbRemoverDoenca_Click(object sender, EventArgs e)
        {
            if (lbDoencasAplicaveis.Items.Count > 0)
            {
                lbDoencas.Items.Add(lbDoencasAplicaveis.SelectedItem);
                lbDoencasAplicaveis.Items.Remove(lbDoencasAplicaveis.SelectedItem);
                lbDoencas.ClearSelection();
                lbDoencasAplicaveis.ClearSelection();
            }
            else
            {
                Response.Write("<script>alert('Selecione item do painel 2.')</script>");
            }            
        }

        protected void lbDoencas_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbDoencasAplicaveis.ClearSelection();
        }

        protected void lbDoencasAplicaveis_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbDoencas.ClearSelection();
        }
    }
}