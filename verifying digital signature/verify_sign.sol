pragma solidity ^0.4.17;

contract DigitalDocumentSigning
{
	// name of the Organisation
    string public Organisation;

	// Owner of the Organisation
    address public ownerOfOrganisation;

	// store and retrieve the signed documents using hashing.
    mapping(bytes32=>string) digitallySignedDocuments;
	
    
	// constructor
    function DigitalDocumentSigning (string Organisation_name) public 
    {
	// storing the owner address.
        ownerOfOrganisation=msg.sender;

	// storing the owner organisation name.
        Organisation=Organisation_name;
    }
    

        // Function to sign the user document.
    function SignDocument(string hashOfDocument,string SignatureOfDocumentByOrganisation) public 
    {
        require(msg.sender==ownerOfOrganisation);
        digitallySignedDocuments[keccak256(hashOfDocument)]=SignatureOfDocumentByOrganisation;
    }
    
        // Function to remove the user document.
    function RemoveDocumentFromOrganisation(string hashOfDocument)public 
    {
	// verify whether document is removed only by the owner of the organisation.
        require(msg.sender==ownerOfOrganisation);
	// delete the document.
        delete digitallySignedDocuments[keccak256(hashOfDocument)];

	//keccak256==sha3 , to get the 32bytes of hash.
    }
    
	// Function to verify whether the documnet is signed or not.
    function getTheSignatureOfDocument(string hashOfDocument) public view returns(string)
    {
        return digitallySignedDocuments[keccak256(hashOfDocument)];
    }
   
}