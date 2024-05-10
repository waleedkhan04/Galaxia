using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project
{
	public partial class Home : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["UserID"] == null)
			{
				Response.Redirect("HomePage.aspx");
			}
			else
			{
				SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
				con.Open();

				string rid = Session["UserID"].ToString();
				SqlCommand comm = new SqlCommand("Select JName from Employees join Jobs on EJobID = JID where EID = '"+ int.Parse(rid) +"' ", con);
				string result = comm.ExecuteScalar().ToString();
				con.Close();

				profile.Visible = true;
				logout.Visible = true;
				reqleave.Visible = true;
				home.Visible = true;
				if (result == "Astronaut")
				{
					missions.Visible = true;
					spaceships.Visible = false;
					samples.Visible = false;
					jobapply.Visible = false;
					leavereq.Visible = false;
					viewship.Visible = false;
					feedbacks.Visible = false;
				}
				else if(result == "Scientist")
				{
					missions.Visible = false;
					spaceships.Visible = false;
					samples.Visible = true;
					jobapply.Visible = false;
					leavereq.Visible = false;
					viewship.Visible = true;
					feedbacks.Visible = false;
				}
				else if(result == "Manager")
				{
					missions.Visible = true;
					spaceships.Visible = true;
					samples.Visible = true;
					jobapply.Visible = true;
					leavereq.Visible = true;
					viewship.Visible = false;
					feedbacks.Visible = true;
				}
			}
		}


		protected void gotoprofile(object sender, EventArgs e)
		{
			Response.Redirect("Profile.aspx");
		}

		protected void gotosamples(object sender, EventArgs e)
		{
			Response.Redirect("Samples.aspx");
		}

		protected void gotoships(object sender, EventArgs e)
		{
			Response.Redirect("SpaceShip.aspx");
		}

		protected void gotomissions(object sender, EventArgs e)
		{
			Response.Redirect("Missions.aspx");
		}

		protected void gotorequest(object sender, EventArgs e)
		{
			Response.Redirect("Request.aspx");
		}

		protected void gotomyships(object sender, EventArgs e)
		{
			Response.Redirect("MyShips.aspx");
		}

		protected void gotoleaves(object sender, EventArgs e)
		{
			Response.Redirect("LeaveRequest.aspx");
		}

		protected void gotojobapply(object sender, EventArgs e)
		{
			Response.Redirect("JobApply.aspx");
		}
		protected void log_out(object sender, EventArgs e)
		{
			Session["UserID"] = null;
			Response.Redirect("HomePage.aspx");
		}

		protected void gotohome(object sender, EventArgs e)
		{
			Response.Redirect("HomePage.aspx");
		}

		protected void gotofeedbacks(object sender, EventArgs e)
		{
			Response.Redirect("Feedbacks.aspx");
		}

	}
}