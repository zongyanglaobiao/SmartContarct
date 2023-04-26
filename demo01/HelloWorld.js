const Web3 = require('web3');
const abi = require('../output/demo01_HelloWorld_sol_HelloWorld.abi');
const bytecode = require('../output/demo01_HelloWorld_sol_HelloWorld.bin');

const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))

let HelloWorldContract = new web3.eth.Contract(abi);

HelloWorldContract.deploy({
  data: bytecode,
  arguments: ['Hello World!']
}).send({
  from: '0xYourAccountAddress',
  gas: 1500000,
  gasPrice: '3000000000'

}).then((contract) => {
  console.log(contract.options.address);
  contract.methods.setMessage('Hello, VS code!')
    .send({ from: '0xYourAccountAddress' }, (error, result) => {
      console.log(result);
      contract.methods.message().call({ from: '0xYourAccountAddress' }, (error, message) => {
        console.log(message);
      });
    });
});