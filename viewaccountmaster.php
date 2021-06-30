<?php
include("header.php");
include("sidebar.php");

if(isset($_GET[delid]))
{
	$sql = "DELETE FROM account_master WHERE acc_type_id='$_GET[delid]'";
	$qsql = mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) ==1 )
	{
		echo "<script>alert('Account master record deleted successfully...');</script>";
	}
}
?> 

      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">

          <h1>View Account Masters</h1>
          <p>View Account Master records.</p>

          <div class="row margin-bottom-30">
            <div class="col-md-12">
              <ul class="nav nav-pills">
                <li class="active"><a href="accountmaster.php">Add Account Types</a></li>
              </ul>          
            </div>
          </div> 
          <div class="row">
            <div class="col-md-12">
              <div class="table-responsive">
<table  id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
<thead>
  <tr>
    <th scope="col">&nbsp;Prefix</th>
    <th scope="col">&nbsp;Account Type</th>
    <th scope="col">&nbsp;Minimum Balance</th>
    <th scope="col">&nbsp;Interest</th>
    <th scope="col">&nbsp;Status</th>
    <th scope="col">&nbsp;Action</th>
  </tr>
  </thead>
  <tbody>
 <?php 
 $sql ="SELECT * FROM account_master";
 $qsql = mysqli_query($con,$sql);
 while($rs = mysqli_fetch_array($qsql))
 {
  echo "<tr>
    <td>&nbsp;$rs[prefix]</td>
    <td>&nbsp;$rs[acc_type]</td>
    <td>&nbsp;$rs[min_balance]</td>
    <td>&nbsp;$rs[interest]%</td>
    <td>&nbsp;$rs[status]</td>
    <td>&nbsp;<a href='accountmaster.php?editid=$rs[acc_type_id]'>Edit</a> | <a href='viewaccountmaster.php?delid=$rs[acc_type_id]' onclick='return confirmtodelete()'>Delete</a></td>
  </tr>";
  }
?>  
</tbody>
</table>
            </div>
          </div>
        </div>
      </div>

<script type="application/javascript">
function confirmtodelete()
{
	if(confirm("Are you sure want to delete this record?") == true)
	{
		return true;
	}
	else
	{
		return false; 
	}
}
</script>
<?php
include("datatables.php");
include("footer.php");
?>