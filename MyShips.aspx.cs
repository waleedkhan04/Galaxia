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
	public partial class MyShips : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				get_ships();
			}
		}

		protected void get_ships()
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			SqlCommand comm = new SqlCommand("select * from SpaceShips where SEmployeeID = '" + int.Parse(Session["UserID"].ToString()) + "'", con);
			SqlDataAdapter add = new SqlDataAdapter(comm);
			DataTable dt = new DataTable();
			add.Fill(dt);
			allships.DataSource = dt;
			allships.DataBind();
			con.Close();
		}



	}
}