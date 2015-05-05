<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="LibrarySystem.AddBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
            <p>&nbsp;</p>
            <div class="form-group">
                <label for="title">Title</label>
                <asp:TextBox ID="title" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="author">Author</label>
                <asp:TextBox ID="author" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="isbn">ISBN</label>
                <asp:TextBox ID="isbn" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="year">Year</label>
                <asp:TextBox ID="year" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="genre">Genre</label>
                <asp:TextBox ID="genre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="publisher">Publisher</label>
                <asp:TextBox ID="publisher" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <asp:TextBox ID="description" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="submit" runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-default"/>
            <br />
            <br />
            <asp:Label ID="status" runat="server"></asp:Label>
    </div>
</asp:Content>
