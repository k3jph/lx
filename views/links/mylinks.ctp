<?php if(empty($links)): ?>
You have no links.  Create some!
<?php else: ?>
<script type="text/javascript">
  var addthis_config = {
    ui_cobrand: "LX.IS"
  }

  $(function() {
    $("#myLinksAccordion").accordion({
      autoHeight: false
    });
  });

  $('#<?php echo 'addthis_button_' . $link['Link']['id'] ?>')
  .mouseover(function(){return addthis_open(this, '', '[URL]', '[TITLE]')})
  .mouseout(function(){addthis_close()})
  .click(function(){return addthis_sendto()});
</script>
<script type="text/javascript" src="http://static.addtoany.com/menu/page.js"></script>
<div id="myLinksAccordion">
  <?php foreach ($links as $link): ?>
  <h3><a href="#"><?php echo $text->truncate($link['Link']['title'], 60, '...', false) ?></a></h3>
  <div>
    <table class="linkinfo">
      <th>
	<td width='10%'>lx.is Link</td>
	<td width='50%'>Destination</td>
	<td width='15%'>Added</td>
	<td width='25%'>&nbsp;</td>
      </th>
      <tr>
	<td></td>
	<td><a href="http://lx.is/<?php echo $base->encode($link['Link']['id']) ?>">http://lx.is/<?php echo $base->encode($link['Link']['id']) ?></a></td>
	<td><?php echo $text->truncate($link['Link']['url'], 60) ?></td>
	<td><?php echo $time->niceShort($link['Link']['timestamp']) ?></td>
	<td class="linktoolbox">
	  <!-- AddThis Button BEGIN -->
	  <a class="<?php echo 'addthis_button_' . $link['Link']['id'] ?>" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=lxis"
	     addthis:title="<?php echo $link['Link']['title'] ?>"
	     addthis:url="<?php echo $link['Link']['url'] ?>"
	    <img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/>
	  </a>
	  <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js?pub=lxis"></script>
	  <!-- AddThis Button END -->
	</td>
      </tr>
    </table>
  </div>
  <?php endforeach; ?>
</div>
<?php endif; ?>
