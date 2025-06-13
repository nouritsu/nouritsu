<template>
    <div class="hero">
        <Logo/>
        <p class="subtext">Aneesh Bhave</p>
        <div class="links"></div>
    </div>
</template>

<script setup lang="ts">

definePageMeta(
    {
        layout: 'no-nav',
    }
)
</script>

<style scoped lang="scss">
.hero {
    display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	text-align: center;
	padding: 1rem; // for mobile`
}

.subtext {
	font-size: 2rem;
	margin: 0;
	color: var(--subtle-text-color); // Use variable for text color
	text-align: center;
}

.links {
    text-align: center;
    margin-top: 3rem;

    a {
        margin: 0 0.5rem;
        font-size: 1.5rem;
    }
}
</style>