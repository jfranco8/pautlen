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

  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "tabla_simbolos.h"
  #include "generacion.h"
  #include "symbol.h"
  #include "alfa.h"
  #include "y.tab.h"

  extern int linea;
  extern int columna;
  extern FILE * out; /*Fichero ASM*/

  extern int yylex(void);
  void yyerror(const char *s);

  int tipo_actual = -1;
  int clase_actual = -1;
  int pos_vector_actual = 0;
  int tamanio_vector_actual = 1;
  int pos_variable_local_actual = 0;
  int pos_parametro_actual = 0;
  int num_parametros_llamada_actual = 0;
  int num_variables_locales_actual = 0;
  int num_parametros_actual = 0;
  int posicion_parametro = 0;
  int es_variable_actual = 0; // no sé si es así
  int en_explist = 0;
  int cuantos_no = 0;
  int cuantos_condicionales = 0;
  int cuantos_bucles = 0;
  int cuantas_comparaciones = 0;
  int es_funcion = 0;

  int _return = 0;
  int return_type;

  tabla_simbolo *ts = NULL;
  ht_symbol *simbolo = NULL;



#line 110 "y.tab.c" /* yacc.c:339  */

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
# define YYDEBUG 0
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
    TOK_ERROR = 295,
    MENOSU = 296
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
#define MENOSU 296

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 46 "alfa.y" /* yacc.c:355  */

  tipo_atributos atributos;

#line 236 "y.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 253 "y.tab.c" /* yacc.c:358  */

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
#define YYLAST   149

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  42
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  47
/* YYNRULES -- Number of rules.  */
#define YYNRULES  86
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  159

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   296

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
      35,    36,    37,    38,    39,    40,    41
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   169,   169,   171,   174,   176,   181,   185,   191,   192,
     195,   200,   202,   206,   210,   213,   218,   229,   230,   234,
     235,   239,   282,   305,   350,   351,   356,   358,   361,   368,
     394,   395,   399,   400,   404,   405,   411,   412,   413,   414,
     419,   420,   424,   472,   509,   544,   547,   551,   564,   571,
     576,   583,   595,   620,   625,   646,   656,   666,   676,   686,
     696,   706,   716,   726,   763,   769,   773,   777,   781,   799,
     808,   813,   817,   820,   822,   832,   843,   854,   865,   876,
     887,   901,   906,   914,   919,   926,   940
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
  "TOK_TRUE", "TOK_FALSE", "TOK_ERROR", "MENOSU", "$accept", "programa",
  "inicioTabla", "escritura1", "escritura_codigo", "escritura2",
  "declaraciones", "declaracion", "clase", "clase_escalar", "tipo",
  "clase_vector", "identificadores", "funciones", "funcion",
  "fn_declaration", "fn_name", "parametros_funcion",
  "resto_parametros_funcion", "parametro_funcion", "idpf",
  "declaraciones_funcion", "sentencias", "sentencia", "sentencia_simple",
  "bloque", "asignacion", "elemento_vector", "condicional", "if_exp",
  "if_exp_sentencias", "bucle", "while", "while_exp", "lectura",
  "escritura", "retorno_funcion", "exp", "idf_llamada_funcion",
  "lista_expresiones", "resto_lista_expresiones", "expf", "comparacion",
  "constante", "constante_logica", "constante_entera", "identificador", YY_NULLPTR
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
     295,   296
};
# endif

#define YYPACT_NINF -29

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-29)))

#define YYTABLE_NINF -70

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
     -29,     5,     9,   -29,     6,   -29,    18,   -29,   -29,    36,
       1,   -29,    18,   -16,   -29,   -29,   -29,    10,    36,   -29,
       1,    22,    15,     1,   -29,   -29,    31,    32,    12,    14,
      22,   -29,    35,    37,    16,    30,    30,   -15,    34,    22,
      46,   -29,   -29,    41,   -29,    22,    43,   -29,    30,    22,
     -29,   -29,   -29,    36,   -29,   -29,   -16,    58,   -29,    64,
      30,   -29,   -29,    30,    30,    30,     0,   -29,   -29,   -29,
     -29,   111,    70,   -29,   -29,   -29,   111,    30,    30,   -29,
     -29,   -29,    30,   -29,    78,    48,    68,    52,    79,    83,
      22,   -29,   -29,   -29,    67,    88,    81,    11,   -29,    30,
      30,    30,    30,    30,    30,    30,   105,   111,   111,    86,
      87,   -29,   -29,   -29,   106,    36,   -29,   104,   120,   -29,
      30,    30,    30,    30,    30,    30,   -29,    11,    11,   -29,
     -29,   -29,    11,   111,    91,   126,   -29,    22,   -29,    18,
      83,   -29,   -29,   111,   111,   111,   111,   111,   111,   -29,
      30,   -29,   121,   -29,   -29,   -29,   126,   -29,   -29
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     0,     0,     1,     0,     5,     6,    14,    15,     0,
      20,     6,     8,     0,    11,    13,    12,     0,     0,     7,
      20,     0,     0,    20,     9,    86,     0,    17,     0,     0,
       0,    19,     0,     0,     0,     0,     0,     0,     0,    32,
       0,    35,    36,     0,    40,     0,     0,    41,     0,     0,
      37,    38,    39,    25,     7,    10,     0,     0,    23,     0,
       0,    50,    52,     0,     0,     0,    63,    85,    83,    84,
      67,    53,     0,    64,    81,    82,    54,     0,     0,    21,
      33,    34,     0,    48,    45,     0,     0,     0,     0,    27,
       0,    18,    16,     3,     0,     0,     0,    59,    62,     0,
       0,     0,     0,     0,     0,    71,     0,    42,    43,     0,
       0,    49,    29,    28,     0,     0,    24,     0,     0,    65,
       0,     0,     0,     0,     0,     0,    66,    55,    56,    57,
      58,    60,    61,    74,     0,    73,    44,     0,    51,    31,
      27,     2,    47,    75,    76,    77,    78,    79,    80,    68,
       0,    70,     0,    30,    22,    26,    73,    46,    72
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -29,   -29,   -29,   -29,   132,    90,   -12,   -29,   -29,   -29,
      -5,   -29,    89,   -14,   -29,   -29,   -29,   -29,     7,    33,
     -29,   -29,   -28,   -29,   -29,   -29,   -29,   -20,   -29,   -29,
     -29,   -29,   -29,   -29,   -29,   -29,   -29,   -21,   -29,   -29,
     -10,    -1,   -29,   -29,   -29,   -29,   -29
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,     6,    10,    30,    11,    12,    13,    14,
      15,    16,    26,    19,    20,    21,    22,    88,   116,    89,
     113,   154,    38,    39,    40,    41,    42,    70,    44,    45,
      46,    47,    48,    49,    50,    51,    52,   133,    72,   134,
     151,   135,    96,    73,    74,    75,    27
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      24,    43,    59,    77,    17,     3,    31,    78,    18,    54,
      43,    80,     4,    29,    71,    76,   -69,    83,    77,    43,
      25,    86,     7,     8,     9,    43,     5,    85,    28,    43,
      32,    53,    33,    34,    35,    36,   101,   102,   103,    94,
       7,     8,    95,    97,    98,    55,    63,    56,    87,    57,
      58,    60,    62,    61,    64,    79,   106,   107,    37,    65,
      81,   108,   117,    82,    84,   110,    66,    67,    68,    69,
      43,    99,   100,   101,   102,   103,   104,    92,   127,   128,
     129,   130,   131,   132,   118,    93,   105,   109,   112,   111,
      99,   100,   101,   102,   103,   104,   114,   115,   126,   143,
     144,   145,   146,   147,   148,   119,   137,   138,   149,   152,
      87,    99,   100,   101,   102,   103,   104,    43,   120,   121,
     122,   123,   124,   125,   136,   141,   139,   153,    99,   100,
     101,   102,   103,   104,    99,   100,   101,   102,   103,   104,
     142,   150,   157,    23,    90,    91,   158,   155,   140,   156
};

