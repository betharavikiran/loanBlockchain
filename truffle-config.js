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
            host: "192.168.1.117",
            port: 8546,
            network_id: "5777", // Match any network id
            gas: 6712390,
            gasPrice: 1
        }
    },
    rpc:{
        host: "192.168.1.117",
        port: 8545,
    }
};
