<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="thegioi.aspx.cs" Inherits="WebTintuc.thegioi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
        <AlternatingItemTemplate> 
        <div style=" background-color:Silver">
            <table width="700px" >
    <tr>
        <td rowspan="4">
            <a href='<%#"baiviet.aspx?id="+ Eval("id") %>'><asp:Image ID="Image1" ImageUrl='<%# Eval("hinh") %>' Width="200px" runat="server"/></a>            
        </td>
        <td>
           <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ngay", "{0:dd MMMM yyyy}")%>' />
        </td>
    </tr>
    <tr>
        <td>
            <div style="font-weight:bold" > <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("tieude") %>' NavigateUrl='<%#"baiviet.aspx?id="+ Eval("id") %>'></asp:HyperLink></div>
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
        <EditItemTemplate>
            <span style="">id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            tieude:
            <asp:TextBox ID="tieudeTextBox" runat="server" Text='<%# Bind("tieude") %>' />
            <br />
            tomtat:
            <asp:TextBox ID="tomtatTextBox" runat="server" Text='<%# Bind("tomtat") %>' />
            <br />
            ngay:
            <asp:TextBox ID="ngayTextBox" runat="server" Text='<%# Bind("ngay") %>' />
            <br />
            noidung:
            <asp:TextBox ID="noidungTextBox" runat="server" Text='<%# Bind("noidung") %>' />
            <br />
            tacgia:
            <asp:TextBox ID="tacgiaTextBox" runat="server" Text='<%# Bind("tacgia") %>' />
            <br />
            trangthai:
            <asp:TextBox ID="trangthaiTextBox" runat="server" 
                Text='<%# Bind("trangthai") %>' />
            <br />
            hinh:
            <asp:TextBox ID="hinhTextBox" runat="server" Text='<%# Bind("hinh") %>' />
            <br />
            theloai:
            <asp:TextBox ID="theloaiTextBox" runat="server" Text='<%# Bind("theloai") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">tieude:
            <asp:TextBox ID="tieudeTextBox" runat="server" Text='<%# Bind("tieude") %>' />
            <br />tomtat:
            <asp:TextBox ID="tomtatTextBox" runat="server" Text='<%# Bind("tomtat") %>' />
            <br />ngay:
            <asp:TextBox ID="ngayTextBox" runat="server" Text='<%# Bind("ngay") %>' />
            <br />noidung:
            <asp:TextBox ID="noidungTextBox" runat="server" Text='<%# Bind("noidung") %>' />
            <br />tacgia:
            <asp:TextBox ID="tacgiaTextBox" runat="server" Text='<%# Bind("tacgia") %>' />
            <br />trangthai:
            <asp:TextBox ID="trangthaiTextBox" runat="server" 
                Text='<%# Bind("trangthai") %>' />
            <br />hinh:
            <asp:TextBox ID="hinhTextBox" runat="server" Text='<%# Bind("hinh") %>' />
            <br />theloai:
            <asp:TextBox ID="theloaiTextBox" runat="server" Text='<%# Bind("theloai") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>   
            <table width="700px">
    <tr>
        <td rowspan="4">
            <a href='<%#"baiviet.aspx?id="+ Eval("id") %>'><asp:Image ID="Image1" ImageUrl='<%# Eval("hinh") %>' Width="200px" runat="server" /></a>
        </td>
        <td>
             <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ngay", "{0:dd MMMM yyyy}")%>' />
        </td>
    </tr>
    <tr>
        <td>
            <div style="font-weight:bold" > <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("tieude") %>' NavigateUrl='<%#"baiviet.aspx?id="+ Eval("id") %>'></asp:HyperLink></div>
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
        <SelectedItemTemplate>
            <span style="">id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            tieude:
            <asp:Label ID="tieudeLabel" runat="server" Text='<%# Eval("tieude") %>' />
            <br />
            tomtat:
            <asp:Label ID="tomtatLabel" runat="server" Text='<%# Eval("tomtat") %>' />
            <br />
            ngay:
            <asp:Label ID="ngayLabel" runat="server" Text='<%# Eval("ngay") %>' />
            <br />
            noidung:
            <asp:Label ID="noidungLabel" runat="server" Text='<%# Eval("noidung") %>' />
            <br />
            tacgia:
            <asp:Label ID="tacgiaLabel" runat="server" Text='<%# Eval("tacgia") %>' />
            <br />
            trangthai:
            <asp:Label ID="trangthaiLabel" runat="server" Text='<%# Eval("trangthai") %>' />
            <br />
            hinh:
            <asp:Label ID="hinhLabel" runat="server" Text='<%# Eval("hinh") %>' />
            <br />
            theloai:
            <asp:Label ID="theloaiLabel" runat="server" Text='<%# Eval("theloai") %>' />
            <br />
<br /></span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tintucConnectionString %>" 
        
        SelectCommand="SELECT [id], [tieude], [tomtat], [ngay], [tacgia], [trangthai], [hinh], [theloai] FROM [baiviet] WHERE (([trangthai] = @trangthai) AND ([theloai] = @theloai)) ORDER BY [id] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="Enabled" Name="trangthai" Type="String" />
            <asp:Parameter DefaultValue="2" Name="theloai" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
