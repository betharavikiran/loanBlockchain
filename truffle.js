module.exports = {
  migrations_directory: "./migrations",
  networks: {
    development: {
        host: "192.168.1.117",
        port: 8545,
        network_id: "*", // Match any network id
        gas: 6712390,
        gasPrice: 1
    },
    local: {
        host: "http://192.168.1.117",
        port: 8546,
        network_id: "5777", // Match any network id
        gas: 6712390,
        gasPrice: 1
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 500
    }
  },
  rpc:{
      host: "http://192.168.1.117",
      port: 8545,
  }
};
