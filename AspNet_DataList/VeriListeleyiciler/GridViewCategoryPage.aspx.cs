using AspNet_DataList.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNet_DataList.VeriListeleyiciler
{
    public partial class GridViewCategoryPage : System.Web.UI.Page
    {
        NORTHWNDContext ctx = new NORTHWNDContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            CategoryList();
        }

        private void CategoryList()
        {
            GridView1.DataSource = ctx.Categories.ToList();
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            CategoryList();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            CategoryList();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["CategoryID"].ToString());
            Category c = ctx.Categories.SingleOrDefault(x => x.CategoryID == id);
            ctx.Categories.Remove(c);
            ctx.SaveChanges();
            CategoryList();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["CategoryID"].ToString());
            Category c = ctx.Categories.SingleOrDefault(x => x.CategoryID == id);
            c.CategoryName = e.NewValues["CategoryName"].ToString();
            c.Description = e.NewValues["Description"].ToString();
            ctx.SaveChanges();
            GridView1.EditIndex = -1;
            CategoryList();
        }
    }
}