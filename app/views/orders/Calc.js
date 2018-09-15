var form = document.getElementById("calc"),
		out = document.querySelector("#calc output"),
		overwrite = true;

	function result(noDisplay) {
		var input = out.value,
			r = 0;
		// replace × with * and ÷ with / for eval()
		input = input.replace(/×/g, "*")
			.replace(/÷/g, "/");
		// remove anything else that is not allowed here
		input = input.replace(/[^0-9. +\-*\/]/g, "");
		try {
			r = eval(input);
		} catch (e) {
			r = 0;
		}
		if (noDisplay !== true) {
			out.value = r;
			overwrite = true;
		}
		return r;
	}

	function extra(type) {
			switch (type) {
			case "√":
				out.value = Math.sqrt(result(true));
				break;
			case "x²":
				out.value = Math.pow(result(true), 2);
				break;
			case "ln":
				out.value = Math.log(result(true));
				break;
			}
			overwrite = true;
		}
		// initialize only if <output> is found and browser supports Array.from()
	if (out && typeof Array.from == "function") {
		form.addEventListener("submit", function (ev) {
			// prevent form submission and page reload
			ev.preventDefault();
			ev.stopPropagation();
			return false;
		});
		// button functionalities
		Array.from(document.querySelectorAll("#calc button"))
			.forEach(function (b) {
				var c = b.textContent;
				switch (c) {
				case "9":
				case "8":
				case "7":
				case "6":
				case "5":
				case "4":
				case "3":
				case "2":
				case "1":
				case "0":
				case ".":
					b.addEventListener("click", function () {
						// remove leading zero?
						if (overwrite) {
							out.value = (c == "." ? "0." : c);
						} else {
							out.value += c;
						}
						overwrite = false;
					});
					break;
				case "+":
				case "-":
				case "×":
				case "÷":
					b.addEventListener("click", function () {
						out.value += " " + c + " ";
						overwrite = false;
					});
					break;
				case "√":
				case "x²":
				case "ln":
					b.addEventListener("click", function () {
						extra(c);
					});
					break;
				case "=":
					b.addEventListener("click", result);
					break;
				case "C":
					b.addEventListener("click", function () {
						out.value = 0;
						overwrite = true;
					});
					break;
				}
			});
	}
});
