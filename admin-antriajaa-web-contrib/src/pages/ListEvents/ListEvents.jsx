import './ListEvents.scss';
import Sidebar from '../../components/sidebar/Sidebar';
import DataNews from '../../components/dataEventsList/DataEvents';

const ListEvents = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <DataNews />
      </div>
    </div>
  );
};

export default ListEvents;
