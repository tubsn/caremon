<main>

<h1><?=$page['title']?></h1>
<p>Bitte geben Sie alle relevanten Details ein und achten Sie darauf, dass die Angaben vollständig und korrekt sind. Die erfassten Daten sind Grundlage für die Therapiepläne.</p>

<form method="post" action="" class="form-container">
<div class="grid-2-wide wide-gap">

<section>

<fieldset class="grid-2-col">
	<label>Vorname
		<input type="text" name="firstname" placeholder="Vorname" value="<?=$client['firstname'] ?? ''?>">
	</label>

	<label>Nachname
		<input type="text" name="lastname" placeholder="Nachname" value="<?=$client['lastname'] ?? ''?>">
	</label>
</fieldset>

<fieldset  class="grid-2-back-wide">
	<label>PLZ
		<input type="text" name="plz" placeholder="Postleitzahl" value="<?=$client['plz'] ?? ''?>">
	</label>

	<label>Wohnort
		<input type="text" name="location" placeholder="Ort" value="<?=$client['location'] ?? ''?>">
	</label>
</fieldset>

<fieldset>
	<label>Anschrift
		<input type="text" name="address" placeholder="Straße und Hausnummer" value="<?=$client['address'] ?? ''?>">
	</label>
</fieldset>

<fieldset>
	<label>Weitere Angaben
		<textarea class="large" name="notes" placeholder="Notizen"><?=$client['notes'] ?? ''?></textarea>
	</label>
</fieldset>

</section>

<section>
	<fieldset class="grid-2-col">
		<label>Budget Start
			<input type="date" name="budget_start" value="<?=$client['budget_start'] ?? ''?>">
		</label>
		<label>Budget Ende
			<input type="date" name="budget_end" value="<?=$client['budget_end'] ?? ''?>">
		</label>		
	</fieldset>

	<fieldset class="grid-2-wide">
		<label>E-Mail
			<input type="text" name="email" placeholder="E-Mail Adresse" value="<?=$client['email'] ?? ''?>">
		</label>

		<label>Telefon
			<input type="text" name="telephone" placeholder="Telefonnummer" value="<?=$client['telephone'] ?? ''?>">
		</label>		
	</fieldset>

	<fieldset>
		<label>Stundenbudget
			<input type="text" name="budget" placeholder="in Stunden" value="<?=$client['budget'] ?? ''?>">
		</label>
	</fieldset>

</section>

</div>

<button class="submit">Angaben speichern</button>&ensp;
<a class="button light" href="/clients">zurück zur Übersicht</a>

</form>


<?php if (isset($client['edited'])): ?>
<small class="fright">
Editiert: <?=formatDate($client['edited'],'d.m.Y H:i')?>
</small>
<?php endif ?>

</main>