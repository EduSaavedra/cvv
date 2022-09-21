using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV.funcionario
{
    public partial class muda_senha : System.Web.UI.Page
    {
        public c_Funcionario oFuncionario
        {
            get
            {
                return Session["func"] as c_Funcionario;
            }
            set
            {
                Session["func"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                oFuncionario = new c_Funcionario();
            }
        }

        protected void btnSalvarSenha_Click(object sender, EventArgs e)
        {
            oFuncionario.Coren = ((c_Login)Session["login"]).Coren;
            oFuncionario.SenhaAntiga = txtSenhaAnterior.Text;
            oFuncionario.BuscaAlteraSenha();

            if (oFuncionario.retorno)
            {
                oFuncionario.Senha = txtNovaSenha.Text;
                oFuncionario.AlterarSenha();
                Response.Write("<script>alert('Senha alterada com sucesso!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Favor verificar se a senha antiga informada está correta.');</script>");
            }
        }
    }
}