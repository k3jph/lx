<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head> 
    <title>lx.is</title> 
    <?php echo $html->css('stylesheet'); ?>
    <?php echo $html->css('lx/jquery-ui-1.7.2.lx'); ?>
    <?php echo $javascript->link('http://www.google.com/jsapi'); ?>
    <script>
      google.load("jquery", "1.3.2");
      google.load("jqueryui", "1.7.2");
    </script>
  </head> 
  <body> 
    <div id="container"> 
      <div id="header"> 
	<div id="userinfo">
	  <?php e($html->link('Blog', 'http://blog.lx.is/')); ?> |
	  <?php e($html->link('Twitter', 'http://twitter.com/lx_is')); ?> |
	  <?php if(isset($loggedIn)): ?>
	  <span class="username"><?php e($loggedInUserName); ?></span> |
	  <?php e($html->link('Settings', array('controller' => 'users', 'action' => 'settings'))); ?> |
	  <?php e($html->link('Logout', array('controller' => 'users', 'action' => 'logout'))); ?>
	  <?php else: ?>
	  <?php e($html->link('Login', array('controller' => 'users', 'action' => 'login'))); ?> |
	  <?php e($html->link('Sign Up', array('controller' => 'users', 'action' => 'signup'))); ?>
	  <?php endif; ?>
	</div>
        <h1><a href="http://lx.is"><img src="/img/logo.png" /></a></h1> 
      </div> 
      <div id="content"> 
        <?php echo $content_for_layout; ?> 
      </div> 
      <div id="footer"> 
        Footer
      </div> 
    </div> 
  </body> 
</html>
