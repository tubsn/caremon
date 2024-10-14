<main>

<div class="fright submenu">
	<a href="/slots/new" class="button">Stunden erfassen</a>
	<!--
	<div style="max-width:200px;" class="box">
		<?php include tpl('navigation/date-picker');?>
	</div>
	-->
</div>

<h1><?=$client['firstname']?> <?=$client['lastname']?> - <?=$selectedMonthGerman?></h1>

<div style="display:flex; align-items:strech; gap:1.5em; margin-bottom:3em;">

<div class="address-box">
<b><a href="/clients/<?=$client['id']?>"><?=$client['firstname']?> <?=$client['lastname']?>
</a></b><br>
<?=$client['address']?><br>
<?=$client['plz']?> <?=$client['location']?>
</div>

<table class="fancy" style="margin-bottom:0;">
<thead>
	<tr>
		<th>Betreuung</th>
		<th></th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>ASD:</td>
		<td><?=$client['asd'] ?? 'offen'?></td>
	</tr>
	<tr>
		<td>Lerntherapeuth: </td>
		<td><?=implode(', ', $advisors) ?></td>
	</tr>	
</tbody>	
</table>

</div>

<h3>Stundenübersicht: &ensp; <?=$usedBudget?>&thinsp;h / <?=$client['budget']?>&thinsp;h</h3>

<?php if (!empty($hours)): ?>
<table class="fancy js-tablesort" style="table-layout: fixed; margin-bottom:3em;">
<thead>
	<tr>
		<th style="width:100px;">Tag</th>
		<th>Dauer</th>
		<th>Therapeut</th>
		<th>Beschreibung</th>
		<th>Kategorie</th>
	</tr>
</thead>
<tbody>

	<?php foreach ($hours as $hour): ?>
	<tr>
		<td><?=formatDate($hour['date'],'d.m.Y')?></td>
		<td><a href="/slots/<?=$hour['id']?>"><?=$hour['timeframe']?>&thinsp;h</a></td>
		<td><?=$hour['advisor']?></td>
		<td><a href="/slots/<?=$hour['id']?>"><?=$hour['notes'] ?? '-'?></a></td>
		<td><?=$hour['category']?></td>
	</tr>
	<?php endforeach ?>
</tbody>
</table>

<?php else: ?>
Für diesen Monat sind keine Stunden erfasst.
<?php endif ?>

</main>
