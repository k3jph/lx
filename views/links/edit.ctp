<?php echo $form->create('Link'); ?>
	<fieldset>
		<legend>Edit link</legend>
		<?php
			echo $form->hidden('id');
			echo $form->input('url');
		?>
	</fieldset>
<?php echo $form->end('Save'); ?>
