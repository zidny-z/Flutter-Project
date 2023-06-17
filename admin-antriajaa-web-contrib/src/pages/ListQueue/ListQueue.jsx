import './ListQueue.scss';
import Sidebar from '../../components/sidebar/Sidebar';
import DataQueue from '../../components/dataQueue/DataQueue';

const ListPolyclinic = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <DataQueue />
      </div>
    </div>
  );
};

export default ListPolyclinic;
