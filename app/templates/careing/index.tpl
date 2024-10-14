<main>

<div class="fright submenu">
	<a href="/slots/new" class="button">Stunden erfassen</a>
</div>

<h1>Monatsberichte</h1>


<table class="fancy">
<thead>
	<tr>
		<th>Klient</th>
		<th>Zeiträume</th>
	</tr>
</thead>
<tbody>

<?php foreach ($clients as $client): ?>

<tr>
	<td><a href="/clients/<?=$client['id']?>"><?=$client['name']?></a></td>
	<td>
		<ul class="pills">
<?php foreach ($client['months'] as $month): ?>
	<li><a href="/careing/<?=$client['id']?>?month=<?=str_replace(' ','+', $month)?>"><?=$month?></a></li>
<?php endforeach ?>
		</ul>
	</td>
</tr>

<?php endforeach ?>

</tbody>	
</table>


</main>