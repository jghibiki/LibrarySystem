<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddLibrarian.aspx.cs" Inherits="LibrarySystem.AddLibrarian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <asp:TextBox ID="firstName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <asp:TextBox ID="lastName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <asp:TextBox ID="phone" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="submit" runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-default"/>
    </div>
</asp:Content>
