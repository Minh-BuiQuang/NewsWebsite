<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="chudequantam.aspx.cs" Inherits="WebTintuc.chudequantam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pn_pan" runat="server" BorderStyle="Double">
        <asp:GridView ID="gv_PatientList" runat="server" Width="100%" 
            EmptyDataText="List empty" AutoGenerateColumns="False" 
            style="margin-top: 0px" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
            datakeynames="mabaiviet"
            GridLines="Vertical" DataSourceID="SqlDataSource1" 
            onselectedindexchanged="gv_PatientList_SelectedIndexChanged" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="tieude" HeaderText="Tiêu đề" 
                        SortExpression="tieude" />
                    <asp:BoundField DataField="tomtat" HeaderText="Tóm tắt" 
                        SortExpression="tomtat" />
                    <asp:BoundField DataField="tacgia" HeaderText="Tác giả" 
                        SortExpression="tacgia" />
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
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:tintucConnectionString %>" 
            DeleteCommand="DELETE FROM [chudequantam] WHERE ([mabaiviet] = @mabaiviet)"
            SelectCommand="SELECT * FROM [dschude] WHERE ([taikhoan] = @taikhoan) ORDER BY [mabaiviet] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="taikhoan" SessionField="taikhoan" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="mabaiviet" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
