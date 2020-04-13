program Academico;

uses
  Forms,
  Unit_logon in 'Unit_logon.pas' {Form_logon},
  Unit_menu in 'Unit_menu.pas' {Form_menu},
  Unit_splash in 'Unit_splash.pas' {Form_splash},
  Unit_usuarios in 'Unit_usuarios.pas' {Form_usuarios},
  Unit_pesquisa in 'Unit_pesquisa.pas' {Form_pesquisa},
  Unit_permissoes in 'Unit_permissoes.pas' {Form_permissoes},
  Unit_cursos in 'Unit_cursos.pas' {Form_cursos},
  Unit_instrutores in 'Unit_instrutores.pas' {Form_instrutores},
  Unit_turmas in 'Unit_turmas.pas' {Form_turmas},
  Unit_pesquisa_turmas in 'Unit_pesquisa_turmas.pas' {Form_pesquisa_turmas},
  Unit_aluno in 'Unit_aluno.pas' {Form_alunos},
  Unit_matriculas in 'Unit_matriculas.pas' {Form_matriculas},
  Unit_lanca_aulas in 'Unit_lanca_aulas.pas' {Form_lanca_aulas},
  Unit_lanca_presenca in 'Unit_lanca_presenca.pas' {Form_lanca_presenca},
  Unit_pag_instrutores in 'Unit_pag_instrutores.pas' {Form_pag_instrutores},
  Unit_relatorios in 'Unit_relatorios.pas' {Form_relatorios},
  Unit_rel_turmas in 'Unit_rel_turmas.pas' {Form_rel_turmas},
  Unit_rel_alunos in 'Unit_rel_alunos.pas' {Form_rel_alunos},
  Unit_rel_faltas in 'Unit_rel_faltas.pas' {Form_rel_faltas},
  Unit_rel_aulas in 'Unit_rel_aulas.pas' {Form_rel_aulas},
  Unit_DMPrincipal in 'Unit_DMPrincipal.pas' {FormDMPrincipal: TDataModule},
  Unit_Rela_Cursos in 'Unit_Rela_Cursos.pas' {Form_rel_Cursos},
  Unit_Rel_TurmasPorCurso in 'Unit_Rel_TurmasPorCurso.pas' {Form_Rel_TurmasPorCurso},
  Unit_Rel_AlunosPorTurma in 'Unit_Rel_AlunosPorTurma.pas' {Form_Rel_AlunosPorTurma},
  Unit_Rel_FaltaAlunos in 'Unit_Rel_FaltaAlunos.pas' {Form_Rel_FaltaAlunos},
  Unit_Rel_AulasInstrutor in 'Unit_Rel_AulasInstrutor.pas' {Form_Rel_AulasInstrutor},
  Unit_Demo_Aulas in 'Unit_Demo_Aulas.pas' {Form_Demo_Aulas};

{$R *.res}

begin
  Form_splash:=Tform_splash.Create(application);
  Form_splash.Show;
  Form_splash.Update;

  Application.Initialize;
  Application.CreateForm(TForm_logon, Form_logon);
  Application.CreateForm(TForm_menu, Form_menu);
  Application.CreateForm(TForm_usuarios, Form_usuarios);
  Application.CreateForm(TForm_pesquisa, Form_pesquisa);
  Application.CreateForm(TForm_permissoes, Form_permissoes);
  Application.CreateForm(TForm_cursos, Form_cursos);
  Application.CreateForm(TForm_instrutores, Form_instrutores);
  Application.CreateForm(TForm_turmas, Form_turmas);
  Application.CreateForm(TForm_pesquisa_turmas, Form_pesquisa_turmas);
  Application.CreateForm(TForm_alunos, Form_alunos);
  Application.CreateForm(TForm_matriculas, Form_matriculas);
  Application.CreateForm(TForm_lanca_aulas, Form_lanca_aulas);
  Application.CreateForm(TForm_lanca_presenca, Form_lanca_presenca);
  Application.CreateForm(TForm_pag_instrutores, Form_pag_instrutores);
  Application.CreateForm(TForm_relatorios, Form_relatorios);
  Application.CreateForm(TForm_rel_turmas, Form_rel_turmas);
  Application.CreateForm(TForm_rel_alunos, Form_rel_alunos);
  Application.CreateForm(TForm_rel_faltas, Form_rel_faltas);
  Application.CreateForm(TForm_rel_aulas, Form_rel_aulas);
  Application.CreateForm(TFormDMPrincipal, FormDMPrincipal);
  Application.CreateForm(TForm_rel_Cursos, Form_rel_Cursos);
  Application.CreateForm(TForm_Rel_TurmasPorCurso, Form_Rel_TurmasPorCurso);
  Application.CreateForm(TForm_Rel_AlunosPorTurma, Form_Rel_AlunosPorTurma);
  Application.CreateForm(TForm_Rel_FaltaAlunos, Form_Rel_FaltaAlunos);
  Application.CreateForm(TForm_Rel_AulasInstrutor, Form_Rel_AulasInstrutor);
  Application.CreateForm(TForm_Demo_Aulas, Form_Demo_Aulas);
  //Application.CreateForm(TForm_splash, Form_splash);

  if Form_logon.autenticacao = false then
    Application.Terminate;

  Form_splash.Hide;
  Form_splash.Destroy;
  Application.Run;
end.
