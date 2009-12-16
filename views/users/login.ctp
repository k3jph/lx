<h2>login to lx.is</h2> 
<?php e($form->create('User', array('action' => 'login')));?> 
<fieldset> 
  <label for="UserUsername" class="usernamelabel"><span>Your Email Address</span></label> 
  <?php e($form->text('username', array('class' => 'fullwidth'))); ?> 
  <label for="UserPassword" class="passwordlabel"><span>Password</span></label> 
  <?php e($form->password('password', array('class' => 'fullwidth'))); ?> 
</fieldset> 
<?php e($form->end()); ?> 
