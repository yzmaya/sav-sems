package sep.gob.mx.sems.Model;

/**
 *
 * @author brayan.padilla
 */
public class Conciliacion {

    private String apPaterno;
    private String apMaterno;
    private String nombre_s;
    private Integer idViaje;
    private String poblacion;
    private String del;
    private String al;
    private String numCheque;
    private String viaticosCheq;
    private String gasolinaCheq;
    private String peajeCheq;
    private String pasajesTerrCheq;
    private String totalCheq;
    private String viaticosDev;
    private String gasolinaDev;
    private String peajeDev;
    private String pasajesTerrDev;
    private String montoViatDev;
    private String viaticosReint;
    private String gasolinaReint;
    private String peajeReint;
    private String pasajesTerrReint;
    private String chequeCancelado;
    private String retiroDGPyRF;
    private String totalReintegrado;
    private String saldoAReintegrar;
    private String saldoPagarDevengado;
    private String cheque1;
    private String cheque2;
    private String cheque3;
    private String saldo;
    private String observaciones;
    private String omvi;
    private String horas;
    private String fecha;
    //TOTALES DE TODAS LAS COLUMNAS QUE VAN EN EL EXCEL
    private String PTPtotalViatCheq;
    private String PTtotalGasCheq;
    private String PTtotalPeajeCheq;
    private String PTtotalPasTerrCheq;
    private String PTtotTotalCheq;
    private String PTtotalViatDev;
    private String PTtotalGasDev;
    private String PTtotalPeajeDev;
    private String PTtotalPasTerRDev;
    private String PTmontoTotalViatDev;
    private String PTtotalViatReint;
    private String PTtotalGasReint;
    private String PTtotalPeajeReint;
    private String PTtotalPasTerrReint;
    private String PTtotalRetDGPyRFReint;
    private String PTtotalTotReintegrado;
    private String PTtotalSaldoReintegrar;
    private String PTtotalSaldoPagarDev;
    private String PTtotalCheq1;
    private String PTtotalCheq2;
    private String PTtotalCheq3;
    private String PTtotalsaldo;

    public String getPTPtotalViatCheq() {
        return PTPtotalViatCheq;
    }

    public void setPTPtotalViatCheq(String PTPtotalViatCheq) {
        this.PTPtotalViatCheq = PTPtotalViatCheq;
    }

    public String getPTmontoTotalViatDev() {
        return PTmontoTotalViatDev;
    }

    public void setPTmontoTotalViatDev(String PTmontoTotalViatDev) {
        this.PTmontoTotalViatDev = PTmontoTotalViatDev;
    }

    public String getPTtotTotalCheq() {
        return PTtotTotalCheq;
    }

    public void setPTtotTotalCheq(String PTtotTotalCheq) {
        this.PTtotTotalCheq = PTtotTotalCheq;
    }

    public String getPTtotalCheq1() {
        return PTtotalCheq1;
    }

    public void setPTtotalCheq1(String PTtotalCheq1) {
        this.PTtotalCheq1 = PTtotalCheq1;
    }

    public String getPTtotalCheq2() {
        return PTtotalCheq2;
    }

    public void setPTtotalCheq2(String PTtotalCheq2) {
        this.PTtotalCheq2 = PTtotalCheq2;
    }

    public String getPTtotalCheq3() {
        return PTtotalCheq3;
    }

    public void setPTtotalCheq3(String PTtotalCheq3) {
        this.PTtotalCheq3 = PTtotalCheq3;
    }

    public String getPTtotalGasCheq() {
        return PTtotalGasCheq;
    }

    public void setPTtotalGasCheq(String PTtotalGasCheq) {
        this.PTtotalGasCheq = PTtotalGasCheq;
    }

    public String getPTtotalGasDev() {
        return PTtotalGasDev;
    }

    public void setPTtotalGasDev(String PTtotalGasDev) {
        this.PTtotalGasDev = PTtotalGasDev;
    }

    public String getPTtotalGasReint() {
        return PTtotalGasReint;
    }

    public void setPTtotalGasReint(String PTtotalGasReint) {
        this.PTtotalGasReint = PTtotalGasReint;
    }

    public String getPTtotalPasTerRDev() {
        return PTtotalPasTerRDev;
    }

