// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, consle} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";
contract FundMeTest is Test {
    FundMe fundMe;

    address USER = makeAddr("user");
    unit256 constant SEND_VALUE = 0.1 ether;
    unit256 constant STARTNG_BALANCE = 100 ether;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTNG_BALANCE);
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundme.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsSender() public {
        assertEq(fundMe.getOwner(), msg.sender);
    }
    function testPriceFeedVersionIsAccurate() public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
    function testFundFailsWithoutEnoughEth() public {
        vm.expectRevert();

        fundMe.fund();
    }
    function testFundUpdatesFundedDataStructure() public {
        vm.prank(USER);
        fundMe.fund{value: SEND_VALUE}();
        unit256 amountFunded = fundMe.getAddressToAmountFunded(address(this));
        assertEq(amountFunded, SEND_VALUE);
    }

    function testAddsFunderToArrayOfFunders() public {
        vm.prank(USER);
        fundMe.fund{value: SEND_VALUE}();

        address funder = fundMe.getFunders(0);
        assertEq(funder, USER);
    }

    modifier funded() {
        vm.prank(USER);
        FundMe.fund{value: SEND_VALUE}();
        _;
    } // using this modifier if in test whe need to repeat the funding process to many times

    function testOnlyOwnerCanWithdraw() public funded {
        vm.expectRevert();
        vm.prank(USER);
        fundMe.withdraw();
    }

    function testWithdrawASingleFunder() public funded {
        // Arrange
        unit256 startingOwnerBalance = fundMe.getOwner().balance;
        unit256 startingFunderBalance = address(fundMe).balance;

        // Act
        vm.prank(fundMe.getOwner());
        fundMe.withdraw();
        // Assert

        unit256 endingOwnerBalance = fundMe.getOwner().balance;
        unit256 endingFunMeBalance = address(fundMe).balance;
        assertEq(endingOwnerBalance, 0);
        assertEq(
            startingFundMeBalance + startingOwnerBalance,
            endingFundMeBalance
        );
    }

    
}
