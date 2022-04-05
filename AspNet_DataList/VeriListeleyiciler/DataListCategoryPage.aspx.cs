using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNet_DataList
{
    using Models;
    public partial class DataListCategoryPage : System.Web.UI.Page
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
            dtlCategories.DataSource = ctx.Categories.ToList();
            dtlCategories.DataBind();
        }

        protected void dtlCategories_CancelCommand(object source, DataListCommandEventArgs e)
        {
            dtlCategories.EditItemIndex = -1;
            CategoryList();
        }

        protected void dtlCategories_EditCommand(object source, DataListCommandEventArgs e)
        {
            dtlCategories.EditItemIndex = e.Item.ItemIndex;
            CategoryList();
        }

        protected void dtlCategories_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Category c = ctx.Categories.SingleOrDefault(x => x.CategoryID == id);
            ctx.Categories.Remove(c);
            ctx.SaveChanges();
            CategoryList();
        }

        protected void dtlCategories_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Category c = ctx.Categories.SingleOrDefault(x => x.CategoryID == id);
            TextBox adi = e.Item.FindControl("adi") as TextBox;
            TextBox aciklama = e.Item.FindControl("desc") as TextBox;
            c.CategoryName = adi.Text;
            c.Description = aciklama.Text;
            ctx.SaveChanges();
            dtlCategories.EditItemIndex = -1;
            CategoryList();
        }
    }
}