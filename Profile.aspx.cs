using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Database_Project
{
	public partial class Profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				GetMissions();
			}

			string rid = Session["UserID"].ToString();
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			SqlCommand comm = new SqlCommand("select JName from employees join Jobs on EJobID = JID where eid ='" + rid + "'", con);
			object result = comm.ExecuteScalar();
			con.Close();
			HtmlGenericControl allmissions = (HtmlGenericControl)FindControl("allmissions");
			if ( result.ToString() == "Manager" )
			{
				allmissions.Visible = false;
			}
			else
			{
				allmissions.Visible = true;
			}

		}
		protected void GetMissions()
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			
			if (Session["UserID"] != null)
			{
				//get missions
				String user = Session["UserID"].ToString();
				SqlCommand comm = new SqlCommand("select Missions.MLocation from Missions Join MissionEmployees on Missions.MID =  MissionEmployees.MEMissionID where MissionEmployees.MEEmployeeID ='" + user + "'", con);
				SqlDataAdapter add = new SqlDataAdapter(comm);
				DataTable dt = new DataTable();
				add.Fill(dt);
				missiondata.DataSource = dt;
				missiondata.DataBind();

				//get username
				SqlCommand comm2 = new SqlCommand("select * from Employees join Jobs on Employees.EJobID = Jobs.JID join Registered on RID = EID where Employees.EID = '" + user+"' ", con);
				SqlDataAdapter add2 = new SqlDataAdapter(comm2);
				DataTable dt2 = new DataTable();
				add2.Fill(dt2);
				userdata.DataSource = dt2;
				userdata.DataBind();
				useremail.DataSource = dt2;
				useremail.DataBind();

			}

			con.Close();
		}

		protected void sumbit_Click(object sender, EventArgs e)
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			if (Session["UserID"] != null)
			{
				string user = Session["UserID"].ToString();

				string newname = this.Request.Form["newname"];
				string newmail = this.Request.Form["newemail"];
				string newnum = this.Request.Form["newnumber"];
				string newpass = this.Request.Form["newpass"];
				

				if(newname != "")
				{
					SqlCommand comm1 = new SqlCommand("update registered set RName = '" + newname + "' where RID = '" + user + "'", con);
					comm1.ExecuteNonQuery();
				}
				if(newmail != "")
				{
					SqlCommand comm1 = new SqlCommand("update registered set REmail = '" + newmail + "' where RID = '" + user + "'", con);
					comm1.ExecuteNonQuery();
				}
				if (newnum != "")
				{
					SqlCommand comm1 = new SqlCommand("update registered set RNumber = '" + newnum + "' where RID = '" + user + "'", con);
					comm1.ExecuteNonQuery();
				}
				if (newpass != "")
				{
					SqlCommand comm1 = new SqlCommand("update registered set RPassword = '" + newpass + "' where RID = '" + user + "'", con);
					comm1.ExecuteNonQuery();
				}


			}
			con.Close();
			Response.Redirect(Request.RawUrl);
		}
	}
}