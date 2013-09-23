//
//  vx.configure.cpp
//  Shreditor
//
//  Created by Thijs Koerselman on 4/23/13.
//
//

#include "vx.configure.h"
#include "maxcpp6.h"


#include <iostream>
//#include "rapidxml/rapidxml.hpp"
//#include "rapidxml/rapidxml_iterators.hpp"
//#include "rapidxml/rapidxml_print.hpp"
//#include "rapidxml/rapidxml_utils.hpp"
#include "tinyxml2.h"

//#include "rapidxml/rapidxml.hpp"
#include <string>
//using namespace rapidxml;
using namespace tinyxml2;

class Configure : public MaxCpp6<Configure> {
public:
	Configure(t_symbol * sym, long ac, t_atom * av)
    :   filepath_(gensym(""))
    {
		setupIO(1, 1); // inlets / outlets
	}
	~Configure() {}
    
	void read(long inlet, t_symbol *filepath) {
        post("filepath: %s", filepath->s_name);
        
        std::string text("<myroot><myproperty>something</myproperty></myroot>");
        
//        xml_document<> doc;    // character type defaults to char
//        doc.parse<0>((char*)text.c_str());    // 0 means default parse flags
//        
        
        post("read is not implemented yet");
        
        
        XMLDocument doc;
        doc.LoadFile( filepath->s_name);
        
        // Structure of the XML file:
        // - Element "PLAY"      the root Element, which is the
        //                       FirstChildElement of the Document
        // - - Element "TITLE"   child of the root PLAY Element
        // - - - Text            child of the TITLE Element
        
        // Navigate to the title, using the convenience function,
        // with a dangerous lack of error checking.
        const char* title = doc.FirstChildElement( "PLAY" )->FirstChildElement( "TITLE" )->GetText();
        printf( "Name of play (1): %s\n", title );
        
        // Text is just another Node to TinyXML-2. The more
        // general way to get to the XMLText:
        XMLText* textNode = doc.FirstChildElement( "PLAY" )->FirstChildElement( "TITLE" )->FirstChild()->ToText();
        title = textNode->Value();
        printf( "Name of play (2): %s\n", title );
    }
    
    
private:
    t_atom atoms_[32];
    t_symbol *filepath_;
    
};

// a macro to mark exported symbols in the code without requiring an external file to define them
#ifdef WIN_VERSION
// note that this is the required syntax on windows regardless of whether the compiler is msvc or gcc
#define T_EXPORT __declspec(dllexport)
#else // MAC_VERSION
// the mac uses the standard gcc syntax, you should also set the -fvisibility=hidden flag to hide the non-marked symbols
#define T_EXPORT __attribute__((visibility("default")))
#endif


int T_EXPORT main(void) {
	// create a class with the given name:
	Configure::makeMaxClass("vx.configure");
    REGISTER_METHOD_SYMBOL(Configure, read);

}