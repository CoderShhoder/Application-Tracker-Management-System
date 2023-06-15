<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationTracker.aspx.cs" Inherits="JobApplicationTracker.ApplicationTracker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h2>Application Tracking Management</h2>

                <div id="headerControls" class="d-flex flex-row" style="float: right;">
                    <div id="Sort">
                        <i class="fas-duotone fa-sort-up"></i>
                        <asp:DropDownList ID="ddlSort" runat="server"></asp:DropDownList>
                    </div>
                    <div id="Filter">
                        <i class="fa fa-filter"></i>
                        <asp:DropDownList ID="ddlFilter" runat="server"></asp:DropDownList>
                    </div>
                    <button type="button" id="openModal" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>

                    <div class="modal fade bd-example-modal-lg" id="RoleFormModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" id="#closeModal" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Modal Header</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="col-sm-12">
                                        <div class="form-group">

                                            <div class="col-sm-12">

                                                <input type="text" id="txtcompanyName" runat="server" class="form-control" placeholder="Company Name " />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 ">
                                        <div class="form-group d-flex flex-row">

                                            <div class="col-sm-5 ">
                                                <input type="text" id="txtJobRole" runat="server" class="form-control" placeholder="Job Role " />
                                            </div>
                                            <div class="col-sm-2">
                                            </div>
                                            <div class="col-sm-5">
                                                <input type="text" id="txtRecruiterName" runat="server" class="form-control" placeholder="Recruiter Name " />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 ">
                                        <div class="form-group d-flex flex-row">

                                            <div class="col-sm-5 ">
                                                <input type="text" id="txtApplicationDate" runat="server" class="form-control" placeholder="Application Date" />
                                            </div>
                                            <div class="col-sm-2">
                                            </div>
                                            <div class="col-sm-5">
<%--                                                <input type="text" class="form-control" placeholder="Application Status " />--%>
                                                <asp:DropDownList ID="ddlApplicationStatus" runat="server" class="form-control" ></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 ">
                                        <div class="form-group d-flex flex-row">
                                            <div class="col-sm-12 ">
                                                <textarea class="form-control" placeholder="Application Notes" rows="3"> </textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">

                                            <div class="col-sm-12">
                                                <input type="text" class="form-control" id="txtContactDetails" runat="server" placeholder="Contact Details (Email Address / Contact Number)" />
                                            </div>
                                        </div>
                                    </div>
                                    <div id="InterviewFeild" runat="server">
                                        <div class="col-sm-12">
                                            <div class="form-group d-flex flex-row">
                                                <div class="col-sm-5 ">
                                                    <input type="text" id="txtInterviewDate" runat="server" class="form-control" placeholder="Interview Date" />
                                                </div>
                                                <div class="col-sm-2">
                                                </div>
                                                <div class="col-sm-5">
                                                    <%--<input type="text" class="form-control" id="txtInterviewTime" runat="server" placeholder="Interview time" />--%>
                                                    <asp:DropDownList ID="ddlInterviewTime" class="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 ">
                                            <div class="form-group d-flex flex-row">
                                                <div class="col-sm-12 ">
                                                    <textarea class="form-control" placeholder="Interview Notes" rows="3"> </textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12" id="AppOutcome">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <%--<input type="text" runat="server" id="txtApplicationOutcome" class="form-control" placeholder="Application Outcome" />--%>
                                                <asp:DropDownList ID="ddlApplicationOutcome" class="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
<%--                                    <button type="button" id="txtSubmit" runat="server" class="btn btn-default" >Submit</button>--%>
                                    <asp:Button ID="btnSubmit" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <main>
                <div>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    <div id="searchbox">
                        <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="imgbtnSearch" runat="server" />
                    </div>
                </div>
                <div id="TrackerGridView">
                    <asp:GridView ID="gvApplicationGrid" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" >
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                    <br />
                </div>

            </main>

        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $("#openModal").click(function () {
                $("#RoleFormModal").modal('show');
            })

            $("#closeModal").click(function () {
                $("#RoleFormModal").modal('hide');
            })
        });
    </script>
</body>
</html>

