package sep.gob.mx.sems.ServiceImpl;

import java.io.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import sep.gob.mx.sems.Model.Conciliacion;
import sep.gob.mx.sems.Service.ConciliacionesService;

/**
 *
 * @author brayan.padilla
 */
@Service
public class ConciliacionesServiceImpl implements ConciliacionesService {

    @Override
    public String cargaArchivoExcel(MultipartFile file, String ruta) throws Exception {
        if (null != file) {
            if (!file.isEmpty()) {
                String nombreOriginalArchivo = file.getOriginalFilename();
                File ficheroDestino = new File(ruta + nombreOriginalArchivo);
                ficheroDestino.mkdirs();
                file.transferTo(ficheroDestino);
                System.out.println("Se transfirio el archivo");

                validaArchivo(ficheroDestino, ruta);

            }
        }
        return "ARCHIVO CARGADO";
    }

    @Override
    public List<Conciliacion> leerArchivo(String nombre, String paterno, String materno, String ruta) throws Exception {

        List<Conciliacion> conciliacion = new ArrayList<Conciliacion>();

        try {

            List sheetData = new ArrayList();

            FileInputStream fis = null;

            try {

                fis = new FileInputStream(ruta + "archivoNuevo.xlsx");
                XSSFWorkbook workbook = new XSSFWorkbook(fis);

                XSSFSheet sheet = workbook.getSheetAt(0);

                Iterator rows = sheet.rowIterator();
                while (rows.hasNext()) {
                    XSSFRow row = (XSSFRow) rows.next();

                    Iterator cells = row.cellIterator();
                    List data = new ArrayList();
                    while (cells.hasNext()) {
                        XSSFCell cell = (XSSFCell) cells.next();
                        data.add(cell);
                    }
                    sheetData.add(data);
                }
            } catch (IOException e) {
                System.out.println("Error IOException en leer archivo Service Implement: " + e.getMessage());
            } finally {
                if (fis != null) {
                    fis.close();
                }
            }

            conciliacion = acomodaDatos(sheetData, nombre, paterno, materno);

        } catch (IllegalStateException e) {
            System.out.println("Error IllegalStateException: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("Error IOException: " + e.getMessage());
        }
        return conciliacion;
    }

    private static List<Conciliacion> acomodaDatos(List sheetData, String nombre, String paterno, String materno) throws Exception {
        DecimalFormat formato = new DecimalFormat("###,###.##");
        int cont = 0;
        List listas = new ArrayList();
        for (int i = 4; i < sheetData.size(); i++) {
            List list = (List) sheetData.get(i);
            cont = 0;
            for (int j = 0; j < list.size(); j++) {

                Cell cell = (Cell) list.get(j);

                if ((cell.getCellType() == Cell.CELL_TYPE_STRING)) {

                    if ((j == 24) && cell.toString().equals(nombre)) {
                        cont++;
                    }
                    if ((j == 25) && cell.toString().equals(paterno)) {
                        cont++;
                    }
                    if ((j == 26) && cell.toString().equals(materno)) {
                        cont++;
                        if (cont == 3) {
                            listas.add(list);
                        }
                    }
                }
            }
        }

        System.out.println("Numero de registros correspondientes al comisionado " + nombre + " " + paterno + " " + materno + ": " + listas.size());
        String paisPoblacion = "";
        String del = "", al = "";
        String noCheque = "";
        String observaciones = "";
        String omvi = "";
        Conciliacion conciliacion;
        List<Conciliacion> listaConciliacion = new ArrayList<Conciliacion>();
        Double saldoReint = 0.0;
        for (int i = 0; i < listas.size(); i++) {

            String peaje = "";
            Double peajeCheq = 0.0;
            Double peajeDev = 0.0;

            String viaticosS = "";
            Double viaticos = 0.0;
            Double viaticosDev = 0.0;

            String gasolinaS = "";
            Double gasolina = 0.0;
            Double gasolinaDev = 0.0;

            String pasajTerrS = "";
            Double pasajTerr = 0.0;
            Double pasajTerrDev = 0.0;

            Double totalCheq = 0.0;
            Double totalDev = 0.0;


            conciliacion = new Conciliacion();

            conciliacion.setIdViaje(i + 1);

            List filas = (List) listas.get(i);
            
            for (int j = 0; j < filas.size(); j++) {

                if (j == 9) {
                    omvi = (String) filas.get(j).toString();
                    conciliacion.setOmvi(omvi);
                }

                if (j == 19) {
                    noCheque = (String) filas.get(j).toString();
                    if (!noCheque.equals("-")) {
                        String[] num = noCheque.split("\\.");
                        conciliacion.setNumCheque(num[0]);
                    }

                }

                if (j == 38) {
                    paisPoblacion = (String) filas.get(j).toString();
                    conciliacion.setPoblacion(paisPoblacion);
                }

                if (j == 41) {
                    del = (String) filas.get(j).toString();
                    conciliacion.setDel(del);
                }

                if (j == 42) {
                    al = (String) filas.get(j).toString();
                    conciliacion.setAl(al);
                }
//--------------------Viaticos anticipo cheque------------------------------------------------------------
                if (j == 46) {

                    viaticosS = (String) filas.get(j).toString();
                    if (!viaticosS.toString().equals("-")) {
                        viaticos += Double.valueOf(viaticosS);

                    }
                }

                if (j == 47) {

                    viaticosS = (String) filas.get(j).toString();
                    if (!viaticosS.toString().equals("-")) {
                        viaticos += Double.valueOf(viaticosS);

                    }
                }

                if (j == 48) {

                    viaticosS = (String) filas.get(j).toString();
                    if (!viaticosS.toString().equals("-")) {
                        viaticos += Double.valueOf(viaticosS);

                    }
                }

                if (j == 49) {

                    viaticosS = (String) filas.get(j).toString();

                    if (!viaticosS.toString().equals("-")) {

                        viaticos += Double.valueOf(viaticosS);

                    }
                    if (viaticos != 0) {

                        conciliacion.setViaticosCheq(formato.format(viaticos));

                    }

                }
//----------------------------Pasajes terrestres anticipo cheque--------------------------------
                if (j == 50) {

                    pasajTerrS = (String) filas.get(j).toString();
                    if (!pasajTerrS.toString().equals("-")) {
                        pasajTerr += Double.valueOf(pasajTerrS);
                    }
                }
                if (j == 54) {

                    pasajTerrS = (String) filas.get(j).toString();
                    if (!pasajTerrS.toString().equals("-")) {
                        pasajTerr += Double.valueOf(pasajTerrS);
                    }
                }
                if (j == 55) {

                    pasajTerrS = (String) filas.get(j).toString();
                    if (!pasajTerrS.toString().equals("-")) {
                        pasajTerr += Double.valueOf(pasajTerrS);
                    }
                    if (pasajTerr != 0) {
                        conciliacion.setPasajesTerrCheq(formato.format(pasajTerr));
                    }
                }
//----------------------------Gasolina anticipo cheque------------------------------------------
                if (j == 51) {

                    gasolinaS = (String) filas.get(j).toString();
                    if (!gasolinaS.toString().equals("-")) {
                        gasolina += Double.valueOf(gasolinaS);
                    }
                }

                if (j == 52) {

                    gasolinaS = (String) filas.get(j).toString();
                    if (!gasolinaS.toString().equals("-")) {
                        gasolina += Double.valueOf(gasolinaS);
                    }
                    if (gasolina != 0) {
                        conciliacion.setGasolinaCheq(formato.format(gasolina));
                    }
                }
//----------------------------Peaje anticipo cheque------------------------------------------
                if (j == 53) {

                    peaje = (String) filas.get(j).toString();
                    if (peaje.toString().equals("-")) {
                        peajeCheq = 0.0;
                    } else {
                        peajeCheq = Double.valueOf(peaje);
                    }
                    if (peajeCheq != 0) {
                        conciliacion.setPeajeCheq(formato.format(peajeCheq));
                    }
                }
//----------------------------Total anticipo cheque------------------------------------------
                if (j == 57) {

                    totalCheq = 0.0;
                    totalCheq = viaticos + gasolina + peajeCheq;
                    if (totalCheq != 0) {
                        conciliacion.setTotalCheq(formato.format(totalCheq));
                    }
                }
//----------------------------Viaticos devengado------------------------------------------

                if (j == 102) {


                    viaticosS = "";
                    viaticosS = (String) filas.get(j).toString();
                    if (!viaticosS.toString().equals("-")) {
                        viaticosDev += Double.valueOf(viaticosS);
                    }
                }

                if (j == 103) {

                    viaticosS = (String) filas.get(j).toString();
                    if (!viaticosS.toString().equals("-")) {
                        viaticosDev += Double.valueOf(viaticosS);
                    }
                }

                if (j == 104) {

                    viaticosS = (String) filas.get(j).toString();
                    if (!viaticosS.toString().equals("-")) {
                        viaticosDev += Double.valueOf(viaticosS);
                    }
                }

                if (j == 105) {

                    viaticosS = (String) filas.get(j).toString();
                    if (!viaticosS.toString().equals("-")) {
                        viaticosDev += Double.valueOf(viaticosS);
                    }
                    if (viaticosDev != 0) {
                        conciliacion.setViaticosDev(formato.format(viaticosDev));
                    }
                }
//----------------------------Pasajes terrestres devengado--------------------------------

                if (j == 106) {

                    pasajTerrS = "";
                    pasajTerrS = (String) filas.get(j).toString();
                    if (!pasajTerrS.toString().equals("-")) {
                        pasajTerrDev += Double.valueOf(pasajTerrS);
                    }
                }
                if (j == 110) {

                    pasajTerrS = (String) filas.get(j).toString();
                    if (!pasajTerrS.toString().equals("-")) {
                        pasajTerrDev += Double.valueOf(pasajTerrS);
                    }
                }
                if (j == 111) {

                    pasajTerrS = (String) filas.get(j).toString();
                    if (!pasajTerrS.toString().equals("-")) {
                        pasajTerrDev += Double.valueOf(pasajTerrS);
                    }
                    if (pasajTerrDev != 0) {
                        conciliacion.setPasajesTerrDev(formato.format(pasajTerrDev));
                    }
                }
//----------------------------Gasolina devengado-------------------------------- 
                if (j == 107) {

                    gasolinaS = "";
                    gasolinaS = (String) filas.get(j).toString();
                    if (!gasolinaS.toString().equals("-")) {
                        gasolinaDev += Double.valueOf(gasolinaS);
                    }
                }
                if (j == 108) {

                    gasolinaS = (String) filas.get(j).toString();
                    if (!gasolinaS.toString().equals("-")) {
                        gasolinaDev += Double.valueOf(gasolinaS);
                    }
                    if (gasolinaDev != 0) {
                        conciliacion.setGasolinaDev(formato.format(gasolinaDev));
                    }
                }
//----------------------------Peaje devengado------------------------------------------
                if (j == 109) {

                    peaje = (String) filas.get(j).toString();
                    if (peaje.toString().equals("-")) {
                        peajeDev = 0.0;
                    } else {
                        peajeDev = Double.valueOf(peaje);
                    }
                    if (peajeDev != 0) {
                        conciliacion.setPeajeDev(formato.format(peajeDev));
                    }
                }
//----------------------------Monto viaticos devengados------------------------------------------(Total devengados)

                if (viaticosDev != 0 || pasajTerrDev != 0 || gasolinaDev != 0 || peajeDev != 0) {

                    totalDev = 0.0;
                    totalDev = viaticosDev + pasajTerrDev + gasolinaDev + peajeDev;
                    if (totalDev != 0) {
                        conciliacion.setMontoViatDev(formato.format(totalDev));
                    }
                }
//----------------------------Saldo a reintegrar------------------------------------------
                saldoReint = totalCheq - totalDev;
                if (saldoReint == 0.0) {

                    conciliacion.setSaldoAReintegrar(null);
                } else {
                    conciliacion.setSaldoAReintegrar(formato.format(saldoReint));
                }
//----------------------------Saldo a pagar devengado------------------------------------------
                if (j == 154) {

                    String saldoPagarDev = (String) filas.get(j).toString();
                    if (saldoPagarDev.equals("-")) {
                        saldoPagarDev = "0.0";
                    }
                    if (Double.valueOf(saldoPagarDev) != 0) {

                        conciliacion.setSaldoPagarDevengado(formato.format(Double.valueOf(saldoPagarDev)));
                    }
                }
//----------------------------Observaciones---------------------------------------------------
                if (j == 145) {
                    observaciones = (String) filas.get(j).toString();
                    conciliacion.setObservaciones(observaciones);
                }
//----------------------------Nombre del comisionado------------------------------------------
                if (j == 24) {
                    String val = (String) filas.get(j).toString();
                    conciliacion.setNombre_s(val);
                }

                if (j == 25) {
                    String val = (String) filas.get(j).toString();
                    conciliacion.setApPaterno(val);
                }

                if (j == 26) {
                    String val = (String) filas.get(j).toString();
                    conciliacion.setApMaterno(val);
                }
            }
            listaConciliacion.add(conciliacion);
        }

        return listaConciliacion;

    }

    public void validaArchivo(File excelfile, String ruta) throws Exception {

        File excelNewFile = new File(ruta + "archivoNuevo.xlsx");

        try {

            FileInputStream excelStream = new FileInputStream(excelfile);

            OutputStream excelNewOutputStream = new FileOutputStream(excelNewFile);

            Workbook workbook = new XSSFWorkbook(excelStream);
            XSSFWorkbook xssfWorkbookNew = new XSSFWorkbook();

            Sheet sheet = workbook.getSheetAt(0);
            XSSFSheet xssfSheetNew = xssfWorkbookNew.createSheet("OMVIS");

            Row row;
            XSSFRow xssfRowNew;

            XSSFCell cellNew;

            String valorCelda = "";

            FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();


            for (int i = 0; i < sheet.getLastRowNum(); i++) {
                row = sheet.getRow(i);
                if (row == null) {
                    break;
                } else {
                    xssfRowNew = xssfSheetNew.createRow(i);
                    for (int c = 0; c < row.getLastCellNum(); c++) {

                        if (row.getCell(c) != null && !"".equals(row.getCell(c).toString()) && c > 42) {
                            CellValue cellValue = evaluator.evaluate(row.getCell(c));
                            //Aqui va validacion por tipo de dato de la celda
                            switch (cellValue.getCellType()) {
                                case Cell.CELL_TYPE_BOOLEAN:
                                    valorCelda = cellValue.toString();
                                    cellNew = xssfRowNew.createCell(c);
                                    cellNew.setCellType(XSSFCell.CELL_TYPE_STRING);
                                    cellNew.setCellValue(valorCelda);
                                    break;
                                case Cell.CELL_TYPE_NUMERIC:
                                    valorCelda = String.valueOf(cellValue.getNumberValue());
                                    cellNew = xssfRowNew.createCell(c);
                                    cellNew.setCellType(XSSFCell.CELL_TYPE_NUMERIC);
                                    cellNew.setCellValue(Double.valueOf(valorCelda));
                                    break;
                                case Cell.CELL_TYPE_STRING:
                                    valorCelda = cellValue.getStringValue();
                                    cellNew = xssfRowNew.createCell(c);
                                    cellNew.setCellType(XSSFCell.CELL_TYPE_STRING);
                                    cellNew.setCellValue(valorCelda);
                                    break;
                                case Cell.CELL_TYPE_BLANK:
                                    valorCelda = "-";
                                    cellNew = xssfRowNew.createCell(c);
                                    cellNew.setCellType(XSSFCell.CELL_TYPE_STRING);
                                    cellNew.setCellValue(valorCelda);
                                    break;
                                case Cell.CELL_TYPE_ERROR:
                                    valorCelda = "-";
                                    cellNew = xssfRowNew.createCell(c);
                                    cellNew.setCellType(XSSFCell.CELL_TYPE_STRING);
                                    cellNew.setCellValue(valorCelda);
                                    break;

                                // CELL_TYPE_FORMULA will never happen
                                case Cell.CELL_TYPE_FORMULA:
                                    break;
                            }
                        } else {
                            valorCelda = row.getCell(c) == null ? "-"
                                    : (row.getCell(c).getCellType() == Cell.CELL_TYPE_STRING) ? row.getCell(c).toString().trim()
                                    : (row.getCell(c).getCellType() == Cell.CELL_TYPE_NUMERIC) ? row.getCell(c).toString().trim()
                                    : (row.getCell(c).getCellType() == Cell.CELL_TYPE_BOOLEAN) ? row.getCell(c).toString().trim()
                                    : (row.getCell(c).getCellType() == Cell.CELL_TYPE_BLANK) ? "-"
                                    : (row.getCell(c).getCellType() == Cell.CELL_TYPE_FORMULA) ? row.getCell(c).toString().trim()
                                    : (row.getCell(c).getCellType() == Cell.CELL_TYPE_ERROR) ? "-" : "-";
                        }

                        cellNew = xssfRowNew.createCell(c);
                        cellNew.setCellType(XSSFCell.CELL_TYPE_STRING);
                        cellNew.setCellValue(valorCelda);
                    }
                }
            }
            xssfWorkbookNew.write(excelNewOutputStream);

//            excelNewOutputStream.close();
            if (excelfile.delete()) {
                System.out.println("Archivo eliminado");
            }

        } catch (FileNotFoundException ex) {
            System.out.println("Error FileNotFoundException Pasar Archivo: " + ex.getMessage());
        } catch (IOException ex) {
            System.out.println("Error IOException Pasar Archivo: " + ex.getMessage());
        }
    }
}