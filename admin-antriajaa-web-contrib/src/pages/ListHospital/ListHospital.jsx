import './ListHospital.scss';
import Sidebar from '../../components/sidebar/Sidebar';
import DataHospital from '../../components/dataHospital/DataHospital';

const ListHospital = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <DataHospital />
      </div>
    </div>
  );
};

export default ListHospital;
