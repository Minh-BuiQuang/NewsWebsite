<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="nangcao.aspx.cs" Inherits="WebTintuc.nangcao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table>
<tr>
    <td>
        Tìm theo tiêu đề:
    </td>
    <td>
        <asp:TextBox ID="txt_tieude" runat="server"></asp:TextBox>
    </td>
</tr>
<tr>
    <td>
        Tìm theo tóm tắt:
    </td>
    <td>
        <asp:TextBox ID="txt_tomtat" runat="server"></asp:TextBox>
    </td>
</tr>
<tr>
    <td>
        Tìm theo nội dung:
    </td>
    <td>
        <asp:TextBox ID="txt_noidung" runat="server"></asp:TextBox>
    </td>
</tr>
<tr>
    <td>
        <asp:Button ID="btn_tim" runat="server" Text="Tìm" onclick="btn_tim_Click" 
            Width="89px" />
    </td>
</tr>
</table>
</asp:Content>
