using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Latigo.Pagina
{
    public partial class frmUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            msg.Text = "";
            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();

                if (tbPass.Text == tbPassConfirm.Text)
                {
                    Usuario s = new Usuario();

                    s.Nombre = tbNombre.Text;
                    s.UserName = tbUsuario.Text;
                    s.Password = tbPassConfirm.Text;
                    s.Tipo = Int32.Parse(ddlTipos.SelectedValue.ToString());
                    db.Usuario.InsertOnSubmit(s);
                    db.SubmitChanges();
                    gvUsuarios.DataBind();
                }
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("UNIQUE"))
                    msg.Text = "Ese usuario ya no está disponible... ";
                else
                    msg.Text = ex.Message;
            }
            catch (Exception ex) {
                msg.Text = ex.Message;
            }
            finally
            {
                tbNombre.Text = tbPass.Text = tbPassConfirm.Text = tbUsuario.Text = "";
            }
        }
        protected void lbIdUsuario_Click(object sender, EventArgs e) {
            try
            {
                btnAgregar.Visible = false;
                btnModificar.Visible = true;
                LinkButton boton = (LinkButton)sender;
                Int32 idUsuario = Convert.ToInt32(boton.CommandArgument);

                DataClasses1DataContext db = new DataClasses1DataContext();
                Usuario sol = (from ren in db.Usuario
                                        where ren.Id == idUsuario
                                   select ren).First();
                tbNombre.Text = sol.Nombre;
                tbUsuario.Text = sol.UserName;
                ddlTipos.SelectedValue = sol.Tipo.ToString();

                hfIdUsuario.Value = idUsuario.ToString();

            }
            catch (Exception ex) { string r = ex.Message; }
            
        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e) {
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            btnAgregar.Visible = true;
            btnModificar.Visible = false;
            try
            {
                long idSol = Convert.ToInt64(hfIdUsuario.Value);
                DataClasses1DataContext db = new DataClasses1DataContext();
                Usuario registro = (from ren in db.Usuario
                                        where ren.Id == idSol
                                        select ren).First();
                if (registro != null)
                {

                    if (tbPass.Text == tbPassConfirm.Text)
                    {
                        registro.Nombre = tbNombre.Text;
                        registro.UserName = tbUsuario.Text;
                        registro.Password = tbPassConfirm.Text;
                        registro.Tipo = Int32.Parse( ddlTipos.SelectedValue);
                        db.SubmitChanges();
                        gvUsuarios.DataBind();
                    }
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
            }
            finally {
                tbNombre.Text = tbPass.Text = tbPassConfirm.Text = tbUsuario.Text = "";
                ddlTipos.SelectedIndex = 0;
            }
        }
    }
}