<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="LibrarySystem.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Book</asp:ListItem>
            <asp:ListItem>Audio</asp:ListItem>
            <asp:ListItem>Video</asp:ListItem>
        </asp:DropDownList>
&nbsp;
    &nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="71px" />
</p>
<p>
    &nbsp;</p>
</asp:Content>
