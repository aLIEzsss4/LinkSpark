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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Buff")));
bytes32 constant BuffTableId = _tableId;

struct BuffData {
  uint256 duration;
  bytes32 effect;
}

library Buff {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.UINT256;
    _schema[1] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](0);

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](2);
    _fieldNames[0] = "duration";
    _fieldNames[1] = "effect";
    return ("Buff", _fieldNames);
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

  /** Get duration */
  function getDuration() internal view returns (uint256 duration) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get duration (using the specified store) */
  function getDuration(IStore _store) internal view returns (uint256 duration) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set duration */
  function setDuration(uint256 duration) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((duration)));
  }

  /** Set duration (using the specified store) */
  function setDuration(IStore _store, uint256 duration) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((duration)));
  }

  /** Get effect */
  function getEffect() internal view returns (bytes32 effect) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get effect (using the specified store) */
  function getEffect(IStore _store) internal view returns (bytes32 effect) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (Bytes.slice32(_blob, 0));
  }

  /** Set effect */
  function setEffect(bytes32 effect) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((effect)));
  }

  /** Set effect (using the specified store) */
  function setEffect(IStore _store, bytes32 effect) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((effect)));
  }

  /** Get the full data */
  function get() internal view returns (BuffData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store) internal view returns (BuffData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(uint256 duration, bytes32 effect) internal {
    bytes memory _data = encode(duration, effect);

    bytes32[] memory _keyTuple = new bytes32[](0);

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, uint256 duration, bytes32 effect) internal {
    bytes memory _data = encode(duration, effect);

    bytes32[] memory _keyTuple = new bytes32[](0);

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(BuffData memory _table) internal {
    set(_table.duration, _table.effect);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, BuffData memory _table) internal {
    set(_store, _table.duration, _table.effect);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (BuffData memory _table) {
    _table.duration = (uint256(Bytes.slice32(_blob, 0)));

    _table.effect = (Bytes.slice32(_blob, 32));
  }

  /** Tightly pack full data using this table's schema */
  function encode(uint256 duration, bytes32 effect) internal view returns (bytes memory) {
    return abi.encodePacked(duration, effect);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple() internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](0);
  }

  /* Delete all data for given keys */
  function deleteRecord() internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