static const yytype_uint8 yycheck[] =
{
      12,    21,    30,    18,     9,     0,    20,    22,     7,    23,
      30,    39,     3,    18,    35,    36,    16,    45,    18,    39,
      36,    49,     4,     5,     6,    45,    20,    48,    18,    49,
       8,    16,    10,    11,    12,    13,    25,    26,    27,    60,
       4,     5,    63,    64,    65,    14,    16,    15,    53,    37,
      36,    16,    36,    16,    24,    21,    77,    78,    36,    29,
      14,    82,    90,    22,    21,    17,    36,    37,    38,    39,
      90,    23,    24,    25,    26,    27,    28,    19,    99,   100,
     101,   102,   103,   104,    17,    21,    16,     9,    36,    21,
      23,    24,    25,    26,    27,    28,    17,    14,    17,   120,
     121,   122,   123,   124,   125,    17,    20,    20,    17,   137,
     115,    23,    24,    25,    26,    27,    28,   137,    30,    31,
      32,    33,    34,    35,    19,    21,    20,   139,    23,    24,
      25,    26,    27,    28,    23,    24,    25,    26,    27,    28,
      20,    15,    21,    11,    54,    56,   156,   140,   115,   150
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    43,    44,     0,     3,    20,    45,     4,     5,     6,
      46,    48,    49,    50,    51,    52,    53,    52,     7,    55,
      56,    57,    58,    46,    48,    36,    54,    88,    18,    52,
      47,    55,     8,    10,    11,    12,    13,    36,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    16,    55,    14,    15,    37,    36,    64,
      16,    16,    36,    16,    24,    29,    36,    37,    38,    39,
      69,    79,    80,    85,    86,    87,    79,    18,    22,    21,
      64,    14,    22,    64,    21,    79,    64,    52,    59,    61,
      47,    54,    19,    21,    79,    79,    84,    79,    79,    23,
      24,    25,    26,    27,    28,    16,    79,    79,    79,     9,
      17,    21,    36,    62,    17,    14,    60,    64,    17,    17,
      30,    31,    32,    33,    34,    35,    17,    79,    79,    79,
      79,    79,    79,    79,    81,    83,    19,    20,    20,    20,
      61,    21,    20,    79,    79,    79,    79,    79,    79,    17,
      15,    82,    64,    48,    63,    60,    83,    21,    82
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    42,    43,    43,    44,    45,    46,    47,    48,    48,
      49,    50,    50,    51,    52,    52,    53,    54,    54,    55,
      55,    56,    57,    58,    59,    59,    60,    60,    61,    62,
      63,    63,    64,    64,    65,    65,    66,    66,    66,    66,
      67,    67,    68,    68,    69,    70,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    79,    79,    79,    79,
      79,    79,    79,    79,    79,    79,    79,    79,    79,    80,
      81,    81,    82,    82,    83,    84,    84,    84,    84,    84,
      84,    85,    85,    86,    86,    87,    88
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,    10,     9,     0,     0,     0,     0,     1,     2,
       3,     1,     1,     1,     1,     1,     5,     1,     3,     2,
       0,     3,     6,     3,     2,     0,     3,     0,     2,     1,
       1,     0,     1,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     3,     3,     4,     2,     6,     5,     2,     3,
       2,     4,     2,     2,     2,     3,     3,     3,     3,     2,
       3,     3,     2,     1,     1,     3,     3,     1,     4,     1,
       2,     0,     3,     0,     1,     3,     3,     3,     3,     3,
       3,     1,     1,     1,     1,     1,     1
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
#line 170 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R1: <programa> ::= main { <declaraciones> <funciones> <sentencias> }\n");}
#line 1450 "y.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 172 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R1: <programa> ::= main { <funciones> <sentencias> }\n");}
#line 1456 "y.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 174 "alfa.y" /* yacc.c:1646  */
    {ts = new_tabla_simbolos();}
#line 1462 "y.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 176 "alfa.y" /* yacc.c:1646  */
    {
  escribir_subseccion_data(out);
  escribir_cabecera_bss(out);
}
#line 1471 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 181 "alfa.y" /* yacc.c:1646  */
    {
  escribir_segmento_codigo(out);
}
#line 1479 "y.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 185 "alfa.y" /* yacc.c:1646  */
    {
  escribir_inicio_main(out);
}
#line 1487 "y.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 191 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R2:	<declaraciones> ::= <declaracion>\n");}
#line 1493 "y.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 192 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R3:	<declaraciones> ::= <declaracion> <declaraciones>\n");}
#line 1499 "y.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 196 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R4:	<declaracion> ::= <clase> <identificadores> ;\n");}
#line 1505 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 200 "alfa.y" /* yacc.c:1646  */
    {clase_actual = ESCALAR;
                      fprintf(out, ";R5:	<clase> ::= <clase_escalar>\n");}
#line 1512 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 202 "alfa.y" /* yacc.c:1646  */
    {clase_actual = VECTOR;
                     fprintf(out, ";R7:	<clase> ::= <clase_vector>\n");}
#line 1519 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 206 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R9:	<clase_escalar> ::= <tipo>\n");}
#line 1525 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 210 "alfa.y" /* yacc.c:1646  */
    {tipo_actual = INT;
               (yyval.atributos).tipo = INT;
               fprintf(out, ";R10:	<tipo> ::= int\n");}
#line 1533 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 213 "alfa.y" /* yacc.c:1646  */
    {tipo_actual = BOOLEAN;
                   (yyval.atributos).tipo = BOOLEAN;
                   fprintf(out, ";R11:	<tipo> ::= boolean\n");}
#line 1541 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 219 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R15:	<clase_vector> ::= array <tipo> [constante_entera]\n");
               tamanio_vector_actual = (yyvsp[-1].atributos).valor_entero;
               if ((tamanio_vector_actual < 1) || (tamanio_vector_actual > MAX_TAMANIO_VECTOR)){
                 fprintf(out, "****Error semantico en lin %d: El tamanyo del vector <%s> excede los limites permitidos (1,64)\n", linea, (yyval.atributos).lexema);
                 return -1;
               }
              }
