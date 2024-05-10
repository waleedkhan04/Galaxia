using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Web.Optimization;
using System.Web.UI.HtmlControls;

namespace Database_Project
{
	public partial class LeaveRequest : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				get_leaves();


				if (Request.QueryString["refresh"] == "true")
				{
					// Refresh logic here
					// ...

					// Register the startup script to call the JavaScript function
					ScriptManager.RegisterStartupScript(this, GetType(), "YourScript", "showdetails();", true);
				}

			}
		}


		protected void get_leaves()
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			SqlCommand comm1 = new SqlCommand("select * from leave join registered on leaver = RID where LStatus = 'Pending'", con);
			SqlDataAdapter add = new SqlDataAdapter(comm1);
			DataTable dt = new DataTable();
			add.Fill(dt);
			leaves.DataSource = dt;
			leaves.DataBind();
			con.Close();
		}


		protected void thisleave(object source, RepeaterCommandEventArgs e)
		{
			string fun = e.CommandName;

			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();

			if (fun == "accept")
			{
				//queries to add
				string lid = e.CommandArgument.ToString();
				SqlCommand comm1 = new SqlCommand("update leave set LStatus = 'Approved' where LID = '" + int.Parse(lid) + "' ", con);
				comm1.ExecuteNonQuery();
				con.Close();
				Response.Redirect(Request.RawUrl);
			}
			if (fun == "decline")
			{
				string lid = e.CommandArgument.ToString();
				SqlCommand comm1 = new SqlCommand("update leave set LStatus = 'Declined' where LID = '" + int.Parse(lid) + "' ", con);
				comm1.ExecuteNonQuery();
				//quries to delete
				con.Close();
				Response.Redirect(Request.RawUrl);
			}
		}
	}
}