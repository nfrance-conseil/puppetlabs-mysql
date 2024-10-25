# frozen_string_literal: true

Facter.add('mysqld_version') do
  setcode do
    if Facter::Core::Execution.which('mysqld') || Facter::Core::Execution.which('/usr/libexec/mysqld') || Facter::Core::Execution.which('/usr/local/libexec/mysqld')
      Facter::Core::Execution.execute('env PATH=$PATH:/usr/libexec:/usr/local/libexec mysqld --no-defaults -V 2>/dev/null')
    elsif Facter::Core::Execution.which('mariadbd') || Facter::Core::Execution.which('/usr/libexec/mariadbd') || Facter::Core::Execution.which('/usr/local/libexec/mariadbd')
      Facter::Core::Execution.execute('env PATH=$PATH:/usr/libexec:/usr/local/libexec mariadbd --no-defaults -V 2>/dev/null')
    end
  end
end
