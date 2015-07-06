using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business.Video;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Threading;

public partial class _Default : System.Web.UI.Page
{
    #region Propriedades

    private dsVideo.videoDataTable dtVideos
    {
        get
        {
            return Session["dtVideos_" + Session.SessionID] as dsVideo.videoDataTable;
        }
        set
        {
            Session["dtVideos_" + Session.SessionID] = value;
        }
    }

    #endregion

    #region Métodos

    private void Pesquisar(string busca)
    {
        dtVideos = BusVideo.getVideo(ReturnQueryString(busca), Convert.ToInt32(ddlQuantia.SelectedValue));
        Bind();
    }

    private void Bind()
    {
        gvVideos.DataSource = dtVideos;
        gvVideos.DataMember = "videos";
        gvVideos.DataBind();
    }

    private string ReturnQueryString(string query)
    {
        return query.ToLower().Replace("'", "").Replace(" or ", "").Replace(" and ", "").Replace(" drop ", "").Replace(" database ", "").Replace(" select ", "").Replace(" delete ", "").Replace(" insert ", "").Replace(" update ", "").Replace("=", "").Replace(">", "").Replace("<", "").Replace(";", "").Replace("trunc", "").Replace("truncate", "");
    }

    #endregion

    #region Eventos
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (IsPostBack)
                Bind();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    protected void btnGO_Click(Object sender, EventArgs e)
    {
        try
        {
            Pesquisar(txtSearch.Value);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    protected void ddlQuantia_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Pesquisar(txtSearch.Value);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    protected void gvVideos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvVideos.PageIndex = e.NewPageIndex;
            Bind();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    #endregion
}