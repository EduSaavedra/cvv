using System;
using System.Data.SqlClient;

namespace SISTEMA_CVV.modelos
{
    public class c_Funcionario
    {
        public string Coren { get; set;  }
        public string Matricula { get; set; }
        public string NomeFuncionario { get; set; }
        public string Cpf { get; set; }
        public string DataNascimento { get; set; }
        public string Pais { get; set; }
        public string Cep { get; set; }
        public string Endereco { get; set; }
        public string Numero { get; set; }
        public string Complemento { get; set; }
        public string CategoriaFuncionario { get; set; }
        public string TipoAcesso { get; set; }
        public string EmailFuncionario { get; set; }
        public string StatusFuncionario { get; set; }
        public string EstadoAtuacao { get; set; }
        public string Municipio { get; set; }
        public string UnidadeAtuacao { get; set; }
        public string Senha { get; set; }
        public string SenhaAntiga { get; set; }
        public string NomeUnidadeSaude { get; set; }
        public bool gravacao = false;
        public bool retorno = false;



        public void ConsultarFuncionario(string Coren)
        {
            ServicosDB s = new ServicosDB();
            string SQL = string.Format("select *, u.nome_unidadesaude from t_funcionario as f, t_unidadesaude as u where f.coren = '{0}' and u.id_unidadesaude = f.fk_id_unidadesaude;", Coren);

            SqlDataReader dr = s.Consultar(SQL);
            if (dr.Read())
            {
                retorno = true;
                Matricula = Convert.ToString(dr["matricula"]);
                NomeFuncionario = Convert.ToString(dr["nome_funcionario"]);
                Cpf = Convert.ToString(dr["cpf"]);
                DataNascimento = Convert.ToString(dr["data_nascimento"]);
                Pais = Convert.ToString(dr["pais"]);
                Cep = Convert.ToString(dr["cep"]);
                Endereco = Convert.ToString(dr["endereco"]);
                Numero =  Convert.ToString(dr["numero"]);
                Complemento = Convert.ToString(dr["complemento"]);
                CategoriaFuncionario = Convert.ToString(dr["categoria_funcionario"]);
                TipoAcesso = Convert.ToString(dr["tipo_acesso"]);
                EmailFuncionario = Convert.ToString(dr["email_funcionario"]);
                StatusFuncionario = Convert.ToString(dr["status_funcionario"]);
                EstadoAtuacao = Convert.ToString(dr["estado_atuacao"]);
                NomeUnidadeSaude = Convert.ToString(dr["nome_unidadesaude"]);
            }
            else
            {
                retorno = false;
            }
            dr.Close();
        }
        //string Coren, string SenhaAntiga, string Senha

        public void BuscaAlteraSenha()
        {
            string SQLC = string.Format("select cpf from t_funcionario where coren = {0} " +
                "and senha = '{1}'",
                Coren, SenhaAntiga);//query ok!
                ServicosDB s = new ServicosDB();
                SqlDataReader dr = s.Consultar(SQLC);
                if (dr.HasRows)
                {
                    retorno = true;
                }
                else
                {
                    retorno = false;
                }
        }

        public void AlterarSenha()
        {
            ServicosDB s = new ServicosDB();
            string SQL = string.Format("update t_funcionario set senha = '{0}' where coren = {1}",
                    Senha,
                    Coren
                );
            s.Atualizar(SQL);
        }
    }
}