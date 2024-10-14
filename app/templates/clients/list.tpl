<main>

<div class="fright">
	<a href="/clients/new" class="button">Neuen Klient anlegen</a>
</div>

<h1>Klientenübersicht</h1>

<?php if (!$clients): ?>
<p>Zur Zeit sind keine Klienten angelegt</p>
<a href="/clients/new" class="button">Klient anlegen</a>	
<?php endif ?>



<table class="fancy wide" style="table-layout: fixed;">
<thead>
	<tr>
		<th style="width:10%">Budget</th>
		<th style="width:30%">Name</th>
		<th style="width:30%">Wohnort</th>
		<th style="width:30%">E-mail</th>
		<th style="width:20%">Telefon</th>
		<th style="width:100px">Erstellt</th>
		<th style="width:50px; text-align:right;">⚙</th>
	</tr>
</thead>

<tbody>
<?php foreach ($clients as $client): ?>
<tr>
	<td>

		<?=$hours[$client['id']] ?? '-'?> / 
		<?=$client['budget'] ?? '-'?> h</td>
	<td><a class="noline" href="/clients/<?=$client['id']?>"><?=$client['firstname']?> <?=$client['lastname']?></a></td>
	<td><?=$client['location'] ?? '-'?></td>
	<td><?=$client['email'] ?? '-'?></td>
	<td><?=$client['telephone'] ?? '-'?></td>


	<td style="white-space:nowrap;"><?=formatDate($client['created'],'Y-m-d')?></td>

	<td>
	<div class="flex-end">
		<a id="copy-prompt-<?=$client['id']?>" title="kopieren" class="noline pointer"><img class="icon-delete" src="/styles/flundr/img/icon-copy.svg"></a>
		<fl-dialog selector="#copy-prompt-<?=$client['id']?>" href="/clients/<?=$client['id']?>/copy">
		<h1><?=$client['lastname']?> - kopieren?</h1>
		<p>Möchten Sie den Klienten wirklich kopieren?</p>
		</fl-dialog>

		<a id="del-prompt-<?=$client['id']?>"  title="löschen" class="noline pointer"><img class="icon-delete" src="/styles/flundr/img/icon-delete-black.svg"></a>
		<fl-dialog selector="#del-prompt-<?=$client['id']?>" href="/clients/<?=$client['id']?>/delete">
		<h1><?=$client['lastname']?> - löschen?</h1>
		<p>Möchten Sie den Klienten wirklich löschen?</p>
		</fl-dialog>
	</div>
	</td>

</tr>
<?php endforeach ?>
</tbody>
</table>




	


</main>