    public void setPTtotalPasTerRDev(String PTtotalPasTerRDev) {
        this.PTtotalPasTerRDev = PTtotalPasTerRDev;
    }

    public String getPTtotalPasTerrCheq() {
        return PTtotalPasTerrCheq;
    }

    public void setPTtotalPasTerrCheq(String PTtotalPasTerrCheq) {
        this.PTtotalPasTerrCheq = PTtotalPasTerrCheq;
    }

    public String getPTtotalPasTerrReint() {
        return PTtotalPasTerrReint;
    }

    public void setPTtotalPasTerrReint(String PTtotalPasTerrReint) {
        this.PTtotalPasTerrReint = PTtotalPasTerrReint;
    }

    public String getPTtotalPeajeCheq() {
        return PTtotalPeajeCheq;
    }

    public void setPTtotalPeajeCheq(String PTtotalPeajeCheq) {
        this.PTtotalPeajeCheq = PTtotalPeajeCheq;
    }

    public String getPTtotalPeajeDev() {
        return PTtotalPeajeDev;
    }

    public void setPTtotalPeajeDev(String PTtotalPeajeDev) {
        this.PTtotalPeajeDev = PTtotalPeajeDev;
    }

    public String getPTtotalPeajeReint() {
        return PTtotalPeajeReint;
    }

    public void setPTtotalPeajeReint(String PTtotalPeajeReint) {
        this.PTtotalPeajeReint = PTtotalPeajeReint;
    }

    public String getPTtotalRetDGPyRFReint() {
        return PTtotalRetDGPyRFReint;
    }

    public void setPTtotalRetDGPyRFReint(String PTtotalRetDGPyRFReint) {
        this.PTtotalRetDGPyRFReint = PTtotalRetDGPyRFReint;
    }

    public String getPTtotalSaldoPagarDev() {
        return PTtotalSaldoPagarDev;
    }

    public void setPTtotalSaldoPagarDev(String PTtotalSaldoPagarDev) {
        this.PTtotalSaldoPagarDev = PTtotalSaldoPagarDev;
    }

    public String getPTtotalSaldoReintegrar() {
        return PTtotalSaldoReintegrar;
    }

    public void setPTtotalSaldoReintegrar(String PTtotalSaldoReintegrar) {
        this.PTtotalSaldoReintegrar = PTtotalSaldoReintegrar;
    }

    public String getPTtotalTotReintegrado() {
        return PTtotalTotReintegrado;
    }

    public void setPTtotalTotReintegrado(String PTtotalTotReintegrado) {
        this.PTtotalTotReintegrado = PTtotalTotReintegrado;
    }

    public String getPTtotalViatDev() {
        return PTtotalViatDev;
    }

    public void setPTtotalViatDev(String PTtotalViatDev) {
        this.PTtotalViatDev = PTtotalViatDev;
    }

    public String getPTtotalViatReint() {
        return PTtotalViatReint;
    }

    public void setPTtotalViatReint(String PTtotalViatReint) {
        this.PTtotalViatReint = PTtotalViatReint;
    }

    public String getPTtotalsaldo() {
        return PTtotalsaldo;
    }

    public void setPTtotalsaldo(String PTtotalsaldo) {
        this.PTtotalsaldo = PTtotalsaldo;
    }
    

    public String getAl() {
        return al;
    }

