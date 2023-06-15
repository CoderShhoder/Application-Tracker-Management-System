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
                ApplicationOutcome();
                ApplicationStatus();
                Time();
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
                cmd.Parameters.AddWithValue("@applicationoutcome", "");
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
                cmd.Parameters.AddWithValue("@companyname", txtcompanyName.Value.ToString());
                cmd.Parameters.AddWithValue("@jobrole", txtJobRole.Value.ToString());
                cmd.Parameters.AddWithValue("@applicationstatus", ddlApplicationStatus.SelectedItem.Text.ToString());
                cmd.Parameters.AddWithValue("@contactdetails", txtContactDetails.Value.ToString());
                cmd.Parameters.AddWithValue("@interviewdate", DateTime.ParseExact(txtInterviewDate.Value.ToString(),"dd/MM/yyyy",null));
                cmd.Parameters.AddWithValue("@interviewtime", ddlInterviewTime.SelectedItem.Text.ToString());
                cmd.Parameters.AddWithValue("@applicationoutcome", ddlApplicationOutcome.SelectedItem.Text.ToString());
                cmd.Connection = conn;
                cmd.ExecuteNonQuery();
                cmd.CommandTimeout = 0;
                lblError.Text = "Data Inserted Succesfully";
            }
            gridviewPopulation();
        }

        protected void ApplicationStatus()
        {
            String cs = ConfigurationManager.ConnectionStrings["JATMDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_JATMDropdownPopulation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TType", "STATUS");
                cmd.Connection = conn;
                cmd.CommandTimeout = 0;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    ddlApplicationStatus.DataSource = dt;
                    ddlApplicationStatus.DataTextField = "ApplicationStatus";
                    ddlApplicationStatus.DataValueField = "ApplicationStatusID";
                    ddlApplicationStatus.DataBind();
                    ddlApplicationStatus.Items.Insert(-0, new ListItem("-- Select Application Status --", "-1"));
                }

            }
        }

        protected void ApplicationOutcome()
        {
            String cs = ConfigurationManager.ConnectionStrings["JATMDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_JATMDropdownPopulation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TType", "OUTCOME");
                cmd.Connection = conn;
                cmd.CommandTimeout = 0;
                SqlDataReader reader = cmd.ExecuteReader();

                ddlApplicationOutcome.DataSource = reader;
                ddlApplicationOutcome.DataTextField = "ApplicationOutcome";
                ddlApplicationOutcome.DataValueField = "ApplicationOutcomeID";
                ddlApplicationOutcome.DataBind();
                ddlApplicationOutcome.Items.Insert(-0, new ListItem("-- Select Application Outcome --","-1"));
            }
        }

        protected void Time()
        {
            String cs = ConfigurationManager.ConnectionStrings["JATMDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_JATMDropdownPopulation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TType", "TIME");
                cmd.Connection = conn;
                cmd.CommandTimeout = 0;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    ddlInterviewTime.DataSource = dt;
                    ddlInterviewTime.DataTextField = "Time";
                    ddlInterviewTime.DataValueField = "ID";
                    ddlInterviewTime.DataBind();
                    ddlInterviewTime.Items.Insert(-0, new ListItem("-- Select Interview Time --", "-1"));
                }

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                InsertData();
                
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}