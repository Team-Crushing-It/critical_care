
/* allow us to use our .env variables */

require("dotenv").config();



/* import the Hedera JavaScript SDK */

const { Client, CryptoTransferTransaction, AccountBalanceQuery  } = require("@hashgraph/sdk");



/* create a new asynchronous function */

async function main(idThing) {



/* grab our testnet credentials from our .env file */

const operatorAccount = idThing;

const operatorPrivateKey = "302e020100300506032b657004220420b9cdcce9a18bcefa21f332a968ffec63c0d727f318c474763420e3f7bbf02e97";



/* configure our testnet client */

const client = Client.forTestnet();

client.setOperator(operatorAccount, operatorPrivateKey);



/* send our first hbar transfer! */
const balance = await new AccountBalanceQuery()
.setAccountId(operatorAccount)
.execute(client);

console.log(`${operatorAccount} balance = ${balance.asTinybar()}`);

const transactionId = await new CryptoTransferTransaction()

.addSender(operatorAccount, 100000000)

.addRecipient("0.0.55494", 100000000)

.setTransactionMemo("Hello future!")

.execute(client);



/* get the receipt of this transfer */

const receipt = await transactionId.getReceipt(client);

console.log(receipt);
return "hi";

}



/* call our async function */ 

console.log(main("0.0.68350"));