require('@nomicfoundation/hardhat-toolbox')
const { alchemyRPCs, accounts } = require('./privateKey')

module.exports = {
	networks: {
		mumbai: {
			url: alchemyRPCs.mumbai,
			accounts,
		},
		goerli: {
			url: alchemyRPCs.goerli,
			accounts,
		},
	},
	solidity: '0.8.4',
}
  