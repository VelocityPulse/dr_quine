/*
	comment1
*/
const DEFINEA = 1
const DEFINEB = 2
const MAIN=()=> {
	const file = "Grace_kid.js";
	const string = "/*\n\tcomment1\n*/\nconst DEFINEA = 1\nconst DEFINEB = 2\nconst MAIN=" + MAIN.toString() + "\nMAIN()\n"
	try {
		require("fs").writeFile(file, string, () => {});
	} catch (err) {
		process.exit();
	}
}
MAIN()
