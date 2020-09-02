<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="duyetbai.aspx.cs" Inherits="WebTintuc.duyetbai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
        <AlternatingItemTemplate> 
        <div style=" background-color:Silver">
            <table width="700px" >
    <tr>
        <td rowspan="4">
            <a href='<%#"chitietduyetbai.aspx?id="+ Eval("id") %>'><asp:Image ID="Image1" ImageUrl='<%# Eval("hinh") %>' Width="200px" runat="server"/></a>            
        </td>
        <td>
           <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ngay", "{0:dd MMMM yyyy}")%>' />
        </td>
    </tr>
    <tr>
        <td>
            <div style="font-weight:bold" > <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("tieude") %>' NavigateUrl='<%#"chitietduyetbai.aspx?id="+ Eval("id") %>'></asp:HyperLink></div>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("tomtat") %>' />
        </td>
    </tr>
    <tr>
        <td>
            <div style="text-align:right"> <asp:Label ID="Label3" runat="server" Text='<%# Eval("tacgia") %>' ForeColor="Red"/></div>
        </td>
    </tr>
</table>
</div>
        </AlternatingItemTemplate>
        
        <ItemTemplate>   
            <table width="700px">
    <tr>
        <td rowspan="4">
            <a href='<%#"chitietduyetbai.aspx?id="+ Eval("id") %>'><asp:Image ID="Image1" ImageUrl='<%# Eval("hinh") %>' Width="200px" runat="server" /></a>
        </td>
        <td>
             <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ngay", "{0:dd MMMM yyyy}")%>' />
        </td>
    </tr>
    <tr>
        <td>
            <div style="font-weight:bold" > <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("tieude") %>' NavigateUrl='<%#"chitietduyetbai.aspx?id="+ Eval("id") %>'></asp:HyperLink></div>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("tomtat") %>' />
        </td>
    </tr>
    <tr>
        <td>
            <div style="text-align:right"> <asp:Label ID="Label3" runat="server" Text='<%# Eval("tacgia") %>' ForeColor="Red"/></div>
        </td>
    </tr>
</table>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align:center">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>

        
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tintucConnectionString %>" 
        SelectCommand="SELECT [id], [tieude], [tomtat], [ngay], [tacgia], [trangthai], [hinh], [theloai] FROM [baiviet] WHERE ([trangthai] = @trangthai) ORDER BY [id] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="Waiting" Name="trangthai" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
