import './ListNews.scss';
import Sidebar from '../../components/sidebar/Sidebar';
import DataNews from '../../components/dataNewsList/DataNews';

const ListNews = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <DataNews />
      </div>
    </div>
  );
};

export default ListNews;
