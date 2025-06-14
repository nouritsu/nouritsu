document.addEventListener("DOMContentLoaded", () => {
	const link = document.querySelector(".link");
	if (!link) {
		return;
	}

	const href = link.getAttribute("href");
	if (href && href.startsWith("mailto:")) {
		let parts = href
			.replace("mailto:", "")
			.split(":")
			.map((part) => atob(part));

		if (parts.length === 3) {
			const [usr, srv, dom] = parts;
			link.setAttribute("href", `mailto:${usr}@${srv}.${dom}`);
		}
	}

	const text = link.querySelector(".link-text");
	if (!text) {
		return;
	}

	const text_original = text.textContent || "";
	const text_hover = text.getAttribute("hover-text") || text_original;

	// Current page based changes
	const link_type = link.getAttribute("link-type");
	if (link_type === "internal") {
		const current_page_url = window.location.pathname;
		if (current_page_url.toLowerCase().includes(text_original.toLowerCase())) {
			const open = link.querySelector(".bracket-open");
			const close = link.querySelector(".bracket-close");

			if (open && close) {
				open.textContent = "(";
				close.textContent = ")";
			}
		}
	}

	const open = link.querySelector(".bracket-open");
	const close = link.querySelector(".bracket-close");
	if (!open || !close) {
		return;
	}

	const open_original = open.textContent || "[";
	const close_original = close.textContent || "]";

	// Hover based changes
	if (open && text && close) {
		link.addEventListener("mouseover", () => {
			open.textContent = "(";
			text.textContent = text_hover;
			close.textContent = ")";
		});

		link.addEventListener("mouseout", () => {
			open.textContent = open_original;
			text.textContent = text_original;
			close.textContent = close_original;
		});
	}
});
