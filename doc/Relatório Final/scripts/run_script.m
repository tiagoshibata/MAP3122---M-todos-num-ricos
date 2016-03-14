function run_script(name)
%RUN_SCRIPT Executa script com configurações corretas do ambiente.
	addpath('../../../src');
	load_parameters;

	feval(name);

	rmpath('../../../src');
end
