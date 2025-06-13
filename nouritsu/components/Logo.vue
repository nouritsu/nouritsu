<template>
<pre class="logo">
                         _ _             
  _ __   ___  _   _ _ __(_) |_ ___ _   _ 
 | '_ \ / _ \| | | | '__| | __/ __| | | |
 | | | | (_) | |_| | |  | | |_\__ \ |_| |
 |_| |_|\___/ \__,_|_|  |_|\__|___/\__,_|
</pre>
</template>

<style scoped lang="scss">
.logo {
	line-height: 1.1;
	font-size: 2.25rem;
	margin: 0; // Reset all margins
	text-align: center;
	white-space: pre;
	overflow-x: auto;
	background-color: transparent; // Override the default pre background

	// Gradient for text
	background-image: linear-gradient(
		to right,
		var(--red),
		var(--yellow),
		var(--green),
		var(--mauve),
		var(--pink)
	);

	background-size: 100%;
	width: fit-content;
	-webkit-background-clip: text;
	background-clip: text;
	color: transparent;

	// Center
	margin-left: auto;
	margin-right: auto;
}
</style>