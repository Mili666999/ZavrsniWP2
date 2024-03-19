import { useEffect, useState } from "react";
import { Button, Container, Table } from "react-bootstrap";
import DjelatnikService from "../../services/DjelatnikService";
import { MdPersonAddAlt1 } from "react-icons/md";
import { FaEdit, FaTrash } from "react-icons/fa";
import { Link, useNavigate } from "react-router-dom";
import { RoutesNames } from "../../constants";




export default function Djelatnici() {
    const [djelatnici, setDjelatnici] = useState();
    const navigate = useNavigate();

    async function dohvatiDjelatnike() {
        await DjelatnikService.getDjelatnici()
            .then((res) => {
                setDjelatnici(res.data);
            })
            .catch((e) => {
                alert(e);
            });
    }

    useEffect(() => {
        dohvatiDjelatnike();
    }, []);



    async function obrisiDjelatnika(id) {
        const odgovor = await SmjerService.obrisiDjelatnika(id);
        if (odgovor.ok) {
            alert(odgovor.poruka);
            dohvatiDjelatnike();
        }

    }

    return (

        <Container>
            <Link to={RoutesNames.DJELATNICI_NOVI} className="btn btn-success gumb">
                <MdPersonAddAlt1 /> Dodaj
            </Link>
            <Table striped bordered hover responsive>
                <thead>
                    <tr>
                        <th>Ime</th>
                        <th>Prezime</th>
                        <th>Mobitel</th>
                        <th>OIB</th>
                        <th>IBAN</th>
                        <th>Akcija</th>
                    </tr>
                </thead>
                <tbody>
                    {djelatnici && djelatnici.map((djelatnik, index) => (
                        <tr key={index}>
                            <td>{djelatnik.ime}</td>
                            <td>{djelatnik.prezime}</td>
                            <td>{djelatnik.mobitel}</td>
                            <td>{djelatnik.oib}</td>
                            <td>{djelatnik.iban}</td>
                            <td className="sredina">
                                <Button
                                    variant="primary"
                                    onClick={() => { navigate(`/djelatnici/${djelatnik.id}`) }}>
                                    <FaEdit
                                        size={25}
                                    />
                                </Button>

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                <Button
                                    variant="danger"
                                    onClick={() => obrisiDjelatnika(djelatnik.id)}
                                >
                                    <FaTrash
                                        size={25}
                                    />
                                </Button>

                            </td>
                        </tr>

                    ))}
                </tbody>
            </Table>
        </Container>

    );

}                    