#line 1553 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 229 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R18:	<identificadores> ::= <identificador>\n");}
#line 1559 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 230 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R19:	<identificadores> ::= <identificador> , <identificadores>\n");}
#line 1565 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 234 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R20:	<funciones> ::= <funcion> <funciones>\n");}
#line 1571 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 235 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R21:	<funciones> ::= \n");}
#line 1577 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 239 "alfa.y" /* yacc.c:1646  */
    {
           //ERROR SI LA FUNCION NO TIENE SENTENCIA DE RETORNO
           if(_return == 0){
             fprintf(out, "****Error semantico en lin %d: Funcion %s sin sentencia de retorno.",linea, (yyvsp[-2].atributos).lexema);
             return -1;
           }
           //COMPROBACIONES SEMANTICAS
           if(tipo_actual != return_type){
             fprintf(out, "****Error semantico en lin %d: Tipo de función %s, (%d) no coincide con tipo de retorno (%d)",linea, (yyvsp[-1].atributos).lexema, (yyvsp[-1].atributos).tipo, return_type);
             return -1;
           }

           fprintf(out, ";R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }\n");

           //ERROR SI YA SE HA DECLARADO UNA FUNCION CON NOMBRE $1.nombre
           //CIERRE DE AMBITO, ETC

           /* fprintf(out, ALFA_CLOSE_ID "\n");
           free(id); */

           set_ambit(GLOBAL);
           set_check(TRUE);
           ts_set_local(ts, NULL);
           es_funcion = 0;

           if(get_ambit() == GLOBAL){
             simbolo = is_global_symbol(ts_get_global(ts), (char *)(yyvsp[-2].atributos).lexema);
           } else {
             simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)(yyvsp[-2].atributos).lexema);
           }

           if(simbolo == NULL){
             fprintf(stderr, "****2Error semantico en lin %d: Declaracion duplicada.\n", linea);
             return -1;
           }

           simbolo->num_param = num_parametros_actual;

           //retornarFuncion(out, es_variable_actual);
           fprintf(out, ";R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }\n");

}
#line 1624 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 282 "alfa.y" /* yacc.c:1646  */
    {
  //COMPROBACIONES SEMANTICAS
  //ERROR SI YA SE HA DECLARADO UNA FUNCION CON NOMBRE $1.nombre

  if(get_ambit() == GLOBAL){
    simbolo = is_global_symbol(ts_get_global(ts), (char *)(yyvsp[-5].atributos).lexema);
  } else {
    simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)(yyvsp[-5].atributos).lexema);
  }

  if(simbolo == NULL){
    fprintf(stderr, "****2Error semantico en lin %d: Declaracion duplicada.\n", linea);
    return -1;
  }

  simbolo->num_param = num_parametros_actual;
  strcpy((yyval.atributos).lexema, (yyvsp[-5].atributos).lexema);
  (yyval.atributos).tipo = (yyvsp[-5].atributos).tipo;
  //GENERACION DE CODIGO
  declararFuncion(out, (yyvsp[-5].atributos).lexema, num_variables_locales_actual);

}
#line 1651 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 305 "alfa.y" /* yacc.c:1646  */
    {
  _return = 0;
  es_funcion = 1;
  //COMPROBACIONES SEMANTICAS
  //ERROR SI YA SE HA DECLARADO UNA FUNCION CON NOMBRE $3.nombre
  if(get_ambit() == GLOBAL){
    simbolo = is_global_symbol(ts_get_global(ts), (char *)(yyvsp[0].atributos).lexema);
  } else {
    simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)(yyvsp[0].atributos).lexema);
  }

  if(simbolo != NULL){
    fprintf(stderr, "****2Error semantico en lin %d: Declaracion duplicada.\n", linea);
    return -1;
  }


  //strcpy(simbolo->id, $3.lexema);
  //simbolo->s_category = FUNCION;
  //simbolo->type = tipo_actual;
  //$$.tipo = tipo_actual;
  //num_variables_locales_actual = 0;


  strcpy((yyval.atributos).lexema, (yyvsp[0].atributos).lexema);

  //ABRIR AMBITO EN LA TABLA DE SIMBOLOS CON IDENTIFICADOR $3.nombre
  //RESETEAR VARIABLES QUE NECESITAMOS PARA PROCESAR LA FUNCION:
  //posicion_variable_local, num_variables_locales, posicion_parametro, num_parametros

  (yyval.atributos).tipo = tipo_actual;
  //declararFuncion(out, $3.lexema, num_variables_locales_actual);
  new_global(ts_get_global(ts), (yyvsp[0].atributos).lexema, FALSE, clase_actual, tipo_actual, FUNCION);
  if(get_ambit() != LOCAL){
    set_ambit(LOCAL);
    ts_set_local(ts, ht_new());
  }
  pos_variable_local_actual = 0;
  num_variables_locales_actual = 0;
  num_parametros_actual = 0;
  pos_parametro_actual = 0;
}
#line 1698 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 350 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R23:	<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>\n");}
#line 1704 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 351 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R24:	<parametros_funcion> ::= \n");}
#line 1710 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 357 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>\n");}
#line 1716 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 358 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R26:	<resto_parametros_funcion> ::= \n");}
#line 1722 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 361 "alfa.y" /* yacc.c:1646  */
    {
  fprintf(out, ";R27: <parametro_funcion> ::= <tipo> <idpf>\n");
  //INCREMENTAR CONTADORES
  num_parametros_actual++;
  posicion_parametro++;
}
#line 1733 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 368 "alfa.y" /* yacc.c:1646  */
    {
    //COMPROBACIONES SEMANTICAS PARA $1.nombre
    //EN ESTE CASO SE MUESTRA ERROR SI EL NOMBRE DEL PARAMETRO YA SE HA UTILIZADO
    //simbolo->id = $1.lexema;
    //simbolo->s_category = PARAMETRO;
    //simbolo->type = tipo_actual;
    //simbolo->category = ESCALAR;
    //simbolo->posision = posicion_parametro;
    //DECLARAR SIMBOLO EN LA TABLA
    if(get_ambit() == GLOBAL){
      simbolo = is_global_symbol(ts_get_global(ts), (char *)(yyvsp[0].atributos).lexema);
    } else {
      simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)(yyvsp[0].atributos).lexema);
    }
    if(simbolo != NULL){
      fprintf(out,"****Error semantico en lin %d: Declaracion duplicada.\n", linea);
      return -1;
    }

    new_local(ts_get_local(ts), (yyvsp[0].atributos).lexema, FALSE, ESCALAR, tipo_actual, PARAMETRO);
    //pos_parametro_actual++;
    //num_parametros_actual++;
}
#line 1761 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 394 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R28: <declaraciones_funcion> ::= <declaraciones>\n");}
#line 1767 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 395 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R29: <declaraciones_funcion> ::= \n");}
#line 1773 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 399 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R30:	<sentencias> ::= <sentencia>\n");}
#line 1779 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 400 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R31:	<sentencias> ::= <sentencia> <sentencias>\n");}
#line 1785 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 404 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R32:	<sentencia> ::= <sentencia_simple> ;\n");}
#line 1791 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 405 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R33:	<sentencia> ::= <bloque>\n");}
#line 1797 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 411 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R34:	<sentencia_simple> ::= <asignacion>\n");}
#line 1803 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 412 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R35:	<sentencia_simple> ::= <lectura>\n");}
#line 1809 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 413 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R36:	<sentencia_simple> ::= <escritura>\n");}
#line 1815 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 414 "alfa.y" /* yacc.c:1646  */
    {
                  fprintf(out, ";R36:	<sentencia_simple> ::= <retorno_funcion>\n");}
