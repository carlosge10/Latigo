using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Latigo
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblAviso.Text = "";
            if (!IsPostBack)
            {
                try
                {
                    if (Request.Cookies["Latigo"] != null)
                    {
                        string idlugar = Request.Cookies["Latigo"]["Lugar"];
                        if (Request.Cookies["Latigo"]["Lugar"] != null)
                        {
                            ddlSucursales.DataBind();
                            ddlSucursales.SelectedIndex = ddlSucursales.Items.IndexOf(ddlSucursales.Items.FindByValue(idlugar));
                        }
                        if (Request.Cookies["Latigo"]["User"] != null)
                            UserName.Text = Request.Cookies["Latigo"]["User"];
                        Password.Focus();
                    }
                }
                catch (Exception ex) { }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();

            int resp = (int) db.validateUser(UserName.Text, Password.Text);

            switch (resp) {
                case 1:
                    Response.Cookies["Latigo"]["User"] = UserName.Text;
                    Response.Cookies["Latigo"]["Password"] = Password.Text;
                    Response.Cookies["Latigo"]["Lugar"] = ddlSucursales.Text;
                    Response.Cookies["Latigo"].Expires = System.Convert.ToDateTime("01/01/2100");
                    Response.Redirect("~/About.aspx");
                    break;
                case 0:
                    Response.Redirect("~/Contact.aspx");
                    break;
                case -1:
                    Response.Redirect("~/Contact.aspx");
                    break;
                default:
                    Response.Redirect("~/Contact.aspx");
                    break;
            }

        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            Usuario u = (from ren in db.Usuario
                           where ren.UserName == UserName.Text
                           select ren).First();

            panelSucursal.Visible = u.Tipo == 2;

        }
    }
}