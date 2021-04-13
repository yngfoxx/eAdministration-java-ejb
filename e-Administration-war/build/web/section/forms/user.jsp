<form class="iblb-form" onsubmit="return submitform(event, this)" action="../req/user.jsp" data-function="fetch_labs_button">
  <div class="iblb-form-inp-div">
    <a class="iblb-form-inp-label">Email</a>
    <input name="lName" type="email" placeholder="Enter email" required>
  </div>

  <div class="iblb-form-inp-div">
    <a class="iblb-form-inp-label">Password</a>
    <input name="lCap" type="password" placeholder="Secure password" required>
  </div>

  <div class="iblb-form-inp-div">
    <a class="iblb-form-inp-label">firstname</a>
    <input name="lServer" type="text" placeholder="Enter firstname here" required>
  </div>

  <div class="iblb-form-inp-div">
    <a class="iblb-form-inp-label">lastname</a>
    <input name="lAdmin" type="text" placeholder="Enter lastname here" required>
  </div>

  <div class="iblb-form-inp-div">
    <a class="iblb-form-inp-label">role</a>
    <input name="lAdmin" type="text" placeholder="Add admin by ID" required>
  </div>

  <div class="iblb-form-inp-div">
    <input type="hidden" value="create" name="event">
    <input type="submit" value="Create" name="submit">
  </div>
</form>