#line 1822 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 419 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R40:	<bloque> ::= <condicional>\n");}
#line 1828 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 420 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R41:	<bloque> ::= <bucle>\n");}
#line 1834 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 424 "alfa.y" /* yacc.c:1646  */
    {
                  printf("ENTRA EN ASIGNACION. LEXEMA = %s\n", (char *)(yyvsp[-2].atributos).lexema);
                  if(get_ambit() == GLOBAL){
                    simbolo = is_global_symbol(ts_get_global(ts), (char *)(yyvsp[-2].atributos).lexema);
                  } else {
                    simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)(yyvsp[-2].atributos).lexema);
                  }

                  if(simbolo == NULL){
                    fprintf(out,"****Error semantico en lin %d: Acceso a variable no declarada (%s).\n", linea, (yyvsp[-2].atributos).lexema);
                    return -1;
                  }
                  else{
                    if(simbolo->s_category == FUNCION){
                      fprintf(out,"**** 1 Error semantico en lin %d: Asignacion incompatible.\n", linea);
          						return -1;
                    }
                    else if(simbolo->type != (yyvsp[0].atributos).tipo){
                      fprintf(out, "RECUERDO. BOOLEAN=%d. INT=%d \n", BOOLEAN, INT);
                      fprintf(out, "tipo que tenemos (simbolo %s): %d. tipo de 3 (simbolo %s): %d \n", simbolo->id, simbolo->type, (yyvsp[0].atributos).lexema, (yyvsp[0].atributos).tipo);
                      fprintf(out,"**** 2 Error semantico en lin %d: Asignacion incompatible.\n", linea);
          						return -1;
                    }
                    else if (simbolo->category == VECTOR){
                      fprintf(out,"**** 3 Error semantico en lin %d: Asignacion incompatible.\n", linea);
          						return -1;
                    }
                  }

                  if(is_global_symbol(ts_get_global(ts), (char *)(yyvsp[-2].atributos).lexema) == NULL){
                    if(simbolo->category == PARAMETRO){
                      printf("HOLA\n");
                      escribirVariableLocal(out, simbolo->num_param+1);
                      asignarDestinoEnPila(out, (yyvsp[0].atributos).es_direccion);
                      //escribirParametro(out, simbolo->num_param, num_parametros_actual);
                    } else {
                      printf("ADIOS\n");
                      escribirVariableLocal(out, simbolo->num_param+1);
                      asignarDestinoEnPila(out, (yyvsp[0].atributos).es_direccion);
                    }
                  } else {
                    printf("AMPS\n");
                    asignar(out, (yyvsp[-2].atributos).lexema, (yyvsp[0].atributos).es_direccion);

                    fprintf(out, ";R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>\n");}
                  }
