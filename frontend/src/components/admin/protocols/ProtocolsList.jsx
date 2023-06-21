import React from "react";
import PropTypes from "prop-types";
import { Link } from "react-router-dom";

export default function ProtocolsList({ protocol }) {
  return (
    <li className="flex h-12 w-full list-none items-center justify-between border-b-[1px] border-slate-200 transition-all lg:h-20 lg:border-gray-300 lg:hover:bg-gray-300">
      <Link
        to={`${protocol.protocol_id}`}
        className="flex w-full items-center justify-between lg:px-4"
      >
        <p className="text-xs font-semibold lg:text-base">
          {protocol.protocol_name}
        </p>
        <p className="text-xs lg:text-base">{protocol.operation_name}</p>
      </Link>
    </li>
  );
}

ProtocolsList.propTypes = {
  protocol: PropTypes.shape().isRequired,
};