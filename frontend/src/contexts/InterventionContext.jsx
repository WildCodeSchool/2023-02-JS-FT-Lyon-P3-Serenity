import { createContext, useContext, useEffect, useMemo, useState } from "react";
import PropTypes from "prop-types";
import APIService from "../services/APIService";
import { useUserContext } from "./UserContext";

const InterventionContext = createContext();

export default InterventionContext;

export function InterventionContextProvider({ children }) {
  const { user } = useUserContext();
  const [protocols, setProtocols] = useState(null);

  useEffect(() => {
    APIService.get(`/operations/${user.operation_id}`)
      .then((res) => setProtocols(res.data))
      .catch((err) => console.error(err));
  }, []);

  const memo = useMemo(() => {
    return { protocols };
  }, [protocols]);

  return (
    <InterventionContext.Provider value={memo}>
      {children}
    </InterventionContext.Provider>
  );
}

export const useInterventionContext = () => useContext(InterventionContext);

InterventionContextProvider.propTypes = {
  children: PropTypes.arrayOf(PropTypes.shape()).isRequired,
};
