<main>

<div class="fright submenu">
	<a href="/slots/new" class="button">Stunden erfassen</a>
</div>


<h1>Stundenerfassung</h1>

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
	<td><a href="/slots/<?=$slot['id']?>"><?=$slot['firstname']?> <?=$slot['lastname']?></a></td>
	<td><a class="noline" href="/slots/<?=$slot['id']?>"><?=$slot['notes'] ?? '-'?></a></td>
	<td><?=$slot['category'] ?? 'Keine'?></td>
	<td class="text-right"><?=formatDate($slot['date'], 'd.m.Y')?></td>

	<td>
		<div class="flex-end">
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
		</div>
	</td>

</tr>
<?php endforeach ?>
</tbody>
</table>

<?=$pager?>

</main>