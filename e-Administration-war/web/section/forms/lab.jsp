<form class="iblb-form" onsubmit="return submitform(event, this)" action="../req/lab.jsp" data-function="fetch_labs_button">
  <div class="iblb-form-inp-div">
    <a class="iblb-form-inp-label">Lab name</a>
    <input name="lName" type="text" placeholder="Enter lab name here..." required>
  </div>

  <div class="iblb-form-inp-div">
    <a class="iblb-form-inp-label">Capacity</a>
    <input name="lCap" type="text" placeholder="Enter lab capacity here..." required>
  </div>

  <div class="iblb-form-inp-div">
    <a class="iblb-form-inp-label">Server</a>
    <input name="lServer" type="text" placeholder="Enter lab preferred server ID here..." required>
  </div>

  <div class="iblb-form-inp-div">
    <a class="iblb-form-inp-label">Admin ID</a>
    <input name="lAdmin" type="text" placeholder="Add admin by ID" required>
  </div>

  <div class="iblb-form-inp-div">
    <input type="hidden" value="create" name="event">
    <input type="submit" value="Create" name="submit">
  </div>
</form>
