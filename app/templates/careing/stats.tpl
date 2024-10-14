<main>
<h1>Statistiken</h1>

<div class="grid-2-col wide-gap">
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


<section>
	<h3>Stundenaufkommen nach Kategorie</h3>
	<table class="fancy js-tablesort wide" style="table-layout: fixed;">
	<thead>
		<tr>
			<th>Monat</th>
			<th>Stunden</th>
		</tr>
	</thead>

	<tbody>
	<?php foreach ($categorieHours as $data): ?>
	<tr>
		<td><?=$data['category']?></td>
		<td><?=$data['hours']?>&thinsp;h</td>
	</tr>
	<?php endforeach ?>
	</tbody>
	</table>
</section>

</div>

</main>