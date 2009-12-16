<?php

class Log extends AppModel {
  var $name = 'Log';
  var $belongsTo = 
    array('Link' => 
	  array('className' => 'Link',
		'foreignKey' => 'link_id'));
}

?>
