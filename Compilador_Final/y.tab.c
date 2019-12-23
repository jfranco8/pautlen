/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "alfa.y" /* yacc.c:339  */

  #include "alfa.h"
  #include "y.tab.h"
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "tabla_simbolos.h"
  #include "generacion.h"

  extern int linea;
  extern int columna;
  extern FILE* yyout;
  extern FILE* out; /*Fichero ASM*/

  extern int yylex();
  void yyerror(const char *s);

  int tipo_actual = -1;
  int clase_actual = -1;
  int tamanio_vector_actual = 1;
  int pos_variable_local_actual = 0;
  int pos_parametro_actual = 0;
  int num_parametros_llamada_actual = 0;
  int num_variables_locales_actual = 0;
  int num_parametros_actual = 0;
  int posicion_parametro = 0;
  int es_variable_actual = 0; // no sé si es así
  int en_explist = 0;
  int etiqueta = 0;

  int _return = 0;
  int return_type;

  tabla_simbolo *ts = NULL;
  ht_symbol *simbolo = NULL;



#line 105 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TOK_MAIN = 258,
    TOK_INT = 259,
    TOK_BOOLEAN = 260,
    TOK_ARRAY = 261,
    TOK_FUNCTION = 262,
    TOK_IF = 263,
    TOK_ELSE = 264,
    TOK_WHILE = 265,
    TOK_SCANF = 266,
    TOK_PRINTF = 267,
    TOK_RETURN = 268,
    TOK_PUNTOYCOMA = 269,
    TOK_COMA = 270,
    TOK_PARENTESISIZQUIERDO = 271,
    TOK_PARENTESISDERECHO = 272,
    TOK_CORCHETEIZQUIERDO = 273,
    TOK_CORCHETEDERECHO = 274,
    TOK_LLAVEIZQUIERDA = 275,
    TOK_LLAVEDERECHA = 276,
    TOK_ASIGNACION = 277,
    TOK_MAS = 278,
    TOK_MENOS = 279,
    TOK_DIVISION = 280,
    TOK_ASTERISCO = 281,
    TOK_AND = 282,
    TOK_OR = 283,
    TOK_NOT = 284,
    TOK_IGUAL = 285,
    TOK_DISTINTO = 286,
    TOK_MENORIGUAL = 287,
    TOK_MAYORIGUAL = 288,
    TOK_MENOR = 289,
    TOK_MAYOR = 290,
    TOK_IDENTIFICADOR = 291,
    TOK_CONSTANTE_ENTERA = 292,
    TOK_TRUE = 293,
    TOK_FALSE = 294,
    TOK_ERROR = 295
  };
#endif
/* Tokens.  */
#define TOK_MAIN 258
#define TOK_INT 259
#define TOK_BOOLEAN 260
#define TOK_ARRAY 261
#define TOK_FUNCTION 262
#define TOK_IF 263
#define TOK_ELSE 264
#define TOK_WHILE 265
#define TOK_SCANF 266
#define TOK_PRINTF 267
#define TOK_RETURN 268
#define TOK_PUNTOYCOMA 269
#define TOK_COMA 270
#define TOK_PARENTESISIZQUIERDO 271
#define TOK_PARENTESISDERECHO 272
#define TOK_CORCHETEIZQUIERDO 273
#define TOK_CORCHETEDERECHO 274
#define TOK_LLAVEIZQUIERDA 275
#define TOK_LLAVEDERECHA 276
#define TOK_ASIGNACION 277
#define TOK_MAS 278
#define TOK_MENOS 279
#define TOK_DIVISION 280
#define TOK_ASTERISCO 281
#define TOK_AND 282
#define TOK_OR 283
#define TOK_NOT 284
#define TOK_IGUAL 285
#define TOK_DISTINTO 286
#define TOK_MENORIGUAL 287
#define TOK_MAYORIGUAL 288
#define TOK_MENOR 289
#define TOK_MAYOR 290
#define TOK_IDENTIFICADOR 291
#define TOK_CONSTANTE_ENTERA 292
#define TOK_TRUE 293
#define TOK_FALSE 294
#define TOK_ERROR 295

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 41 "alfa.y" /* yacc.c:355  */

  tipo_atributos atributos;

