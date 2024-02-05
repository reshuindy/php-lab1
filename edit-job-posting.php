<?php
// ini_set('display_errors', '1');
// ini_set('display_startup_errors', '1');
// error_reporting(E_ALL);
include 'inc/header.php';
Session::CheckSession();

$sId =  Session::get('login');

if ($sId === true) {

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  
  $userEdit = $JobPositions->editNewJobPosting($_POST);
} 
    $job = $JobPositions->retrieveJobPosting($_REQUEST['id'])[0];

if (isset($userEdit)) {
  echo $userEdit;
}
$pathtoHome = dirname($_SERVER['SCRIPT_NAME']);
 ?>
 <div class="card ">
   <div class="card-header">
          <h3 class='text-center'>Edit Job Posting (<small><?php echo $job->title; ?></small>)</h3>
        </div>
        <div class="cad-body">
            <div style="width:600px; margin:0px auto">

            <form class="" action="" method="post">
                
                <div class="form-group pt-3">
                  <label for="title">Job Title</label>
                  <textarea name="title"  class="form-control" maxlength="200" required><?php echo $job->title ?></textarea>
                </div>
                <div class="form-group">
                  <label for="description">Job Description</label>
                  <textarea name="description"  class="form-control" required><?php echo $job->description ?></textarea>
                </div>
                <div class="form-group">
                  <label for="skill_set">Skillset</label>
                  <textarea name="skill_set"  class="form-control" required><?php echo $job->skill_set ?></textarea>
                </div>
                <div class="form-group">
                  <label for="mobile">Hourly Rate</label>
                  <strong>($)</strong><input type="number" name="hourly_rate" step="any" class="form-control" required value="<?php echo $job->hourly_rate ?>">
                </div>
                <div class="form-group">
                  <label for="password">Application Instructions</label>
                  <textarea name="application_inst" class="form-control" required><?php echo $job->application_inst ?></textarea>
                </div>
                <div class="form-group">
                  <label for="contact_info">Contact Info</label>
                  <textarea name="contact_info" class="form-control" required maxlength="200"><?php echo $job->contact_info ?></textarea>
                </div>
                <div class="form-group">
                  <label for="department">Department</label>
                  <select class="form-control disabled" name="user_dept_id_disabled" id="user_dept_id_disabled" disabled>
                      <option value="<?php echo Session::get('department_id'); ?>"><?php echo Session::get('department_name'); ?></option>
                    </select>
                  <input type="hidden" name="user_dept_id"  value="<?php echo Session::get('department_id'); ?>" />

                  <input type="hidden" name="id"  value="<?php echo $job->id; ?>" />
                </div>
                
                <div class="form-group">
                  <button type="submit" name="addUser" class="btn btn-success">Update</button>
                  <a href="<?php echo $pathtoHome; ?>/index.php" class="btn btn-secondary">&laquo; Back</a>
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
