package modelo;
import com.csvreader.CsvWriter;
import com.github.junrar.Archive;
import com.github.junrar.impl.FileVolumeManager;
import com.github.junrar.rarfile.FileHeader;
import controlador.conexion;
import java.util.ArrayList;
import java.util.Iterator;
import java.text.SimpleDateFormat;  
import java.text.ParseException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xslf.model.geom.Path;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.util.zip.*;
import java.io.*;

public class Butilidades {
	private String inputFile;
	private String outputFile;
    private static final int BUFFER_SIZE = 1024;
    
    public Butilidades(String file, String out){
    	this.inputFile = file;
    	this.outputFile = out;
    }

    public String getInputFile() {
        return inputFile;
    }

    public void setInputFile(String inputFile) {
        this.inputFile = inputFile;
    }
    
    public ArrayList<String[]> leerXLS() throws FileNotFoundException, IOException{
    	ArrayList<String[]> listaErrores= new ArrayList<String[]>();
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	SimpleDateFormat dateEntrada = new SimpleDateFormat("dd-MMM-yyyy");
    	SimpleDateFormat horaFormat = new SimpleDateFormat("HH:mm:ss");
        InputStream ExcelFileToRead = new FileInputStream(inputFile);
        File f = new File(inputFile);
        HSSFWorkbook wb = new HSSFWorkbook(ExcelFileToRead);
        String query="";
        int registros=0;
        int folio_receta=0, cedula=0, clave=0, edad=0, id_unidad, id_origen;
        String nombre_paciente="", nombre_medi="", descrip="", unidad="", jurs="";
        
        HSSFSheet sheet=wb.getSheetAt(0);
        sheet.shiftRows(1, sheet.getLastRowNum(), -1);
        HSSFRow row; 
        HSSFCell cell;
        CsvWriter archivo=new CsvWriter(new FileWriter(f.getParent() + File.separator + "nuevo.csv", true), ',');
        String auxRuta=f.getParent() + File.separator + "nuevo.csv";
        File fCSV = new File(auxRuta);
        Iterator rows = sheet.rowIterator();

        while (rows.hasNext())
        //while (registros<15)
        {
        	try{
        		row=(HSSFRow) rows.next();
                Iterator cells = row.cellIterator();
                registros += 1;
                //AQUI OBTENEMOS EL FOLIO DE LA RECETA
                cell=row.getCell(0);
                archivo.write(datoCSV(row.getCell(0).toString()));
                if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING){
                	String cadena=cell.getStringCellValue().trim().replace("-", "");
                	isNumeric(cadena, "Folio Receta [Columna 0]", listaErrores, registros);
                }
                //folio_receta=(int)cell.getNumericCellValue();
                
                cell=row.getCell(1);//Fecha (Ya no hay que darle formato)
                //Date date=dateEntrada.parse(row.getCell(1).toString().trim());
                archivo.write(datoCSV(dateFormat.format(dateEntrada.parse(row.getCell(1).toString().trim()))));
                if(cell.getCellType()== HSSFCell.CELL_TYPE_STRING){
                	if (cell.getStringCellValue().trim().length()!= dateFormat.toPattern().length()){
                		agregarError("Fecha [Columna 1]", listaErrores, registros);
                	}
                }
                
                cell=row.getCell(2);//Hora
                archivo.write(datoCSV(horaFormat.format(horaFormat.parse(cell.getDateCellValue().toString().substring(11, 19)))));
                if(cell.getCellType()== HSSFCell.CELL_TYPE_STRING){
                	if (cell.getStringCellValue().trim().length()== 13){
                		int hora=0, min=0, seg=0;
                		String cadena_aux=cell.getStringCellValue().trim();
                		hora=Integer.parseInt(cadena_aux.substring(0, 2));
                		min=Integer.parseInt(cadena_aux.substring(3, 5));
                		min=Integer.parseInt(cadena_aux.substring(6, 8));
                		if (hora >24 || min >60 || seg>60){
                			agregarError("Hora [Columna 2]", listaErrores, registros);
                		}
                	}
                }

                cell=row.getCell(3);//No de jurisdiccion en romano
                archivo.write(datoCSV(row.getCell(3).toString()));
                if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	if (registros==1){
                		jurs=cell.getStringCellValue().trim();
                	}else if(!jurs.equals(cell.getStringCellValue().trim())){
                		agregarError("Jurisdiccion [Columna 3]", listaErrores, registros);
                	}
                }
                
                cell=row.getCell(4);
                archivo.write(datoCSV(row.getCell(4).toString()));
                
                cell=row.getCell(5);//unidad atencion*/
                archivo.write(datoCSV(row.getCell(5).toString()));
                if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	if (registros==1){
                		unidad=cell.getStringCellValue().trim();
                	}else if(!unidad.equals(cell.getStringCellValue().trim())){
                		agregarError("Unidad Atencion [Columna 5]", listaErrores, registros);
                	}
                }
                
