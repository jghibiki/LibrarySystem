<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="LibrarySystem.AddCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    First Name:<br />
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
    <br />
    Last Name:<br />
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
&nbsp;<br />
    Email:<br />
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="email" runat="server"></asp:TextBox>
    <br />
    Phone:<br />
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="phone" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="submit" runat="server" OnClick="Submit" Text="Submit" />
</asp:Content>
