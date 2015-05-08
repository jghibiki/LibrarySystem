<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchBook.aspx.cs" Inherits="LibrarySystem.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Title</asp:ListItem>
            <asp:ListItem>Author</asp:ListItem>
            <asp:ListItem>Publisher</asp:ListItem>
            <asp:ListItem>Genre</asp:ListItem>
            <asp:ListItem>Year</asp:ListItem>
        </asp:DropDownList>
&nbsp;
    &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="71px" />
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCommand="OnRowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Author1" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="ISBN1" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:ButtonField CommandName="Reserve" Text="Reserve" />
            <asp:ButtonField CommandName="Checkout" Text="Check Out"/>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="Media" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Media_Book] ORDER BY [Id]"></asp:SqlDataSource>
    <asp:Label runat="server" ID="status"></asp:Label>
    </p>
</asp:Content>
