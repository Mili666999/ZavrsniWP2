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
         console.log(e.response.data.errors.Naziv[0]);
        return {ok: false, poruka: e.response.data.errors.Naziv[0]}
    });
    return odgovor;
}

export default{
    getDjelatnici,
    obrisiDjelatnika,
    dodajDjelatnika
};