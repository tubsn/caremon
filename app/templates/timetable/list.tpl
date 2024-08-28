<main>

<div class="fright">
	<a href="/slots/new" class="button">Neuer Eintrag</a>
</div>

<h1><?=$page['title']?> - Stundenerfassung</h1>




<table class="fancy js-tablesort wide" style="table-layout: fixed;">
<thead>
	<tr>
		<th style="width:30px">Dauer</th>
		<th style="width:20%">Klient</th>
		<th style="width:40%">Beschreibung</th>
		<th style="width:10%">Kategorie</th>
		<th style="width:100px; text-align:right;">Tag</th>
		<th style="width:50px; text-align:right;">⚙</th>
	</tr>
</thead>

<tbody>
<?php foreach ($slots as $slot): ?>
<tr>
	<td><?=$slot['timeframe']?>&thinsp;h</td>
	<td><?=$slot['firstname']?> <?=$slot['lastname']?></td>
	<td><a class="noline" href="/slots/<?=$slot['id']?>"><?=$slot['notes'] ?? '-'?></a></td>
	<td><a class="noline" href="/slots/<?=$slot['id']?>"><?=$slot['category'] ?? 'Keine'?></a></td>
	<td class="text-right"><?=formatDate($slot['date'], 'd.m.Y')?></td>

	<td class="text-right" style="white-space:nowrap;">
		<a id="copy-prompt-<?=$slot['id']?>" title="kopieren" class="noline pointer"><img class="icon-delete" src="/styles/flundr/img/icon-copy.svg"></a>
		<fl-dialog selector="#copy-prompt-<?=$slot['id']?>" href="/slots/<?=$slot['id']?>/copy">
		<h1><?=$slot['id']?> - kopieren?</h1>
		<p>Möchten Sie den Klienten wirklich kopieren?</p>
		</fl-dialog>

		<a id="del-prompt-<?=$slot['id']?>"  title="löschen" class="noline pointer"><img class="icon-delete" src="/styles/flundr/img/icon-delete-black.svg"></a>
		<fl-dialog selector="#del-prompt-<?=$slot['id']?>" href="/slots/<?=$slot['id']?>/delete">
		<h1><?=$slot['id']?> - löschen?</h1>
		<p>Möchten Sie den Klienten wirklich löschen?</p>
		</fl-dialog>
	</td>

</tr>
<?php endforeach ?>
</tbody>
</table>


<hr>



<div class="grid-3-col wide-gap">
<section>
	<h3>Stundenaufkommen pro Klient</h3>
	<table class="fancy js-tablesort wide" style="table-layout: fixed;">
	<thead>
		<tr>
			<th>Klient</th>
			<th>Beansprucht</th>
			<th>Budget</th>
		</tr>
	</thead>

	<tbody>
	<?php foreach ($budgets as $client): ?>
	<tr>
		<td><?=$client['firstname']?> <?=$client['lastname']?></td>
		<td><?=$client['hours']?>&thinsp;h</td>
		<td><?=$client['budget']?>&thinsp;h</td>
	</tr>
	<?php endforeach ?>
	</tbody>
	</table>
</section>

<section>
	<h3>Stundenaufkommen pro Monat</h3>
	<table class="fancy js-tablesort wide" style="table-layout: fixed;">
	<thead>
		<tr>
			<th>Monat</th>
			<th>Stunden</th>
		</tr>
	</thead>

	<tbody>
	<?php foreach ($monthHours as $data): ?>
	<tr>
		<td><?=$data['month']?></td>
		<td><?=$data['hours']?>&thinsp;h</td>
	</tr>
	<?php endforeach ?>
	</tbody>
	</table>
</section>


<section>
	<h3>Stundenaufkommen nach Betreuer</h3>
	<table class="fancy js-tablesort wide" style="table-layout: fixed;">
	<thead>
		<tr>
			<th>Monat</th>
			<th>Stunden</th>
		</tr>
	</thead>

	<tbody>
	<?php foreach ($advisorHours as $data): ?>
	<tr>
		<td><?=$data['advisor']?></td>
		<td><?=$data['hours']?>&thinsp;h</td>
	</tr>
	<?php endforeach ?>
	</tbody>
	</table>
</section>

</div>


<div style="max-width:200px;" class="box fright">
<?php include tpl('navigation/date-picker');?>
</div>



</main>