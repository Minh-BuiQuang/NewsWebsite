<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="chitietduyetbai.aspx.cs" Inherits="WebTintuc.chitietduyetbai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="">           
            <asp:Label ID="ngayLabel" runat="server" Text='<%# Eval("ngay") %>' />
            <br />
            <div style="font-size:large"><asp:Label ID="tieudeLabel" runat="server" Text='<%# Eval("tieude") %>' ForeColor="Blue"/></div>
            <br />            
            <asp:Label ID="tomtatLabel" runat="server" Text='<%# Eval("tomtat") %>' />
            <br />
            <div style="text-align:center"><img id="Img1" alt="" src='<%# Eval("hinh") %>' runat="server" />            </div>
            <br />
            <table>
            <tr>
            <td>
            <asp:Label ID="noidungLabel" runat="server" Text='<%# Eval("noidung") %>' />
            </td>            
            </tr>
            </table>
            <br />
            <div style="text-align:right;color:Red"><asp:Label ID="tacgiaLabel" runat="server" Text='<%# Eval("tacgia") %>' /></div>            
            </span>            
        </AlternatingItemTemplate>
       
        <ItemTemplate>           
            <span style="">           
            <asp:Label ID="ngayLabel" runat="server" Text='<%# Eval("ngay") %>' />
            <br />
            <div style="font-size:large"><asp:Label ID="tieudeLabel" runat="server" Text='<%# Eval("tieude") %>' ForeColor="Blue"/></div>
            <br />            
            <asp:Label ID="tomtatLabel" runat="server" Text='<%# Eval("tomtat") %>' />
            <br />
            <div style="text-align:center"><img id="Img1" alt="" src='<%# Eval("hinh") %>' runat="server" />            </div>
            <br />
            <asp:Label ID="noidungLabel" runat="server" Text='<%# Eval("noidung") %>' />
            <br />
            <div style="text-align:right;color:Red"><asp:Label ID="tacgiaLabel" runat="server" Text='<%# Eval("tacgia") %>' /></div>            
            </span> 
        </ItemTemplate>  
    </asp:ListView>
    Thể loại:
    <asp:DropDownList ID="ddl_theloai" runat="server">
        <asp:ListItem Value="1">Xã hội</asp:ListItem>
        <asp:ListItem Value="2">Thế giới</asp:ListItem>
        <asp:ListItem Value="3">Thể thao</asp:ListItem>
        <asp:ListItem Value="4">Giải trí</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="txt_duyet" runat="server" Text="Duyệt!!!" 
    onclick="txt_duyet_Click" />
    <asp:Button ID="txt_khongduyet" runat="server" Text="Không duyệt..." 
    onclick="txt_khongduyet_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tintucConnectionString %>"         
        SelectCommand="SELECT * FROM [baiviet] WHERE (([id] = @id) AND ([trangthai] = @trangthai))">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="Waiting" Name="trangthai" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
