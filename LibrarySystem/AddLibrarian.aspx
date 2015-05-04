<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddLibrarian.aspx.cs" Inherits="LibrarySystem.AddLibrarian" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    First Name:<br />
&nbsp;&nbsp;
    <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
&nbsp;<br />
    LastName:
    <br />
&nbsp;&nbsp;
    <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
&nbsp;<br />
    Email:<br />
&nbsp;&nbsp;
    <asp:TextBox ID="email" runat="server"></asp:TextBox>
&nbsp;<br />
    Phone:<br />
&nbsp;&nbsp;
    <asp:TextBox ID="phone" runat="server"></asp:TextBox>
&nbsp;
    <br />
    <asp:Button ID="submit" runat="server" Text="Submit" OnClick="Submit" />
</asp:Content>
