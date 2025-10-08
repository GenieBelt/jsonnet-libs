local k8s = import 'kubernetes/kubernetes.libsonnet';

(import 'config.libsonnet') +
{
  local c = $._config,

  // Deployment definition
  serviceDeployment:
    k8s.serviceDeployment(
      deploymentConfig=c.deployment,
      withService=true,
      withIngress=true,
      ingressConfig=c.ingress,
    ),

  statefulSet:
    k8s.serviceStatefulSet(c.statefulSet, withService=true),
  job:
    k8s.serviceJob(c.job),
}
