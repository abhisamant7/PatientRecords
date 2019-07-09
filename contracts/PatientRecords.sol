pragma solidity >=0.4.22 <0.6.0;

contract PatientRecords {

struct Patient {
    string ID;
    string name;
    string Email;
    string Contact_Number;
    string Address;
} 

struct Doctor {
    string ID;
    string name;
    string Email;
    string Contact_Number;
    string Address;
} 

address doctor;
address patient;

constructor() public {
    doctor = msg.sender;
        patient = msg.sender;
}

modifier onlydoctor() {
    if (msg.sender == doctor) {
        _;
    }
} 

modifier onlypatient() {
    if (msg.sender == patient ) {
        _;
    }
} 

modifier onlyOwnerOrStudent() { 
         if (msg.sender == patient || msg.sender == doctor) _; 
}


Patient[] public patients;

function registerPatient(
    string memory  _name, 
    string memory _ID, 
   string memory  _Email,  
  string memory  _Contact_Number, string memory  _Address) public onlypatient {
        patients.push(Patient(_name, _ID, _Email, _Contact_Number,_Address));
    }


function registerDoctor(
    string memory  _name, 
    string memory _ID, 
   string memory  _Email,  
  string memory  _Contact_Number, string memory  _Address) public onlydoctor {
        patients.push(Patient(_name, _ID, _Email, _Contact_Number,_Address));
    }
}