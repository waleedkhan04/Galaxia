using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Database_Project
{
	public partial class Samples : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				get_samples();
			}
		}

		protected void get_samples()
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			SqlCommand comm1 = new SqlCommand("Select * from Samples join Missions on SmMissionID = MID", con);
			SqlDataAdapter add = new SqlDataAdapter(comm1);
			DataTable dt = new DataTable();
			add.Fill(dt);
			samples.DataSource = dt;
			samples.DataBind();
			con.Close();
		}

		protected void samples_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			string fun = e.CommandName;
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();

			if (fun == "descard")
			{
				string args = e.CommandArgument.ToString();
				SqlCommand remsample = new SqlCommand("delete from samples where SmID = '"+ int.Parse(args)+ "'", con);
				remsample.ExecuteNonQuery();
			}
			con.Close();
			Response.Redirect(Request.RawUrl);
		}


		protected void add_sample(object sender, EventArgs e)
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();

			string smname = this.Request.Form["smname"];
			string smsize = this.Request.Form["smsize"];
			string smmid = this.Request.Form["smmid"];
			if (smname != "" && smmid != "" && smsize != "")
			{
				SqlCommand comm1 = new SqlCommand("INSERT INTO Samples (SmName, SmSize, SmMissionID) VALUES ('" + smname + "','" + smsize + "','" + smmid + "')", con);
				object result = comm1.ExecuteScalar();
			}

			con.Close();
			Response.Redirect(Request.RawUrl);
		}
	}
}