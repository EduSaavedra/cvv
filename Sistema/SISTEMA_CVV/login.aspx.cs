using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace SISTEMA_CVV
{
    public partial class login : System.Web.UI.Page
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
                txtUsuario.Focus();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid == true)
            {
                if (!oLogin.ErroConexaoBanco)
                {
                    oLogin.Coren = txtUsuario.Text;
                    oLogin.Senha = txtSenha.Text;
                    oLogin.EfetuarLogin(txtUsuario.Text, txtSenha.Text);
                    if (oLogin.Autorizacao)
                    {
                        if (oLogin.autorizaStatus)
                        {
                            FormsAuthentication.RedirectFromLoginPage
                            (txtUsuario.Text, cbPersistent.Checked);
                        }
                        else
                        {
                            lblErro.Text = "Usuário não autorizado a fazer login.";
                            txtUsuario.Focus();
                        }
                    }
                    else
                    {
                        lblErro.Text = "Erro ao tentar efetuar login. Por favor, reveja os dados e tente novamente.";
                        txtUsuario.Focus();
                    }
                }
                else
                {
                    lblErro.Text = "Problema com o banco de dados. Por favor, tente novamente mais tarde.";
                }
            }   
            else
            {
                lblErro.Text = "Some required fields are empty.";
            }
        }
    }
}