using AspNet_DataList.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNet_DataList.VeriListeleyiciler
{
    public partial class GridViewPage : System.Web.UI.Page
    {
        NORTHWNDContext ctx = new NORTHWNDContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            ProductList();
        }

        private void ProductList()
        {
            GridView1.DataSource = ctx.Products.ToList();
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ProductList();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ProductList();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["ProductID"].ToString());
            Product p = ctx.Products.SingleOrDefault(x => x.ProductID == id);
            ctx.Products.Remove(p);
            ctx.SaveChanges();
            ProductList();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["ProductID"].ToString());
            Product p = ctx.Products.SingleOrDefault(x => x.ProductID == id);
            p.ProductName = e.NewValues["ProductName"].ToString();
            p.UnitPrice = Convert.ToDecimal(e.NewValues["UnitPrice"]);
            p.UnitsInStock = Convert.ToInt16(e.NewValues["UnitsInStock"]);
            p.Discontinued = Convert.ToBoolean(e.NewValues["Discontinued"]);
            ctx.SaveChanges();
            GridView1.EditIndex = -1;
            ProductList();
        }
    }
}