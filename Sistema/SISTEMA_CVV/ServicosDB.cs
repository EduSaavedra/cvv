
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SISTEMA_CVV
{
    public class ServicosDB
    {
        public bool ConexaoBanco = false;
        public string ErroConexao;
        private SqlConnection Conexao;

        public string StringConexao
        {
            get
            {
                return new SqlConnectionStringBuilder()
                {
                    MultipleActiveResultSets = true,
                    DataSource = "DESKTOP001\\SQLEXPRESS",
                    InitialCatalog = "db_cvv",
                    IntegratedSecurity = false,
                    UserID = "sa",
                    Password = "123456"
                }.ToString();
            }
        }
        
        public ServicosDB()
        {
            try
            {
                Conexao = new SqlConnection(StringConexao);
                Conexao.Open();
                ConexaoBanco = true;
            }
            catch (SqlException)
            {
                ConexaoBanco = false;
            }
            finally
            {
                ConexaoBanco = false;
            }
        }

        private SqlCommand CriarCommand(string SQL)
        {
            string tmp = StringConexao;
            return new SqlCommand(SQL, Conexao);
        }

        public SqlDataReader Consultar(string SQL)
        {
            return CriarCommand(SQL).ExecuteReader();
        }

        public int Atualizar(string SQL)
        {
            return CriarCommand(SQL).ExecuteNonQuery();
        }
    }
}