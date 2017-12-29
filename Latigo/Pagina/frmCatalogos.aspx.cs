using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Latigo.Pagina
{
    public partial class frmCatalogos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void indexChanged(object sender, EventArgs e) {
        }
        public void method(object sender, EventArgs e) {
        }
        public void btnClick(object sender, EventArgs e)
        {
            try
            {
                string s = ((Button)sender).Text;

                if (s == "Lugar")
                {
                    mvPrincipal.ActiveViewIndex = mvPrincipal.Views.IndexOf(vLugares);
                }
                else if (s == "Servicios")
                {
                    mvPrincipal.ActiveViewIndex = mvPrincipal.Views.IndexOf(vServicios);
                }
                else if (s == "Tipos de Servicios")
                {
                    mvPrincipal.ActiveViewIndex = mvPrincipal.Views.IndexOf(vTiposServicio);
                }
                else if (s == "Proveedores")
                {
                    mvPrincipal.ActiveViewIndex = mvPrincipal.Views.IndexOf(vProveedor);
                }
                else if (s == "Solicitantes")
                {
                    //mvPrincipal.ActiveViewIndex = //mvPrincipal.Views.IndexOf();
                }
            }
            catch (Exception ex) {

            }
        }

        /*<LUGAR*/
        public void modificarLugar(object sender, EventArgs e)
        {
            btnAgregarLugar.Text = "Guardar";

            LinkButton boton = (LinkButton)sender;
            Int32 idLugar = Convert.ToInt32(boton.CommandArgument);

            DataClasses1DataContext db = new DataClasses1DataContext();
            Lugar l = (from ren in db.Lugar
                       where ren.Id == idLugar
                       select ren).First();
            tbLugarNombre.Text = l.Nombre;
            tbLugarDireccion.Text = l.Direccion;

            hfIDLugar.Value = idLugar.ToString();
        }
        protected void btnAgregarLugar_Click(object sender, EventArgs e)
        {
            lblLugaresMsg.Text = "";

            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();
                if (btnAgregarLugar.Text == "Agregar")
                {
                    Lugar l = new Lugar();

                    l.Nombre = tbLugarNombre.Text;
                    l.Direccion = tbLugarDireccion.Text;

                    db.Lugar.InsertOnSubmit(l);
                    db.SubmitChanges();
                    gvLugares.DataBind();
                }
                else {
                    long idLugar = Convert.ToInt64(hfIDLugar.Value);
                    Lugar registro = (from ren in db.Lugar
                                        where ren.Id == idLugar
                                        select ren).First();
                    if (registro != null)
                    {
                        if(tbLugarNombre.Text != "" && tbLugarNombre.Text != tbLugarDireccion.Text)
                        {
                            registro.Nombre = tbLugarNombre.Text;
                            registro.Direccion = tbLugarDireccion.Text;

                            db.SubmitChanges();
                            gvLugares.DataBind();
                        }
                        else
                        {
                            lblLugaresMsg.Text = "Los campos de nombre y direccion no pueden ir vacios!";
                        }
                    }
                    btnAgregarLugar.Text = "Agregar";
                }
            }
            catch (Exception ex)
            {
                lblLugaresMsg.Text = ex.Message;
            }

        }
        /*LUGAR>*/

        /*<TIPO_SERVICIO*/
        public void modificarTipoServicio(object sender, EventArgs e)
        {
            btnTipoServicioAgregar.Text = "Guardar";

            LinkButton boton = (LinkButton)sender;
            Int32 idTipoServicio = Convert.ToInt32(boton.CommandArgument);

            DataClasses1DataContext db = new DataClasses1DataContext();
            TipoServicio l = (from ren in db.TipoServicio
                       where ren.Id == idTipoServicio
                       select ren).First();
            tbLugarNombre.Text = l.Nombre;

            hfIDTipoServicio.Value = idTipoServicio.ToString();
        }
        protected void btnTipoServicioAgregar_Click(object sender, EventArgs e)
        {
            lblTipoServicioMsg.Text = "";

            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();
                if (btnTipoServicioAgregar.Text == "Agregar")
                {
                    TipoServicio t = new TipoServicio();

                    t.Nombre = tbTipoNombre.Text;

                    db.TipoServicio.InsertOnSubmit(t);
                    db.SubmitChanges();
                    gvTiposServicio.DataBind();
                }
                else
                {
                    long idTipoServ = Convert.ToInt64(hfIDTipoServicio.Value);
                    TipoServicio registro = (from ren in db.TipoServicio
                                      where ren.Id == idTipoServ
                                      select ren).First();
                    if (registro != null)
                    {
                        if (tbTipoNombre.Text != "")
                        {
                            registro.Nombre = tbLugarNombre.Text;

                            db.SubmitChanges();
                            gvTiposServicio.DataBind();
                        }
                        else
                        {
                            lblTipoServicioMsg.Text = "El campo de nombre no puede ir vacio!";
                        }
                    }
                    btnAgregarLugar.Text = "Agregar";
                }
            }
            catch (Exception ex)
            {
                lblTipoServicioMsg.Text = ex.Message;
            }
        }
        protected void agregarServicio(object sender, EventArgs e)
        {
            LinkButton boton = (LinkButton)sender;
            Int32 idServicio = Convert.ToInt32(boton.CommandArgument);

            hfIDTipoServicio.Value = idServicio.ToString();
            mvPrincipal.ActiveViewIndex = mvPrincipal.Controls.IndexOf(vServicios);

            SDSServicio.SelectCommand = "SELECT S.ID, S.Nombre, S.Descripcion, P.Nombre As Proveedor, TS.Nombre FROM Servicio S LEFT JOIN ServicioProveedor SP ON SP.IDServicio = S.ID LEFT JOIN Proveedor P ON P.Id = SP.IDProveedor LEFT JOIN TipoServicio TS ON TS.Id = S.IdTipo WHERE (SP.Principal = 1 OR SP.Principal IS NULL) AND TS.ID = " + idServicio  + " ORDER BY S.Nombre DESC";

            gvServicios.DataBind();

            ddlTipoServicio.SelectedIndex = ddlTipoServicio.Items.IndexOf(ddlTipoServicio.Items.FindByValue(hfIDTipoServicio.Value));
        }
        /*TIPO_SERVICIO>*/

        /*<SERVICIO*/
        public void modificarServicio(object sender, EventArgs e)
        {
            btnServiciosAgregar.Text = "Guardar";

            LinkButton boton = (LinkButton)sender;
            Int32 idServicio = Convert.ToInt32(boton.CommandArgument);

            DataClasses1DataContext db = new DataClasses1DataContext();
            Servicio l = (from ren in db.Servicio
                              where ren.Id == idServicio
                              select ren).First();
            tbServicioNombre.Text = l.Nombre;
            tbServicioDescripcion.Text = l.Descripcion;

            hfIdServicio.Value = idServicio.ToString();
        }
        protected void btnServiciosAgregar_Click(object sender, EventArgs e)
        {
            lblServiciosMsg.Text = "";

            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();
                if (btnServiciosAgregar.Text == "Agregar")
                {
                    Servicio s = new Servicio();

                    s.Nombre = tbServicioNombre.Text;
                    s.Descripcion = tbServicioDescripcion.Text;
                    s.IdTipo = Int32.Parse( hfIDTipoServicio.Value);

                    db.Servicio.InsertOnSubmit(s);
                    db.SubmitChanges();

                    SDSServicio.SelectCommand = "SELECT S.ID, S.Nombre, S.Descripcion, P.Nombre As Proveedor, TS.Nombre FROM Servicio S LEFT JOIN ServicioProveedor SP ON SP.IDServicio = S.ID LEFT JOIN Proveedor P ON P.Id = SP.IDProveedor LEFT JOIN TipoServicio TS ON TS.Id = S.IdTipo WHERE (SP.Principal = 1 OR SP.Principal IS NULL) AND TS.ID = " + s.IdTipo + " ORDER BY S.Nombre DESC";

                    gvServicios.DataBind();
                }
                else {
                    long idServ = Convert.ToInt64(hfIdServicio.Value);
                    Servicio registro = (from ren in db.Servicio
                                             where ren.Id == idServ
                                             select ren).First();
                    if (registro != null)
                    {
                        if (tbServicioNombre.Text != "" && tbServicioDescripcion.Text != tbServicioNombre.Text)
                        {
                            registro.Nombre = tbServicioNombre.Text;
                            registro.Descripcion = tbServicioDescripcion.Text;

                            db.SubmitChanges();
                            gvServicios.DataBind();
                        }
                        else
                        {
                            lblTipoServicioMsg.Text = "Los campos de nombre y descripcion no pueden ir vacios!";
                        }
                    }
                    btnAgregarLugar.Text = "Agregar";
                }
            }
            catch (Exception ex)
            {
                lblServiciosMsg.Text = ex.Message;
            }
        }
        /*SERVICIO>*/

        /*<PROVEEDORES*/
        protected void modificarProveedores(object sender, EventArgs e) {
            LinkButton boton = (LinkButton)sender;
            Int32 idServicio = Convert.ToInt32(boton.CommandArgument);

            hfIdServicio.Value = idServicio.ToString();
            mvPrincipal.ActiveViewIndex = mvPrincipal.Controls.IndexOf(vProveedor);

            SDSProveedor.SelectCommand = "SELECT ID, Nombre, Email, Whatsapp, SMS, Slack FROM Latigo.dbo.Proveedor P LEFT JOIN ServicioProveedor SP ON SP.IDProveedor = P.Id WHERE SP.IDServicio = "+ idServicio.ToString() +" ORDER BY P.Nombre DESC";

            gvProveedores.DataBind();
        }
        protected void btnProveedorAgregar_Click(object sender, EventArgs e)
        {
            lblProveedorMsg.Text = "";
            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();

                if (btnProveedorAgregar.Text == "Agregar")
                {
                    Proveedor p = new Proveedor();

                    p.Nombre = tbProveedorNombre.Text;
                    p.Email = tbProveedorEmail.Text;
                    p.Whatsapp = tbProveedorWhatsapp.Text;
                    p.SMS = tbProveedorSMS.Text;
                    p.Slack = tbProveedorSlack.Text;

                    db.Proveedor.InsertOnSubmit(p);
                    db.SubmitChanges();

                    ServicioProveedor sp = new ServicioProveedor();
                    sp.IDProveedor = p.Id;
                    sp.IDServicio = Int32.Parse(hfIdServicio.Value);
                    sp.Principal = chbProveedorPrincipal.Checked;

                    db.ServicioProveedor.InsertOnSubmit(sp);
                    db.SubmitChanges();

                    gvProveedores.DataBind();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                lblProveedorMsg.Text = ex.Message;
            }
            finally
            {

            }
        }

        protected void modificarProveedor(object sender, EventArgs e) {

        }
        /*PROVEEDORES>*/
    }
}