                cell=row.getCell(6);//nombre del paciente
                archivo.write(datoCSV(row.getCell(6).toString()));
                	//nombre_paciente=cell.getStringCellValue();
                
                cell=row.getCell(7);//edad del paciente
                archivo.write(datoCSV(row.getCell(7).toString()));
                	//edad=(int)cell.getNumericCellValue();
                
                cell=row.getCell(8);//folio_sp
                archivo.write(datoCSV(row.getCell(8).toString()));
                
                cell=row.getCell(9);//afiliado
                archivo.write(datoCSV(row.getCell(9).toString()));
                validaCadenaVacia(cell,"Afiliado [Columna 9]", listaErrores, registros);
                
                cell=row.getCell(10);
                archivo.write(datoCSV(row.getCell(10).toString()));
                
                cell=row.getCell(11);//cedula medico
                archivo.write(datoCSV(row.getCell(11).toString()));
                	//cedula=(int)cell.getNumericCellValue();
                
                cell=row.getCell(12);//nombre medico
                archivo.write(datoCSV(row.getCell(12).toString()));
                	//nombre_medi=cell.getStringCellValue();
                
                cell=row.getCell(13);//causes
                archivo.write(datoCSV(row.getCell(13).toString()));
                
                cell=row.getCell(14);//clave insumo
                archivo.write(datoCSV(row.getCell(14).toString()));
                if (cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	String aux=cell.getStringCellValue().trim();
                	if(!aux.contains(".")){
                		aux.replace(".", "");
                		isNumeric(aux, "Clave insumo [Columna 14]", listaErrores, registros);
                	}
                }
                	//clave=(int)cell.getNumericCellValue();
                cell=row.getCell(15);//descripcion del producto
                archivo.write(datoCSV(row.getCell(15).toString().replace("\n", " ")));
                validaCadenaVacia(cell, "Descripcion [Columna 15]", listaErrores, registros);
                	//descrip=cell.getStringCellValue();
                
                cell=row.getCell(16);//cantidad solicitada
                archivo.write(datoCSV(row.getCell(16).toString()));
                esNumero(cell, "Cantidad Solicitada  [Columna 16]", listaErrores, registros);
                
                cell=row.getCell(17);//cantidad ***preungtar a que se refiere uni
                archivo.write(datoCSV(row.getCell(17).toString()));
                esNumero(cell, "Cantidad  [Columna 17]", listaErrores, registros);
                
