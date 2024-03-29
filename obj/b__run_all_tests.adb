pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__run_all_tests.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__run_all_tests.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E073 : Short_Integer; pragma Import (Ada, E073, "system__os_lib_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "ada__exceptions_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "system__soft_links_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exception_table_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "ada__containers_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "ada__io_exceptions_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "ada__strings_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings__maps_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__strings__maps__constants_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "interfaces__c_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "system__exceptions_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "system__object_reader_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "system__dwarf_lines_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__soft_links__initialize_E");
   E040 : Short_Integer; pragma Import (Ada, E040, "system__traceback__symbolic_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "ada__tags_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "ada__streams_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "system__file_control_block_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__finalization_root_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "ada__finalization_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__file_io_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "system__storage_pools_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__finalization_masters_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "system__storage_pools__subpools_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "ada__strings__unbounded_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "ada__text_io_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "tad_coordonnee_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "tad_ensemble_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "tad_grillesudoku_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "affichage_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "remplirgrille_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "tad_pile_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "tad_pile_cord_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "tad_pile_grille_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "resolutions_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "tests_resolutions_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "tests_tad_coordonnee_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "tests_tad_ensemble_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "tests_tad_grille_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E194 := E194 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "tests_tad_grille__finalize_spec");
      begin
         F1;
      end;
      E191 := E191 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "tests_tad_ensemble__finalize_spec");
      begin
         F2;
      end;
      E188 := E188 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "tests_tad_coordonnee__finalize_spec");
      begin
         F3;
      end;
      E164 := E164 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "tests_resolutions__finalize_spec");
      begin
         F4;
      end;
      E100 := E100 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ada__text_io__finalize_spec");
      begin
         F5;
      end;
      E136 := E136 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "ada__strings__unbounded__finalize_spec");
      begin
         F6;
      end;
      E144 := E144 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__storage_pools__subpools__finalize_spec");
      begin
         F7;
      end;
      E146 := E146 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__finalization_masters__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__file_io__finalize_body");
      begin
         E112 := E112 - 1;
         F9;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E026 := E026 + 1;
      Ada.Containers'Elab_Spec;
      E041 := E041 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E069 := E069 + 1;
      Ada.Strings'Elab_Spec;
      E053 := E053 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E055 := E055 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E059 := E059 + 1;
      Interfaces.C'Elab_Spec;
      E079 := E079 + 1;
      System.Exceptions'Elab_Spec;
      E028 := E028 + 1;
      System.Object_Reader'Elab_Spec;
      E081 := E081 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E048 := E048 + 1;
      System.Os_Lib'Elab_Body;
      E073 := E073 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E022 := E022 + 1;
      E014 := E014 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E040 := E040 + 1;
      E009 := E009 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E104 := E104 + 1;
      Ada.Streams'Elab_Spec;
      E102 := E102 + 1;
      System.File_Control_Block'Elab_Spec;
      E116 := E116 + 1;
      System.Finalization_Root'Elab_Spec;
      E115 := E115 + 1;
      Ada.Finalization'Elab_Spec;
      E113 := E113 + 1;
      System.File_Io'Elab_Body;
      E112 := E112 + 1;
      System.Storage_Pools'Elab_Spec;
      E150 := E150 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E146 := E146 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E144 := E144 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E136 := E136 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E100 := E100 + 1;
      E168 := E168 + 1;
      Tad_Ensemble'Elab_Spec;
      E170 := E170 + 1;
      Tad_Grillesudoku'Elab_Spec;
      E172 := E172 + 1;
      E166 := E166 + 1;
      E174 := E174 + 1;
      tad_pile'elab_spec;
      E180 := E180 + 1;
      tad_pile_cord'elab_spec;
      E182 := E182 + 1;
      tad_pile_grille'elab_spec;
      E184 := E184 + 1;
      resolutions'elab_spec;
      E178 := E178 + 1;
      Tests_Resolutions'Elab_Spec;
      E164 := E164 + 1;
      Tests_Tad_Coordonnee'Elab_Spec;
      E188 := E188 + 1;
      Tests_Tad_Ensemble'Elab_Spec;
      E191 := E191 + 1;
      Tests_Tad_Grille'Elab_Spec;
      E194 := E194 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_run_all_tests");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\TAD_coordonnee.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\TAD_ensemble.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\TAD_grillesudoku.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\affichage.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\remplirGrille.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\TAD_Pile.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\TAD_Pile_Cord.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\TAD_Pile_Grille.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\resolutions.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\tests.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\tests_resolutions.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\run_tests_resolutions.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\tests_TAD_Coordonnee.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\run_tests_TAD_Coordonnee.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\tests_TAD_Ensemble.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\run_tests_TAD_Ensemble.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\tests_TAD_Grille.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\run_tests_TAD_Grille.o
   --   C:\Users\lucas\Desktop\Informatique\S1.02\obj\run_all_tests.o
   --   -LC:\Users\lucas\Desktop\Informatique\S1.02\obj\
   --   -LC:\Users\lucas\Desktop\Informatique\S1.02\obj\
   --   -LC:/gnat/2020/lib/gcc/x86_64-pc-mingw32/9.3.1/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
