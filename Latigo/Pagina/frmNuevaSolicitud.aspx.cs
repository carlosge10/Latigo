using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Latigo.Pagina
{
    public partial class frmServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            SDSServicios.SelectCommand = "SELECT [Nombre], [Id] FROM [Servicio] WHERE NOMBRE LIKE %" + tbServiceFilter.Text + "%";
            ddlServicio.DataBind();


        }

        protected void btnAgregarServicio_Click(object sender, EventArgs e)
        {
            lblElementos.Text = lblElementos.Text + ddlServicio.SelectedItem.Text + " <br/>\n";
            hfIdsElementos.Value = hfIdsElementos.Value + ddlServicio.SelectedValue + ",";
        }
    }
}