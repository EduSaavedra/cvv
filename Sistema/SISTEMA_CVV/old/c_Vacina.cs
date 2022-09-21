using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SISTEMA_CVV.modelos
{
    public class c_Vacina
    {
        public string Lote { get; set; }
        public string NomeVacina { get; set; }
        public string Dose { get; set; }
        public string Aplicavel { get; set; }
        public string msgRetorno = "";
        public bool gravacao = false;

        public void incluirVacina (string Lote)
        {
            try
            {
                // aqui devera ter 2 inserts... um para cadastrar na t_vacina e outro para cadastrar na t_aplicavel
                ServicosDB s = new ServicosDB();
                string SQL = string.Format("insert into t_vacina values ('{0}', '{1}', '{2}', '{3}')",
                    Lote, NomeVacina, Dose, Aplicavel
                );
                s.Atualizar(SQL);
                gravacao = true;
            }
            catch (SystemException er)
            {
                msgRetorno = ("Erro: " + er);
                gravacao = false;
            }
        }

    }
}