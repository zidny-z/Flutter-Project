import './Sidebar.scss';
import PersonOutlineIcon from '@mui/icons-material/PersonOutline';
import CreditCardIcon from '@mui/icons-material/CreditCard';
import StoreIcon from '@mui/icons-material/Store';
import InsertChartIcon from '@mui/icons-material/InsertChart';
import ExitToAppIcon from '@mui/icons-material/ExitToApp';
import AccountCircleOutlinedIcon from '@mui/icons-material/AccountCircleOutlined';
import { Link } from 'react-router-dom';
import { DarkModeContext } from '../../context/darkModeContext';
import { useContext } from 'react';

const Sidebar = () => {
  const { dispatch } = useContext(DarkModeContext);
  return (
    <div className="sidebar">
      <div className="top">
        <Link to="/" style={{ textDecoration: 'none' }}>
          <span className="logo">Super Admin</span>
        </Link>
      </div>
      <hr />
      <div className="center">
        <ul>
          <p className="title">LISTS</p>
          <Link to="/doctorPage" style={{ textDecoration: 'none' }}>
            <li>
              <PersonOutlineIcon className="icon" />
              <span>Doctor List</span>
            </li>
          </Link>
          <Link to="/hospitalPage" style={{ textDecoration: 'none' }}>
            <li>
              <StoreIcon className="icon" />
              <span>Hospital List</span>
            </li>
          </Link>
          <Link to="/polyclinicPage" style={{ textDecoration: 'none' }}>
            <li>
              <CreditCardIcon className="icon" />
              <span>Polyclinic Page</span>
            </li>
          </Link>
          <Link to="/eventsPage" style={{ textDecoration: 'none' }}>
            <li>
              <StoreIcon className="icon" />
              <span>Events Page</span>
            </li>
          </Link>
          <Link to="/newsPage" style={{ textDecoration: 'none' }}>
            <li>
              <CreditCardIcon className="icon" />
              <span>News Page</span>
            </li>
          </Link>

          <p className="title">USEFUL</p>
          <Link to="/queueList" style={{ textDecoration: 'none' }}>
            <li>
              <InsertChartIcon className="icon" />
              <span>Queue</span>
            </li>
          </Link>

          <p className="title">USER</p>
          <li>
            <AccountCircleOutlinedIcon className="icon" />
            <span>Profile</span>
          </li>
          <li>
            <ExitToAppIcon className="icon" />
            <span>Logout</span>
          </li>
        </ul>
      </div>
      <div className="bottom">
        <div className="colorOption" onClick={() => dispatch({ type: 'LIGHT' })}></div>
        <div className="colorOption" onClick={() => dispatch({ type: 'DARK' })}></div>
      </div>
    </div>
  );
};

export default Sidebar;
