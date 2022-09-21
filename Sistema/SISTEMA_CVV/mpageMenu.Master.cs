using SISTEMA_CVV.modelos;
using System;
using System.Web.Security;

namespace SISTEMA_CVV
{
    public partial class mpageMenu : System.Web.UI.MasterPage
    {
        private bool acesso = false;
        public string numVersao;

        public string MenuAdm
        {
            get
            {
                if ((Session["login"] != null) && (Session["login"] is c_Login) && ((Session["login"] as c_Login).Autorizacao))
                {
                    return "Olá, " + ((c_Login)Session["login"]).NomeFuncionario;
                }
                else
                {
                    return "Administração";
                }
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                acesso = ((Session["login"] != null) && (Session["login"] is c_Login) && ((Session["login"] as c_Login).Autorizacao));
                if (acesso)
                {
                    lblAdministracao.Text = "  Olá, " + ((c_Login)Session["login"]).NomeFuncionario;
                    MostraMenu();
                    hplAdministracao.Enabled = false;
                }
                else
                {
                    FormsAuthentication.SignOut();
                    EscondeMenu();
                }
                
            }
        }

        public void EfetuarLogout()
        {
            hplAdministracao.Enabled = true;
            hplAdministracao.NavigateUrl = "~/login.aspx";
            Session.Abandon();
            Session.RemoveAll();
            Session.Clear();
            EscondeMenu();
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
            Response.Redirect("http://vacinacaovirtual.ddns.net:46801/Default.aspx");
        }

        protected void lbtnSair_Click(object sender, EventArgs e)
        {
            EfetuarLogout();
        }

        protected void EscondeMenu()
        {
            btnAlterarSenha.Visible = false;
            lbtnSair.Visible = false;
        }

        protected void MostraMenu()
        {
            btnAlterarSenha.Visible = true;
            lbtnSair.Visible = true;
        }
    }

}