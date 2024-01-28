<?php
include 'inc/header.php';
Session::CheckSession();

$sId =  Session::get('login');
if ($sId === true) {

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['addUser'])) {
  $userAdd = $JobPositions->addNewJobPosting($_POST);
}

if (isset($userAdd)) {
  echo $userAdd;
}


 ?>
 <div class="card ">
   <div class="card-header">
          <h3 class='text-center'>Add New Job Posting</h3>
        </div>
        <div class="cad-body">



            <div style="width:600px; margin:0px auto">

            <form class="" action="" method="post">
                <div class="form-group pt-3">
                  <label for="title">Job Title</label>
                  <textarea name="title"  class="form-control" maxlength="200" required></textarea>
                </div>
                <div class="form-group">
                  <label for="description">Job Description</label>
                  <textarea name="description"  class="form-control" required></textarea>
                </div>
                <div class="form-group">
                  <label for="skill_set">Skillset</label>
                  <textarea name="skill_set"  class="form-control" required></textarea>
                </div>
                <div class="form-group">
                  <label for="mobile">Hourly Rate</label>
                  <strong>($)</strong><input type="number" name="hourly_rate" step="any" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="password">Application Instructions</label>
                  <textarea name="application_inst" class="form-control" required> </textarea>
                </div>
                <div class="form-group">
                  <label for="contact_info">Contact Info</label>
                  <textarea name="contact_info" class="form-control" required maxlength="200"> </textarea>
                </div>
                <!-- <div class="form-group">
                  <div class="form-group">
                    <label for="sel1">Select user Role</label>
                    <select class="form-control" name="roleid" id="roleid">
                      <option value="1">Admin</option>
                      <option value="2">Editor</option>
                      <option value="3">User only</option>

                    </select>
                  </div>
                </div> -->
                <div class="form-group">
                  <button type="submit" name="addUser" class="btn btn-success">Post</button>
                </div>


            </form>
          </div>


        </div>
      </div>

<?php
}else{

  header('Location:index.php');



}
 ?>

  <?php
  include 'inc/footer.php';

  ?>
