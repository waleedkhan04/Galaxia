using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project
{
	public partial class JobApply : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				get_applies();
			}
		}

		protected void get_applies()
		{
			SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
			con.Open();
			SqlCommand comm1 = new SqlCommand("Select * from Registered Join JobApplicants on RID = JAID join Jobs on JAJobID = JID Where JAStatus = 'Pending'", con);
			SqlDataAdapter add = new SqlDataAdapter(comm1);
			DataTable dt = new DataTable();
			add.Fill(dt);
			jobs.DataSource = dt;
			jobs.DataBind();
			con.Close();
		}

		protected void apply_ItemCommand(object source, RepeaterCommandEventArgs e)
		{

			string fun = e.CommandName;
			
			if(fun == "openlink")
			{
				string arg = e.CommandArgument.ToString();
				Response.Redirect(arg);
			}
			else
			{
				//reject accept
				SqlConnection con = new SqlConnection("Data Source=DESKTOP-RLIP9MV\\SQLSERVER2014;Initial Catalog=tempproj;Integrated Security=True");
				con.Open();

				string[] args = e.CommandArgument.ToString().Split(',');
				string jaid = args[0];
				string jobid = args[1];
				if (fun == "accept")
				{
					//check if its an employee
					SqlCommand comm = new SqlCommand("Select * from employees where EID = '"+jaid+"'",con);
					object result = comm.ExecuteScalar();
					if(result != null)
					{
						//if its an employee update the status
						SqlCommand addemployee = new SqlCommand("update employees set EJobID = '"+jobid+"' where EID = '"+jaid+"'", con);
						addemployee.ExecuteNonQuery();
					}
					else
					{
						//if its not an employee add it to employee from reg
						SqlCommand addemployee = new SqlCommand("insert into employees(EID,EJobID) values('"+jaid+"','"+jobid+"')", con);
						addemployee.ExecuteNonQuery();
					}
					//update the job
					SqlCommand ujob = new SqlCommand("update Jobs set JStatus = 'Closed' where JID = '"+jobid+"'", con);
					ujob.ExecuteNonQuery();
					//remove the application
					SqlCommand uapp = new SqlCommand("update JobApplicants set JAStatus = 'Accepted' where JAJobID = '" + jobid + "' AND JAID = '"+jaid+"' ", con);
					uapp.ExecuteNonQuery();
					//delete all other applications for this job
					SqlCommand del = new SqlCommand("Delete from JobApplicants where JAJobID = '" + jobid + "' and JAStatus = 'Pending'", con);
					del.ExecuteNonQuery();
				}
				else if(fun == "decline")
				{
					SqlCommand dec = new SqlCommand("delete from JobApplicants where JAID = '" + jaid + "' and JAJobID = '" + jobid + "' ", con);
					dec.ExecuteNonQuery();
				}
				Response.Redirect(Request.RawUrl);
				con.Close();
			}
			

		}
	}
}