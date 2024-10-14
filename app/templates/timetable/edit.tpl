<main>

<h1>Stundenerfassung <?php if (!empty($slot['id'])): ?>korrigieren<?php endif ?></h1>

<form action="" method="post" class="form-container" style="max-width:960px">

<div class="grid-2-col">
<fieldset>
<label>Klienten auswählen</label>
<select name="client_id">
<?php foreach ($clients as $client): ?>
	<option <?php if (isset($slot['client_id']) AND $slot['client_id'] == $client['id']): ?>selected<?php endif ?>
	value="<?=$client['id']?>"><?=$client['firstname']?> <?=$client['lastname']?>
	</option>
<?php endforeach ?>
</select>
</fieldset>

<fieldset>
<label>Kategorie</label>
<select name="category">
	<option <?php if (isset($slot['category']) AND $slot['category'] == 'Lerntherapie'): ?>selected<?php endif ?>>Lerntherapie</option>	
	<option <?php if (isset($slot['category']) AND $slot['category'] == 'Betreuung'): ?>selected<?php endif ?>>Betreuung</option>
	<option <?php if (isset($slot['category']) AND $slot['category'] == 'Training'): ?>selected<?php endif ?>>Training</option>
	<option <?php if (isset($slot['category']) AND $slot['category'] == 'Schule'): ?>selected<?php endif ?>>Schule</option>
	<option <?php if (isset($slot['category']) AND $slot['category'] == 'keine Angabe'): ?>selected<?php endif ?>>keine Angabe</option>
</select>
</fieldset>

</div>


<fieldset class="grid-3-col">

	<label>Datum
		<input name="date" type="date" value="<?=$slot['date'] ?? date('Y-m-d')?>">
	</label>

	<label>Betreuungs Zeitraum
		<select name="timeframe">
			<option <?php if (isset($slot['timeframe']) AND $slot['timeframe'] == 1): ?>selected<?php endif ?> value="1">1h</option>
			<option <?php if (isset($slot['timeframe']) AND $slot['timeframe'] == 2): ?>selected<?php endif ?> value="2">2h</option>
			<option <?php if (isset($slot['timeframe']) AND $slot['timeframe'] == 3): ?>selected<?php endif ?> value="3">3h</option>
			<option <?php if (isset($slot['timeframe']) AND $slot['timeframe'] == 4): ?>selected<?php endif ?> value="4">4h</option>
			<option <?php if (isset($slot['timeframe']) AND $slot['timeframe'] == 5): ?>selected<?php endif ?> value="5">5h</option>
			<option <?php if (isset($slot['timeframe']) AND $slot['timeframe'] == 6): ?>selected<?php endif ?> value="6">6h</option>
			<option <?php if (isset($slot['timeframe']) AND $slot['timeframe'] == 7): ?>selected<?php endif ?> value="7">7h</option>
			<option <?php if (isset($slot['timeframe']) AND $slot['timeframe'] == 8): ?>selected<?php endif ?> value="8">8h</option>
			<option <?php if (isset($slot['timeframe']) AND $slot['timeframe'] == 9): ?>selected<?php endif ?> value="9">9h</option>
		</select>
	</label>

	<label>Betreuer
		<select name="advisor_id">
		<?php foreach ($advisors as $advisor): ?>
			<option <?php if (isset($slot['advisor_id']) AND $slot['advisor_id'] == $advisor['id']): ?>selected<?php endif ?>
			value="<?=$advisor['id']?>"><?=$advisor['firstname']?> <?=$advisor['lastname']?></option>
		<?php endforeach ?>
		</select>
	</label>
</fieldset>

<fieldset>
	<label>Weitere Angaben
	<textarea name="notes" class="large" placeholder="Beschreibung"><?=$slot['notes'] ?? ''?></textarea>
	</label>
</fieldset>


<button class="submit">Angaben speichern</button>&ensp;
<a class="button light" href="/">zurück zur Übersicht</a>


</form>

</main>
