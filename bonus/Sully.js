var index = 5;
const main=()=> {
	if (index <= 0)
		process.exit();
	try {
		require("fs").openSync("Sully_" + index + ".js", "r", () => {});
		index--;
	} catch (err) {}
	const string = "var index = " + index + ";\nconst main=" + main.toString() + "\nmain();\n";
	try {
		require("fs").writeFile("Sully_" + index + ".js", string, () => {
				const { exec }= require("child_process")
				exec("node ./Sully_" + index + ".js", () => {});
				});
	} catch (err) {
		process.exit();
	}
}
main();
