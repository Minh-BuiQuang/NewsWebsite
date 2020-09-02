<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="thongtintaikhoan.aspx.cs" Inherits="WebTintuc.thongtintaikhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
<br />
<br />
<br />
    <a id="a_thongtinbatbuoc" runat="server" style="color:Red">(*) Thông tin bắt buộc</a> 
    <table>
    <tr>
        <td>
            Tên tài khoản:<a style="color:Red">*</a>
        </td>
        <td>
            <asp:TextBox ID="txt_tentaikhoan" runat="server" MaxLength="20"></asp:TextBox>
        </td>
        <td>
            Mật khẩu:<a style="color:Red">*</a>
        </td>
        <td>
            <asp:TextBox ID="txt_matkhau" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Họ và tên:
        </td>
        <td>
            <asp:TextBox ID="txt_hovaten" runat="server" MaxLength="50"></asp:TextBox>
        </td>
        <td>
            Ngày sinh:
        </td>
        <td>
            <asp:TextBox ID="txt_ngaysinh" runat="server" MaxLength="10"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Địa chỉ:
        </td>
        <td colspan="3">
            <asp:TextBox ID="txt_diachi" runat="server" Width="100%"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Ghi chú:
        </td>
        <td colspan="3">
            <asp:TextBox ID="txt_ghichu" runat="server" Width="100%"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div style="text-align:center"><asp:Button ID="btn_dangky" runat="server" 
                    Text="Đăng ký" Width="100px" ValidationGroup="thongtinnguoidung" 
                    onClick="btn_dangky_Click" /></div>
        </td>
        
    </tr>
    </table>
    <asp:RegularExpressionValidator ID="vl_tentaikhoan" runat="server" ErrorMessage="Tên tài khoản không hợp lệ!" ControlToValidate="txt_tentaikhoan" ValidationExpression="[0-9a-zA-Z]{4,20}" ValidationGroup="thongtinnguoidung" ></asp:RegularExpressionValidator>
    <br />
    <asp:RegularExpressionValidator ID="vl_matkhau" runat="server" ErrorMessage="Mật khẩu không hợp lệ!" ControlToValidate="txt_matkhau" ValidationExpression="[0-9a-zA-Z]{4,20}" ValidationGroup="thongtinnguoidung" ></asp:RegularExpressionValidator>
    <br />
    <asp:CompareValidator id="vl_ngaysinh" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="txt_ngaysinh" ErrorMessage="Ngày sinh không hợp lệ!" ValidationGroup="thongtinnguoidung"></asp:CompareValidator>
    <br />
    <asp:Label ID="lb_trungtaikhoan" runat="server" Text=""></asp:Label>
    <br />    

    <%--<asp:Panel ID="pn_pan" runat="server" BorderStyle="Double">
        <asp:GridView ID="gv_PatientList" runat="server" Width="100%" 
            EmptyDataText="List empty" AutoGenerateColumns="False" 
            style="margin-top: 0px" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
            GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Tài khoản">
                        <ItemTemplate>
                            <asp:LinkButton ID="lb_ID" runat="server" Text='<%# Eval("taikhoan") %>'
                               OnClick="LoadList" ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Mật khẩu" DataField="matkhau"
                        SortExpression="matkhau"/>
                    <asp:BoundField HeaderText="Họ tên" DataField="hoten" 
                        SortExpression="hoten" />
                    <asp:BoundField HeaderText="Địa chỉ" DataField="diachi" 
                        SortExpression="diachi" />
                    <asp:BoundField HeaderText="Ngày sinh" DataField="ngaysinh" 
                        SortExpression="ngaysinh" />
                    <asp:BoundField HeaderText="Ghi chú" DataField="ghichu" 
                        SortExpression="ghichu" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#F7F7DE" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </asp:Panel>--%>
</asp:Content>
