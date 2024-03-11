import { useEffect, useState } from "react";
import { Container, Table } from "react-bootstrap";
import DjelatnikService from "../../services/DjelatnikService";


export default function Djelatnici(){
    const [djelatnici, setDjelatnici] = useState();

    async function dohvatiDjelatnike(){
        await DjelatnikService.getDjelatnici()
        .then((res)=>{
            setDjelatnici(res.data);
        })
        .catch((e)=>{
            alert(e);
        });
    }

    useEffect(()=>{
        dohvatiDjelatnike();
    },[]);


    return(

        <Container>
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
                    {djelatnici && djelatnici.map((djelatnik,index)=>(
                        <tr key={index}>
                            <td>{djelatnik.ime}</td>
                            <td>{djelatnik.prezime}</td>
                            <td>{djelatnik.mobitel}</td>
                            <td>{djelatnik.oib}</td>
                            <td>{djelatnik.iban}</td>
                            <td>{djelatnik.akcija}</td>
                        </tr>
                    ))}
                </tbody>
            </Table>
        </Container>

    );

}