using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Xml.Linq;
using System.Configuration;
using Antlr.Runtime;
using Microsoft.Ajax.Utilities;

namespace Database_Project
{
	public partial class Signup : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			signup.Visible = false;
			main.Visible = false;
			career.Visible = false;
		}
		protected void reguser(object sender, EventArgs e)
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			//name email password

			string name = this.Request.Form["signupname"];
			string mail = this.Request.Form["signupemail"];
			string pass = this.Request.Form["signuppassword"];
			string num = this.Request.Form["signupnumber"];
			string link = this.Request.Form["signuplink"];
			SqlCommand comm1 = new SqlCommand("Select RID from Registered where REmail = '"+mail+"'", con);
			object result = comm1.ExecuteScalar();
			if(result != null)
			{
				con.Close();
				return;
			}
			SqlCommand comm = new SqlCommand("Insert into Registered(RName,REmail,RPassword,RNumber,RLink) values('" + name + "','" + mail + "','" + pass + "','"+num+"', '"+link+"')", con);
			comm.ExecuteNonQuery();
			con.Close();
			Response.Redirect("Login.aspx");
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