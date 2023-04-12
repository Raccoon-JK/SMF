/**
 * @param {int} price
 */
function priceFormat(price){
	let numberWithCommas = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return numberWithCommas 	
}