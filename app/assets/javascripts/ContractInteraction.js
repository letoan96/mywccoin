// = require web3
var w3 = new Web3() //web3js 1.0
w3.setProvider(web3.currentProvider)//set the provider of web3 to metamask's current provider (mainnet, ropsten,rinkeby,...)

var WCCArtifact //compiled code of coin contract
var wccContract //contract object

fetch('/contracts/WCC.json')
    .then((resp) => { return resp.json() })
    .then((abi) => {
        WCCArtifact = abi
        wccContract = new w3.eth.Contract(WCCArtifact.abi, "0x577d323c06d7ba68c4659e8dedcb41336feb84ac") // token contract address
    })

function claimToken() {
    var amount =  document.getElementById('amount').value
    wccContract.methods.transfer(account.address, amount)
        .send({
            from: "0x4921f3714740C12A554205B884054285a8416298" // admin address
        })
        .then((result) => {
            console.log(result)
        })
}

$('#new_user').on('submit', () => {
    if (!web3) {
        alert('Please install Metamask extension first!')
        return false
    }
    var newAccount = w3.eth.accounts.create()
    document.getElementById('user_wallet_address') = newAccount.address
    claimToken();
    return true
})