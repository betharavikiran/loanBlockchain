import KarmaDatabaseInterface from './../build/contracts/KarmaDatabaseInterface'


const drizzleOptions = {
  web3: {
    block: false,
    fallback: {
      type: 'ws',
      url: 'ws://127.0.0.1:8545'
    }
  },
  contracts: [
   KarmaDatabaseInterface,
  ],
  events: {
      KarmaDatabaseInterface: ['LogNewCustomer', 'LogNewServiceProvider','LogLoanApplied']
  },
  polls: {
    accounts: 1500
  }
}

export default drizzleOptions