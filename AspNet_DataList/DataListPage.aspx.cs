using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNet_DataList
{
    using Models;
    public partial class DataListPage : System.Web.UI.Page
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
            dtlProducts.DataSource = ctx.Products.ToList();
            dtlProducts.DataBind();
        }

        protected void dtlProducts_EditCommand(object source, DataListCommandEventArgs e)
        {
            dtlProducts.EditItemIndex = e.Item.ItemIndex;
            ProductList();
        }

        protected void dtlProducts_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Product p = ctx.Products.FirstOrDefault(x => x.ProductID == id);
            ctx.Products.Remove(p);
            ctx.SaveChanges();
            ProductList();
        }

        protected void dtlProducts_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Product p = ctx.Products.FirstOrDefault(x => x.ProductID == id);
            TextBox adi = e.Item.FindControl("txtProductName") as TextBox;
            TextBox fiyat = e.Item.FindControl("txtFiyat") as TextBox;
            TextBox stok = e.Item.FindControl("txtStok") as TextBox;
            p.ProductName = adi.Text;
            p.UnitPrice = Convert.ToDecimal(fiyat.Text);
            p.UnitsInStock = Convert.ToInt16(stok.Text);
            ctx.SaveChanges();
            dtlProducts.EditItemIndex = -1;
            ProductList();
        }

        protected void dtlProducts_CancelCommand(object source, DataListCommandEventArgs e)
        {
            dtlProducts.EditItemIndex = -1;
            ProductList();
        }
    }
}