#line 1885 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 472 "alfa.y" /* yacc.c:1646  */
    {

            if(get_ambit() == GLOBAL){
              simbolo = is_global_symbol(ts_get_global(ts), (yyvsp[-2].atributos).lexema);
            } else {
              simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (yyvsp[-2].atributos).lexema);
            }

            if(simbolo == NULL){
              fprintf(out,"****Error semantico en lin %d: Acceso a variable no declarada (%s).\n", linea, (yyvsp[-2].atributos).lexema);
              return -1;
            }

            if((yyvsp[-2].atributos).tipo != (yyvsp[0].atributos).tipo){
  						fprintf(out,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
  						return -1;
  					}

            char buffer_cte[256];
            //sprintf(buffer_cte, "%d", pos_vector_actual);
            pos_vector_actual ++;
            //escribir_operando(out, buffer_cte, $$.es_direccion);
            if ((yyvsp[-2].atributos).indice == 0) {
              sprintf(buffer_cte, "%d", (yyvsp[-2].atributos).valor_entero);
              printf("valor entero = %s\n", buffer_cte);
              escribir_operando(out, buffer_cte, 0);
            }
            if ((yyvsp[-2].atributos).indice == 1) {
              printf("---> pilla indice 1\n");
              escribir_operando(out, (yyvsp[-2].atributos).nombre_indice, 1);
            }
            //escribir_elemento_vector(out, simbolo->id, simbolo->len, $3.es_direccion);
            escribir_elemento_vector(out, (yyvsp[-2].atributos).lexema, simbolo->num_param, (yyvsp[0].atributos).es_direccion);
            asignarDestinoEnPila(out, (yyvsp[0].atributos).es_direccion);
            fprintf(out, ";R44:	<asignacion> ::= <elemento_vector> = <exp>\n");}
#line 1925 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 509 "alfa.y" /* yacc.c:1646  */
    {
               fprintf(out, ";R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]\n");
               if ((yyvsp[-1].atributos).tipo != INT){
  							fprintf(out,"****Error semantico en lin %d: El indice en una operacion de indexacion tiene que ser de tipo entero.", linea);
  							return -1;
							 }
               else if(get_ambit() == GLOBAL){
                 simbolo = is_global_symbol(ts_get_global(ts), (yyvsp[-3].atributos).lexema);
               } else {
                 simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (yyvsp[-3].atributos).lexema);
               }
               if(simbolo == NULL){
                 fprintf(out,"****Error semantico en lin %d: Acceso a variable no declarada (%s).\n", linea, (yyvsp[-3].atributos).lexema);
                 return -1;
               }
               else if (get_category(simbolo) != VECTOR){
                 fprintf(out,"****Error semantico en lin %d: Intento de indexacion de una variable que no es de tipo vector.\n", linea);
                 return -1;
               }
							 (yyval.atributos).tipo = simbolo->type;
               (yyval.atributos).es_direccion = 1;
               if ((yyvsp[-1].atributos).es_direccion == 0) {
                  (yyval.atributos).indice = 0;
                  (yyval.atributos).valor_entero = (yyvsp[-1].atributos).valor_entero;
                }
                if ((yyvsp[-1].atributos).es_direccion == 1) {
                  (yyval.atributos).indice = 1;
                  strcpy((yyval.atributos).nombre_indice, (yyvsp[-1].atributos).lexema);
                }
							 escribir_elemento_vector(out, simbolo->id, simbolo->len, (yyvsp[-1].atributos).es_direccion);
							 fprintf(out, ";R:\telemento_vector:	TOK_IDENTIFICADOR '[' exp ']'\n");
              }
#line 1962 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 545 "alfa.y" /* yacc.c:1646  */
    {ifthenelse_fin(out, (yyvsp[-1].atributos).etiqueta);
              fprintf(out, ";R50: <condicional> ::= <if_exp_sentencias> { \n");}
#line 1969 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 548 "alfa.y" /* yacc.c:1646  */
    {ifthenelse_fin(out, (yyvsp[-5].atributos).etiqueta);
              fprintf(out, ";R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }\n");}
