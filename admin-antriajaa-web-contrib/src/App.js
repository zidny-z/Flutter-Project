import Home from './pages/home/Home';
import Login from './pages/login/Login';
import ListDoctor from './pages/ListDoctor/ListDoctor';
import NewDataDoctor from './pages/newDataDoctor/NewDataDoctor';
import NewDataEvents from './pages/newDataEvents/NewDataEvents';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { userInputs, userInputsEvents, userInputsHospital, userInputsNews, userInputsPolyclinic } from './formSource';
import './style/dark.scss';
import { useContext } from 'react';
import { DarkModeContext } from './context/darkModeContext';
import { AuthContext } from './context/AuthContext';
import ListEvents from './pages/ListEvents/ListEvents';
import ListHospital from './pages/ListHospital/ListHospital';
import ListNews from './pages/ListNews/ListNews';
import ListPolyclinic from './pages/ListPolyclinic/ListPolyclinic';
import ListQueue from './pages/ListQueue/ListQueue';
import NewDataPolyclinic from './pages/newDataPolyclinic/NewDataPolyclinic';
import NewDataHospital from './pages/newDataHospital/NewDataHospital';
import NewDataNews from './pages/newDataNews/NewDataNews';

function App() {
  const { darkMode } = useContext(DarkModeContext);

  const { currentUser } = useContext(AuthContext);

  const RequireAuth = ({ children }) => {
    return currentUser ? children : <Navigate to="/login" />;
  };

  return (
    <div className={darkMode ? 'app dark' : 'app'}>
      <BrowserRouter>
        <Routes>
          <Route path="/">
            <Route path="login" element={<Login />} />
            <Route
              index
              element={
                <RequireAuth>
                  <Home />
                </RequireAuth>
              }
            />
            <Route path="doctorPage">
              <Route
                index
                element={
                  <RequireAuth>
                    <ListDoctor />
                  </RequireAuth>
                }
              />
              <Route
                path="newDataDoctor"
                element={
                  <RequireAuth>
                    <NewDataDoctor inputs={userInputs} title="Add New Doctor" />
                  </RequireAuth>
                }
              />
            </Route>
            <Route path="hospitalPage">
              <Route
                index
                element={
                  <RequireAuth>
                    <ListHospital />
                  </RequireAuth>
                }
              />
              <Route
                path="newDataHospital"
                element={
                  <RequireAuth>
                    <NewDataHospital inputs={userInputsHospital} title="Add New Hospital" />
                  </RequireAuth>
                }
              />
            </Route>
            <Route path="polyclinicPage">
              <Route
                index
                element={
                  <RequireAuth>
                    <ListPolyclinic />
                  </RequireAuth>
                }
              />
              <Route
                path="newDataPolyclinic"
                element={
                  <RequireAuth>
                    <NewDataPolyclinic inputs={userInputsPolyclinic} title="Add New Polyclinic" />
                  </RequireAuth>
                }
              />
            </Route>
            <Route path="eventsPage">
              <Route
                index
                element={
                  <RequireAuth>
                    <ListEvents />
                  </RequireAuth>
                }
              />
              <Route
                path="newDataEvents"
                element={
                  <RequireAuth>
                    <NewDataEvents inputs={userInputsEvents} title="Add New Events" />
                  </RequireAuth>
                }
              />
            </Route>
            <Route path="newsPage">
              <Route
                index
                element={
                  <RequireAuth>
                    <ListNews />
                  </RequireAuth>
                }
              />
              <Route
                path="newDataNews"
                element={
                  <RequireAuth>
                    <NewDataNews inputs={userInputsNews} title="Add New News" />
                  </RequireAuth>
                }
              />
            </Route>
            <Route path="queueList">
              <Route
                index
                element={
                  <RequireAuth>
                    <ListQueue />
                  </RequireAuth>
                }
              />
              {/* <Route
                path="newDataNews"
                element={
                  <RequireAuth>
                    <NewDataNews inputs={userInputsNews} title="Add New News" />
                  </RequireAuth>
                }
              /> */}
            </Route>
          </Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
