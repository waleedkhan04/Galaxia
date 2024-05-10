using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project
{
	public partial class Request : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void request(object sender, EventArgs e)
		{
			if (Session["UserID"] != null)
			{
				SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
				con.Open();
				string type = this.Request.Form["type"];
				string reason = this.Request.Form["reason"];
				string days = this.Request.Form["days"];
				string rid = Session["UserID"].ToString();

				if (days != null && rid != null)
				{
					SqlCommand comm = new SqlCommand("Insert into Leave(Leaver,Reason,LeaveType,LStatus,LDays) values('" + int.Parse(rid) + "','" + reason + "','" + type + "','Pending','" + days + "')", con);
					comm.ExecuteNonQuery();
				}
				con.Close();
				Response.Redirect("Home.aspx");
			}
		}
		
	}


	
}