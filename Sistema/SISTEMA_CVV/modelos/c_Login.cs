using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV.modelos
{
    public class c_Login
    {
        public string Coren { get; set; }
        public string Senha { get; set; }
        public string NomeFuncionario { get; set; }
        public string Email { get; set; }
        public string Status { get; set; }
        public string Cpf { get; set; }
        public string UnidadeSaude { get; set; }
        public string ResultadoAlteraSenha { get; set; }
        public int codigoAlteracao { get; set; }
        public bool autorizaStatus { get; set; }
        public bool Autorizacao = false;
        public bool AtualizacaoNovaSenha = false;
        public bool ConsultaBanco = false;
        public bool ErroConexaoBanco;

        public void EfetuarLogin(string Coren, string Senha)
        {
            ServicosDB s = new ServicosDB();
            ErroConexaoBanco = s.ConexaoBanco;
            string SQL = string.Format("select coren, nome_funcionario, status_funcionario, senha, fk_id_unidadesaude from t_funcionario where coren = '{0}' and senha = '{1}'", Coren, Senha);
            SqlDataReader dr = s.Consultar(SQL);
            ConsultaBanco = (dr.HasRows);

            if ((dr.Read()) & (ConsultaBanco == true))
            {
                Senha = Convert.ToString(dr["senha"]);
                Coren = Convert.ToString(dr["coren"]);
                Status = Convert.ToString(dr["status_funcionario"]);
                UnidadeSaude = Convert.ToString(dr["fk_id_unidadesaude"]);
                NomeFuncionario = Convert.ToString(dr["nome_funcionario"]);
                Autorizacao = true;
                if (Status == "A")
                {
                    autorizaStatus = true;
                }
                else
                {
                    autorizaStatus = false;
                }
            }
            dr.Close();
        }

        public void BuscaFuncAlteraSenha()
        {
            ServicosDB s = new ServicosDB();
            ErroConexaoBanco = s.ConexaoBanco;
            string SQL = string.Format("select nome_funcionario, status_funcionario " +
                "from t_funcionario where coren = '{0}' and cpf = '{1}' and email_funcionario = '{2}'", Coren, Cpf, Email);
            SqlDataReader dr = s.Consultar(SQL);
            ConsultaBanco = (dr.HasRows);
            
            if (dr.Read())
            {
                Status = Convert.ToString(dr["status_funcionario"]);
                NomeFuncionario = Convert.ToString(dr["nome_funcionario"]);
                
                if (Status == "A")
                {
                    codigoAlteracao = 0;
                    RedefinirSenha(Coren);
                }
                else
                {
                    codigoAlteracao = 1;
                }
            }
            else
            {
                codigoAlteracao = 2;
            }
            dr.Close();
        }

        public void ConsultarNovaSenha(String Coren)
        {
            ServicosDB s = new ServicosDB();
            string SQL = string.Format("select senha from t_funcionario where coren = '{0}'", Coren);
            SqlDataReader dr = s.Consultar(SQL);
            ConsultaBanco = (dr.HasRows);
            
            if ((dr.Read()) & (ConsultaBanco))
            {
                Senha = Convert.ToString(dr["senha"]);
            }
        }

        public void RedefinirSenha(string Coren)
        {
            try
            {
                ServicosDB s = new ServicosDB();
                string SQL = string.Format(
                    "update t_funcionario set senha = left(NEWID(),8) where coren = '{0}'", Coren);
                AtualizacaoNovaSenha = true;
                s.Atualizar(SQL);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void EnviarNovaSenha()
        {
            if (AtualizacaoNovaSenha)
            {
                ConsultarNovaSenha(Coren);
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("vacinacaovirtual@gmail.com");
                msg.To.Add(Email);
                msg.Subject = "[CONFIDENCIAL] E-mail de recuperação";
                msg.Body = (" <html><body><br/> " +
                        "Olá, <b>" + NomeFuncionario + "</b>. Recebemos uma solcitaçao em seu nome para alterar sua senha." +
                        " Informamos que a alteração já foi realizada e estamos lhe enviando a senha no corpo deste e-mail. <br/><br/>" +
                    "   Seu login é: " + Coren + "<br/><br/>" +
                    "   Sua nova senha é: " + Senha + "<br/><br/>" +
                    "   Por motivos de segurança, lembre-se de, após efeituar o login, alterar sua senha." +
                    "   Para alterar a senha, passe o mouse sobre seu nome e clique em 'Alterar Senha'." + "<br/><br/><br/>" +
                    "<b>Equipe CVV | Carteira de Vacinação Virtual</b>" +
                    "<br/><br/>" +
                    "<img style='width: 100px;' src='http://imageshack.com/a/img924/5391/Jtq15O.gif'/>" +
                    "<hr/>" +
                    "<b>ATENÇÃO:</b> Este email é confidencial e destina-se a pessoa nele citada." +
                    "Caso desconheça este email, favor nos responder neste email solicitando a" +
                    "exclusão deste e-mail do nosso banco dados." +
                    "</body></html>"
                );
                msg.IsBodyHtml = true;
                SmtpClient smt = new SmtpClient();
                smt.Host = "smtp.gmail.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = "vacinacaovirtual@gmail.com"; //Your Email ID  
                ntwd.Password = "@Unik.2016**"; // Your Password  
                smt.UseDefaultCredentials = true;
                smt.Credentials = ntwd;
                smt.Port = 587;
                smt.EnableSsl = true;
                smt.Send(msg);
            }
        }
    }
}