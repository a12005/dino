java Command to 
compile : javac file.java
execute : java file
sudo apt-get install traceroute ex5

3 a)Bit Stuffing:

import java.util.*;
class BitStuff{
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the bits:");
        String s=sc.nextLine();
        String res=bitstuffing(s);
        System.out.println("Original Data Stream:");
        System.out.println(s);
        System.out.println("Bitstuffed Data Stream:");
        System.out.println(res);
    }
    public static String bitstuffing(String s){
        StringBuilder sb=new StringBuilder();
        int count=0;
        for(int i=0;i<s.length();i++){
            char bit=s.charAt(i);
            sb.append(bit);
            if(bit=='1'){
                count++;
            }else{
                count=0;
            }
            if(count==5){
                sb.append('0');
                count=0;
            }
        }
        return sb.toString();
    }
}

3 b)Character Stuffing:

import java.util.*;
class CharStuff{
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the number of Characters:");
        int n=sc.nextInt();
        System.out.println("Enter the characters:");
        String arr[]=new String[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.next();
        }
        for(int i=0;i<n;i++){
            if(arr[i].equals("dle")){
                arr[i]="dle dle";
            }
        }
        System.out.println("Transmitted message is: ");
        System.out.print("dle stx ");
        for(int i=0;i<n;i++){
            System.out.print(arr[i]+" ");
        }
        System.out.print("dle etx");
    }
}
=======================================================================================================
4  a)Sliding window

sender:
import java.util.*;
import java.io.*;
import java.net.*;

class sender{
    public static void main(String[] args) throws Exception{
        Scanner s = new Scanner(System.in);
        Socket soc = new Socket("localhost",12345);
        System.out.print("Enter the no. of frames: ");        
        int n = s.nextInt();
        s.nextLine();
        String arr[] = new String[n];
        System.out.println("Enter "+n+" messages to send: ");        
        for(int i=0; i<n; i++){
            arr[i] = s.nextLine();
        }
        PrintStream out = new PrintStream(soc.getOutputStream());
        for(String temp:arr){
            out.println(temp);
        }
        System.out.println("Acknowledgement Received");        
    }
}

Receiver:

import java.util.*;
import java.io.*;
import java.net.*;

class receiver{
    public static void main(String[] args) throws Exception{
        ServerSocket ssoc = new ServerSocket(12345);
        Socket soc = ssoc.accept();
        DataInputStream in = new DataInputStream(soc.getInputStream());
        int i = 0;
        String msg;
        while((msg = in.readLine())!=null){
            System.out.println("The received frame "+i+" is : "+msg);
            i++;
        }
        System.out.println("Acknowledgement sent");     
    }
}
---------------------------------------------------------------------------------------------------------
b)Stop and Wait:

sender:

import java.util.*;
import java.io.*;
import java.net.*;

class sender{
    public static void main(String[] args) throws Exception{
        Scanner s = new Scanner(System.in);
        Socket soc = new Socket("localhost",12345);
        System.out.println("Connected to receiver");  
        System.out.print("Enter data to send: ");        
        String str = s.nextLine();
        PrintStream out = new PrintStream(soc.getOutputStream());
        for(char a:str.toCharArray()){
            System.out.println("data sent = "+a);
            out.println(a);
            System.out.println("waiting for Ack........"); 
            System.out.println("receiver packet received"); 
        }
        System.out.println("All data packet sent, Exiting.");        
    }
}

Receiver:

import java.util.*;
import java.io.*;
import java.net.*;
import java.awt.*;

class receiver{
    public static void main(String[] args) throws Exception{
        ServerSocket ssoc = new ServerSocket(12345);
        Socket soc = ssoc.accept();
        DataInputStream in = new DataInputStream(soc.getInputStream());
        int i = 0;

        String msg;
        while((msg = in.readLine())!=null){
            System.out.println("received = "+msg);
            i++;
        }
        System.out.println("Received all data packets");     
    }
}

========================================================================================================
5 ping and 7 a). Upd
Client:

import java.util.*;
import java.net.*;
import java.io.*;

