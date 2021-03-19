  plan apache::bootstrap(
    TargetSpec $node,
    TargetSpec $hostname,
  ) {
    run_task('apache::hostname', $node, hostname => $hostname)
    run_command("curl -k https://ppserver01.4v2at4d0mdaexnxy30mifask5d.cx.internal.cloudapp.net:8140/packages/current/install.bash -o /tmp/install.bash", $node)
    run_command("bash /tmp/install.bash", $node)
    run_command("puppetserver ca sign --all", "ppserver01")
  }
