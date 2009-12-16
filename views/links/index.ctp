<script type="text/javascript">
  $(function() {
    $("#tabs").tabs({
      selected: 1
    }); 
  });
</script>
<div id="tabs">
  <ul>
    <li><?php echo $html->link('Add a Link', array('action'=>'add')); ?></li>
    <li><?php echo $html->link('My Links', array('action'=>'mylinks')); ?></li>
    <li><?php echo $html->link('Starred', array('action'=>'starred')); ?></li>
    <li><?php echo $html->link('Recent Links', array('action'=>'alllinks')); ?></li>
    <li><?php echo $html->link('Search', array('action'=>'search')); ?></li>
  </ul>
</div>
