using Antlr.Runtime;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project
{
	public partial class About : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			gallery.Visible = true;
			about.Visible = false;
			contact.Visible = true;
			if (Session["UserID"] == null)
			{
				career.Visible = false;
				login.Visible = true;
				signup.Visible = true;
				main.Visible = false;
				logout.Visible = false;
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