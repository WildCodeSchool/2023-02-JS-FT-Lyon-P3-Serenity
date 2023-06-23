import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import PropTypes from "prop-types";
import notifySuccess, {
  notifyError,
} from "../../../services/ToastNotificationService";
import APIService from "../../../services/APIService";

export default function DeleteProtocol({
  selectedProtocol,
  setSelectedProtocol,
  setIsShow,
}) {
  // Submit Delete Protocol Request
  const handleDelete = async () => {
    if (selectedProtocol !== "") {
      try {
        const res = await APIService.delete(`/protocols/${selectedProtocol}`);
        if (res) {
          notifySuccess("Le protocole a bien été supprimé.");
          setSelectedProtocol("");
          setIsShow({ modalC: false });
        }
        throw new Error();
      } catch (error) {
        if (error.request?.status === 500) {
          notifyError("La requête a échouée.");
        }
      }
    }
  };

  return (
    <div className="flex flex-col items-center justify-between p-4 lg:p-8">
      <h1 className="self-start text-lg font-semibold lg:text-xl">
        Supprimer ce protocole ?
      </h1>
      <div className="flex gap-2">
        <button
          type="button"
          className="my-4 h-fit w-fit self-center rounded-lg border-2 border-violet-dark-0 bg-violet-dark-0 px-6 py-3 text-sm text-slate-100 shadow-lg transition-all hover:border-violet-light-0 hover:bg-violet-light-0 disabled:border-slate-300 disabled:bg-slate-300 lg:mt-8"
          onClick={handleDelete}
        >
          Oui
        </button>
        <button
          type="button"
          className="my-4 h-fit w-fit self-center rounded-lg border-2 border-violet-dark-0 bg-violet-dark-0 px-6 py-3 text-sm text-slate-100 shadow-lg transition-all hover:border-violet-light-0 hover:bg-violet-light-0 disabled:border-slate-300 disabled:bg-slate-300 lg:mt-8"
          onClick={() => setIsShow({ modalC: false })}
        >
          Non
        </button>
      </div>
      <ToastContainer limit={1} />
    </div>
  );
}

DeleteProtocol.propTypes = {
  selectedProtocol: PropTypes.string.isRequired,
  setSelectedProtocol: PropTypes.shape().isRequired,
  setIsShow: PropTypes.shape().isRequired,
};
