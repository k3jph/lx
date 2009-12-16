<?php if(empty($links)): ?>
You have no links.  Create some!
<?php else: ?>
<script type="text/javascript">
  $(function() {
    $("#allLinksAccordion").accordion({
      autoHeight: false
    });
  });
</script>
<div id="allLinksAccordion">
  <?php foreach ($links as $link): ?>
  <h3><a href="#"><?php echo $link['Link']['destination'] ?></a></h3>
  <div><?php echo $base->encode($link['Link']['id']) ?></div>
  <?php endforeach; ?>
</div>
<?php endif; ?>
