import './ListPolyclinic.scss';
import Sidebar from '../../components/sidebar/Sidebar';
import DataPolyclinic from '../../components/dataPolyclinic/DataPolyclinic';

const ListPolyclinic = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <DataPolyclinic />
      </div>
    </div>
  );
};

export default ListPolyclinic;
