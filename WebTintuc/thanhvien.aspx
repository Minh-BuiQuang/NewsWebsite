<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="thanhvien.aspx.cs" Inherits="WebTintuc.thanhvien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="font-weight:bold;padding-left:170px">Thông tin tài khoản thành viên</h1>
    <asp:label ID="lbl_error" runat="server" Font-Bold="true" ForeColor="Red"></asp:label>
    <table>
        <tr>
            <td>
                Tài khoản: 
            </td>
            <td>
                <asp:TextBox ID="txt_taikhoan" runat="server" Width="100px" Enabled="false"></asp:TextBox>
            </td>
            <td>
                Mật khẩu:
            </td>
            <td>
                <asp:TextBox ID="txt_matkhau" runat="server" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Trạng thái: 
            </td>
            <td>
                <asp:DropDownList ID="ddl_trangthai" runat="server">
                    <asp:ListItem>Enabled</asp:ListItem>
                    <asp:ListItem>Disabled</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                Quyền hạn:
            </td>
            <td>
                <asp:DropDownList ID="ddl_quyenhan" runat="server">
                    <asp:ListItem>admin</asp:ListItem>
                    <asp:ListItem>user</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Họ tên: 
            </td>
            <td>
                <asp:TextBox ID="txt_hoten" runat="server" Width="100px"></asp:TextBox>
            </td>
            <td>
                Địa chỉ:
            </td>
            <td>
                <asp:TextBox ID="txt_diachi" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Ngày sinh: 
            </td>
            <td>
                <asp:TextBox ID="txt_ngaysinh" runat="server"></asp:TextBox>
            </td>
            <td>
                Ghi chú:
            </td>
            <td>
                <asp:TextBox ID="txt_ghichu" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
     </table>

    <asp:Button ID="btn_edit" runat="server" Text="Sửa"
        OnClientClick="return confirm('Bạn có chắc không?')" 
        onclick="btn_edit_Click" /> 

    <asp:Panel ID="pn_pan" runat="server" BorderStyle="Double">
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
                    <asp:BoundField HeaderText="Trạng thái" DataField="trangthai" 
                        SortExpression="trangthai" />
                    <asp:BoundField HeaderText="Quyền hạn" DataField="quyenhan" 
                        SortExpression="quyenhan" />
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
    </asp:Panel>
    <br />
</asp:Content>
