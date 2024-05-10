using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project
{
	public partial class HomePage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			gallery.Visible = true;
			about.Visible = true;
			contact.Visible = true;
			if (Session["UserID"] == null)
			{
				//not logged in
				//dont show career
				//dont show main
				main.Visible = false;
				login.Visible = true;
				signup.Visible = true;
				career.Visible = false;
				logout.Visible = false;
			}
			else
			{
				//string rid = Session["UserID"].ToString();
				//SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
				//con.Open();
				//SqlCommand comm1 = new SqlCommand("Select * from Employees where EID = '" + rid + "'", con);
				//object result = comm1.ExecuteScalar();
				//con.Close();
				login.Visible = false;
				signup.Visible = false;
				logout.Visible = true;
				career.Visible = true;
				if (Session["User"].ToString() == "reg")//not an employee just a registered user
				{
					main.Visible = false;
				}
				else
				{
					main.Visible = true;
				}
				//if foumd show main else dont
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