#line 1976 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 551 "alfa.y" /* yacc.c:1646  */
    {
  //COMPROBACIONES SEMANTICAS
  if((yyvsp[-2].atributos).tipo != BOOLEAN){
					fprintf(out,"****Error semantico en lin %d: Condicional con condicion de tipo int.\n", linea);
					return -1;
	}
  //GESTION ETIQUETA
  //cuantos_condicionales++;
	(yyval.atributos).etiqueta = cuantos_condicionales++;
  ifthenelse_inicio(out, (yyvsp[-2].atributos).es_direccion, (yyval.atributos).etiqueta);
  fprintf(out, ";R: <if_exp> ::=	if ( <exp> ) { \n");
}
#line 1993 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 564 "alfa.y" /* yacc.c:1646  */
    {
 (yyval.atributos).etiqueta = (yyvsp[-1].atributos).etiqueta;
 ifthenelse_fin_then(out, (yyval.atributos).etiqueta);
 fprintf(out, ";R: <if_exp_sentencias> ::=	<if_exp> <sentencias> \n");
}
#line 2003 "y.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 572 "alfa.y" /* yacc.c:1646  */
    {while_fin(out, (yyvsp[-2].atributos).etiqueta);
        fprintf(out, ";R52: <bucle> ::= <while_exp> <sentencias> }\n");
}
#line 2011 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 576 "alfa.y" /* yacc.c:1646  */
    {
 //GESTION ETIQUETA
 (yyval.atributos).etiqueta = cuantos_bucles ++;
 while_inicio(out, (yyval.atributos).etiqueta);
 fprintf(out, ";R: <while> ::= while (\n");
}
#line 2022 "y.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 583 "alfa.y" /* yacc.c:1646  */
    {
  //COMPROBACIONES SEMANTICAS
  if((yyvsp[-2].atributos).tipo != BOOLEAN) {
    fprintf(out,"****Error semantico en lin %d: Bucle con condicion de tipo int.\n", linea);
   	return -1;
  }
 (yyval.atributos).etiqueta = (yyvsp[-3].atributos).etiqueta;
 while_exp_pila(out, (yyvsp[-2].atributos).es_direccion, (yyval.atributos).etiqueta);
 fprintf(out, ";R: <while_exp> ::= <while> <exp> ) {\n");
}
#line 2037 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 595 "alfa.y" /* yacc.c:1646  */
    {
          printf("HA ENTRADO EN LECTURA. LEXEMA = %s\n", (yyvsp[0].atributos).lexema);
          if(get_ambit() == GLOBAL){
            simbolo = is_global_symbol(ts_get_global(ts), (yyvsp[0].atributos).lexema);
          } else {
            simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (yyvsp[0].atributos).lexema);
          }

          if(simbolo == NULL){
            fprintf(out,"**** 1 Error semantico en lin %d: Variable no declarada.\n", linea);
            return -1;
          }
          else if(get_symbol_category(simbolo) == FUNCION || get_symbol_category(simbolo) == VECTOR){
            fprintf(out,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
            return -1;
          }
          else if (get_category(simbolo) == VECTOR){
              fprintf(out,"****Error semantico en lin %d: Variable local de tipo no escalar.\n", linea);
              return -1;
          }

          leer(out, (yyvsp[0].atributos).lexema, (yyvsp[0].atributos).tipo_actual);
          fprintf(out, ";R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>\n");}
#line 2065 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 620 "alfa.y" /* yacc.c:1646  */
    {
            fprintf(out, ";R56:	<escritura> ::= printf <exp>\n");
            escribir(out, (yyvsp[0].atributos).es_direccion, (yyvsp[0].atributos).tipo);}
#line 2073 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 625 "alfa.y" /* yacc.c:1646  */
    {
            /*if(get_ambit() == GLOBAL){
              fprintf(out,"**** 2 Error semantico en lin %d: Variable no declarada.\n", linea);
              return -1;
            } else {*/
              _return = 1; // variable que nos indica si la función tiene retorno o no
              return_type = (yyvsp[0].atributos).tipo;
              retornarFuncion(out, (yyvsp[0].atributos).es_direccion);
              fprintf(out, ";R61:	<retorno_funcion> ::= return <exp>\n");}
#line 2087 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 646 "alfa.y" /* yacc.c:1646  */
    {
      fprintf(out, ";R72:	<exp> ::= <exp> + <exp>\n");
      if ((yyvsp[-2].atributos).tipo != INT || (yyvsp[0].atributos).tipo != INT){
  			fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
  			return -1;
  		}
      sumar(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
  		(yyval.atributos).es_direccion = 0;
  		(yyval.atributos).tipo = INT;
    }
#line 2102 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 656 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(out, ";R73:	<exp> ::= <exp> - <exp>\n");
     if ((yyvsp[-2].atributos).tipo != INT || (yyvsp[0].atributos).tipo != INT){
       fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
       return -1;
     }
     restar(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
     (yyval.atributos).es_direccion = 0;
     (yyval.atributos).tipo = INT;
   }
#line 2117 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 666 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(out, ";R74:	<exp> ::= <exp> / <exp>\n");
     if ((yyvsp[-2].atributos).tipo != INT || (yyvsp[0].atributos).tipo != INT){
       fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
       return -1;
     }
     dividir(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
     (yyval.atributos).es_direccion = 0;
     (yyval.atributos).tipo = INT;
   }
#line 2132 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 676 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(out, ";R75:	<exp> ::= <exp> * <exp>\n");
     if ((yyvsp[-2].atributos).tipo != INT || (yyvsp[0].atributos).tipo != INT){
       fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
       return -1;
     }
     multiplicar(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
     (yyval.atributos).es_direccion = 0;
     (yyval.atributos).tipo = INT;
   }
#line 2147 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 686 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(out, ";R76:	<exp> ::= -<exp>\n");
     if ((yyvsp[0].atributos).tipo!=INT){
				fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
				return -1;
			}
			cambiar_signo(out, (yyvsp[0].atributos).es_direccion?1:0);
			(yyval.atributos).es_direccion = 0;
			(yyval.atributos).tipo = INT;
   }