#line 229 "y.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 246 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   154

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  41
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  44
/* YYNRULES -- Number of rules.  */
#define YYNRULES  82
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  151

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   295

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   153,   153,   156,   158,   165,   171,   172,   175,   180,
     182,   186,   190,   193,   198,   209,   210,   214,   215,   219,
     247,   257,   274,   275,   280,   282,   285,   292,   305,   306,
     310,   311,   315,   316,   322,   323,   324,   325,   330,   331,
     335,   363,   373,   399,   402,   406,   418,   425,   430,   437,
     449,   473,   478,   499,   509,   519,   529,   539,   549,   559,
     569,   580,   602,   606,   610,   614,   618,   622,   631,   634,
     638,   641,   649,   660,   671,   682,   693,   704,   718,   722,
     729,   733,   739
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "TOK_MAIN", "TOK_INT", "TOK_BOOLEAN",
  "TOK_ARRAY", "TOK_FUNCTION", "TOK_IF", "TOK_ELSE", "TOK_WHILE",
  "TOK_SCANF", "TOK_PRINTF", "TOK_RETURN", "TOK_PUNTOYCOMA", "TOK_COMA",
  "TOK_PARENTESISIZQUIERDO", "TOK_PARENTESISDERECHO",
  "TOK_CORCHETEIZQUIERDO", "TOK_CORCHETEDERECHO", "TOK_LLAVEIZQUIERDA",
  "TOK_LLAVEDERECHA", "TOK_ASIGNACION", "TOK_MAS", "TOK_MENOS",
  "TOK_DIVISION", "TOK_ASTERISCO", "TOK_AND", "TOK_OR", "TOK_NOT",
  "TOK_IGUAL", "TOK_DISTINTO", "TOK_MENORIGUAL", "TOK_MAYORIGUAL",
  "TOK_MENOR", "TOK_MAYOR", "TOK_IDENTIFICADOR", "TOK_CONSTANTE_ENTERA",
  "TOK_TRUE", "TOK_FALSE", "TOK_ERROR", "$accept", "programa",
  "inicioTabla", "escritura1", "escritura2", "declaraciones",
  "declaracion", "clase", "clase_escalar", "tipo", "clase_vector",
  "identificadores", "funciones", "funcion", "fn_declaration", "fn_name",
  "parametros_funcion", "resto_parametros_funcion", "parametro_funcion",
  "idpf", "declaraciones_funcion", "sentencias", "sentencia",
  "sentencia_simple", "bloque", "asignacion", "elemento_vector",
  "condicional", "if_exp", "if_exp_sentencias", "bucle", "while",
  "while_exp", "lectura", "escritura", "retorno_funcion", "exp",
  "idf_llamada_funcion", "lista_expresiones", "resto_lista_expresiones",
  "comparacion", "constante", "constante_logica", "constante_entera", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295
};
# endif

#define YYPACT_NINF -35

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-35)))

#define YYTABLE_NINF -68

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -35,     4,    10,   -35,    27,   -35,    16,   -35,   -35,    40,
     -35,    16,   -29,   -35,   -35,   -35,     6,     9,   -35,    37,
      39,    17,    40,    -2,     9,    -2,    63,   -29,   -35,   -35,
      68,    52,    73,    74,    55,    19,    19,    -3,    77,    -2,
      95,   -35,   -35,    97,   -35,    -2,    89,   -35,    19,    -2,
     -35,   -35,   -35,   -35,    99,    40,   -35,   -35,   -35,    19,
     -35,   -35,    19,    19,    19,    15,   -35,   -35,   -35,    50,
     106,   -35,   -35,   -35,    50,    19,    19,   -35,   -35,   -35,
      19,   -35,   114,    88,   110,   -35,    96,   116,   126,   101,
      69,   124,    12,   -35,    19,    19,    19,    19,    19,    19,
      19,   111,    50,    50,   122,   123,   -35,   -35,   -35,   125,
      40,   -35,   127,   -35,    19,    19,    19,    19,    19,    19,
     -35,    12,    12,    22,    22,   -35,   -35,    44,   129,   -35,
      -2,   -35,    16,   126,   -35,    50,    50,    50,    50,    50,
      50,    19,   -35,   -35,   128,   -35,   -35,   -35,    44,   -35,
     -35
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     0,     0,     1,     0,     4,     0,    12,    13,     0,
       5,     6,     0,     9,    11,    10,     0,    18,     7,    15,
       0,     0,     0,     0,    18,     0,     0,     0,     8,    82,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    30,
       0,    33,    34,     0,    38,     0,     0,    39,     0,     0,
      35,    36,    37,    17,     0,    23,    16,    14,    21,     0,
      48,    50,     0,     0,     0,    61,    80,    81,    65,    51,
       0,    62,    78,    79,    52,     0,     0,     2,    31,    32,
       0,    46,    43,     0,     0,    19,     0,     0,    25,     0,
       0,     0,    57,    60,     0,     0,     0,     0,     0,     0,
      69,     0,    40,    41,     0,     0,    47,    27,    26,     0,
       0,    22,     0,    63,     0,     0,     0,     0,     0,     0,
      64,    53,    54,    55,    56,    58,    59,    71,     0,    42,
       0,    49,    29,    25,    45,    72,    73,    74,    75,    76,
      77,     0,    68,    66,     0,    28,    20,    24,    71,    44,
      70
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -35,   -35,   -35,   -35,   -35,   -11,   -35,   -35,   -35,    -4,
     -35,   117,   130,   -35,   -35,   -35,   -35,    18,    38,   -35,
     -35,   -13,   -35,   -35,   -35,   -35,   -22,   -35,   -35,   -35,
     -35,   -35,   -35,   -35,   -35,   -35,   -34,   -35,   -35,     2,
     -35,   -35,   -35,   131
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,     6,    17,    10,    11,    12,    13,    14,
      15,    20,    23,    24,    25,    26,    87,   111,    88,   108,
     146,    38,    39,    40,    41,    42,    68,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    69,    70,   128,   142,
      91,    71,    72,    73
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      18,    43,    74,    43,     3,    16,    32,    19,    33,    34,
      35,    36,    54,     4,    83,    75,    22,    43,    31,    76,
       7,     8,     9,    43,    21,    89,    78,    43,    90,    92,
      93,   -67,    81,    75,    37,    62,    84,    96,    97,    98,
      99,   101,   102,    63,     7,     8,   103,     5,    64,    98,
      99,    86,    27,    28,    29,    65,    29,    66,    67,   141,
     121,   122,   123,   124,   125,   126,   127,    94,    95,    96,
      97,    98,    99,    94,    95,    96,    97,    98,    99,    55,
     135,   136,   137,   138,   139,   140,   113,    57,    58,    59,
      60,    61,    94,    95,    96,    97,    98,    99,    77,   114,
     115,   116,   117,   118,   119,   105,    86,   148,    43,    79,
      82,    94,    95,    96,    97,    98,    99,   144,   112,    80,
      85,   145,   100,   104,    94,    95,    96,    97,    98,    99,
     129,   106,   107,   109,    94,    95,    96,    97,    98,    99,
     110,   120,   130,   131,    56,   132,   143,   134,   133,   149,
     150,   147,    30,     0,    53
};

