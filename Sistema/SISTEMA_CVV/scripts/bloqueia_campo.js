<script type="text/javascript">
	function EnableDisableTextBox(chkPassport) {
		var txtCartaoSus = document.getElementById("txtCartaoSus");
		txtCartaoSus.disabled = chkPassport.checked ? true : false;
		if (!txtCartaoSus.disabled) {
            txtCartaoSus.readOnly;
			txtCartaoSus.focus();
		}
	}
</script>