using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace Business.Video
{
    public static class BusVideo
    {
        public static dsVideo.videoDataTable getVideo(string busca, int topQt)
        {
            string query = "SELECT TOP " + topQt + @" v.titulo, v.url, v.descricao FROM video v inner join classificacao c on c.id = v.classificacao where (lower(v.titulo+c.descricao) like @busca) order by v.titulo";

            using (SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                cmd.Parameters.Add("@busca", System.Data.SqlDbType.VarChar, 100);
                cmd.Parameters["@busca"].Value = "%" + busca.ToLower() + "%";
                sqlConn.Open();
                dsVideo.videoDataTable dt = new dsVideo.videoDataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }
    }
}
