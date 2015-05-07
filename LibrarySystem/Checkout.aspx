<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="LibrarySystem.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Books Checkout</h2>
    <div runat="server" id="alert" class="alert alert-dismissible"></div>
    <div class="row">
        <div class="form-group">
            <label for="searchValue">Search by Title/Description/ISBN:</label>
            <asp:TextBox ID="searchValue" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="searchButton" Text="Search" runat="server" OnClick="searchButton_Click" CssClass="form-control btn btn-primary"></asp:Button>
    </div>

    <div class="row">
        <asp:GridView ID="BookCopiesGridView" runat="server" AutoGenerateColumns="False" CellSpacing="3" Width="900px" OnSelectedIndexChanged="BookCopies_Checkout" OnRowUpdating="BookCopies_Reserve">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="FirstName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="LastName" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Email" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Phone" />
                <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Email" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="Email" />
                <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Email" />
                <asp:ButtonField CommandName="Select" HeaderText="Checkout" ShowHeader="True" Text="Checkout" />
                <asp:ButtonField CommandName="Update" HeaderText="Reserve" ShowHeader="True" Text="Reserve" />
                <asp:TemplateField HeaderText="Available Copies">
                    <ItemTemplate>
                        <%#  ((IEnumerable<LibrarySystem.Copy>) Eval("Copies")).Where(c=>c.Availability==1).Count() %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
