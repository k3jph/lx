<?php

class LinksController extends AppController {
  var $name = 'Links';
  var $helpers = array('Base', 'Form', 'Html', 'Text', 'Time');
  var $components = array('Page', 'RequestHandler');
  
  function index() {
  }
  
  function mylinks() {
    $this->set('links', $this->Link->find('all', array('conditions' => array('Link.user_id' => $this->Auth->user('id')), 'order' => 'Link.id DESC')));
  }

  function alllinks() {
    $this->set('links', $this->Link->find('all', array('order' => 'Link.id DESC')));
  }

  function add() {
    if(!empty($this->data)) {
      $this->Link->create();
      $this->data['Link']['user_id'] = $this->Auth->user('id');
      $this->data['Link']['title'] = $this->Page->getTitle($this->data['Link']['url']);
      if($this->Link->save($this->data)) {
	$this->Session->setFlash('The URL has been saved.');
	$this->redirect(array('action'=>'index'), null, true);
      } else {
	$this->Session->setFlash('The URL was not saved.  Try again.');
      }
    }
  }
  
  function edit($id = null) {
    if(!$id) {
      $this->Session->setFlash('Invalid URL');
      $this->redirect(array('action'=>'index'), null, true);
    }
    if(empty($this->data)) {
      $this->data = $this->Link->find(array('id' => $id));
    } else {
      if($this->Link->save($this->data)) {
	$this->Session->setFlash('The URL has been saved.');
	$this->redirect(array('action'=>'index'), null, true);
      } else {
	$this->Session->setFlash('The URL could not be saved. Please, try again.');
      }
    }
  }
  
  function delete($id = null) {
    if(!$id) {
      $this->Session->setFlash('Invalid URL');
      $this->redirect(array('action'=>'index'), null, true);
    }
    if($this->Link->del($id)) {
      $this->Session->setFlash('URL #' . $id . ' deleted.');
      $this->redirect(array('action'=>'index'), null, true);
    }
  }
  
  function lx($id = null) {
    App::import('Helper', 'Base');
    $base = new BaseHelper();
    $id = $base->decode($id);
    if(!$id) {
      $this->Session->setFlash('Invalid URL');
      $this->redirect(array('action'=>'index'), null, true);
    }
    $this->data = $this->Link->findById($id, array('recursive' => false));
    if(!$this->data) {
      $this->Session->setFlash('Invalid URL');
      $this->redirect(array('action'=>'index'), null, true);
    }
    $log = ClassRegistry::init('Log');
    $log->create(array('link_id' => $id, 
		       'referrer' => $this->referer(),
		       'address' => $this->RequestHandler->getClientIP()));
    $log->save();
    header('Location: ' . $this->data['Link']['url']);
  }
  
}

?>
