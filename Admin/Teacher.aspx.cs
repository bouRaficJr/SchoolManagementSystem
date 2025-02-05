using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;

namespace SchoolManagementSystem.Admin
{
    public partial class Teacher : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTeachers();
            }
        }

        private void GetTeachers()
        {
            DataTable dt = fn.Fetch(@"select ROw_NUMBER() OVER(ORDER By (SELECT 1)) as SR.No, TeacherId , [Name] ,BOB , Gender , Moblie ,
                                                Email , [Address] , [Password] from Teacher ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue != "0")
                {
                    string email = txtEmail.Text.Trim();
                    DataTable dt = fn.Fetch("Select * from Teacher Where Email = '" + email + "'");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "Insert into Teacher  values ('" + txtName.Text.Trim() + "', '" + txtDoB.Text.Trim() + "', " + "'" +
                                        ddlGender.SelectedValue + "', '" + txtMobile.Text.Trim() + "','" + txtEmail.Text.Trim() + "', '" +
                                        txtAddress.Text.Trim() + "','" + txtPasword.Text.Trim() + "' ";
                        fn.Query(query);
                        lblMsg.Text = "Inserted Succesfuly!";
                        lblMsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        txtName.Text = string.Empty;
                        txtDoB.Text = string.Empty;
                        txtMobile.Text = string.Empty;
                        txtEmail.Text = string.Empty;
                        txtAddress.Text = string.Empty;
                        txtPasword.Text = string.Empty;
                        GetTeachers();

                    }
                    else
                    {

                        lblMsg.Text = "Entered  <b> '" + email + "'</b> already exists";
                        lblMsg.CssClass = "alert alert-DANGER";
                    }
                }
                else
                {
                    lblMsg.Text = "Gender is required!";
                    lblMsg.CssClass = "alert alert-DANGER";
                }
            }
            
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Gridview1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetTeachers();
        }
        protected void Gridview1_RowCancelingEdit(object sender, GridViewPageEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeachers();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Teacher where TeacherId='" + teacherId + "' ");
                lblMsg.Text = "Teacher Deleted Successfully!";
                lblMsg.CssClass = "alert alert-success";
                GetTeachers();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void Gridview1_RowEditing(object sender, GridViewUpdateEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;
            GetTeachers();
        }
        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("txtName") as TextBox).Text;
                string mobile = (row.FindControl("txtMobile") as TextBox).Text;
                string password = (row.FindControl("txtPassword") as TextBox).Text;
                string address = (row.FindControl("txtAddress") as TextBox).Text;

                fn.Query("Update Teacher set Name = '" + name + "',Mobile='" + mobile.Trim() + "',Address='" + 
                      address.Trim() + "' ,Password='" + password.Trim() + "' where TeacherId='" + teacherId + "' ");
                lblMsg.Text = " Teacher Updated  Succesfuly!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetTeachers();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
       

    }

}