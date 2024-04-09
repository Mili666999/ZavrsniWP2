import { App } from "../constants"
import { httpService } from "./httpService";

async function getDjelatnici(){
    return await httpService.get('/Djelatnik')
    .then((res)=>{
        if(App.DEV) console.table(res.data);
        return res;
    }).catch((e)=>{
        console.log(e);
    });
}

async function obrisiDjelatnika(id){
    return await httpService.delete('/Djelatnik/' + id)
    .then((res)=>{
        return {ok: true, poruka: res};
    }).catch((e)=>{
        console.log(e);
    });
}

async function dodajDjelatnika(djelatnik){
    const odgovor = await httpService.post('/Djelatnik', djelatnik)
    .then(()=>{
        return {ok: true, poruka: 'Uspješno dodano'}
    })
    .catch((e)=>{
         console.log(e.response.data.errors);
        return {ok: false, poruka: 'Greška, sva polja moraju biti unešena'}
    });
    return odgovor;
}

async function promjeniDjelatnika(id, djelatnik){
    const odgovor = await httpService.put('/Djelatnik/' + id, djelatnik)
    .then(()=>{
        return {ok: true, poruka: 'Uspješno promjenjeno'}
    })
    .catch((e)=>{
         console.log(e.response.data.errors);
        return {ok: false, poruka: 'Greška'}
    });
    return odgovor;
}

async function getById(id){
    return await httpService.get('/Djelatnik/' + id)
    .then((res)=>{
        if(App.DEV) console.table(res.data);
        return res.data;
    }).catch((e)=>{
        console.log(e);
        return {poruka: e}
    });
}



export default{
    getDjelatnici,
    obrisiDjelatnika,
    dodajDjelatnika,
    promjeniDjelatnika,
    getById
};