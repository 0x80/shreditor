/*

Write MaxMSP (v5) objects in C++

-- general --

Allows the definition of a max object as a C++ class. 

Most of the mechanics of typical max objects are encapsulated by the curiously recurring template pattern. 

note: be careful to only include this header once, to avoid linker errors!
note: this probably won't work with virtuals -- and definitely won't work with multiple inheritance!

-- licence --
maxcpp is distributed under the permissive BSD-like MIT licence:

Copyright (c) 2009-2013 Graham Wakefield

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

/* 
 Edited by Thijs Koerselman
 DSP base class removed and added some extra macros
*/

#ifndef MAXMSP_CPP_6_H
#define MAXMSP_CPP_6_H

#include "ext.h"
#include "ext_obex.h"
#include "ext_common.h"
#include "commonsyms.h"

#include <new>

#define MAX_CPP_VERSION	0.600

// for A_NOTHING methods (e.g. bang):
#define REGISTER_METHOD(CLASS, METHOD)	class_addmethod(	\
	(t_class *)CLASS::m_class,								\
	(method)CLASS::MaxMethod<&CLASS::METHOD>::call,			\
	#METHOD,												\
	0);	
// for A_GIMME methods (t_symbol * s, long argc, void * argv):
#define REGISTER_METHOD_GIMME(CLASS, METHOD)	class_addmethod(	\
	(t_class *)CLASS::m_class,								\
	(method)CLASS::MaxMethodGimme<&CLASS::METHOD>::call,	\
	#METHOD,												\
	A_GIMME,												\
	0);	
	
// for A_FLOAT methods (double v):
#define REGISTER_METHOD_FLOAT(CLASS, METHOD)	class_addmethod(	\
	(t_class *)CLASS::m_class,								\
	(method)CLASS::MaxMethodFloat<&CLASS::METHOD>::call,	\
	#METHOD,												\
	A_FLOAT,												\
	0);	
	
// for A_INT methods (long v):
#define REGISTER_METHOD_LONG(CLASS, METHOD)	class_addmethod(	\
	(t_class *)CLASS::m_class,								\
	(method)CLASS::MaxMethodLong<&CLASS::METHOD>::call,	\
	#METHOD,												\
	A_LONG,												\
	0);
	

// START EDIT THIJS
#define REGISTER_METHOD_SYMBOL(CLASS, METHOD) class_addmethod(\
(t_class *)CLASS::m_class,								\
(method)CLASS::MaxMethodSymbol<&CLASS::METHOD>::call,	\
#METHOD,												\
A_SYM,                                                  \
0);

#define REGISTER_METHOD_SYMBOL_LONG(CLASS, METHOD) class_addmethod(\
(t_class *)CLASS::m_class,								\
(method)CLASS::MaxMethodSymbolLong<&CLASS::METHOD>::call,	\
#METHOD,												\
A_SYM, A_LONG,                                                  \
0);

#define REGISTER_METHOD_LONG2(CLASS, METHOD) class_addmethod(\
(t_class *)CLASS::m_class,								\
(method)CLASS::MaxMethodLong2<&CLASS::METHOD>::call,	\
#METHOD,												\
A_LONG,                                                 \
A_LONG,                                                 \
0);

#define REGISTER_METHOD_ANYTHING(CLASS, METHOD)	class_addmethod(\
(t_class *)CLASS::m_class,								\
(method)CLASS::MaxMethodAnything<&CLASS::METHOD>::call,	\
#METHOD,												\
A_GIMME,												\
0);


// for default int handling without prepended message
#define REGISTER_METHOD_LONG_DEF(CLASS, METHOD)	class_addmethod(\
(t_class *)CLASS::m_class,								\
(method)CLASS::MaxMethodLongDef<&CLASS::METHOD>::call,	\
"int",                                                  \
A_LONG,                                                 \
0);

// for default int handling without prepended message
#define REGISTER_METHOD_LIST_DEF(CLASS, METHOD)	class_addmethod(\
(t_class *)CLASS::m_class,								\
(method)CLASS::MaxMethodListDef<&CLASS::METHOD>::call,	\
"list",                                                 \
A_GIMME,												\
0);
// END EDIT THIJS




// a purely static base class for Max and MSP objects:
template <typename T>
class MaxCppBase {
public:
	
	static t_class * m_class;
	
	// template functors to forward Max messages to class methods:
	
	typedef void (T::*maxmethodgimme)(long inlet, t_symbol * s, long ac, t_atom * av);
	template<maxmethodgimme F>
	struct MaxMethodGimme {
		static void call(T * x, t_symbol * s, long ac, t_atom * av) { ((x)->*F)(proxy_getinlet((t_object *)x), s, ac, av); }
	};
	
