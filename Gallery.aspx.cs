using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project
{
	public partial class Gallery : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			gallery.Visible = false;
			about.Visible = true;
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
					main.Visible=true;
				}
				else
				{
					main.Visible = false;
				}
			}
			if (!IsPostBack)
			{
				get_images();
			}
		}



		protected void get_images()
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			SqlCommand comm = new SqlCommand("select * from Images", con);
			SqlDataAdapter add = new SqlDataAdapter(comm);
			DataTable dt = new DataTable();
			add.Fill(dt);
			images.DataSource = dt;
			images.DataBind();
			con.Close();
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