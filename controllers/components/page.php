<?php

class PageComponent extends Object {
  function getTitle($url) {
    App::import('Vendor', 'simple_html_dom');
    $html = file_get_html($url);
    foreach($html->find('title') as $element) 
      return $element->plaintext;
 }
}

?>