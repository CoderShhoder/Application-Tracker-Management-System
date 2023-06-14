using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace JobApplicationTracker
{
    public partial class ApplicationTracker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //gvApplicationGrid.HeaderRow.Visible = true;
                gridviewPopulation();
            }
        }

        protected void gridviewPopulation()
        {
            String cs = ConfigurationManager.ConnectionStrings["JATMDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_JATMGridViewPopulation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TType", "SELECT");
                cmd.Parameters.AddWithValue("@companyname", "");
                cmd.Parameters.AddWithValue("@jobrole", "");
                cmd.Parameters.AddWithValue("@applicationstatus", "");
                cmd.Parameters.AddWithValue("@contactdetails", "");
                cmd.Parameters.AddWithValue("@interviewdate", "");
                cmd.Parameters.AddWithValue("@interviewtime", "");
                cmd.Parameters.AddWithValue("@appliucationoutcome", "");
                cmd.Connection = conn;
                cmd.CommandTimeout = 0;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    gvApplicationGrid.DataSource = dt;
                    gvApplicationGrid.DataBind();
                }
            }

        }

        protected void InsertData()
        {
            String cs = ConfigurationManager.ConnectionStrings["JATMDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_JATMGridViewPopulation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TType", "INSERT");
                cmd.Parameters.AddWithValue("@companyname", "");
                cmd.Parameters.AddWithValue("@jobrole", "");
                cmd.Parameters.AddWithValue("@applicationstatus", "");
                cmd.Parameters.AddWithValue("@contactdetails", "");
                cmd.Parameters.AddWithValue("@interviewdate", "");
                cmd.Parameters.AddWithValue("@interviewtime", "");
                cmd.Parameters.AddWithValue("@appliucationoutcome", "");

            }
        }
    }
}