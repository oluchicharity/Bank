import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import { ethers } from "hardhat";

const BankModule = buildModule("BankModule", (m) => {
    const deployBank= m.contract("Bank", []);

    return { deployBank};
});

export default BankModule;