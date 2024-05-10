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
	public partial class Missions : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				get_missions();
			}
		}


		protected void get_missions()
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			SqlCommand comm = new SqlCommand("select * from Missions", con);
			SqlDataAdapter add = new SqlDataAdapter(comm);
			DataTable dt = new DataTable();
			add.Fill(dt);
			allmissions.DataSource = dt;
			allmissions.DataBind();
			con.Close();
		}



		protected void add_mission(object sender, EventArgs e)
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();

			string name = Request.Form["aname"];
			string start = Request.Form["astart"];
			string end = Request.Form["aend"];
			string cost = Request.Form["acost"];

			SqlCommand comm = new SqlCommand("Insert into Missions(MLocation,MLaunchDate,MEndDate,MExpense) values('" + name + "','" + start + "','"+end+"','" + cost + "')", con);
			comm.ExecuteNonQuery();

			con.Close();
			Response.Redirect(Request.RawUrl);
		}

		protected void del_mission(object sender, EventArgs e)
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			//name email password

			string mid = this.Request.Form["dmid"];

			SqlCommand del = new SqlCommand("Delete from Missions where MID = '" + int.Parse(mid) + "'", con);
			del.ExecuteNonQuery();

			con.Close();
			Response.Redirect(Request.RawUrl);
		}
	}
}