﻿<%@ Page Title="Register" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.vb" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Đăng kí</h1>
        <h2>Điền thông tin bên dưới để tạo tài khoản.</h2>
    </hgroup>

    <asp:CreateUserWizard runat="server" ID="RegisterUser" ViewStateMode="Disabled" OnCreatedUser="RegisterUser_CreatedUser">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
            <asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" ID="RegisterUserWizardStep">
                <ContentTemplate>
                    <p class="message-info">
                        Mật khẩu có ít nhất <%: Membership.MinRequiredPasswordLength %> characters in length.
                    </p>

                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="ErrorMessage" />
                    </p>

                    <fieldset>
                        <legend>Khung đăng kí</legend>
                        <ol>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="UserName">Tài Khoản</asp:Label>
                                <asp:TextBox runat="server" ID="UserName" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                    CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label>
                                <asp:TextBox runat="server" ID="Email" TextMode="Email" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                    CssClass="field-validation-error" ErrorMessage="The email address field is required." />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="Password">Mật khẩu</asp:Label>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    CssClass="field-validation-error" ErrorMessage="The password field is required." />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Xác nhận</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                            </li>
                        </ol>
                        <asp:Button runat="server" CommandName="MoveNext" Text="Register" />
                    </fieldset>
                </ContentTemplate>
                <CustomNavigationTemplate />
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>