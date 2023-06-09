// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

// Import user types
import { RaceType } from "./../Types.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Hero")));
bytes32 constant HeroTableId = _tableId;

struct HeroData {
  RaceType race;
  uint256 lv;
}

library Hero {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.UINT8;
    _schema[1] = SchemaType.UINT256;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](2);
    _fieldNames[0] = "race";
    _fieldNames[1] = "lv";
    return ("Hero", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get race */
  function getRace(bytes32 player) internal view returns (RaceType race) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return RaceType(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Get race (using the specified store) */
  function getRace(IStore _store, bytes32 player) internal view returns (RaceType race) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return RaceType(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Set race */
  function setRace(bytes32 player, RaceType race) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(race)));
  }

  /** Set race (using the specified store) */
  function setRace(IStore _store, bytes32 player, RaceType race) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(race)));
  }

  /** Get lv */
  function getLv(bytes32 player) internal view returns (uint256 lv) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get lv (using the specified store) */
  function getLv(IStore _store, bytes32 player) internal view returns (uint256 lv) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set lv */
  function setLv(bytes32 player, uint256 lv) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((lv)));
  }

  /** Set lv (using the specified store) */
  function setLv(IStore _store, bytes32 player, uint256 lv) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((lv)));
  }

  /** Get the full data */
  function get(bytes32 player) internal view returns (HeroData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 player) internal view returns (HeroData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 player, RaceType race, uint256 lv) internal {
    bytes memory _data = encode(race, lv);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 player, RaceType race, uint256 lv) internal {
    bytes memory _data = encode(race, lv);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 player, HeroData memory _table) internal {
    set(player, _table.race, _table.lv);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 player, HeroData memory _table) internal {
    set(_store, player, _table.race, _table.lv);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (HeroData memory _table) {
    _table.race = RaceType(uint8(Bytes.slice1(_blob, 0)));

    _table.lv = (uint256(Bytes.slice32(_blob, 1)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(RaceType race, uint256 lv) internal view returns (bytes memory) {
    return abi.encodePacked(race, lv);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 player) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 player) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 player) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    _store.deleteRecord(_tableId, _keyTuple);
  }
}