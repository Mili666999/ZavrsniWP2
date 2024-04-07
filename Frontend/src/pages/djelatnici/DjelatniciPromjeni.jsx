import { useEffect, useState } from "react";
import { Button, Col, Container, Form, Row } from "react-bootstrap";
import { Link, useNavigate, useParams } from "react-router-dom";
import DjelatnikService from "../../services/DjelatnikService";
import { RoutesNames } from "../../constants";

export default function DjelatniciPromjeni(){
    
    const navigate = useNavigate();
    const routeParams = useParams();
    const [djelatnik, setDjelatnik] = useState({});

    async function dohvatiDjelatnika(){
        await DjelatnikService.getById(routeParams.id)
        .then((res)=>{
            setDjelatnik(res)
        })
        .catch((e)=>{
            alert(e.poruka);
        })
    }

    useEffect(()=>{
        dohvatiDjelatnika();
    },[]);

    async function promjeniDjelatnika(djelatnik){
        const odgovor = await DjelatnikService.promjeniDjelatnika(routeParams.id, djelatnik);
          if(odgovor.ok){
            navigate(RoutesNames.DJELATNICI_PREGLED);
          }else{
            alert(odgovor.poruka);
          }
    }

    function handleSubmit(e){
        e.preventDefault();
        const podaci = new FormData(e.target);

        const djelatnik = 
        {
            ime: podaci.get('ime'),
            prezime: podaci.get('prezime'),
            email: podaci.get('email'),
            mobitel: podaci.get('mobitel'),
            oib: podaci.get('oib'),
            iban: podaci.get('iban')
          };

          //console.log(JSON.stringify(djelatnik));

          promjeniDjelatnika(djelatnik);
    }
    
    return(

        <Container>
            
            <Form onSubmit={handleSubmit}>
                <Form.Group controlId="ime">
                    <Form.Label>Ime</Form.Label>
                    <Form.Control
                        type="text"
                        defaultValue={djelatnik.ime}
                        name="ime"
                    />
                </Form.Group>

                <Form.Group controlId="prezime">
                    <Form.Label>Prezime</Form.Label>
                    <Form.Control
                        type="text"
                        defaultValue={djelatnik.prezime}
                        name="prezime"
                    />
                </Form.Group>

                <Form.Group controlId="email">
                    <Form.Label>Email</Form.Label>
                    <Form.Control
                        type="text"
                        defaultValue={djelatnik.email}
                        name="email"
                    />
                </Form.Group>

                <Form.Group controlId="mobitel">
                    <Form.Label>Mobitel</Form.Label>
                    <Form.Control
                        type="text"
                        defaultValue={djelatnik.mobitel}
                        name="mobitel"
                    />
                </Form.Group>

                <Form.Group controlId="oib">
                    <Form.Label>OIB</Form.Label>
                    <Form.Control
                        type="text"
                        defaultValue={djelatnik.oib}
                        name="oib"
                    />
                </Form.Group>

                <Form.Group controlId="iban">
                    <Form.Label>IBAN</Form.Label>
                    <Form.Control
                        type="text"
                        defaultValue={djelatnik.iban}
                        name="iban"
                    />
                </Form.Group>

                <Row className="akcije">
                    <Col>
                        <Link 
                        className="btn btn-danger"
                        to={RoutesNames.DJELATNICI_PREGLED}>Odustani</Link>
                    </Col>
                    <Col>
                        <Button
                            variant="primary"
                            type="submit"
                        >
                            Promjeni djelatnika
                        </Button>
                    </Col>
                 </Row>
            </Form>

        </Container>

    );

}