<%@ Page Title="Manage Account" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Manage.aspx.vb" Inherits="Account_Manage" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1>Quản lý.</h1>
    </hgroup>

    <section id="passwordForm">
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="message-success"><%: SuccessMessageText %></p>
        </asp:PlaceHolder>

        <p>Bạn đã đăng nhập <strong><%: User.Identity.Name %></strong>.</p>

        <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
            <p>
                             Bạn có thể sử dụng Gmail, Facebook, Twitter để đăng nhập thay vì phải đăng kí tài khoản.
            </p>
            <fieldset>
                <legend>Đặt mật khẩu</legend>
                <ol>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="password">Mật khẩu</asp:Label>
                        <asp:TextBox runat="server" ID="password" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                            CssClass="field-validation-error" ErrorMessage="The password field is required."
                            Display="Dynamic" ValidationGroup="SetPassword" />
                        
                        <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                            CssClass="field-validation-error" SetFocusOnError="true" />
                        
                    </li>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="confirmPassword">Xác nhận</asp:Label>
                        <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                            CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required."
                            ValidationGroup="SetPassword" />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                            CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                            ValidationGroup="SetPassword" />
                    </li>
                </ol>
                <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="setPassword_Click" />
            </fieldset>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="changePassword" Visible="false">
            <h3>Change password</h3>
            <asp:ChangePassword runat="server" CancelDestinationPageUrl="~/" ViewStateMode="Disabled" RenderOuterTable="false" SuccessPageUrl="Manage.aspx?m=ChangePwdSuccess">
                <ChangePasswordTemplate>
                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                    <fieldset class="changePassword">
                        <legend>Đổi thông tin mật khẩu</legend>
                        <ol>
                            <li>
                                <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword">Mật khẩu hiện tại</asp:Label>
                                <asp:TextBox runat="server" ID="CurrentPassword" CssClass="passwordEntry" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="field-validation-error" ErrorMessage="The current password field is required."
                                    ValidationGroup="ChangePassword" />
                            </li>
                            <li>
                                <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword">Mật khẩu mới</asp:Label>
                                <asp:TextBox runat="server" ID="NewPassword" CssClass="passwordEntry" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="field-validation-error" ErrorMessage="The new password is required."
                                    ValidationGroup="ChangePassword" />
                            </li>
                            <li>
                                <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword">Xác nhận mật khẩu mới</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" CssClass="passwordEntry" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Confirm new password is required."
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
                                    ValidationGroup="ChangePassword" />
                            </li>
                        </ol>
                        <asp:Button runat="server" CommandName="ChangePassword" Text="Change password" ValidationGroup="ChangePassword" />
                    </fieldset>
                </ChangePasswordTemplate>
            </asp:ChangePassword>
        </asp:PlaceHolder>
    </section>

    <section id="externalLoginsForm">
        
        <asp:ListView runat="server"
            ItemType="Microsoft.AspNet.Membership.OpenAuth.OpenAuthAccountData"
            SelectMethod="GetExternalLogins" DeleteMethod="RemoveExternalLogin" DataKeyNames="ProviderName,ProviderUserId">
        
            <LayoutTemplate>
                <h3>Đăng nhập với đăng kí ngoài</h3>
                <table>
                    <thead><tr><th>Service</th><th>Tài khoản</th><th>Lần trước sử dụng</th><th>&nbsp;</th></tr></thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder"></tr>
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    
                    <td><%#: Item.ProviderDisplayName %></td>
                    <td><%#: Item.ProviderUserName %></td>
                    <td><%#: ConvertToDisplayDateTime(Item.LastUsedUtc) %></td>
                    <td>
                        <asp:Button runat="server" Text="Remove" CommandName="Delete" CausesValidation="false" 
                            ToolTip='<%#: "Remove this " & Item.ProviderDisplayName & " login from your account" %>'
                            Visible="<%# CanRemoveExternalLogins %>" />
                    </td>
                    
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <h3>Thêm đăng nhập ở ngoài</h3>
        <uc:OpenAuthProviders runat="server" ReturnUrl="~/Account/Manage.aspx" />
    </section>
</asp:Content>
