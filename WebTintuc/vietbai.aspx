<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="vietbai.aspx.cs" Inherits="WebTintuc.vietbai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:Label ID="lb_thongbao" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <a runat="server" style="color:Red">(*) Thông tin bắt buộc</a> 
    <table >        
    <tr>
    <td>
        Tiêu đề:
    <a style="color:Red">*</a></td>
        <td>
            <asp:TextBox ID="txt_tieude" width="500px" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td>
        Link Hình:
    </td>
        <td>
            <asp:TextBox ID="txt_linkhinh" width="500px" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td valign="top">
        Tóm tắt:
    <a style="color:Red">*</a></td>
        <td>
            <asp:TextBox ID="txt_tomtat" width="500px" runat="server" Height="50px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td valign="top">
            Nội dung:<a style="color:Red">*</a>
        </td>       
        <td>
            <asp:TextBox ID="txt_noidung" width="500px" runat="server" Height="500px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div style="text-align:right"><asp:Button ID="btn_guibai" runat="server" 
                    Text="Gửi bài" onclick="btn_guibai_Click" /></div>
        </td>
    </tr>
</table>

</asp:Content>