static const yytype_int16 yycheck[] =
{
      11,    23,    36,    25,     0,     9,     8,    36,    10,    11,
      12,    13,    25,     3,    48,    18,     7,    39,    22,    22,
       4,     5,     6,    45,    18,    59,    39,    49,    62,    63,
      64,    16,    45,    18,    36,    16,    49,    25,    26,    27,
      28,    75,    76,    24,     4,     5,    80,    20,    29,    27,
      28,    55,    15,    14,    37,    36,    37,    38,    39,    15,
      94,    95,    96,    97,    98,    99,   100,    23,    24,    25,
      26,    27,    28,    23,    24,    25,    26,    27,    28,    16,
     114,   115,   116,   117,   118,   119,    17,    19,    36,    16,
      16,    36,    23,    24,    25,    26,    27,    28,    21,    30,
      31,    32,    33,    34,    35,    17,   110,   141,   130,    14,
      21,    23,    24,    25,    26,    27,    28,   130,    17,    22,
      21,   132,    16,     9,    23,    24,    25,    26,    27,    28,
      19,    21,    36,    17,    23,    24,    25,    26,    27,    28,
      14,    17,    20,    20,    27,    20,    17,    20,   110,    21,
     148,   133,    21,    -1,    24
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    42,    43,     0,     3,    20,    44,     4,     5,     6,
      46,    47,    48,    49,    50,    51,    50,    45,    46,    36,
      52,    18,     7,    53,    54,    55,    56,    15,    14,    37,
      84,    50,     8,    10,    11,    12,    13,    36,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    53,    62,    16,    52,    19,    36,    16,
      16,    36,    16,    24,    29,    36,    38,    39,    67,    77,
      78,    82,    83,    84,    77,    18,    22,    21,    62,    14,
      22,    62,    21,    77,    62,    21,    50,    57,    59,    77,
      77,    81,    77,    77,    23,    24,    25,    26,    27,    28,
      16,    77,    77,    77,     9,    17,    21,    36,    60,    17,
      14,    58,    17,    17,    30,    31,    32,    33,    34,    35,
      17,    77,    77,    77,    77,    77,    77,    77,    79,    19,
      20,    20,    20,    59,    20,    77,    77,    77,    77,    77,
      77,    15,    80,    17,    62,    46,    61,    58,    77,    21,
      80
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    41,    42,    43,    44,    45,    46,    46,    47,    48,
      48,    49,    50,    50,    51,    52,    52,    53,    53,    54,
      55,    56,    57,    57,    58,    58,    59,    60,    61,    61,
      62,    62,    63,    63,    64,    64,    64,    64,    65,    65,
      66,    66,    67,    68,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    77,    77,    77,    77,    77,    77,
      77,    77,    77,    77,    77,    77,    77,    78,    79,    79,
      80,    80,    81,    81,    81,    81,    81,    81,    82,    82,
      83,    83,    84
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     9,     0,     0,     0,     1,     2,     3,     1,
       1,     1,     1,     1,     5,     1,     3,     2,     0,     3,
       6,     3,     2,     0,     3,     0,     2,     1,     1,     0,
       1,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       3,     3,     4,     2,     6,     5,     2,     3,     2,     4,
       2,     2,     2,     3,     3,     3,     3,     2,     3,     3,
       2,     1,     1,     3,     3,     1,     4,     1,     2,     0,
       3,     0,     3,     3,     3,     3,     3,     3,     1,     1,
       1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 154 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R1: <programa> ::= main { <declaraciones> <funciones> <sentencias> }\n");}
#line 1444 "y.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 156 "alfa.y" /* yacc.c:1646  */
    {ts = new_tabla_simbolos();}
#line 1450 "y.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 158 "alfa.y" /* yacc.c:1646  */
    {
  escribir_subseccion_data(out);
  escribir_cabecera_bss(out);
  // creo que hay que esxribir la tabla de simbolos
  escribir_segmento_codigo(out);
}
#line 1461 "y.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 165 "alfa.y" /* yacc.c:1646  */
    {
  escribir_inicio_main(out);
}
#line 1469 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 171 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R2:	<declaraciones> ::= <declaracion>\n");}
#line 1475 "y.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 172 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R3:	<declaraciones> ::= <declaracion> <declaraciones>\n");}
#line 1481 "y.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 176 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R4:	<declaracion> ::= <clase> <identificadores> ;\n");}
#line 1487 "y.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 180 "alfa.y" /* yacc.c:1646  */
    {clase_actual = ESCALAR;
                      fprintf(yyout, ";R5:	<clase> ::= <clase_escalar>\n");}
#line 1494 "y.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 182 "alfa.y" /* yacc.c:1646  */
    {clase_actual = VECTOR;
                     fprintf(yyout, ";R7:	<clase> ::= <clase_vector>\n");}
#line 1501 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 186 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R9:	<clase_escalar> ::= <tipo>\n");}
#line 1507 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 190 "alfa.y" /* yacc.c:1646  */
    {tipo_actual = INT;
               (yyval.atributos).tipo = INT;
               fprintf(yyout, ";R10:	<tipo> ::= int\n");}
#line 1515 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 193 "alfa.y" /* yacc.c:1646  */
    {tipo_actual = BOOLEAN;
                   (yyval.atributos).tipo = BOOLEAN;
                   fprintf(yyout, ";R11:	<tipo> ::= boolean\n");}
#line 1523 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 199 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R15:	<clase_vector> ::= array <tipo> [constante_entera]\n");
               tamanio_vector_actual = (yyvsp[-1].atributos).valor_entero;
               if ((tamanio_vector_actual < 1) || (tamanio_vector_actual > MAX_TAMANIO_VECTOR)){
                 fprintf(yyout, "****Error semantico en lin %d: El tamanyo del vector <%s> excede los limites permitidos (1,64)\n", linea, (yyval.atributos).lexema);
                 return -1;
               }
              }
