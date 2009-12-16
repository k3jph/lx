<?php

class Star extends AppModel {
  var $name = 'Star';
  var $belongsTo = array('Link', 'User');
}

?>
