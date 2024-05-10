using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Security;

namespace Database_Project
{
	public partial class Career : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			gallery.Visible = true;
			about.Visible = true;
			contact.Visible = true;
			career.Visible = false;
			login.Visible = false;
			signup.Visible = false;
			logout.Visible = true;
			if (Session["User"].ToString() == "emp")
			{
				main.Visible = true;
			}
			else
			{
				main.Visible = false;
			}
			


			if (!IsPostBack)
			{
				get_jobs();
			}
		}


		protected void get_jobs()
		{

			if (Session["UserID"] != null)
			{

				SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
				con.Open();

				SqlCommand comm = new SqlCommand("select * from Jobs where JStatus = 'Open'", con);
				SqlDataAdapter add = new SqlDataAdapter(comm);
				DataTable dt = new DataTable();
				add.Fill(dt);
				jobs.DataSource = dt;
				jobs.DataBind();

				con.Close();
			}
		}



		protected void jobs_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			if (Session["UserID"] != null)
			{
				if (e.CommandName == "Apply")
				{
					string jid = e.CommandArgument.ToString();
					string rid = Session["UserID"].ToString();

					//add to jobapplicants as pending
					SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
					con.Open();

					SqlCommand comm1 = new SqlCommand("Select * from JobApplicants where JAJobID = '" + jid + "' AND JAID = '" + rid + "'",con);
					object result = comm1.ExecuteScalar();
					if (result == null)
					{
						SqlCommand comm2 = new SqlCommand("Insert into JobApplicants(JAID, JAJobID, JAStatus) values ('" + rid + "','" + jid + "', 'Pending')", con);
						comm2.ExecuteNonQuery();
					}
				}
			}
		}





		protected void gomain(object sender, EventArgs e)
		{
			Response.Redirect("Home.aspx");
		}
		protected void gologin(object sender, EventArgs e)
		{
			Response.Redirect("Login.aspx");
		}
		protected void gosignup(object sender, EventArgs e)
		{
			Response.Redirect("Signup.aspx");
		}

		protected void gocareer(object sender, EventArgs e)
		{
			Response.Redirect("Career.aspx");
		}

		protected void gogallery(object sender, EventArgs e)
		{
			Response.Redirect("Gallery.aspx");
		}

		protected void goabout(object sender, EventArgs e)
		{
			Response.Redirect("About.aspx");
		}

		protected void gocontact(object sender, EventArgs e)
		{
			Response.Redirect("ContactUs.aspx");
		}

		protected void gologout(object sender, EventArgs e)
		{
			Session["UserID"] = null;
			Session["User"] = null;
			Response.Redirect("HomePage.aspx");
		}

	}
}