document.addEventListener("DOMContentLoaded", () => {
	const link = document.querySelector(".link");
	if (!link) {
		return;
	}

	const text = link.querySelector(".link-text");
	if (!text) {
		return;
	}

	const text_original = text.textContent || "";
	const text_hover = link.getAttribute("hover-text") || text_original;

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
