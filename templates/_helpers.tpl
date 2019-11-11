{{- define "registry.name" -}}
{{- .Release.Name -}}-registy
{{- end -}}
{{- define "app.name" -}}
{{- .Release.Name -}}-app
{{- end -}}
{{- define "storage.claim.name" -}}
{{- .Release.Name -}}-storage-claim
{{- end -}}
{{- define "tls.name" -}}
{{- .Release.Name -}}-tls
{{- end -}}