class client {
    public static void main(String[] args) {
        long t1, t2;
        int c = 0;
        String str;

        try {
            Socket s = new Socket("localhost", 5555);
            BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
            PrintStream out1 = new PrintStream(s.getOutputStream());

            while (c < 4) {
                t1 = System.currentTimeMillis();
                str = "Welcome to Ubuntu";

                out1.println(str);
                System.out.println(br.readLine());

                t2 = System.currentTimeMillis();
                System.out.println("TLL : " + (t2 - t1) + " ms");
                c++;
            }
            s.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}




Server :


import java.io.*;
import java.net.*;
import java.util.*;

class Main {
    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(5555);
            Socket s = ss.accept();
            int c = 0;
            
            while (c < 4) {
                BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
                PrintStream out2 = new PrintStream(s.getOutputStream());

                String str = br.readLine();
                out2.println("Response Message: " + InetAddress.getLocalHost() + " Length: " + str.length()+" String "+str);
                c++;
            }
            s.close();
            ss.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

-----------------------------------------------------------------------------------------------------------

5 b) traceout


import java.io.*;
import java.util.*;

class Traceroute {
    public static void main(String args[]) {
        try {
            System.out.print("Enter the IP Address to be Traced: ");
            Scanner scanner = new Scanner(System.in);
            String ip = scanner.nextLine();
            
            Runtime runtime = Runtime.getRuntime();
            Process process = runtime.exec("traceroute " + ip);
            
            Scanner processScanner = new Scanner(process.getInputStream());
            while (processScanner.hasNextLine()) {
                System.out.println(" " + processScanner.nextLine());
            }
            
            processScanner.close();
            scanner.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

==================================================================================================

8) http image upload

Server:

import java.io.*;
import java.net.*;
import java.util.*;
import javax.swing.*;
import java.awt.*;

class server {
    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(5555);
            Socket s = ss.accept();
            int c = 0;
            
                BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
                PrintStream out2 = new PrintStream(s.getOutputStream());

                String str = br.readLine();
		opener(str);
                out2.println("Image Opened");
             
       
            s.close();
            ss.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void opener(String str) {
        String directoryPath = str;
        
        
       JFrame frame = new JFrame("Image Viewer");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        // Load and display the image
        ImageIcon imageIcon = new ImageIcon(directoryPath);
        JLabel label = new JLabel(imageIcon);
        frame.add(label);
        
        // Adjust the frame size to fit the image
        frame.pack();
        frame.setLocationRelativeTo(null); // Center the frame
        frame.setVisible(true);
    }
}


Client:


import java.util.*;
import java.net.*;
import java.io.*;

class client {
    public static void main(String[] args) {
        try {
            Socket s = new Socket("localhost", 5555);

            BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
            PrintStream out1 = new PrintStream(s.getOutputStream());


  
            String str = "C:/Users/gokul/Documents/download.jpg";

            out1.println(str);
            System.out.println("Response Message : "+br.readLine());

                               
            s.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

==================================================================================================

9) subnet 

import java.util.*;
class subnet
{
	public static void main(String []args)
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter the IP Address : ");
		String ip = sc.next();
		String arr[] = ip.split("\\.");
		String binary="";

		for(int i=0;i<4;i++)
		{
			int dec = Integer.parseInt(arr[i]);
			String b = Integer.toBinaryString(dec);
			binary+=b;
			binary+=" ";
		}
		System.out.println("Binary Format of Ip Address : "+binary);

		//Subnet Mask of Ip
		System.out.println("Enter the number of addresses in each subnet : ");
		int n = sc.nextInt();
		int bits = (int)Math.ceil(Math.log(n)/Math.log(2));
		int mask = 32 - bits;

		System.out.println("Subnet Mask : "+mask);

		//Network Address  -1
		String na = "";
		String ba = "";
		for(int i=0;i<4;i++)
		{
			if(i==3)
			{
				int add=Integer.parseInt(arr[i]);
				na+=String.valueOf(add-1);
				ba+=String.valueOf(add+6);
			}
			else
			{
				na+=arr[i]+".";
				ba+=arr[i]+".";
			}
		}

		//Print data
		System.out.println("Network address is : "+na);
		System.out.println("Broadcast address is : "+ba);
	}
}


==================================================================================================