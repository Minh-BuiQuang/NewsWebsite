<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="WebTintuc.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="background-color: #FAFAD2;color: #284775;">id:
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
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #FFCC66;color: #000080;">id:
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
            <span style="background-color: #FFFBD6;color: #333333;">id:
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
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" 
                style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">id:
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
        SelectCommand="SELECT [id], [tieude], [tomtat], [ngay], [tacgia], [trangthai], [hinh], [theloai] FROM [baiviet] WHERE ([trangthai] = @trangthai) ORDER BY [id] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="Enabled" Name="trangthai" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
