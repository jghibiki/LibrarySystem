<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchLibrarian.aspx.cs" Inherits="LibrarySystem.SearchLibrarian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
            <div class="form-group">
                <label for="searchOption">Search by</label>
                <asp:DropDownList ID="searchOption" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Librarian ID" Value="Id"></asp:ListItem>
                    <asp:ListItem Text="First Name" Value="FirstName"></asp:ListItem>
                    <asp:ListItem Text="Last Name" Value="LastName"></asp:ListItem>
                    <asp:ListItem Text="Email" Value="Email"></asp:ListItem>
                    <asp:ListItem Text="Phone" Value="Phone"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="searchValue">Keyword</label>
                <asp:TextBox ID="searchValue" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="searchButton" Text="Search" runat="server" OnClick="searchButton_Click" CssClass="form-control btn btn-primary"></asp:Button>

            <asp:GridView ID="CustomersGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="CourseID" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
            </asp:GridView>
    </div>
</asp:Content>

