<?php
class BaseHelper extends AppHelper {
	function encode($n) {
		App::import('Vendor', 'base_conversion');
		return $this->output(base_dec2base($n, 64));
	}

	function decode($n) {
		App::import('Vendor', 'base_conversion');
		return $this->output(base_base2dec($n, 64));
	}
}
?>
