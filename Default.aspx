<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Chào mừng các bạn đến nhà sách BookShools của nhà sách chúng tôi</h1>
            </hgroup>
            <p>
                Trang website này được thành lập năm 2016 trang web có nất nhiều sách cho các độc giả có thể lựa chọn các thể loại gồm : Truyện tranh, truyện trinh thám , truyện hài hước ,truyện kinh dị, và các sách phục vụ cho việc học.
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Cơ sở dữ liệu</h3>
    <ol class="round">
        <li class="one">
            <h5>Khách Hàng<asp:DetailsView ID="DetailsView7" runat="server" AllowPaging="True" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="MaHD" HeaderText="MaHD" SortExpression="MaHD" />
                    <asp:BoundField DataField="MaSanPham" HeaderText="MaSanPham" SortExpression="MaSanPham" />
                    <asp:BoundField DataField="SoLuong" HeaderText="SoLuong" SortExpression="SoLuong" />
                </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Anhnvph03669_QLBHConnectionString10 %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Chi_tiet_hoa_don]"></asp:SqlDataSource>
            </h5>
       <a href="http://go.microsoft.com/fwlink/?LinkId=245147">Learn more…</a>
        </li>
        <li class="two">
            <h5>Hóa Đơn<asp:DetailsView ID="DetailsView8" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="MaHD" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="MaHD" HeaderText="MaHD" ReadOnly="True" SortExpression="MaHD" />
                    <asp:BoundField DataField="MaKhachHang" HeaderText="MaKhachHang" SortExpression="MaKhachHang" />
                    <asp:BoundField DataField="NgayMua" HeaderText="NgayMua" SortExpression="NgayMua" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Anhnvph03669_QLBHConnectionString12 %>" DeleteCommand="DELETE FROM [Hoa_Don] WHERE [MaHD] = @original_MaHD AND [MaKhachHang] = @original_MaKhachHang AND [NgayMua] = @original_NgayMua" InsertCommand="INSERT INTO [Hoa_Don] ([MaHD], [MaKhachHang], [NgayMua]) VALUES (@MaHD, @MaKhachHang, @NgayMua)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [MaHD], [MaKhachHang], [NgayMua] FROM [Hoa_Don]" UpdateCommand="UPDATE [Hoa_Don] SET [MaKhachHang] = @MaKhachHang, [NgayMua] = @NgayMua WHERE [MaHD] = @original_MaHD AND [MaKhachHang] = @original_MaKhachHang AND [NgayMua] = @original_NgayMua">
                    <DeleteParameters>
                        <asp:Parameter Name="original_MaHD" Type="String" />
                        <asp:Parameter Name="original_MaKhachHang" Type="String" />
                        <asp:Parameter Name="original_NgayMua" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MaHD" Type="String" />
                        <asp:Parameter Name="MaKhachHang" Type="String" />
                        <asp:Parameter Name="NgayMua" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="MaKhachHang" Type="String" />
                        <asp:Parameter Name="NgayMua" Type="DateTime" />
                        <asp:Parameter Name="original_MaHD" Type="String" />
                        <asp:Parameter Name="original_MaKhachHang" Type="String" />
                        <asp:Parameter Name="original_NgayMua" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </h5>
           
            <a href="http://go.microsoft.com/fwlink/?LinkId=245147">Learn more…</a>
        </li>
        <li class="three">
            <h5>Sản Phẩm<asp:DetailsView ID="DetailsView3" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="MaSanPham" DataSourceID="SqlDataSource3" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="MaSanPham" HeaderText="MaSanPham" ReadOnly="True" SortExpression="MaSanPham" />
                    <asp:BoundField DataField="MaLoaiSanPham" HeaderText="MaLoaiSanPham" SortExpression="MaLoaiSanPham" />
                    <asp:BoundField DataField="Ten" HeaderText="Ten" SortExpression="Ten" />
                    <asp:BoundField DataField="Gia" HeaderText="Gia" SortExpression="Gia" />
                    <asp:BoundField DataField="MoTa" HeaderText="MoTa" SortExpression="MoTa" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Anhnvph03669_QLBHConnectionString3 %>" DeleteCommand="DELETE FROM [San_Pham] WHERE [MaSanPham] = @original_MaSanPham AND [MaLoaiSanPham] = @original_MaLoaiSanPham AND [Ten] = @original_Ten AND [Gia] = @original_Gia AND [MoTa] = @original_MoTa" InsertCommand="INSERT INTO [San_Pham] ([MaSanPham], [MaLoaiSanPham], [Ten], [Gia], [MoTa]) VALUES (@MaSanPham, @MaLoaiSanPham, @Ten, @Gia, @MoTa)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [MaSanPham], [MaLoaiSanPham], [Ten], [Gia], [MoTa] FROM [San_Pham]" UpdateCommand="UPDATE [San_Pham] SET [MaLoaiSanPham] = @MaLoaiSanPham, [Ten] = @Ten, [Gia] = @Gia, [MoTa] = @MoTa WHERE [MaSanPham] = @original_MaSanPham AND [MaLoaiSanPham] = @original_MaLoaiSanPham AND [Ten] = @original_Ten AND [Gia] = @original_Gia AND [MoTa] = @original_MoTa">
                    <DeleteParameters>
                        <asp:Parameter Name="original_MaSanPham" Type="String" />
                        <asp:Parameter Name="original_MaLoaiSanPham" Type="String" />
                        <asp:Parameter Name="original_Ten" Type="String" />
                        <asp:Parameter Name="original_Gia" Type="Decimal" />
                        <asp:Parameter Name="original_MoTa" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MaSanPham" Type="String" />
                        <asp:Parameter Name="MaLoaiSanPham" Type="String" />
                        <asp:Parameter Name="Ten" Type="String" />
                        <asp:Parameter Name="Gia" Type="Decimal" />
                        <asp:Parameter Name="MoTa" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="MaLoaiSanPham" Type="String" />
                        <asp:Parameter Name="Ten" Type="String" />
                        <asp:Parameter Name="Gia" Type="Decimal" />
                        <asp:Parameter Name="MoTa" Type="String" />
                        <asp:Parameter Name="original_MaSanPham" Type="String" />
                        <asp:Parameter Name="original_MaLoaiSanPham" Type="String" />
                        <asp:Parameter Name="original_Ten" Type="String" />
                        <asp:Parameter Name="original_Gia" Type="Decimal" />
                        <asp:Parameter Name="original_MoTa" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </h5>
          
            <a href="http://go.microsoft.com/fwlink/?LinkId=245143">Learn more…</a>
        </li>
        <li class="four">
            <h5>Loại sản phẩm<asp:DetailsView ID="DetailsView4" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="MaLoaiSanPham" DataSourceID="SqlDataSource4" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="MaLoaiSanPham" HeaderText="MaLoaiSanPham" ReadOnly="True" SortExpression="MaLoaiSanPham" />
                    <asp:BoundField DataField="TenLoai" HeaderText="TenLoai" SortExpression="TenLoai" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Anhnvph03669_QLBHConnectionString5 %>" DeleteCommand="DELETE FROM [Loai_San_Pham] WHERE [MaLoaiSanPham] = @original_MaLoaiSanPham AND [TenLoai] = @original_TenLoai" InsertCommand="INSERT INTO [Loai_San_Pham] ([MaLoaiSanPham], [TenLoai]) VALUES (@MaLoaiSanPham, @TenLoai)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [MaLoaiSanPham], [TenLoai] FROM [Loai_San_Pham]" UpdateCommand="UPDATE [Loai_San_Pham] SET [TenLoai] = @TenLoai WHERE [MaLoaiSanPham] = @original_MaLoaiSanPham AND [TenLoai] = @original_TenLoai">
                    <DeleteParameters>
                        <asp:Parameter Name="original_MaLoaiSanPham" Type="String" />
                        <asp:Parameter Name="original_TenLoai" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MaLoaiSanPham" Type="String" />
                        <asp:Parameter Name="TenLoai" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TenLoai" Type="String" />
                        <asp:Parameter Name="original_MaLoaiSanPham" Type="String" />
                        <asp:Parameter Name="original_TenLoai" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </h5>
          
            <a href="http://go.microsoft.com/fwlink/?LinkId=245143">Learn more…</a>
        </li>
        <li class="five">
            <h5>Chi tiết hóa đơn<br />
                <asp:DetailsView ID="DetailsView9" runat="server" DataSourceID="SqlDataSource5" Height="50px" Width="125px">
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server"></asp:SqlDataSource>
            </h5>
            <a href="http://go.microsoft.com/fwlink/?LinkId=245143">Learn more…</a>
        </li>

    </ol>
</asp:Content>