#line 1535 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 209 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R18:	<identificadores> ::= <TOK_IDENTIFICADOR>\n");}
#line 1541 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 210 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R19:	<identificadores> ::= <TOK_IDENTIFICADOR> , <identificadores>\n");}
#line 1547 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 214 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R20:	<funciones> ::= <funcion> <funciones>\n");}
#line 1553 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 215 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R21:	<funciones> ::= \n");}
#line 1559 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 219 "alfa.y" /* yacc.c:1646  */
    {
           //ERROR SI LA FUNCION NO TIENE SENTENCIA DE RETORNO
           if(_return == 0){
             fprintf(yyout, "****Error semantico en lin %d: Funcion %s sin sentencia de retorno.",linea, (yyvsp[-2].atributos).lexema);
             return -1;
           }
           //COMPROBACIONES SEMANTICAS
           if(tipo_actual != return_type){
             fprintf(yyout, "****Error semantico en lin %d: Tipo de función %s, (%d) no coincide con tipo de retorno (%d)",linea, (yyvsp[-1].atributos).lexema, (yyvsp[-1].atributos).tipo, return_type);
             return -1;
           }

           fprintf(yyout, ";R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }\n");

           //ERROR SI YA SE HA DECLARADO UNA FUNCION CON NOMBRE $1.nombre
           //CIERRE DE AMBITO, ETC

           /* fprintf(out, ALFA_CLOSE_ID "\n");
           free(id); */
           set_ambit(GLOBAL);
           set_check(TRUE);
           ts_set_local(ts, NULL);

           simbolo->num_param = num_parametros_actual;

           retornarFuncion(out, es_variable_actual);
}
#line 1591 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 247 "alfa.y" /* yacc.c:1646  */
    {
  //COMPROBACIONES SEMANTICAS
  //ERROR SI YA SE HA DECLARADO UNA FUNCION CON NOMBRE $1.nombre
  simbolo->num_param = num_parametros_actual;
  strcpy((yyval.atributos).lexema, (yyvsp[-5].atributos).lexema);
  (yyval.atributos).tipo = (yyvsp[-5].atributos).tipo;
  //GENERACION DE CODIGO
  declararFuncion(out, (yyvsp[-5].atributos).lexema, num_variables_locales_actual);
}
#line 1605 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 257 "alfa.y" /* yacc.c:1646  */
    {
  //COMPROBACIONES SEMANTICAS
  //ERROR SI YA SE HA DECLARADO UNA FUNCION CON NOMBRE $3.nombre
  simbolo->id = (yyvsp[0].atributos).lexema;
  simbolo->s_category = FUNCION;
  simbolo->type = tipo_actual;
  (yyval.atributos).tipo = tipo_actual;
  num_variables_locales_actual = 0;
  strcpy((yyval.atributos).lexema, (yyvsp[0].atributos).lexema);

  //ABRIR AMBITO EN LA TABLA DE SIMBOLOS CON IDENTIFICADOR $3.nombre
  //RESETEAR VARIABLES QUE NECESITAMOS PARA PROCESAR LA FUNCION:
  //posicion_variable_local, num_variables_locales, posicion_parametro, num_parametros
}
#line 1624 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 274 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R23:	<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>\n");}
#line 1630 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 275 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R24:	<parametros_funcion> ::= \n");}
#line 1636 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 281 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>\n");}
#line 1642 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 282 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R26:	<resto_parametros_funcion> ::= \n");}
#line 1648 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 285 "alfa.y" /* yacc.c:1646  */
    {
  fprintf(yyout, ";R27: <parametro_funcion> ::= <tipo> <idpf>\n");
  //INCREMENTAR CONTADORES
  num_parametros_actual++;
  posicion_parametro++;
}
#line 1659 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 292 "alfa.y" /* yacc.c:1646  */
    {
    //COMPROBACIONES SEMANTICAS PARA $1.nombre
    //EN ESTE CASO SE MUESTRA ERROR SI EL NOMBRE DEL PARAMETRO YA SE HA UTILIZADO
    simbolo->id = (yyvsp[0].atributos).lexema;
    simbolo->s_category = PARAMETRO;
    simbolo->type = tipo_actual;
    simbolo->category = ESCALAR;
    simbolo->posision = posicion_parametro;
    //DECLARAR SIMBOLO EN LA TABLA
}
#line 1674 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 305 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R28: <declaraciones_funcion> ::= <declaraciones>\n");}
#line 1680 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 306 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R29: <declaraciones_funcion> ::= \n");}
#line 1686 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 310 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R30:	<sentencias> ::= <sentencia>\n");}
#line 1692 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 311 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R31:	<sentencias> ::= <sentencia> <sentencias>\n");}
#line 1698 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 315 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R32:	<sentencia> ::= <sentencia_simple> ;\n");}
#line 1704 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 316 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R33:	<sentencia> ::= <bloque>\n");}
#line 1710 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 322 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R34:	<sentencia_simple> ::= <asignacion>\n");}
#line 1716 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 323 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R35:	<sentencia_simple> ::= <lectura>\n");}
#line 1722 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 324 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R36:	<sentencia_simple> ::= <escritura>\n");}
#line 1728 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 325 "alfa.y" /* yacc.c:1646  */
    {
                  fprintf(yyout, ";R36:	<sentencia_simple> ::= <retorno_funcion>\n");}
