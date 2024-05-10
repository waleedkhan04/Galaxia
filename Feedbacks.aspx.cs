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
	public partial class Feedbacks : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				get_feedbacks();
			}
		}
		protected void get_feedbacks()
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			SqlCommand comm = new SqlCommand("select * from ContactUs", con);
			SqlDataAdapter add = new SqlDataAdapter(comm);
			DataTable dt = new DataTable();
			add.Fill(dt);
			allmissions.DataSource = dt;
			allmissions.DataBind();
			con.Close();
		}


	}
}