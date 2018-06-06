把需要的jar包从struts2的lib目录复制到WEB-INF/lib文件夹下，最基础的需要8个jar包： 
commons-fileupload-1.3.3.jar、commons-io-2.5.jar、commons-lang3-3.6.jar、freemarker-2.3.26.jar、 
log4j-api-2.9.1.jar、ognl-3.1.15.jar、struts2-core-2.5.14.1.jar、javassist-3.20.0-GA.jar

注意：struts2.5之前的版本有点不同，还需要xwork-core.jar，不需要log4j-api-2.7.jar。原因是struts2.5把xwork的源码 
合并到了struts-core中。struts2.5之前使用logging API，而struts2.5用log4j 2 API取代。 
如果你听从了我的建议，阅读了struts2.5的 version-notes ，你就能知道详细的原因。