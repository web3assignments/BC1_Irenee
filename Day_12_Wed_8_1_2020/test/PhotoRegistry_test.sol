pragma solidity >=0.4.0 <0.6.0;
pragma experimental ABIEncoderV2;

      import "PhotoRegistry.sol"; // this import is automatically injected by Remix.

      // file name has to end with '_test.sol'
      contract PhotoRegistry_test {

        PhotoRegistry PR;
        struct PhotoData {
            uint256 photoID;
            address registrant;
            string ipfsHash;
            string photographer;
            string photoLocation;
        }

        function beforeAll() public {
          // here should instantiate tested contract
          PR = new PhotoRegistry();
          // assert.isEmpty(PR.photoIDs, "photoID should be empty");
          // registrant = msg.sender; How to get msg.sender in test
        }

        function registerOnePhoto() public {
          // use 'Assert' to test the contract
          PR.registerPhoto(
              "QmdCntgXiAotyTBR1v3CeNUoRNtVc3Gu3ScneCA4Zr9iWX", 
              "Tester", 
              "Test Location");
          PR.PhotoData registeredPhotos = PR.getRegistry(1);
          assert.equal(registeredPhotos.photoID, 1, "PhotoID should be 1 now");
          // Assert.equal(PR.photos(1).registrant, msg.sender, "Registrant should be msg.sender now");
          assert.equal(PR.photos(1).ipfsHash, "QmdCntgXiAotyTBR1v3CeNUoRNtVc3Gu3ScneCA4Zr9iWX", "ipfsHash should be QmdCntgXiAotyTBR1v3CeNUoRNtVc3Gu3ScneCA4Zr9iWX now");
          assert.equal(PR.photos(1).photographer, "Tester", "photographer should be Tester now");
          assert.equal(PR.photos(1).photoLocation, "Test Location", "photoLocation should be Test Location now");
        }

      }
