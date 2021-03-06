package kr.or.ddit.util;

import net.openhft.compiler.CompilerUtils;

public class TestCompiler {
	public static void main(String[] args) {

//		String className = "mypackage.MyClass";
//		String javaCode = "package mypackage;\n" +
//		                 "public class MyClass implements Runnable {\n" +
//		                 "    public void run() {\n" +
//		                 "        System.out.println(\"Hello World\");\n" +
//		                 "    }\n" +
//		                 "}\n";
//		Runnable runner = null;
//		try {
//			Class aClass = CompilerUtils.CACHED_COMPILER.loadFromJava(className, javaCode);
//			runner = (Runnable) aClass.newInstance();
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (InstantiationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IllegalAccessException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		runner.run();
		// dynamically you can call
				String className = "mypackage.MyClass";
				
				StringBuilder code = new StringBuilder();
				code.append("package mypackage;");
				code.append("import java.util.Date;");
				code.append("public class MyClass implements Runnable {");
				code.append("    public void run() {");
				code.append("		MemberVO vo = new MemberVO();");
				code.append("				Date date = new Date();");
				code.append("		System.out.println(vo.id);");
				code.append("		System.out.println(date);");
				code.append("        System.out.println(\"Hello World\");");
				code.append("    }");
				code.append("}");
				code.append("class MemberVO {");
				code.append("public int id = 5;");
				code.append("}");
				
				Runnable runner = null;
				try {
					Class aClass = CompilerUtils.CACHED_COMPILER.loadFromJava(className, code.toString());
					runner = (Runnable) aClass.newInstance();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
				runner.run();
	}
}
