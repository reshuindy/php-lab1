<?php
include 'inc/header.php';

Session::CheckSession();

$logMsg = Session::get('logMsg');
if (isset($logMsg)) {
  echo $logMsg;
}
$msg = Session::get('msg');
if (isset($msg)) {
  echo $msg;
}
Session::set("msg", NULL);
Session::set("logMsg", NULL);
?>
<?php

// if (isset($_GET['remove'])) {
//   $remove = preg_replace('/[^a-zA-Z0-9-]/', '', (int)$_GET['remove']);
//   $removeUser = $users->deleteUserById($remove);
// }

// if (isset($removeUser)) {
//   echo $removeUser;
// }
// if (isset($_GET['deactive'])) {
//   $deactive = preg_replace('/[^a-zA-Z0-9-]/', '', (int)$_GET['deactive']);
//   $deactiveId = $users->userDeactiveByAdmin($deactive);
// }

// if (isset($deactiveId)) {
//   echo $deactiveId;
// }
if (isset($_GET['active'])) {
  $active = preg_replace('/[^a-zA-Z0-9-]/', '', (int)$_GET['active']);
  $activeId = $JobPositions->userActiveByAdmin($active);
}

if (isset($activeId)) {
  echo $activeId;
}


 ?>
      <div class="card ">
        <div class="card-header">
        <?php if (Session::get('id') == TRUE) { ?> <h3>Job List <span class="float-right">Welcome <strong>
            <span class="badge badge-lg badge-secondary text-white">
              <?php
              $username = Session::get('name');
              if (isset($username)) {
                echo $username;
              }
              ?> 
            </span>

          </strong></span></h3> <?php } ?>
        </div>
        <div class="card-body pr-2 pl-2">
        <?php if (Session::get('id') == TRUE) { ?>
          <button id="add-job-posting" type="button" class="btn btn-primary float-right">Add Job Posting</button>
<?php }?>
          <table id="listjobs" class="table table-striped table-bordered" style="width:100%">
                  <thead>
                    <tr>
                      <th  class="text-center">SL</th>
                      <th  class="text-center">Job Title</th>
                      <th  class="text-center">Job Description</th>
                      <th  class="text-center">Skill set</th>
                      <th  class="text-center">Hourly rate</th>
                      <th  class="text-center">Contact Info</th>
                      <th  class="text-center">Status</th>
                      <?php if (Session::get('id') == TRUE) { ?>
                      <th  width='100' class="text-center">Action</th>
                      <?php } ?>
                    </tr>
                  </thead>
                  <tbody>
                    <?php

                      $allUser = $JobPositions->selectAllJobData();

                      if ($allUser) {
                        $i = 0;
                        foreach ($allUser as  $value) {
                          $i++;

                     ?>

                      <tr class="text-center"
                      <?php /*if (Session::get("id") == $value->id) {
                        echo "style='background:#d9edf7' ";
                      } */?>
                      >

                        <td><?php echo $i; ?></td>
                        <td title="<?php echo $value->title; ?>"><?php echo $value->title; ?></td>
                        <td title="<?php echo $value->description; ?> "><?php echo $value->description; ?> <br>
                          
                        </td> 
                        <td title="<?php echo $value->skill_set; ?>"><?php echo $value->skill_set; ?></td>

                        <td><span class="badge badge-lg badge-secondary text-white">$<?php echo $value->hourly_rate; ?></span></td>
                        <td title="<?php echo $value->contact_info; ?>"><span class="badge badge-lg badge-secondary text-white text-wrap"><?php echo $value->contact_info; ?></span></td>
                        <td>
                          <?php if ($value->status == 'Open') { ?>
                          <span class="badge badge-lg badge-info text-white">Open</span>
                        <?php }else{ ?>
                    <span class="badge badge-lg badge-danger text-white">Closed</span>
                        <?php } ?>

                        </td>
                        <?php if (Session::get('id') == TRUE) { ?>
                        <td width="100">
                          <?php if($value->status == 'Open'){?>
                               <a onclick="return confirm('Are you sure To Close it ?')" class="btn btn-danger
                       <?php if (Session::get("id") == $value->id) {
                         echo "disabled";
                       } ?>
                                btn-sm " href="?active=<?php echo $value->id;?>">Close Vacancy</a>
                             <?php } ?>


                        
                        </td>
                        <?php } ?>
                      </tr>
                    <?php }}else{ ?>
                      <tr class="text-center">
                      <td>No Job Posting available now !</td>
                    </tr>
                    <?php } ?>

                  </tbody>

              </table>
    </div>
      </div>
  <?php
  include 'inc/footer.php';
  ?>
