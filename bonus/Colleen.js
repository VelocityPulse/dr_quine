/*
	comment1
*/
const func=()=>{}

const main=()=> {
/*
	comment2
*/
	func();
	console.log("/*\n\tcomment1\n*/\nconst func=()=>{}\n\nconst main=" + main.toString() + "\nmain();")
}
main();
