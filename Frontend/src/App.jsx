import { Route, Routes } from "react-router-dom"
import Pocetna from "./pages/Pocetna"
import { RoutesNames } from "./constants"
import NavBar from "./components/NavBar"
import Djelatnici from "./pages/djelatnici/Djelatnici"

function App() {
  return (
    <>
    <NavBar />
      <Routes>
        <>
          <Route path={RoutesNames.HOME} element={<Pocetna />} />
          <Route path={RoutesNames.DJELATNICI_PREGLED} element={<Djelatnici />} />
        </>
      </Routes>
    </>
  )
}

export default App
