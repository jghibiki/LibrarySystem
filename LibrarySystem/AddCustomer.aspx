<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="LibrarySystem.AddCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <br />
            <div class="form-group">
                <label for="firstName">First Name</label>
                <asp:TextBox ID="firstName" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="lastName">Last Name</label>
                <asp:TextBox ID="lastName" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="email">Email</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="phone">Phone</label>
                <asp:TextBox ID="phone" runat="server" CssClass="form-control"></asp:TextBox><br />
                <asp:Button ID="submit" runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-default"/>
            </div>
    </div>
</asp:Content>
