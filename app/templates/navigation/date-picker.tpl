<form action="" method="get" class="calendar-timeframe">
	<select name="month" class="js-calendar-monthpicker">

		<?php foreach ($months as $month => $dates): ?>
			<?php if ($month == $selectedMonth): ?>
			<option selected value="<?=$month?>"><?=$dates['german']?></option>		
			<?php else: ?>
			<option value="<?=$month?>"><?=$dates['german']?></option>
			<?php endif ?>
		<?php endforeach; ?>
	</select>
</form>

<script type="text/javascript">
let timeframe = document.querySelector('.js-calendar-monthpicker');
if (timeframe) {timeframe.addEventListener('change', () => {timeframe.parentNode.submit();});}
</script>	