    public void setAl(String al) {
        this.al = al;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getCheque1() {
        return cheque1;
    }

    public void setCheque1(String cheque1) {
        this.cheque1 = cheque1;
    }

    public String getCheque2() {
        return cheque2;
    }

    public void setCheque2(String cheque2) {
        this.cheque2 = cheque2;
    }

    public String getCheque3() {
        return cheque3;
    }

    public void setCheque3(String cheque3) {
        this.cheque3 = cheque3;
    }

    public String getChequeCancelado() {
        return chequeCancelado;
    }

    public void setChequeCancelado(String chequeCancelado) {
        this.chequeCancelado = chequeCancelado;
    }

    public String getDel() {
        return del;
    }

    public void setDel(String del) {
        this.del = del;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getGasolinaCheq() {
        return gasolinaCheq;
    }

    public void setGasolinaCheq(String gasolinaCheq) {
        this.gasolinaCheq = gasolinaCheq;
    }

    public String getGasolinaDev() {
        return gasolinaDev;
    }

    public void setGasolinaDev(String gasolinaDev) {
        this.gasolinaDev = gasolinaDev;
    }

    public String getGasolinaReint() {
        return gasolinaReint;
    }

    public void setGasolinaReint(String gasolinaReint) {
        this.gasolinaReint = gasolinaReint;
    }

    public String getHoras() {
        return horas;
    }

    public void setHoras(String horas) {
        this.horas = horas;
    }

    public Integer getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(Integer idViaje) {
        this.idViaje = idViaje;
    }

    public String getMontoViatDev() {
        return montoViatDev;
    }

    public void setMontoViatDev(String montoViatDev) {
        this.montoViatDev = montoViatDev;
    }

    public String getNombre_s() {
        return nombre_s;
    }

    public void setNombre_s(String nombre_s) {
        this.nombre_s = nombre_s;
    }

    public String getNumCheque() {
        return numCheque;
    }

    public void setNumCheque(String numCheque) {
        this.numCheque = numCheque;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getOmvi() {
        return omvi;
    }

    public void setOmvi(String omvi) {
        this.omvi = omvi;
    }

    public String getPasajesTerrCheq() {
        return pasajesTerrCheq;
    }

    public void setPasajesTerrCheq(String pasajesTerrCheq) {
        this.pasajesTerrCheq = pasajesTerrCheq;
    }

    public String getPasajesTerrDev() {
        return pasajesTerrDev;
    }

    public void setPasajesTerrDev(String pasajesTerrDev) {
        this.pasajesTerrDev = pasajesTerrDev;
    }

    public String getPasajesTerrReint() {
        return pasajesTerrReint;
    }

    public void setPasajesTerrReint(String pasajesTerrReint) {
        this.pasajesTerrReint = pasajesTerrReint;
    }

    public String getPeajeCheq() {
        return peajeCheq;
    }

    public void setPeajeCheq(String peajeCheq) {
        this.peajeCheq = peajeCheq;
    }

    public String getPeajeDev() {
        return peajeDev;
    }

    public void setPeajeDev(String peajeDev) {
        this.peajeDev = peajeDev;
    }

    public String getPeajeReint() {
        return peajeReint;
    }

    public void setPeajeReint(String peajeReint) {
        this.peajeReint = peajeReint;
    }

    public String getPoblacion() {
        return poblacion;
    }

    public void setPoblacion(String poblacion) {
        this.poblacion = poblacion;
    }

    public String getRetiroDGPyRF() {
        return retiroDGPyRF;
    }

    public void setRetiroDGPyRF(String retiroDGPyRF) {
        this.retiroDGPyRF = retiroDGPyRF;
    }

    public String getSaldo() {
        return saldo;
    }

    public void setSaldo(String saldo) {
        this.saldo = saldo;
    }

    public String getSaldoAReintegrar() {
        return saldoAReintegrar;
    }

    public void setSaldoAReintegrar(String saldoAReintegrar) {
        this.saldoAReintegrar = saldoAReintegrar;
    }

    public String getSaldoPagarDevengado() {
        return saldoPagarDevengado;
    }

    public void setSaldoPagarDevengado(String saldoPagarDevengado) {
        this.saldoPagarDevengado = saldoPagarDevengado;
    }

    public String getTotalCheq() {
        return totalCheq;
    }

    public void setTotalCheq(String totalCheq) {
        this.totalCheq = totalCheq;
    }

    public String getTotalReintegrado() {
        return totalReintegrado;
    }

    public void setTotalReintegrado(String totalReintegrado) {
        this.totalReintegrado = totalReintegrado;
    }

    public String getViaticosCheq() {
        return viaticosCheq;
    }

    public void setViaticosCheq(String viaticosCheq) {
        this.viaticosCheq = viaticosCheq;
    }

    public String getViaticosDev() {
        return viaticosDev;
    }

    public void setViaticosDev(String viaticosDev) {
        this.viaticosDev = viaticosDev;
    }

    public String getViaticosReint() {
        return viaticosReint;
    }

    public void setViaticosReint(String viaticosReint) {
        this.viaticosReint = viaticosReint;
    }

    
}