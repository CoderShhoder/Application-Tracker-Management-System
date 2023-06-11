﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationTracker.aspx.cs" Inherits="JobApplicationTracker.ApplicationTracker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
                                        <input type="text" class="form-control" placeholder="Company Name " />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 ">
                                <div class="form-group d-flex flex-row">

                                    <div class="col-sm-5 ">
                                        <input type="text" class="form-control" placeholder="Job Role " />
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" placeholder="Recruiter Name " />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 ">
                                <div class="form-group d-flex flex-row">

                                    <div class="col-sm-5 ">
                                        <input type="text" class="form-control" placeholder="Application Date" />
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" placeholder="Application Status " />
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
                                        <input type="text" class="form-control" placeholder="Contact Details (Email Address / Contact Number)" />
                                    </div>
                                </div>
                            </div>
                            <div id="InterviewFeild">
                                <div class="col-sm-12">
                                    <div class="form-group d-flex flex-row">
                                        <div class="col-sm-5 ">
                                            <input type="text" class="form-control" placeholder="Interview Date" />
                                        </div>
                                        <div class="col-sm-2">
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" placeholder="Interview time" />
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
                                        <input type="text" class="form-control" placeholder="Application Outcome" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
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