#line 2162 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 696 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(out, ";R77:	<exp> ::= <exp> && <exp>\n");
     if ((yyvsp[-2].atributos).tipo != BOOLEAN || (yyvsp[0].atributos).tipo != BOOLEAN) {
				fprintf(out,"****Error semántico en lin %d: Operacion logica con operandos int.\n", linea);
				return -1;
			}
			y(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
			(yyval.atributos).es_direccion = 0;
			(yyval.atributos).tipo = BOOLEAN;
   }
#line 2177 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 706 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(out, ";R78:	<exp> ::= <exp> || <exp>\n");
     if ((yyvsp[-2].atributos).tipo != BOOLEAN || (yyvsp[0].atributos).tipo != BOOLEAN) {
				fprintf(out,"****Error semántico en lin %d: Operacion logica con operandos int.\n", linea);
				return -1;
			}
			o(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion);
			(yyval.atributos).es_direccion = 0;
			(yyval.atributos).tipo = BOOLEAN;
   }
#line 2192 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 716 "alfa.y" /* yacc.c:1646  */
    {
     fprintf(out, ";R79:	<exp> ::= ! <exp>\n");
     if ((yyvsp[0].atributos).tipo!=BOOLEAN) {
				fprintf(out,"****Error semántico en lin %d: Operacion logica con operandos int.\n", linea);
				return -1;
			}
			no(out, (yyvsp[0].atributos).es_direccion?1:0, cuantos_no++);
			(yyval.atributos).es_direccion = 0;
			(yyval.atributos).tipo = BOOLEAN;
   }
#line 2207 "y.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 726 "alfa.y" /* yacc.c:1646  */
    {
    strcpy((yyval.atributos).lexema, (yyvsp[0].atributos).lexema);
     if(get_ambit() == GLOBAL){
       simbolo = is_global_symbol(ts_get_global(ts), (yyvsp[0].atributos).lexema);
     } else {
       simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (yyvsp[0].atributos).lexema);
     }

     if(simbolo == NULL){
       fprintf(out,"**** 3 Error semantico en lin %d: Variable no declarada.\n", linea);
       return -1;
     }
     /*else{
       if(get_symbol_category(simbolo) == FUNCION || get_symbol_category(simbolo) == VECTOR){
         fprintf(out,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
         return -1;
       }
       $$.tipo = get_type(simbolo);
       $$.es_direccion = 1;
     }
     escribir_operando(out, $1.lexema, $$.es_direccion);*/

     if (is_global_symbol(ts_get_global(ts), (yyvsp[0].atributos).lexema) == NULL){
         if(get_symbol_category(simbolo) == PARAMETRO){
           escribirParametro(out, simbolo->num_param, num_parametros_actual);
           num_parametros_actual--;
         }else{
           escribirVariableLocal(out, simbolo->num_param+1);
         }
       } else{
         escribir_operando(out, (yyvsp[0].atributos).lexema, 1);
       }
     (yyval.atributos).tipo = get_type(simbolo);
     (yyval.atributos).es_direccion = 1;

     fprintf(out, ";R80:	<exp> ::= <TOK_IDENTIFICADOR>\n");
   }
#line 2249 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 764 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R81:	<exp> ::= <constante>\n");
      (yyval.atributos).tipo = (yyvsp[0].atributos).tipo;
      (yyval.atributos).es_direccion = (yyvsp[0].atributos).es_direccion;
      escribir_operando(out, (yyvsp[0].atributos).lexema, 0);
      }
#line 2259 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 770 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R82:	<exp> ::= ( <exp> )\n");
      (yyval.atributos).tipo = (yyvsp[-1].atributos).tipo;
      (yyval.atributos).es_direccion = (yyvsp[-1].atributos).es_direccion;}
#line 2267 "y.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 774 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R83:	<exp> ::= ( <comparacion> )\n");
      (yyval.atributos).tipo = (yyvsp[-1].atributos).tipo;
      (yyval.atributos).es_direccion = (yyvsp[-1].atributos).es_direccion;}
#line 2275 "y.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 778 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R85:	<exp> ::= <elemento_vector>\n");
      (yyval.atributos).tipo = (yyvsp[0].atributos).tipo;
      (yyval.atributos).es_direccion = (yyvsp[0].atributos).es_direccion;}
#line 2283 "y.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 782 "alfa.y" /* yacc.c:1646  */
    {
     if(get_ambit() == GLOBAL){
       simbolo = is_global_symbol(ts_get_global(ts), (yyvsp[-3].atributos).lexema);
     } else {
       simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (yyvsp[-3].atributos).lexema);
     }
       if(simbolo == NULL){
         fprintf(out,"****Error semantico en lin %d: Funcion no declarada.\n", linea);
         return -1;
       }
       en_explist = 0;
       (yyval.atributos).tipo = simbolo->type;
       llamarFuncion(out, (yyvsp[-3].atributos).lexema, simbolo->num_param);
       fprintf(out, ";R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )\n");

      }
#line 2304 "y.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 799 "alfa.y" /* yacc.c:1646  */
    { //NO se muy bien que hace esta cosa
  //Control de Errores como arriba
  num_parametros_llamada_actual = 0;
  en_explist = 1;
  strcpy((yyval.atributos).lexema, (yyvsp[0].atributos).lexema);
}
#line 2315 "y.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 809 "alfa.y" /* yacc.c:1646  */
    {
                   en_explist = 0;
                   fprintf(out, ";R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>\n");
                    num_parametros_llamada_actual++;}
#line 2324 "y.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 813 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R90:	<lista_expresiones> ::= \n");}
#line 2330 "y.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 818 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>\n");
                          num_parametros_llamada_actual++;}
