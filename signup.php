<?php
include 'inc/header.php';
Session::CheckLogin();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['register'])) {
  $register = $JobPositions->userRegistration($_POST);
}

if (isset($register)) {
  echo $register;
}
$depts = $JobPositions->retrieveDepartments();
 ?>


 <div class="card ">
   <div class="card-header">
          <h3 class='text-center'>User Registration</h3>
        </div>
        <div class="cad-body">

            <div style="width:600px; margin:0px auto">

            <form class="" action="" method="post">
                <div class="form-group pt-3">
                  <label for="name">Your name</label>
                  <input type="text" name="user_name"  class="form-control">
                </div>
                <div class="form-group">
                  <label for="email">Email address</label>
                  <input type="email" name="user_name_email" class="form-control">
                </div>
                <div class="form-group">
                  <label for="password">Password <small>(min. 6 characters)</small></label>
                  <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                  <label for="user_department_id">Department</label>
                  <select class="form-control" name="user_department_id" id="user_department_id" required>
                      <option value="">Select a department</option>
                      <?php foreach ($depts as $dept) { ?>
                        <option value="<?php echo $dept->dept_id; ?>"><?php echo $dept->dept_name; ?></option>
                     <?php } ?>
                    </select>
                </div>
                <div class="form-group">
                  <button type="submit" name="register" class="btn btn-success">Register</button>
                </div>


            </form>
          </div>


        </div>
      </div>



  <?php
  include 'inc/footer.php';

  ?>