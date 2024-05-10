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
	public partial class SpaceShip : System.Web.UI.Page
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
			SqlCommand comm = new SqlCommand("select * from SpaceShips", con);
			SqlDataAdapter add = new SqlDataAdapter(comm);
			DataTable dt = new DataTable();
			add.Fill(dt);
			allships.DataSource = dt;
			allships.DataBind();
			con.Close();
		}


		protected void add_ship(object sender, EventArgs e)
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			//name email password

			string name = Request.Form["aname"];
			string link = Request.Form["alink"];
			string sid = Request.Form["asid"];

			SqlCommand comm = new SqlCommand("Insert into SpaceShips(SName,SImagelink,SEmployeeID) values('"+name+"','"+link+"','"+int.Parse(sid)+"')", con);
			comm.ExecuteNonQuery();

			con.Close();
			Response.Redirect(Request.RawUrl);
		}

		protected void del_ship(object sender, EventArgs e)
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			//name email password

			string name = this.Request.Form["dname"];

			SqlCommand del = new SqlCommand("Delete from SpaceShips where SName = '"+name+"'", con);
			del.ExecuteNonQuery();

			con.Close();
			Response.Redirect(Request.RawUrl);
		}
	}
}