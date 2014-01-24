package controlador;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Berror;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



/**
 * Servlet implementation class ServletUpload
 */
@WebServlet("/ServletUpload")
public class ServletUpload extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "upload/archivosTemp";
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
    private boolean transferencia;
    private String nombreArchivo="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
            PrintWriter writer = response.getWriter();
            writer.println("Error: El contenido no es de tipo Multipart");
            writer.flush();
            return;
        }
		SqlSentencia sentencia;
		DiskFileItemFactory factory = new DiskFileItemFactory();
        //Se establece el umbral de memoria
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        //Establece un directorio temporal para la carga de archivo
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        //Establece el tamaño maxiño del archivo
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        //Establece el tamaño maxiño de la petición (incluyendo archivo + datos del formulario)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        //Construye el path del directorio para guardar el archivo
        //Este path es relativo al directorio de la aplicación
        ServletContext servletContext = request.getSession().getServletContext();
		String absoluteDiskPath = servletContext.getRealPath(UPLOAD_DIRECTORY);
		//System.out.println(absoluteDiskPath);
        String uploadPath = absoluteDiskPath;
        //Crea el directorio si no existe
        File uploadDir = new File(uploadPath);
        
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        try {
            //Procesa en contenido de la peticion y extrae la info del archivo
            List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0) {
                //Itera sobre los campos del form
                for (FileItem item : formItems) {
                    //Procesa solo los campos que no son parte del form
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        //Guarda el archivo en disco
                        item.write(storeFile);
                        
                        sentencia= new SqlSentencia();
                        Berror er= new Berror();
                        er.setMsj(sentencia.insertarDAtos(filePath,fileName, uploadPath));
                        request.getSession().setAttribute("msj", er);
                    }
                }
            }
        } catch (Exception ex) {
        	System.out.println(ex);
        }
        response.sendRedirect("upload/subirExcell.jsp");

	}

}
