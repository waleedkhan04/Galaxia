using Antlr.Runtime;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project
{
	public partial class ContactUs : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			gallery.Visible = true;
			about.Visible = true;
			contact.Visible = false;
			if (Session["UserID"] == null)
			{
				career.Visible = false;
				login.Visible = true;
				signup.Visible = true;
				main.Visible = false;
				logout.Visible= false;
			}
			else
			{
				career.Visible = true;
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
			}
		}

		protected void sendfeedback(object sender, EventArgs e)
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			string name = this.Request.Form["name"];
			string mail = this.Request.Form["mail"];
			string data = this.Request.Form["data"];
			if( name=="" || mail=="" || data == "")
			{
				con.Close();
				Response.Redirect("ContactUs.aspx");
			}
			SqlCommand comm1 = new SqlCommand("insert into contactus values('"+name+ "','"+mail+ "','"+data+"')", con);
			comm1.ExecuteNonQuery();
			con.Close();
			Response.Redirect("HomePage.aspx");
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