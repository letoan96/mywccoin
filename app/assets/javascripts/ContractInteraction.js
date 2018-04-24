// = require web3
var w3 = new Web3() //web3js 1.0
w3.setProvider(web3.currentProvider)//set the provider of web3 to metamask's current provider (mainnet, ropsten,rinkeby,...)

var WCCArtifact //compiled code of coin contract
var wccContract //contract object
var BetArtifact

fetch('/contracts/WCC.json')
    .then((resp) => { return resp.json() })
    .then((abi) => {
        WCCArtifact = abi
        wccContract = new w3.eth.Contract(WCCArtifact.abi, "0xF2dF313F36567b7e70a8E9B97E876550E1B8dAcD") // token contract address
    })

fetch('/contracts/WorldcupBetting.json')
    .then((resp) => { return resp.json() })
    .then((abi) => {
        BetArtifact = abi
    })

function claimToken(newAccount) {
    var amount = document.getElementById('amount').value
    wccContract.methods.transfer(newAccount.address, amount)
        .send({
            from: "0x4921f3714740C12A554205B884054285a8416298" // admin address
        })
        .then((result) => {
            console.log(result)
        })
}

function placeBet() {
    wccContract.methods.approveAndCall()
        .send({
            from: w3.eth.accounts[0]
        })
        .then((res) => {
            if (res.events.Approval.returnValues._owner) {
                //check allowance (bet contract address - user address)
                //execute bet
            }
        })

}

function initBet() {
    var BetContract = new w3.eth.Contract(BetArtifact.abi)
    BetContract
    .deploy({
        data: BetArtifact.bytecode
    })
    .send({
        from: w3.eth.accounts[0]
    })
    .then((contractInstance) => {
      console.log(contractInstance)  
    })
}

$('#new_user').on('submit', () => {
    if (!web3) {
        alert('Please install Metamask extension first!')
        return false
    }
    var newAccount = w3.eth.accounts.create()
    document.getElementById('user_wallet_address').value = newAccount.address
    document.getElementById('user_private_key').value = newAccount.privateKey
    return true
})