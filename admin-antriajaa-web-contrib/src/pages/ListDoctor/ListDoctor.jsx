import './ListDoctor.scss';
import Sidebar from '../../components/sidebar/Sidebar';
import DataDoctor from '../../components/dataDoctor/DataDoctor';

const ListDoctor = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <DataDoctor />
      </div>
    </div>
  );
};

export default ListDoctor;