	typedef void (T::*maxmethod)(long inlet);
	template<maxmethod F>
	struct MaxMethod {
		static void call(T * x) { ((x)->*F)(proxy_getinlet((t_object *)x)); }
	};
	
	typedef void (T::*maxmethodlong)(long inlet, long v);
	template<maxmethodlong F>
	struct MaxMethodLong {
		static void call(T * x, long v) { ((x)->*F)(proxy_getinlet((t_object *)x), v); }
	};
	
	typedef void (T::*maxmethodfloat)(long inlet, double v);
	template<maxmethodfloat F>
	struct MaxMethodFloat {
		static void call(T * x, double v) { ((x)->*F)(proxy_getinlet((t_object *)x), v); }
	};
    
    // START EDIT THIJS
    typedef void (T::*maxmethodsymbol)(long inlet, t_symbol *v);
	template<maxmethodsymbol F>
	struct MaxMethodSymbol {
		static void call(T * x, t_symbol *v) { ((x)->*F)(proxy_getinlet((t_object *)x), v); }
	};
    
    typedef void (T::*maxmethodsymbollong)(long inlet, t_symbol *s, long v);
	template<maxmethodsymbollong F>
	struct MaxMethodSymbolLong {
		static void call(T * x, t_symbol *s, long v) { ((x)->*F)(proxy_getinlet((t_object *)x), s, v); }
	};
    
    typedef void (T::*maxmethodlong2)(long inlet, long a, long b);
	template<maxmethodlong2 F>
	struct MaxMethodLong2 {
		static void call(T * x, long a, long b) { ((x)->*F)(proxy_getinlet((t_object *)x), a, b); }
	};
    
    typedef void (T::*maxmethodanything)(long inlet, t_symbol * s, long ac, t_atom * av);
	template<maxmethodanything F>
	struct MaxMethodAnything {
		static void call(T * x, t_symbol * s, long ac, t_atom * av) { ((x)->*F)(proxy_getinlet((t_object *)x), s, ac, av); }
	};
    
    typedef void (T::*maxmethodlongdef)(long v);
	template<maxmethodlongdef F>
	struct MaxMethodLongDef {
		static void call(T * x, long v) { ((x)->*F)(v); }
	};
    
    typedef void (T::*maxmethodlistdef)(t_symbol * s, long ac, t_atom * av);
	template<maxmethodlistdef F>
	struct MaxMethodListDef {
		static void call(T * x, t_symbol * s, long ac, t_atom * av) { ((x)->*F)(s, ac, av); }
	};
    // END EDIT THIJS

};

// note: only include this file once to prevent linker errors!
template<typename T> t_class * MaxCppBase<T>::m_class = 0;

// inherit from this one for non-audio objects
template <typename T>
class MaxCpp6 : public MaxCppBase<T> {
public:
	t_object m_ob;
	void **	m_outlets;
	void **	m_inletproxies;
	long m_whichinlet;
	
	static t_class * makeMaxClass(const char * classname) {
		common_symbols_init();
		t_class * c = class_new(classname, (method)MaxCpp6<T>::maxcpp_create, (method)MaxCpp6<T>::maxcpp_destroy, sizeof(T), 0L, A_GIMME, 0);
		class_register(CLASS_BOX, c);
		MaxCppBase<T>::m_class = c;
		return c;
	}
	
	static void * maxcpp_create(t_symbol * sym, long ac, t_atom * av) {
		void * x = object_alloc(MaxCppBase<T>::m_class);
		new(x) T(sym, ac, av);
		return (T *)x; 
	}
	
	static void maxcpp_destroy(t_object * x) {
		T * t = (T *)x;
		t->~T();
	}
	
	void setupIO(unsigned int numinlets = 1, unsigned int numoutlets = 1) {
		if (numinlets > 0) {
			unsigned int numproxies = numinlets - 1;
			m_inletproxies = (void **)sysmem_newptr(sizeof(void *) * numproxies);
			for (unsigned int i=1; i<=numproxies; i++)
				m_inletproxies[i] = proxy_new(this, i, &this->m_whichinlet); // generic inlet
		}
		m_outlets = (void **)sysmem_newptr(sizeof(void *) * numoutlets);
		for (unsigned int i=0; i<numoutlets; i++)
			m_outlets[numoutlets - i - 1] = outlet_new(this, NULL); // generic outlet
	}
	
	// C++ operator overload to treat MaxCpp6 objects as t_objects
	operator t_object & () { return m_ob; }
};

#endif
