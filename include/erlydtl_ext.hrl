
-record(error_info, {
          return = false,
          report = false,
          list = []
         }).

-record(dtl_context, {
          local_scopes = [], 
          block_dict = dict:new(), 
          trans_fun = none,
          trans_locales = [],
          auto_escape = off, 
          doc_root = "", 
          parse_trail = [],
          vars = [],
          record_info = [],
          filters = [],
          tags = [],
          libraries = [],
          custom_tags_dir = [],
          reader = {file, read_file},
          module = undefined,
          compiler_options = [],
          binary_strings = true,
          force_recompile = false,
          verbose = false,
          is_compiling_dir = false,
          extension_module = undefined,
          scanner_module = erlydtl_scanner,
          scanned_tokens = [],
          all_options = [],
          errors = #error_info{},
          warnings = #error_info{},
          bin = undefined
         }).

-record(ast_info, {
          dependencies = [],
          translatable_strings = [],
          translated_blocks= [],
          custom_tags = [],
          var_names = [],
          pre_render_asts = []}).

-record(treewalker, {
          counter = 0,
          safe = false,
          extension = undefined,
          context
         }).    

-record(scanner_state, {
          template=[],
          scanned=[],
          pos={1,1},
          state=in_text
        }).


-define(ERR(Err, Ctx), erlydtl_compiler_utils:add_error(?MODULE, Err, Ctx)).
-define(WARN(Warn, Ctx), erlydtl_compiler_utils:add_warning(?MODULE, Warn, Ctx)).
