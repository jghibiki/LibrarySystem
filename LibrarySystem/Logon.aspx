<%@ Page Title="asd" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="LibrarySystem.Logon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="form-group">
            <label for="UserEmail">Username:</label>
            <asp:TextBox ID="UserEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="UserEmail" ErrorMessage="  Cannot be empty" runat="server" />
        </div>

        <div class="form-group">
            <label for="Password">Password:</label>
            <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="Password" ErrorMessage="  Cannot be empty" runat="server" />
        </div>

        <div class="checkbox">
            <label>
                <asp:CheckBox ID="Persist" runat="server"/> Remember Me
            </label>
        </div>

        <asp:Button ID="Submit" OnClick="Logon_Click" runat="server" Text="Login"/>

        <asp:Label ID="Msg" ForeColor="red" runat="server" />
        
    </div>
</asp:Content>