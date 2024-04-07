import { Button, Col, Container, Form, Row } from "react-bootstrap";
import { Link, useNavigate } from "react-router-dom";
import { RoutesNames } from "../../constants";
import DjelatnikService from "../../services/DjelatnikService";


export default function DjelatniciDodaj(){
    const navigate = useNavigate();

    async function dodajDjelatnika(djelatnik){
        const odgovor = await DjelatnikService.dodajDjelatnika(djelatnik);
          if(odgovor.ok){
            navigate(RoutesNames.DJELATNICI_PREGLED);
          }else{
            alert(odgovor.poruka);
          }
    }
    
    function handleSubmit(e){
        e.preventDefault();
        const podaci = new FormData(e.target);
        //console.log(podaci.get('ime'));

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

          dodajDjelatnika(djelatnik);

    }

    return(

        <Container>
            
            <Form onSubmit={handleSubmit}>
                <Form.Group controlId="ime">
                    <Form.Label>Ime</Form.Label>
                    <Form.Control
                        type="text"
                        name="ime"
                    />
                </Form.Group>

                <Form.Group controlId="prezime">
                    <Form.Label>Prezime</Form.Label>
                    <Form.Control
                        type="text"
                        name="prezime"
                    />
                </Form.Group>

                <Form.Group controlId="email">
                    <Form.Label>Email</Form.Label>
                    <Form.Control
                        type="text"
                        name="email"
                    />
                </Form.Group>

                <Form.Group controlId="mobitel">
                    <Form.Label>Mobitel</Form.Label>
                    <Form.Control
                        type="text"
                        name="mobitel"
                    />
                </Form.Group>

                <Form.Group controlId="oib">
                    <Form.Label>OIB</Form.Label>
                    <Form.Control
                        type="text"
                        name="oib"
                    />
                </Form.Group>

                <Form.Group controlId="iban">
                    <Form.Label>IBAN</Form.Label>
                    <Form.Control
                        type="text"
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
                            Dodaj djelatnika
                        </Button>
                    </Col>
                 </Row>
            </Form>

        </Container>

    );

}