#line 1735 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 330 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R40:	<bloque> ::= <condicional>\n");}
#line 1741 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 331 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R41:	<bloque> ::= <bucle>\n");}
#line 1747 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 335 "alfa.y" /* yacc.c:1646  */
    {
                  if(get_ambit() == GLOBAL){
                    simbolo = is_global_symbol(ts_get_global(ts), (yyvsp[-2].atributos).lexema);
                  } else {
                    simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (yyvsp[-2].atributos).lexema);
                  }

                  if(simbolo == NULL){
                    fprintf(yyout,"****Error semantico en lin %d: Acceso a variable no declarada (%s).\n", linea, (yyvsp[-2].atributos).lexema);
                    return -1;
                  }
                  else{
                    if(get_symbol_category(simbolo) == FUNCION || get_symbol_category(simbolo) == VECTOR){
                      fprintf(yyout,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
          						return -1;
                    }
                    else if(get_type(simbolo) != (yyvsp[0].atributos).tipo){
                      fprintf(yyout,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
          						return -1;
                    }
                    else if (get_category(simbolo) == VECTOR){
                      fprintf(yyout,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
          						return -1;
                    }
                  }
                    asignar(out, (yyvsp[-2].atributos).lexema, (yyvsp[-2].atributos).es_direccion);

                  fprintf(yyout, ";R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>\n");}
#line 1780 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 363 "alfa.y" /* yacc.c:1646  */
    {

            if((yyvsp[-2].atributos).tipo != (yyvsp[0].atributos).tipo){
  						fprintf(yyout,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
  						return -1;
  					}
            asignarDestinoEnPila(out, (yyvsp[0].atributos).es_direccion);
            fprintf(yyout, ";R44:	<asignacion> ::= <elemento_vector> = <exp>\n");}
#line 1793 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 373 "alfa.y" /* yacc.c:1646  */
    {
               fprintf(yyout, ";R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]\n");
               if ((yyvsp[-1].atributos).tipo != INT){
  							fprintf(yyout,"****Error semantico en lin %d: El indice en una operacion de indexacion tiene que ser de tipo entero.", linea);
  							return -1;
							 }
               else if(get_ambit() == GLOBAL){
                 simbolo = is_global_symbol(ts_get_global(ts), (yyvsp[-3].atributos).lexema);
               } else {
                 simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (yyvsp[-3].atributos).lexema);
               }
               if(simbolo == NULL){
                 fprintf(yyout,"****Error semantico en lin %d: Acceso a variable no declarada (%s).\n", linea, (yyvsp[-3].atributos).lexema);
                 return -1;
               }
               else if (get_category(simbolo) != VECTOR){
                 fprintf(yyout,"****Error semantico en lin %d: Intento de indexacion de una variable que no es de tipo vector.\n", linea);
                 return -1;
               }
							 (yyval.atributos).tipo = simbolo->type;
							 escribir_elemento_vector(out, simbolo->id, simbolo->len, (yyvsp[-1].atributos).es_direccion);
							 fprintf(yyout, ";R:\telemento_vector:	TOK_IDENTIFICADOR '[' exp ']'\n");
              }
#line 1821 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 400 "alfa.y" /* yacc.c:1646  */
    {ifthen_fin(out, (yyvsp[-1].atributos).etiqueta);
              fprintf(yyout, "R50: <condicional> ::= <if_exp_sentencias> { \n");}
#line 1828 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 403 "alfa.y" /* yacc.c:1646  */
    {ifthenelse_fin(out, (yyvsp[-5].atributos).etiqueta);
              fprintf(yyout, "R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }\n");}
#line 1835 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 406 "alfa.y" /* yacc.c:1646  */
    {
  //COMPROBACIONES SEMANTICAS
  if((yyvsp[-2].atributos).tipo != BOOLEAN){
					fprintf(yyout,"****Error semantico en lin %d: Condicional con condicion de tipo int.\n", linea);
					return -1;
	}
  //GESTION ETIQUETA
	(yyval.atributos).etiqueta = etiqueta ++;
  ifthenelse_inicio(out, (yyvsp[-2].atributos).es_direccion, (yyval.atributos).etiqueta);
  fprintf(yyout, ";R: <if_exp> ::=	if ( <exp> ) { \n");
}
#line 1851 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 418 "alfa.y" /* yacc.c:1646  */
    {
 (yyval.atributos).etiqueta = (yyvsp[-1].atributos).etiqueta;
 ifthenelse_fin_then(out, (yyval.atributos).etiqueta);
 fprintf(yyout, ";R: <if_exp_sentencias> ::=	<if_exp> <sentencias> \n");
}
#line 1861 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 426 "alfa.y" /* yacc.c:1646  */
    {while_fin(out, (yyvsp[-2].atributos).etiqueta);
        fprintf(yyout, ";R52: <bucle> ::= <while_exp> <sentencias> }\n");
}
#line 1869 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 430 "alfa.y" /* yacc.c:1646  */
    {
 //GESTION ETIQUETA
 (yyval.atributos).etiqueta = etiqueta ++;
 while_inicio(out, (yyval.atributos).etiqueta);
 fprintf(yyout, ";R: <while> ::= while (\n");
}
#line 1880 "y.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 437 "alfa.y" /* yacc.c:1646  */
    {
  //COMPROBACIONES SEMANTICAS
  if((yyvsp[-2].atributos).tipo != BOOLEAN) {
    fprintf(yyout,"****Error semantico en lin %d: Bucle con condicion de tipo int.\n", linea);
   	return -1;
  }
 (yyval.atributos).etiqueta = (yyvsp[-3].atributos).etiqueta;
 while_exp_pila(out, (yyvsp[-2].atributos).es_direccion, (yyval.atributos).etiqueta);
 fprintf(yyout, ";R: <while_exp> ::= <while> <exp> ) {\n");
}
#line 1895 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 449 "alfa.y" /* yacc.c:1646  */
    {
          if(get_ambit() == GLOBAL){
            simbolo = is_global_symbol(ts_get_global(ts), (yyvsp[0].atributos).lexema);
          } else {
            simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (yyvsp[0].atributos).lexema);
          }

          if(simbolo == NULL){
            fprintf(yyout,"****Error semantico en lin %d: Variable no declarada.\n", linea);
            return -1;
          }
          else if(get_symbol_category(simbolo) == FUNCION || get_symbol_category(simbolo) == VECTOR){
            fprintf(yyout,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
            return -1;
          }
          else if (get_category(simbolo) == VECTOR){
              fprintf(yyout,"****Error semantico en lin %d: Variable local de tipo no escalar.\n", linea);
              return -1;
          }

          leer(out, (yyvsp[0].atributos).lexema, (yyvsp[0].atributos).tipo_actual);
          fprintf(yyout, ";R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>\n");}
#line 1922 "y.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 473 "alfa.y" /* yacc.c:1646  */
    {
            fprintf(yyout, ";R56:	<escritura> ::= printf <exp>\n");
            escribir(out, (yyvsp[0].atributos).es_direccion, (yyvsp[0].atributos).tipo);}
#line 1930 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 478 "alfa.y" /* yacc.c:1646  */
    {
            if(get_ambit() == GLOBAL){
              fprintf(yyout,"****Error semantico en lin %d: Variable no declarada.\n", linea);
              return -1;
            } else {
              _return = 1; // variable que nos indica si la función tiene retorno o no
              return_type = (yyvsp[0].atributos).tipo;
              retornarFuncion(out, (yyvsp[0].atributos).es_direccion);
              fprintf(yyout, ";R61:	<retorno_funcion> ::= return <exp>\n");};
            }
#line 1945 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 499 "alfa.y" /* yacc.c:1646  */
    {
      fprintf(yyout, ";R72:	<exp> ::= <exp> + <exp>\n");
      if ((yyvsp[-2].atributos).tipo != INT || (yyvsp[0].atributos).tipo != INT){
  			fprintf(yyout,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
  			return -1;
  		}
      sumar(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
  		(yyval.atributos).es_direccion = 0;
  		(yyval.atributos).tipo = INT;
    }
#line 1960 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 509 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(yyout, ";R73:	<exp> ::= <exp> - <exp>\n");
     if ((yyvsp[-2].atributos).tipo != INT || (yyvsp[0].atributos).tipo != INT){
       fprintf(yyout,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
       return -1;
     }
     restar(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
     (yyval.atributos).es_direccion = 0;
     (yyval.atributos).tipo = INT;
   }
#line 1975 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 519 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(yyout, ";R74:	<exp> ::= <exp> / <exp>\n");
     if ((yyvsp[-2].atributos).tipo != INT || (yyvsp[0].atributos).tipo != INT){
       fprintf(yyout,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
       return -1;
     }
     dividir(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
     (yyval.atributos).es_direccion = 0;
     (yyval.atributos).tipo = INT;
   }
#line 1990 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 529 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(yyout, ";R75:	<exp> ::= <exp> * <exp>\n");
     if ((yyvsp[-2].atributos).tipo != INT || (yyvsp[0].atributos).tipo != INT){
       fprintf(yyout,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
       return -1;
     }
     multiplicar(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
     (yyval.atributos).es_direccion = 0;
     (yyval.atributos).tipo = INT;
   }
#line 2005 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 539 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(yyout, ";R76:	<exp> ::= -<exp>\n");
     if ((yyvsp[0].atributos).tipo!=INT){
				fprintf(yyout,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
				return -1;
			}
			cambiar_signo(out, (yyvsp[0].atributos).es_direccion);
			(yyval.atributos).es_direccion = 0;
			(yyval.atributos).tipo = INT;
   }
#line 2020 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 549 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(yyout, ";R77:	<exp> ::= <exp> && <exp>\n");
     if ((yyvsp[-2].atributos).tipo != BOOLEAN || (yyvsp[0].atributos).tipo != BOOLEAN) {
				fprintf(yyout,"****Error semántico en lin %d: Operacion logica con operandos int.\n", linea);
				return -1;
			}
			y(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
			(yyval.atributos).es_direccion = 0;
			(yyval.atributos).tipo = BOOLEAN;
   }
#line 2035 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 559 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(yyout, ";R78:	<exp> ::= <exp> || <exp>\n");
     if ((yyvsp[-2].atributos).tipo != BOOLEAN || (yyvsp[0].atributos).tipo != BOOLEAN) {
				fprintf(yyout,"****Error semántico en lin %d: Operacion logica con operandos int.\n", linea);
				return -1;
			}
			o(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
			(yyval.atributos).es_direccion = 0;
			(yyval.atributos).tipo = BOOLEAN;
   }
#line 2050 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 569 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(yyout, ";R79:	<exp> ::= ! <exp>\n");
     if ((yyvsp[0].atributos).tipo!=BOOLEAN) {
				fprintf(yyout,"****Error semántico en lin %d: Operacion logica con operandos int.\n", linea);
				return -1;
			}
			no(out, (yyvsp[0].atributos).es_direccion, etiqueta);
			(yyval.atributos).es_direccion = 0;
			(yyval.atributos).tipo = BOOLEAN;
			etiqueta++;
   }
#line 2066 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 580 "alfa.y" /* yacc.c:1646  */
    {
     if(get_ambit() == GLOBAL){
       simbolo = is_global_symbol(ts_get_global(ts), (yyvsp[0].atributos).lexema);
     } else {
       simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (yyvsp[0].atributos).lexema);
     }

     if(simbolo == NULL){
       fprintf(yyout,"****Error semantico en lin %d: Variable no declarada.\n", linea);
       return -1;
     }
     else{
       if(get_symbol_category(simbolo) == FUNCION || get_symbol_category(simbolo) == VECTOR){
         fprintf(yyout,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
         return -1;
       }
       (yyval.atributos).tipo = get_type(simbolo);
       (yyval.atributos).es_direccion = 1;
     }
     escribir_operando(out, get_id(simbolo), (yyval.atributos).es_direccion);
     fprintf(yyout, ";R80:	<exp> ::= <TOK_IDENTIFICADOR>\n");
   }
#line 2093 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 603 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R81:	<exp> ::= <constante>\n");
      (yyval.atributos).tipo = (yyvsp[0].atributos).tipo;
      (yyval.atributos).es_direccion = (yyvsp[0].atributos).es_direccion;}
#line 2101 "y.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 607 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R82:	<exp> ::= ( <exp> )\n");
      (yyval.atributos).tipo = (yyvsp[-1].atributos).tipo;
      (yyval.atributos).es_direccion = (yyvsp[-1].atributos).es_direccion;}
#line 2109 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 611 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R83:	<exp> ::= ( <comparacion> )\n");
      (yyval.atributos).tipo = (yyvsp[-1].atributos).tipo;
      (yyval.atributos).es_direccion = (yyvsp[-1].atributos).es_direccion;}
#line 2117 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 615 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R85:	<exp> ::= <elemento_vector>\n");
      (yyval.atributos).tipo = (yyvsp[0].atributos).tipo;
      (yyval.atributos).es_direccion = (yyvsp[0].atributos).es_direccion;}
#line 2125 "y.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 619 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )\n");
      en_explist = 0;}
#line 2132 "y.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 622 "alfa.y" /* yacc.c:1646  */
    { //NO se muy bien que hace esta cosa
  //Control de Errores como arriba
  num_parametros_llamada_actual = 0;
  en_explist = 1;
  strcpy((yyval.atributos).lexema, (yyvsp[0].atributos).lexema);
}
#line 2143 "y.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 632 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>\n");
                    num_parametros_llamada_actual++;}
