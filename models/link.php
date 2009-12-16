<?php

class Link extends AppModel {
  var $name = 'Link';
  var $hasOne = 'Star';
  var $hasMany = 
    array('Log' => 
	  array('className' => 'Log',
		'foreignKey' => 'link_id',
		'dependent' => true));
  var $belongsTo = 
    array('User' => 
	  array('className' => 'User',
		'foreignKey' => 'user_id'));
  var $validate = 
    array('destination' => 
	  array('rule' => VALID_NOT_EMPTY,
		'message' => 'Destination must not be empty'));
}

?>
