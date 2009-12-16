<?php 

class AppController extends Controller { 
  var $helpers = array('Javascript');
  var $components = array('Auth');
  
  function beforeFilter() { 
    $this->Auth->loginRedirect = array('controller'=>'links', 'action' => 'home'); 
    $this->Auth->logoutRedirect = array('controller'=>'links', 'action' => 'home'); 
    $this->Auth->allow('signup', 'confirm', 'home'); 
    $this->Auth->authorize = 'controller'; 
    $this->Auth->userScope = array('User.confirmed' => '1'); 
    $this->set('loggedIn', $this->Auth->user('id')); 
    $this->set('loggedInUserName', $this->Auth->user('username'));
  }
  
  function isAuthorized() { 
    return true; 
  } 
} 

?>
