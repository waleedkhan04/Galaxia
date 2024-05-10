using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Net;

namespace Database_Project
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			login.Visible = false;
			main.Visible = false;
			career.Visible = false;
		}

		protected void logincheck(object sender, EventArgs e)
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();

			string mail = this.Request.Form["loginemail"];
			string pass = this.Request.Form["loginpassword"];
			if (mail == "" || pass == "")
			{
				con.Close();
				Response.Redirect("Login.aspx");
			}
			else
			{
				SqlCommand comm = new SqlCommand("Select RID from Registered where REmail = '" + mail + "' AND RPassword = '" + pass + "'", con);
				object result = comm.ExecuteScalar();
				if (result != null)
				{
					Session["UserID"] = (int)result;
					SqlCommand comm2 = new SqlCommand("select EID from Employees join Registered on EID = RID where RID = '" + (int)result + "'", con);
					result = comm2.ExecuteScalar();
					if (result == null)
					{
						Session["User"] = "reg";
					}
					else
					{
						Session["User"] = "emp";
					}
				}
				else
				{
					Session["User"] = null;
					Session["UserID"] = null;
					Response.Redirect("Login.aspx");
				}
				con.Close();
				Response.Redirect("HomePage.aspx");
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

		
	}
}