                cell=row.getCell(18);//true o false si es surtida
                archivo.write(datoCSV(row.getCell(18).toString()));
                if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	String auxiliar=cell.getStringCellValue().trim();
                	if(!(auxiliar.equals("SI") || auxiliar.equals("NO") || auxiliar.equals("No") || auxiliar.equals("Si") )){
                		agregarError("Surtidad [Columna 18]", listaErrores, registros);
                	}
                }
                cell=row.getCell(19);//encargado
                archivo.write(datoCSV(row.getCell(19).toString()));
                validaCadenaVacia(cell, "Encargado [Columna 19]", listaErrores, registros);
                
                cell=row.getCell(20);//clave unidad atencion
                archivo.write(datoCSV(row.getCell(20).toString()));
                esNumero(cell, "Clave Unidad [Columna 20]", listaErrores, registros);
                	//id_unidad=(int)cell.getNumericCellValue();
                
                cell=row.getCell(21);//tipo medicamento
                archivo.write(datoCSV(row.getCell(21).toString()));
                validaCadenaVacia(cell, "Tipo Medicamento [Columna 21]", listaErrores, registros);
                
                cell=row.getCell(22);
                archivo.write(datoCSV(row.getCell(22).toString()));
                
                cell=row.getCell(23);
                archivo.write(datoCSV(row.getCell(23).toString()));
                
                cell=row.getCell(24);//cv_financiamiento
                archivo.write(datoCSV(row.getCell(24).toString()));
                if(cell.getCellType()!=HSSFCell.CELL_TYPE_NUMERIC){
                	String auxiliar=cell.getStringCellValue().trim();
                	isNumeric(auxiliar, "CV Financiamiento [Columna 24]", listaErrores, registros);
                }
                
                cell=row.getCell(25);//tipo de programa
                archivo.write(datoCSV(row.getCell(25).toString()));
                validaCadenaVacia(cell, "Tipo de programa [Columna 25]", listaErrores, registros);
                
                cell=row.getCell(26);//layout
                archivo.write(datoCSV(row.getCell(26).toString()));
                if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	String auxiliar=cell.getStringCellValue().trim();
                	String[] auxiliar2=auxiliar.split("-");
                	if(auxiliar2.length!=6){
                		agregarError("Layout [Columa 26]", listaErrores, registros);
                	}
                }
                
                cell=row.getCell(27);//id origen
                archivo.write(datoCSV(row.getCell(27).toString()));
                esNumero(cell, "Id Origen [Columna 27]", listaErrores, registros);
                	//id_origen=(int)cell.getNumericCellValue();
                
                cell=row.getCell(28);//presentacion del insumo
                archivo.write(datoCSV(row.getCell(28).toString()));
                validaCadenaVacia(cell, "Presentacion [Columna28]", listaErrores, registros);
                
                cell=row.getCell(29);//cantidad pendiente
                archivo.write(datoCSV(row.getCell(29).toString()));
                esNumero(cell, "Cantidad Pendiente [Columna 29]", listaErrores, registros);
                
                cell=row.getCell(30);//status de la receta
                archivo.write(datoCSV(row.getCell(30).toString()));
                if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	String auxiliar=cell.getStringCellValue().trim();
                	if(!(auxiliar.equals("SURTIDO COMPLETO") || auxiliar.equals("SURTIDO PARCIAL"))){
                		agregarError("Estatus Receta [Columna 30]", listaErrores, registros);
                	}
                }
                
                cell=row.getCell(31);//tipo de la receta
                archivo.write(datoCSV(row.getCell(31).toString()));
                if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	String auxiliar=cell.getStringCellValue().trim();
                	if(!(auxiliar.equals("RC") || auxiliar.equals("RF"))){
                		agregarError("Tipo de Receta [Columna 31]", listaErrores, registros);
                	}
                }
                
                cell=row.getCell(32);//precio
                archivo.write(datoCSV(row.getCell(32).toString()));
                if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	String auxiliar=cell.getStringCellValue().trim();
                	auxiliar.replace(".", "");
                	isNumeric(auxiliar, "Precio [Columna 32]", listaErrores, registros);
                }
                
                cell=row.getCell(33);
                archivo.write(datoCSV(row.getCell(33).toString()));
                
                cell=row.getCell(34);
                archivo.write(datoCSV(row.getCell(34).toString()));
                
                cell=row.getCell(35);
                archivo.write(datoCSV(row.getCell(35).toString()));
                
                cell=row.getCell(36);
                archivo.write(datoCSV(row.getCell(36).toString()));
                
                cell=row.getCell(37);//servicio
                archivo.write(datoCSV(row.getCell(37).toString()));
                
                cell=row.getCell(38);//dias de la semana
                archivo.write(datoCSV(row.getCell(38).toString()));
                validaCadenaVacia(cell, "Dias de la semana", listaErrores, registros);
                
                cell=row.getCell(39);//descriopcion cuase ***campo demasiado grande*/
                archivo.write(datoCSV(row.getCell(39).toString()));
                
                cell=row.getCell(40);
                archivo.write(datoCSV(row.getCell(40).toString()));
                
                cell=row.getCell(41);
                archivo.write(datoCSV(row.getCell(41).toString()));
                
                cell=row.getCell(42);
                archivo.write(datoCSV(row.getCell(42).toString()));
                
                cell=row.getCell(43);
                archivo.write(datoCSV(row.getCell(43).toString()));
                
                cell=row.getCell(44);
                archivo.write(datoCSV(row.getCell(44).toString()));
                
                cell=row.getCell(45);//municipio
                archivo.write(datoCSV(row.getCell(45).toString()));
                validaCadenaVacia(cell, "Municipio", listaErrores, registros);
                
                cell=row.getCell(46);//costo_u
                archivo.write(datoCSV(row.getCell(46).toString()));
                if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	String auxiliar_cad=cell.getStringCellValue().trim();
                	auxiliar_cad.replace(".", "");
                	isNumeric(auxiliar_cad, "Costo_u [Columna 46]", listaErrores, registros);
                }
                
                cell=row.getCell(47);//costo
                archivo.write(datoCSV(row.getCell(47).toString()));
                if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                	String auxiliar_cad2=cell.getStringCellValue().trim();
                	auxiliar_cad2.replace(".", "");
                	isNumeric(auxiliar_cad2, "Costo [Columna 47]", listaErrores, registros);
                }
                cell=row.getCell(48);//municipio
                archivo.write(datoCSV(row.getCell(48).toString()));
                
                archivo.endRecord();
                //query+="("+folio_receta + ",\'" + nombre_paciente + "\'," + cedula + ",\'" + nombre_medi + "\'," + clave + "," + edad + ", "+ id_unidad + ", " + id_origen +"),";
        	}catch(Exception e){
        		//res+=e + " Error en la fila: " + registros + "del excel\n";
        		System.out.println(e);
        	}
                
                /*
                if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING)
                {
                	System.out.println(cell.getStringCellValue());
                }else if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC)
                {
                    System.out.print((int)cell.getNumericCellValue());
                }
                if(registros==10){
                	break;
                }*/
               /*while (cells.hasNext())
                {
                        cell=(HSSFCell) cells.next();
                        if(cell.getColumnIndex()==0){//folio de la receta
                        	System.out.print(cell.getStringCellValue()+" ");
                        }else if(cell.getColumnIndex()==11){//cedula del medico
                        	
                        }
                        if(registros==10){
                        	break;
                        }
                        /*
                        if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING)
                        {
                                System.out.print(cell.getStringCellValue()+" ");
                                res+=cell.getStringCellValue()+" ";
                                res+= "\n";
                        }
                        else if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC)
                        {
                                System.out.print(cell.getNumericCellValue()+" ");
                                res+=cell.getNumericCellValue()+" ";
                                res+= "\n";
                        }
                        else
                        {
                                //U Can Handel Boolean, Formula, Errors
                        }
                }*/
                //System.out.println();
        }
        archivo.close();
        if(f.exists())
        	f.delete();
        String aux_query="LOAD DATA LOCAL INFILE '" + fCSV.getAbsolutePath().replace("\\", "/") + "' INTO TABLE excel FIELDS TERMINATED BY ',' LINES TERMINATED BY '\\n'";
        //res = "Número de registros en el archivo: " + String.valueOf(registros);
        if(listaErrores.size()==0){
        	try{
            	
            	conexion conex = new conexion();
            	conex.conectar();
            	conex.getCon().createStatement().executeUpdate(aux_query);
            	conex.getCon().close();
            }catch(Exception e){
            	System.out.println(e);
            }
        }
        if(fCSV.exists())
        	fCSV.delete();
        return listaErrores;
    }
    
    public ArrayList<String[]> leerXLSX() throws IOException{
    	ArrayList<String[]> res= new ArrayList<String[]>();
    	int registros=0;
        InputStream ExcelFileToRead = new FileInputStream(inputFile);
        File f = new File(inputFile);
        XSSFWorkbook  wb = new XSSFWorkbook(ExcelFileToRead);

        XSSFWorkbook test = new XSSFWorkbook(); 

        XSSFSheet sheet = wb.getSheetAt(0);
        XSSFRow row; 
        XSSFCell cell;

        Iterator rows = sheet.rowIterator();

        while (rows.hasNext())
        {
                row=(XSSFRow) rows.next();
                Iterator cells = row.cellIterator();
                registros += 1;
                /*while (cells.hasNext())
                {
                        cell=(XSSFCell) cells.next();

                        if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
                        {
                                System.out.print(cell.getStringCellValue()+" ");
                        }
                        else if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
                        {
                                System.out.print(cell.getNumericCellValue()+" ");
                        }
                        else
                        {
                                //U Can Handel Boolean, Formula, Errors
                        }
                }*/
                //System.out.println();
        }
        if(f.exists())
        	f.delete();
        return res;
    }
    
    public ArrayList<String[]> descomprimirZIP() throws IOException{
    	ArrayList<String[]> res = new ArrayList<String[]>();
        int buffer = 2048;
        BufferedOutputStream dest = null;
		FileInputStream fis = null;
		ZipInputStream zis = null;
        FileOutputStream fos = null;
        ZipEntry entry;
        File f;
        
        try{
        	f= new File(inputFile);
            fis= new FileInputStream(inputFile);
            zis = new ZipInputStream(new BufferedInputStream(fis));
            while((entry = zis.getNextEntry()) != null){
                int count;
                byte data[] = new byte[buffer];
                fos = new FileOutputStream(outputFile + File.separator + entry.getName());
                dest = new BufferedOutputStream(fos, buffer);
                while ((count = zis.read(data, 0, buffer)) != -1){
                   dest.write(data, 0, count);
                }
                dest.flush();
                if(entry.getName().endsWith("xls")){
    				this.setInputFile(outputFile + File.separator + entry.getName());
    				res=this.leerXLS();
    			}else if(entry.getName().endsWith("xlsx")){
    				this.setInputFile(outputFile + File.separator + entry.getName());
    				res=this.leerXLSX();
    			}
            }
            zis.close();
            if(f.exists())
            	f.delete();
        }catch(Exception e){
            System.out.println(e);
        }finally{
            dest.close();
            zis.close();
            fos.close();
            fis.close();
        }
        return res;
    }
    public ArrayList<String[]> descomprimirRAR(){
    	ArrayList<String[]> res= new ArrayList<String[]>();
        try{
            File f = new File(inputFile);
            Archive a = null;
            a = new Archive(new FileVolumeManager(f));
            if(a != null){
            	FileHeader fh = a.nextFileHeader();
                while(fh != null){
                    File out = new File(outputFile + File.separator + fh.getFileNameString().trim());
                    //System.out.println(out.getAbsolutePath());
                    FileOutputStream os = new FileOutputStream(out);
                    a.extractFile(fh, os);
                    os.close();
                    if(fh.getFileNameString().trim().endsWith("xls")){
        				this.setInputFile(outputFile + File.separator + fh.getFileNameString().trim());
        				res=this.leerXLS();
        			}else if(fh.getFileNameString().trim().endsWith("xlsx")){
        				this.setInputFile(outputFile + File.separator + fh.getFileNameString().trim());
        				res=this.leerXLSX();
        			}
                    fh = a.nextFileHeader();
                }
            }
            a.close();
            if(f.exists())
            	f.delete();
        }
        catch(Exception e){
            System.out.println(e);
        }
        return res;
    }
    public static String datoCSV(String celda){
    	String res="";
    	if(celda.contains(".m.") || celda.contains(":")){
    		res=celda.trim();
    	}else if(celda.endsWith(".0")){
    		try{
    			res=String.valueOf(Integer.parseInt(celda.trim()));
    		}catch(Exception e){
    			res=celda.trim();
    		}
    	}
    	else if(celda.contains(".1")||celda.contains(".2")||celda.contains(".3")||celda.contains(".4")||
    			celda.contains(".5")||celda.contains(".6")||celda.contains(".7")||celda.contains(".8")||
    			celda.contains(".9")||celda.contains(".0")){
    		res=String.valueOf(Double.parseDouble(celda.trim()));
    		
    	}else{
    		try{
    			res=String.valueOf(Integer.parseInt(celda.trim()));
    		}catch(Exception e){
    			res=celda.trim();
    		}
    	}
    	return res;
    }
    public static boolean isNumeric(String cadena, String columna, ArrayList<String[]> listaErrores, int registros){
    	try{
    		Integer.parseInt(cadena);
    		return true;
    	}catch(Exception e){
    		String[] error=new String[2];
    		error[0]=columna;
    		registros += 1;
    		error[1]=String.valueOf(registros);
    		listaErrores.add(error);
    		return false;
    	}
    }

    public static void validaCadenaVacia(HSSFCell cell, String columna, ArrayList<String[]> listaErrores, int registros){
    	if(cell.getCellType()== HSSFCell.CELL_TYPE_STRING){
    		String des=cell.getStringCellValue().trim().replace("\n", " ");
    		int w=0;
    		while(cell.getStringCellValue().trim().charAt(w)==' ' && w<cell.getStringCellValue().trim().length()){
    			w++;
    		}if(w+1==cell.getStringCellValue().trim().length()){
    			String[] error=new String[2];
    			error[0]=columna;
    			registros += 1;
    			error[1]=String.valueOf(registros);
    			listaErrores.add(error);
    		}
    	}
    }
    
    public static void esNumero(HSSFCell cell, String columna, ArrayList<String[]> listaErrores, int registros){
    	if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING){
    		String[] error=new String[2];
    		error[0]=columna;
    		registros += 1;
    		error[1]=String.valueOf(registros);
    		listaErrores.add(error);
    	}
    }

    public static void esCadena(HSSFCell cell, String columna, ArrayList<String[]> listaErrores, int registros){
    	if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){
    		String[] error=new String[2];
    		error[0]=columna;
    		registros += 1;
    		error[1]=String.valueOf(registros);
    		listaErrores.add(error);
    	}
    }
    
    public static void agregarError(String columna, ArrayList<String[]> listaErrores, int registros){
    	String[] error=new String[2];
    	error[0]=columna;
    	registros += 1;
    	error[1]=String.valueOf(registros);
    	listaErrores.add(error);
    }
}
