<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="baiviet.aspx.cs" Inherits="WebTintuc.baiviet" %>
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
            <div style="text-align:center"><img alt="" src='<%# Eval("hinh") %>' runat="server" />            </div>
            <br />
            <asp:Label ID="noidungLabel" runat="server" Text='<%# Eval("noidung") %>' />
            <br />
            <div style="text-align:right;color:Red"><asp:Label ID="tacgiaLabel" runat="server" Text='<%# Eval("tacgia") %>' /></div>            
            </span> 
        </ItemTemplate>
        
    </asp:ListView>
    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
            <asp:Panel ID="Panel1" runat="server" BorderColor="Black" Width="500px" BorderWidth="1px">            
             <table width="500px">
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="taikhoanLabel" runat="server" Text='<%# Eval("taikhoan") %>' ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="noidungLabel" runat="server" Text='<%# Eval("noidung") %>' />        
                </td>
            </tr>
            <tr>
                <td>
                    <div style="text-align:right"><asp:Label ID="thoidiemLabel" runat="server" Text='<%# Eval("thoidiem") %>'/></div>
                </td>
            </tr>
        </table>
        </asp:Panel>
        </AlternatingItemTemplate>
        
        <ItemTemplate>
        <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BorderWidth="1px" Width="500px">   
        <table width="500px" >
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="taikhoanLabel" runat="server" Text='<%# Eval("taikhoan") %>' ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="noidungLabel" runat="server" Text='<%# Eval("noidung") %>' />        
                </td>
            </tr>
            <tr>
                <td>
                    <div style="text-align:right"><asp:Label ID="thoidiemLabel" runat="server" Text='<%# Eval("thoidiem") %>'/></div>
                </td>
            </tr>
        </table>
        </asp:Panel>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="margin-left:220px">
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
    <table width="500px">       
        <tr>
            <td colspan="2">
                <asp:TextBox ID="txt_binhluan" runat="server" Width="500px" Height="50px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <asp:RequiredFieldValidator ID="vl_chuavietbinhluan" runat="server" ErrorMessage="Chưa viết bình luận!" ValidationGroup="vlg_guibinhluan" ControlToValidate="txt_binhluan" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lb_dodaibinhluan" ForeColor="Red" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <div style="text-align:right"><asp:Button ID="txt_guibinhluan" runat="server" 
                        Text="Gửi bình luận" ValidationGroup="vlg_guibinhluan" 
                        onclick="txt_guibinhluan_Click"/></div>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tintucConnectionString %>"         
        SelectCommand="SELECT * FROM [baiviet] WHERE (([id] = @id) AND ([trangthai] = @trangthai))">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="Enabled" Name="trangthai" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tintucConnectionString %>"         
        
        SelectCommand="SELECT * FROM [binhluan] WHERE (([mabaiviet] = @mabaiviet) AND ([trangthai] = @trangthai)) ORDER BY [mabinhluan] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="mabaiviet" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="Enabled" Name="trangthai" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>     
</asp:Content>