#line 2150 "y.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 634 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R90:	<lista_expresiones> ::= \n");}
#line 2156 "y.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 639 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>\n");
                          num_parametros_llamada_actual++;}
#line 2163 "y.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 641 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R92: <resto_lista_expresiones> ::= \n");}
#line 2169 "y.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 649 "alfa.y" /* yacc.c:1646  */
    {
              fprintf(yyout, ";R93: <comparacion> ::= <exp> == <exp>\n");
              if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
        				fprintf(yyout,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
        				return -1;
        			}
        			igual(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, etiqueta);
        			(yyval.atributos).etiqueta = etiqueta++;
        			(yyval.atributos).es_direccion = 0;
        			(yyval.atributos).tipo = BOOLEAN;
            }
#line 2185 "y.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 660 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(yyout, ";R94: <comparacion> ::= <exp> != <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(yyout,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             distinto(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, etiqueta);
             (yyval.atributos).etiqueta = etiqueta++;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2201 "y.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 671 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(yyout, ";R95: <comparacion> ::= <exp> <= <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(yyout,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             menor_igual(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, etiqueta);
             (yyval.atributos).etiqueta = etiqueta++;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2217 "y.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 682 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(yyout, ";R96: <comparacion> ::= <exp> >= <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(yyout,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             mayor_igual(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, etiqueta);
             (yyval.atributos).etiqueta = etiqueta++;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2233 "y.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 693 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(yyout, ";R97: <comparacion> ::= <exp> < <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(yyout,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             menor(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, etiqueta);
             (yyval.atributos).etiqueta = etiqueta++;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2249 "y.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 704 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(yyout, ";R98: <comparacion> ::= <exp> > <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(yyout,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             mayor(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, etiqueta);
             (yyval.atributos).etiqueta = etiqueta++;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2265 "y.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 719 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R99: <constante> ::= <constante_logica>\n");
            (yyval.atributos).tipo = (yyvsp[0].atributos).tipo;
            (yyval.atributos).es_direccion = (yyvsp[0].atributos).es_direccion;}
#line 2273 "y.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 723 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R100: <constante> ::= <constante_entera>\n");
            (yyval.atributos).tipo = (yyvsp[0].atributos).tipo;
            (yyval.atributos).es_direccion = (yyvsp[0].atributos).es_direccion;}
#line 2281 "y.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 730 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R102: <constante_logica> ::= true\n");
                   (yyval.atributos).tipo = BOOLEAN;
                   (yyval.atributos).es_direccion = 0;}
#line 2289 "y.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 734 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R103: <constante_logica> ::= false\n");
                  (yyval.atributos).tipo = BOOLEAN;
                  (yyval.atributos).es_direccion = 0;}
#line 2297 "y.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 740 "alfa.y" /* yacc.c:1646  */
    {fprintf(yyout, ";R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA\n");
                   (yyval.atributos).tipo = INT;
                   (yyval.atributos).es_direccion = 0;
                   strcpy((yyval.atributos).valor_entero, (yyvsp[0].atributos).valor_entero);
                   escribir_operando(out, (yyvsp[0].atributos).lexema, 0);
                 }
#line 2308 "y.tab.c" /* yacc.c:1646  */
    break;


#line 2312 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 764 "alfa.y" /* yacc.c:1906  */


void yyerror(const char *s) {
  fprintf(yyout,"****Error sintactico en [linea %d, columna %d]\n", linea, columna);
}
