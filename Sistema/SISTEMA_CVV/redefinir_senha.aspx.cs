using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV
{
    public partial class redefinir_senha : System.Web.UI.Page
    {
        public c_Login oLogin
        {
            get
            {
                return Session["login"] as c_Login;
            }
            set
            {
                Session["login"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                oLogin = new c_Login();
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            oLogin.Coren = txtCoren.Text;
            oLogin.Email = txtEmail.Text;
            oLogin.Cpf = txtCPF.Text;
            oLogin.BuscaFuncAlteraSenha();

            if (oLogin.ConsultaBanco)
            {
                if (oLogin.codigoAlteracao == 0) //sucesso
                {
                    oLogin.EnviarNovaSenha();
                    Response.Write("<script>alert('Senha alterada com sucesso. Por favor, verifique se recebeu a nova senha no e-mail informado.')</script>");
                    Response.Write("<script>window.location.assign('http://vacinacaovirtual.ddns.net:46801')</script>");
                    LimapCampos();  
                }
                else if (oLogin.codigoAlteracao == 1) //nao autorizado
                {
                    Response.Write("<script>alert('Funcionário não autorizado a alterar a senha.')</script>");
                }
            }
            else //nao localizado
            {
                Response.Write("<script>alert('Funcionário não localizado. Por favor, revise os dados.')</script>");
            }
        }

        public void LimapCampos()
        {
            txtCoren.Text = "";
            txtCPF.Text = "";
            txtEmail.Text = "";
            txtEmail.Focus();
        }
    }
}