#line 2337 "y.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 820 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R92: <resto_lista_expresiones> ::= \n");}
#line 2343 "y.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 822 "alfa.y" /* yacc.c:1646  */
    {
  operandoEnPilaAArgumento(out, (yyvsp[0].atributos).es_direccion);
}
#line 2351 "y.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 832 "alfa.y" /* yacc.c:1646  */
    {
              fprintf(out, ";R93: <comparacion> ::= <exp> == <exp>\n");
              if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
        				fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
        				return -1;
        			}
        			igual(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, cuantas_comparaciones++);
        			(yyval.atributos).etiqueta = cuantas_comparaciones;
        			(yyval.atributos).es_direccion = 0;
        			(yyval.atributos).tipo = BOOLEAN;
            }
#line 2367 "y.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 843 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(out, ";R94: <comparacion> ::= <exp> != <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             distinto(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, cuantas_comparaciones++);
             (yyval.atributos).etiqueta = cuantas_comparaciones;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2383 "y.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 854 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(out, ";R95: <comparacion> ::= <exp> <= <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             menor_igual(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, cuantas_comparaciones++);
             (yyval.atributos).etiqueta = cuantas_comparaciones;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2399 "y.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 865 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(out, ";R96: <comparacion> ::= <exp> >= <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             mayor_igual(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, cuantas_comparaciones++);
             (yyval.atributos).etiqueta = cuantas_comparaciones;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2415 "y.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 876 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(out, ";R97: <comparacion> ::= <exp> < <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             menor(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, cuantas_comparaciones++);
             (yyval.atributos).etiqueta = cuantas_comparaciones;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2431 "y.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 887 "alfa.y" /* yacc.c:1646  */
    {
             fprintf(out, ";R98: <comparacion> ::= <exp> > <exp>\n");
             if ((yyvsp[-2].atributos).tipo!=INT || (yyvsp[0].atributos).tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             mayor(out, (yyvsp[-2].atributos).es_direccion, (yyvsp[0].atributos).es_direccion, cuantas_comparaciones++);
             (yyval.atributos).etiqueta = cuantas_comparaciones;
             (yyval.atributos).es_direccion = 0;
             (yyval.atributos).tipo = BOOLEAN;
           }
#line 2447 "y.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 902 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R99: <constante> ::= <constante_logica>\n");
            (yyval.atributos).tipo = (yyvsp[0].atributos).tipo;
            (yyval.atributos).es_direccion = (yyvsp[0].atributos).es_direccion;
            strcpy((yyval.atributos).lexema, (yyvsp[0].atributos).lexema);}
#line 2456 "y.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 907 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R100: <constante> ::= <constante_entera>\n");
            (yyval.atributos).tipo = (yyvsp[0].atributos).tipo;
            (yyval.atributos).es_direccion = (yyvsp[0].atributos).es_direccion;
            strcpy((yyval.atributos).lexema, (yyvsp[0].atributos).lexema);}
#line 2465 "y.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 915 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R102: <constante_logica> ::= true\n");
                   (yyval.atributos).tipo = BOOLEAN;
                   (yyval.atributos).es_direccion = 0;
                   strcpy((yyval.atributos).lexema, "1");}
#line 2474 "y.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 920 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R103: <constante_logica> ::= false\n");
                  (yyval.atributos).tipo = BOOLEAN;
                  (yyval.atributos).es_direccion = 0;
                  strcpy((yyval.atributos).lexema, "0");}
#line 2483 "y.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 927 "alfa.y" /* yacc.c:1646  */
    {fprintf(out, ";R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA\n");
                   (yyval.atributos).tipo = INT;
                   (yyval.atributos).es_direccion = 0;
                   //$$.valor_entero = $1.valor_entero;
                   //char buffer_cte[100];
                   //sprintf(buffer_cte, "%d", $$.valor_entero);
                   //escribir_operando(out, buffer_cte, $$.es_direccion);
                   sprintf((yyval.atributos).lexema, "%d", (yyval.atributos).valor_entero);
                 }
#line 2497 "y.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 940 "alfa.y" /* yacc.c:1646  */
    {
  if(get_ambit() == GLOBAL){
    if(new_global(ts_get_global(ts), (yyvsp[0].atributos).lexema, FALSE, clase_actual, tipo_actual, VARIABLE) == FALSE){
      fprintf(out,"****Error semantico en lin %d: Identificador %s duplicado.\n", linea, (yyvsp[0].atributos).lexema);
      return -1;
    }
    if(clase_actual == VECTOR){
      declarar_variable(out, (yyvsp[0].atributos).lexema, tipo_actual, tamanio_vector_actual);
    } else {
      declarar_variable(out, (yyvsp[0].atributos).lexema, tipo_actual, 1);
    }
    //declarar_variable(out, $1.lexema, tipo_actual, tamanio_vector_actual);
  } else {
    if(es_funcion){
      if(clase_actual != ESCALAR){
        fprintf(out,"****Error semantico en lin %d: Variable local de tipo no escalar\n", linea);
      }
      num_variables_locales_actual ++;
      pos_variable_local_actual++;
    } else {
      if(clase_actual == VECTOR){
        declarar_variable(out, (yyvsp[0].atributos).lexema, tipo_actual, tamanio_vector_actual);
      } else {
        declarar_variable(out, (yyvsp[0].atributos).lexema, tipo_actual, 1);
      }
    }

    if(new_local(ts_get_local(ts), (yyvsp[0].atributos).lexema, FALSE, clase_actual, tipo_actual, VARIABLE) == FALSE){
      fprintf(out,"****Error semantico en lin %d: Identificador %s duplicado.\n", linea, (yyvsp[0].atributos).lexema);
    }

  }
  fprintf(out, ";R108:	<identificador> ::= TOK_IDENTIFICADOR\n");}
#line 2535 "y.tab.c" /* yacc.c:1646  */
    break;


#line 2539 "y.tab.c" /* yacc.c:1646  */
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
#line 973 "alfa.y" /* yacc.c:1906  */


void yyerror(const char *s) {
  fprintf(out,"****Error sintactico en [linea %d, columna %d]\n", linea, columna);
}
