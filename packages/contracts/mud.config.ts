import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  enums: {
    RaceType: ["Human", "Beast", "Elf", "Undead" ]
  },
  tables: {
    Attribute: {
      keySchema: {},
      schema: {
        attack: "uint256",
        hp: "uint256",
        coin: "uint256",
        exp: "uint256",
      },
    },
    Skill:{
      keySchema: {},
      schema: {
        exists: "bool",
        cooldown: "bytes32",
        effect: "bytes32",
      },
    },
    Buff:{
      keySchema: {},
      schema: {
        duration: "uint256",
        effect: "bytes32",
      },
    },
    Synthesis:{
      keySchema: {},
      schema: {
        duration: "uint256",
        effect: "bytes32",
      },
    },
    Hero:{
      keySchema: {
        player: "bytes32",
      },
      schema: {
        race: "RaceType",
        lv: "uint256",
      },
    },
    Race: "RaceType",
    Position: {
      dataStruct: false,
      schema: {
        x: "uint32",
        y: "uint32",
      },
    },
  },
});
