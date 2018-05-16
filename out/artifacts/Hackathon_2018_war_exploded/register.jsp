<%--
  Created by IntelliJ IDEA.
  User: Đào Tùng
  Date: 15/05/2018
  Time: 8:41 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="article-clean"></div>
<div class="article-list">
    <div class="container">
        <div class="intro"></div>
    </div>
</div>
<div class="register-photo">
    <div class="form-container">
        <form name="register-form" method="post">
            <h2 class="text-center"><strong>Register form</strong> </h2>
            <div class="form-group" id="rollNumber">
                <input type="text" name="rollNumber" placeholder="Roll Number" class="form-control" onkeyup="validateRollNumber(this)" required />
                <div></div>

            </div>
            <div class="form-group">
                <input class="form-control" type="text" name="address" placeholder="Address" required/>
            </div>
            <div class="form-group">
                <input type="text" name="phone" placeholder="Phone Number" class="form-control"  required/>
            </div>
            <div class="form-group">
                <input type="text" name="fullName" placeholder="Full Name" class="form-control" required onkeyup="validateFullname(this)" />
                <div></div>
            </div>
            <div class="form-group">
                <input type="email" name="email" placeholder="Email" class="form-control" required onkeyup="validateEmail(this)"/>
                <div></div>
            </div>
            <div class="form-group">
                <input type="date" name="birthday" placeholder="Birthday" class="form-control" required />
            </div>
            <div class="form-group">

                <select name="gender" id="gender" class="form-control">
                    <option value="2">Other</option>
                    <option value="1">Male</option>
                    <option value="0">Female</option>
                </select>
            </div>
            <div class="form-group">
                <div class="float-left">
                    <input type="text" name="avatar" class="form-control" placeholder="Avatar" readonly>
                </div>
                <label class="custom-file ml-3">
                    <input type="file" id="myImg" class="custom-file-input" required>
                    <span class="custom-file-control text-center">Chọn ảnh</span>
                </label>
            </div>
            <div class="form-group">
                <div class="checkbox">
                    <label class="control-label">
                        <input type="checkbox">I agree to the license terms.</label>
                </div>
            </div>
            <div class="form-group">
                <button class="btn btn-primary btn-block" type="submit" onclick="doSubmit(event)">Submit </button>
            </div>
            <a href="#" class="already">
                You already have an account? Login here.
            </a>
        </form>
    </div>
</div>
<script src="../js/validate.js"></script>