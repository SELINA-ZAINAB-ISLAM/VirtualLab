// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract VirtualLab {

    // Creating Structure to have details of an experiment
    struct Experiment {
        uint id;
        string name;
        string description;
        address owner;
        uint timestamp;
    }

    // Mapping to store experiments by their ID
    mapping(uint => Experiment) public experiments;

    // Creating an Event to emit when a new experiment is submitted
    event ExperimentSubmitted(uint id, string name, address owner, uint timestamp);

    // Variable to keep track of the number of experiments
    uint public experimentCount;

    // Creating a Function to submit a new experiment
    function submitExperiment(string memory _name, string memory _description) public {
        // Increment the experiment count
        experimentCount++;

        // Creating a new experiment and storing it
        experiments[experimentCount] = Experiment(experimentCount, _name, _description, msg.sender, block.timestamp);

        // Emiting the event
        emit ExperimentSubmitted(experimentCount, _name, msg.sender, block.timestamp);
    }

    // Creating Function to retrieve experiment details by ID
    function getExperiment(uint _id) public view returns (uint, string memory, string memory, address, uint) {
        Experiment memory exp = experiments[_id];
        return (exp.id, exp.name, exp.description, exp.owner, exp.timestamp);
    }
}