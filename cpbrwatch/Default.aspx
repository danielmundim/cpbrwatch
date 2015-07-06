<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="upConteudo" runat="server">
        <ContentTemplate>
        <script type="text/javascript" language="javascript">
            function pageLoad() {
                $('a').click(function (event) {
                    $("#<%=txtSearch.ClientID%>").val(event.target.id);
                    $("#<%=btnGO.ClientID %>").click();
                });

                jQuery('body').fitVids();
                $("#pitagoras").tooltip();
                $("#socrates").tooltip();
                $("#gutenberg").tooltip();
                $("#michelangelo").tooltip();
                $("#arquimedes").tooltip();
                $("#stadium").tooltip();
                $("#hypatia").tooltip();
                $("#galileu").tooltip();
                $(".contato").tooltip();
            }
        </script>
        <style type="text/css">
            @media(max-width:560px) 
            {
                #divFrame { width:300px; }
                .divDescricao { height:196px; }
                .divDescricao h4 { font-size:10pt; font-weight:bold; }
            }

        </style>
            <br /><br />
            <div style="text-align:center;">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                      <div class="container-fluid">
                        <div class="navbar-header">
                          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                          </button>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                          <ul class="nav navbar-nav" id="ulMenu">
                            <li><a id="arquimedes" href="#" data-toggle="tooltip" data-placement="bottom" title="Segurança e Redes">Arquimedes</a></li>
                            <li><a id="galileu" href="#" data-toggle="tooltip" data-placement="bottom" title="Robótica, Astronomia, Modding e Hardware SciTech">Galileu</a></li>
                            <li><a id="gutenberg" href="#" data-toggle="tooltip" data-placement="bottom" title="Mídias Sociais">Gutenberg</a></li>
                            <li><a id="hypatia" href="#" data-toggle="tooltip" data-placement="bottom" title="Empreendedorismo">Hypatia</a></li>
                            <li><a id="michelangelo" href="#" data-toggle="tooltip" data-placement="bottom" title="Design, Multimídia">Michelangelo</a></li>
                            <li><a id="pitagoras" href="#" data-toggle="tooltip" data-placement="bottom" title="Desenvolvimento">Pitágoras</a></li>
                            <li><a id="principal" href="#">Principal</a></li>
                            <li><a id="socrates" href="#" data-toggle="tooltip" data-placement="bottom" title="Software Livre">Sócrates</a></li>
                            <li><a id="stadium" href="#" data-toggle="tooltip" data-placement="bottom" title="Games e Simulação">Stadium</a></li>
                          </ul>
                          <ul class="nav navbar-nav navbar-right">
                            <li><a class="contato" href="mailto:dmundim.cr@gmail.com" data-toggle="tooltip" data-placement="left" title="dmundim.cr@gmail.com">Contato</a></li>
                          </ul>
                        </div><!-- /.navbar-collapse -->
                      </div><!-- /.container-fluid -->
                    </nav>
                </div>
                <div class="col-lg-1"></div>
            </div>
            <br />
            <div style="text-align:center;">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <br />
                    <div class="input-group">
                      <input type="text" class="form-control" id="txtSearch" runat="server" placeholder="Digite aqui o termo de busca ou selecione uma das categorias acima" />
                      <span class="input-group-btn">
                        <asp:Button ID="btnGO" runat="server" CssClass="btn btn-default" Text="Go!" OnClick="btnGO_Click" />
                      </span>
                    </div>
                </div>
                <div class="col-lg-1">
                    <br />
                    <span>Mostrar</span>
                    <asp:DropDownList ID="ddlQuantia" runat="server" Width="55px" Height="22px" OnSelectedIndexChanged="ddlQuantia_SelectedIndexChanged">
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="25" Value="25"></asp:ListItem>
                        <asp:ListItem Text="50" Value="50"></asp:ListItem>
                        <asp:ListItem Text="100" Value="100"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-1"></div>
            </div>
            <br />
            <div id="grd">
                <asp:GridView ID="gvVideos" runat="server" CssClass="gridview" Width="96%" AutoGenerateColumns="false" GridLines="None" OnPageIndexChanging="gvVideos_PageIndexChanging"
                    AllowPaging="true" PageSize="100" EmptyDataText="Utilize a busca acima para navegar pelo conteúdo" EmptyDataRowStyle-CssClass="emptydatatext">
                    <PagerStyle CssClass="pagin" />
                    <Columns>
                      <asp:TemplateField ItemStyle-VerticalAlign="Top" ItemStyle-Width="50%" ItemStyle-HorizontalAlign="Right" ItemStyle-BackColor="White">
                            <ItemTemplate>
                                <div id="divFrame">
                                    <iframe width="560" height="315" src='<%#Eval("url") %>' frameborder="0" allowfullscreen></iframe>
                                </div>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-VerticalAlign="Top" ItemStyle-Width="50%" ItemStyle-BackColor="White">
                            <ItemTemplate>
                                <div class="divDescricao">
                                    <h4><%#Eval("Titulo") %></h4>
                                    <br />
                                    <span><%#Eval("Descricao") %></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
