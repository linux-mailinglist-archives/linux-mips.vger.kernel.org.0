Return-Path: <linux-mips+bounces-7868-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE762A3C815
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 19:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B4FA188FE28
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 18:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779CD2153D1;
	Wed, 19 Feb 2025 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c2xni/dj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20608215173
	for <linux-mips@vger.kernel.org>; Wed, 19 Feb 2025 18:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739991438; cv=none; b=uOsgeUBngLmhEFiDxy8NYN1y75i+csa7zq1AcsJNmtvkxCtiRAh3OXPNejO2P/ZWk68Wghe+nJuxlN57F6SwHVHWoKzJ4ScGEcOkaQ1V2WUg8tXKxvAgqeIuJibVlX10J0uHvHLBmsH6R8ede91YLBNiaFYy0d5nSpYJ4yiYrRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739991438; c=relaxed/simple;
	bh=TCgqmhfXYewTfdfE5eGGWEMMxbZ3unWH7SsyKg+4rhU=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=Jpviirmwrg2wKiTexa2xwJIiLSpR6aiuirx+t2znS84knhFlRffHMVsCnH/+Q9OgKw9Cihk8r06OShllaNPIph75Zq5TITd8j8uvqlHNE+aqdlBCR9b2Ilq/vZ4AahHS9lzI1ygOETd0ypPNSto5NKtATpf0f/uv8cVoyMRpNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c2xni/dj; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e582bfcada6so312442276.1
        for <linux-mips@vger.kernel.org>; Wed, 19 Feb 2025 10:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739991435; x=1740596235; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UhKzWnab12XMxWTCYlOFUttaizbC7pr5Fhq5T8U2Rac=;
        b=c2xni/djB+3ylUlQYJ44Lk26g0Ym7Ax4SZ+UNHUaix6V/f0Z5TH98xMAcv/h5oXS3q
         s4WsS7P2fPT5BU6jybMV5DNJvKweDzhedBYq1cf2jLSLWKbFFheU71O05IeoA3zc8VZW
         WHYfqES3OS8N+yiiLb+QH9pLEcQvSwfuZ5gdlEx63B6u5iD0BKTbNFxWdRAnRIo8XDzW
         B6FZQlQuiNaqUIvkdUecAdBWFheALRvnLRowMFq97huIaMcQoG/QrXU7jOsl14NJgBpq
         gRbq4bojuBbwadbQSkN4syvNxjvCvfvAekW6BN9YjNAEnqbq6SPoMDzVRMaTFGhDQUbc
         bJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739991435; x=1740596235;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhKzWnab12XMxWTCYlOFUttaizbC7pr5Fhq5T8U2Rac=;
        b=A9Hp1QJ2OYzhc4lrIEP4GBOPbvaRKG1Fa/xBXCN4KY/hb9+PrXxXqysgPQ4tQIbdFD
         s2HqlsZnFf9UMuXzRd0I95ivcPv/UFhRIpcbZojaYGYReYLfPcYHJ4m35FmWt2llYDD0
         DbKYJ9z7sIC5tE22es3UccqV8Qf7yuaT0fWpbSo6KFug93ne8NuO7DhBoBwLzaKwwOZU
         KitMw87yEpkesq+yVrUcbIe19HBb7Z9lcOuqrQgaC70YX8lMpSfN/LQsddKcJSPs5SZG
         sWP3ZGYgTuROg33uESiwLblDJ7N0FbGNg86rFV51H3j1ESQRc7cIssZcF8BvrHldfe5s
         4xDA==
X-Forwarded-Encrypted: i=1; AJvYcCVjmLL8JCnew8L6iFuD3E8BNHtQZFGwwZO554FvnMvY+HDBPTkfNq2xYcJn2fGLaT28AGCF0T8bnVPv@vger.kernel.org
X-Gm-Message-State: AOJu0YxQPAnEhXh+uRmrAL31TVl6xo6QVuI7QkBb7015F3aYpHckJp1F
	ymdx9lXo/6qNSbdcCjembQDXdrOzrL6dQG3BsFTyy3FxtvUbQDxhLv8tACff9PICN7vIQT5Q41j
	YMkgLGA==
X-Google-Smtp-Source: AGHT+IGXwvYLp2kQzjITAGDJrXA0LX3POwHlCA5JvOVaoVS7n1r0R/Yw+oVM26kgofXtKfVPeA2TfRdlWuI/
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:c57b:86f0:c166:3061])
 (user=irogers job=sendgmr) by 2002:a05:6902:2987:b0:e5b:20df:8adb with SMTP
 id 3f1490d57ef6-e5dc932b130mr194569276.9.1739991434785; Wed, 19 Feb 2025
 10:57:14 -0800 (PST)
Date: Wed, 19 Feb 2025 10:56:51 -0800
In-Reply-To: <20250219185657.280286-1-irogers@google.com>
Message-Id: <20250219185657.280286-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250219185657.280286-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Subject: [PATCH v3 2/8] perf trace: Reorganize syscalls
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Identify struct syscall information in the syscalls table by a machine
type and syscall number, not just system call number. Having the
machine type means that 32-bit system calls can be differentiated from
64-bit ones on a machine capable of both. Having a table for all
machine types and all system call numbers would be too large, so
maintain a sorted array of system calls as they are encountered.

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: Howard Chu <howardchu95@gmail.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/builtin-trace.c | 177 ++++++++++++++++++++++++-------------
 1 file changed, 118 insertions(+), 59 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index f55a8a6481f2..eb3551fb0e7b 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -66,6 +66,7 @@
 #include "syscalltbl.h"
 #include "../perf.h"
 #include "trace_augment.h"
+#include "dwarf-regs.h"
 
 #include <errno.h>
 #include <inttypes.h>
@@ -86,6 +87,7 @@
 
 #include <linux/ctype.h>
 #include <perf/mmap.h>
+#include <tools/libc_compat.h>
 
 #ifdef HAVE_LIBTRACEEVENT
 #include <event-parse.h>
@@ -149,7 +151,10 @@ struct trace {
 	struct perf_tool	tool;
 	struct syscalltbl	*sctbl;
 	struct {
+		/** Sorted sycall numbers used by the trace. */
 		struct syscall  *table;
+		/** Size of table. */
+		size_t		table_size;
 		struct {
 			struct evsel *sys_enter,
 				*sys_exit,
@@ -1454,22 +1459,37 @@ static const struct syscall_fmt *syscall_fmt__find_by_alias(const char *alias)
 	return __syscall_fmt__find_by_alias(syscall_fmts, nmemb, alias);
 }
 
-/*
- * is_exit: is this "exit" or "exit_group"?
- * is_open: is this "open" or "openat"? To associate the fd returned in sys_exit with the pathname in sys_enter.
- * args_size: sum of the sizes of the syscall arguments, anything after that is augmented stuff: pathname for openat, etc.
- * nonexistent: Just a hole in the syscall table, syscall id not allocated
+/**
+ * struct syscall
  */
 struct syscall {
+	/** @e_machine: The ELF machine associated with the entry. */
+	int e_machine;
+	/** @id: id value from the tracepoint, the system call number. */
+	int id;
 	struct tep_event    *tp_format;
 	int		    nr_args;
+	/**
+	 * @args_size: sum of the sizes of the syscall arguments, anything
+	 * after that is augmented stuff: pathname for openat, etc.
+	 */
+
 	int		    args_size;
 	struct {
 		struct bpf_program *sys_enter,
 				   *sys_exit;
 	}		    bpf_prog;
+	/** @is_exit: is this "exit" or "exit_group"? */
 	bool		    is_exit;
+	/**
+	 * @is_open: is this "open" or "openat"? To associate the fd returned in
+	 * sys_exit with the pathname in sys_enter.
+	 */
 	bool		    is_open;
+	/**
+	 * @nonexistent: Name lookup failed. Just a hole in the syscall table,
+	 * syscall id not allocated.
+	 */
 	bool		    nonexistent;
 	bool		    use_btf;
 	struct tep_format_field *args;
@@ -2107,22 +2127,21 @@ static int syscall__set_arg_fmts(struct syscall *sc)
 	return 0;
 }
 
-static int trace__read_syscall_info(struct trace *trace, int id)
+static int syscall__read_info(struct syscall *sc, struct trace *trace)
 {
 	char tp_name[128];
-	struct syscall *sc;
-	const char *name = syscalltbl__name(trace->sctbl, id);
+	const char *name;
 	int err;
 
-	if (trace->syscalls.table == NULL) {
-		trace->syscalls.table = calloc(trace->sctbl->syscalls.max_id + 1, sizeof(*sc));
-		if (trace->syscalls.table == NULL)
-			return -ENOMEM;
-	}
-	sc = trace->syscalls.table + id;
 	if (sc->nonexistent)
 		return -EEXIST;
 
+	if (sc->name) {
+		/* Info already read. */
+		return 0;
+	}
+
+	name = syscalltbl__name(trace->sctbl, sc->id);
 	if (name == NULL) {
 		sc->nonexistent = true;
 		return -EEXIST;
@@ -2145,15 +2164,16 @@ static int trace__read_syscall_info(struct trace *trace, int id)
 	 */
 	if (IS_ERR(sc->tp_format)) {
 		sc->nonexistent = true;
-		return PTR_ERR(sc->tp_format);
+		err = PTR_ERR(sc->tp_format);
+		sc->tp_format = NULL;
+		return err;
 	}
 
 	/*
 	 * The tracepoint format contains __syscall_nr field, so it's one more
 	 * than the actual number of syscall arguments.
 	 */
-	if (syscall__alloc_arg_fmts(sc, IS_ERR(sc->tp_format) ?
-					RAW_SYSCALL_ARGS_NUM : sc->tp_format->format.nr_fields - 1))
+	if (syscall__alloc_arg_fmts(sc, sc->tp_format->format.nr_fields - 1))
 		return -ENOMEM;
 
 	sc->args = sc->tp_format->format.fields;
@@ -2442,13 +2462,67 @@ static size_t syscall__scnprintf_args(struct syscall *sc, char *bf, size_t size,
 	return printed;
 }
 
+static void syscall__init(struct syscall *sc, int e_machine, int id)
+{
+	memset(sc, 0, sizeof(*sc));
+	sc->e_machine = e_machine;
+	sc->id = id;
+}
+
+static void syscall__exit(struct syscall *sc)
+{
+	if (!sc)
+		return;
+
+	zfree(&sc->arg_fmt);
+}
+
+static int syscall__cmp(const void *va, const void *vb)
+{
+	const struct syscall *a = va, *b = vb;
+
+	if (a->e_machine != b->e_machine)
+		return a->e_machine - b->e_machine;
+
+	return a->id - b->id;
+}
+
+static struct syscall *trace__find_syscall(struct trace *trace, int e_machine, int id)
+{
+	struct syscall key = {
+		.e_machine = e_machine,
+		.id = id,
+	};
+	struct syscall *sc, *tmp;
+
+	sc = bsearch(&key, trace->syscalls.table, trace->syscalls.table_size,
+		     sizeof(struct syscall), syscall__cmp);
+	if (sc)
+		return sc;
+
+	tmp = reallocarray(trace->syscalls.table, trace->syscalls.table_size + 1,
+			   sizeof(struct syscall));
+	if (!tmp)
+		return NULL;
+
+	trace->syscalls.table = tmp;
+	sc = &trace->syscalls.table[trace->syscalls.table_size++];
+	syscall__init(sc, e_machine, id);
+	qsort(trace->syscalls.table, trace->syscalls.table_size, sizeof(struct syscall),
+	      syscall__cmp);
+	sc = bsearch(&key, trace->syscalls.table, trace->syscalls.table_size,
+		     sizeof(struct syscall), syscall__cmp);
+	return sc;
+}
+
 typedef int (*tracepoint_handler)(struct trace *trace, struct evsel *evsel,
 				  union perf_event *event,
 				  struct perf_sample *sample);
 
-static struct syscall *trace__syscall_info(struct trace *trace,
-					   struct evsel *evsel, int id)
+static struct syscall *trace__syscall_info(struct trace *trace, struct evsel *evsel,
+					   int e_machine, int id)
 {
+	struct syscall *sc;
 	int err = 0;
 
 	if (id < 0) {
@@ -2473,28 +2547,20 @@ static struct syscall *trace__syscall_info(struct trace *trace,
 
 	err = -EINVAL;
 
-	if (id > trace->sctbl->syscalls.max_id) {
-		goto out_cant_read;
-	}
-
-	if ((trace->syscalls.table == NULL || trace->syscalls.table[id].name == NULL) &&
-	    (err = trace__read_syscall_info(trace, id)) != 0)
-		goto out_cant_read;
+	sc = trace__find_syscall(trace, e_machine, id);
+	if (sc)
+		err = syscall__read_info(sc, trace);
 
-	if (trace->syscalls.table && trace->syscalls.table[id].nonexistent)
-		goto out_cant_read;
-
-	return &trace->syscalls.table[id];
-
-out_cant_read:
-	if (verbose > 0) {
+	if (err && verbose > 0) {
 		char sbuf[STRERR_BUFSIZE];
-		fprintf(trace->output, "Problems reading syscall %d: %d (%s)", id, -err, str_error_r(-err, sbuf, sizeof(sbuf)));
-		if (id <= trace->sctbl->syscalls.max_id && trace->syscalls.table[id].name != NULL)
-			fprintf(trace->output, "(%s)", trace->syscalls.table[id].name);
+
+		fprintf(trace->output, "Problems reading syscall %d: %d (%s)", id, -err,
+			str_error_r(-err, sbuf, sizeof(sbuf)));
+		if (sc && sc->name)
+			fprintf(trace->output, "(%s)", sc->name);
 		fputs(" information\n", trace->output);
 	}
-	return NULL;
+	return err ? NULL : sc;
 }
 
 struct syscall_stats {
@@ -2643,14 +2709,6 @@ static void *syscall__augmented_args(struct syscall *sc, struct perf_sample *sam
 	return NULL;
 }
 
-static void syscall__exit(struct syscall *sc)
-{
-	if (!sc)
-		return;
-
-	zfree(&sc->arg_fmt);
-}
-
 static int trace__sys_enter(struct trace *trace, struct evsel *evsel,
 			    union perf_event *event __maybe_unused,
 			    struct perf_sample *sample)
@@ -2662,7 +2720,7 @@ static int trace__sys_enter(struct trace *trace, struct evsel *evsel,
 	int id = perf_evsel__sc_tp_uint(evsel, id, sample), err = -1;
 	int augmented_args_size = 0;
 	void *augmented_args = NULL;
-	struct syscall *sc = trace__syscall_info(trace, evsel, id);
+	struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
 	struct thread_trace *ttrace;
 
 	if (sc == NULL)
@@ -2736,7 +2794,7 @@ static int trace__fprintf_sys_enter(struct trace *trace, struct evsel *evsel,
 	struct thread_trace *ttrace;
 	struct thread *thread;
 	int id = perf_evsel__sc_tp_uint(evsel, id, sample), err = -1;
-	struct syscall *sc = trace__syscall_info(trace, evsel, id);
+	struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
 	char msg[1024];
 	void *args, *augmented_args = NULL;
 	int augmented_args_size;
@@ -2811,7 +2869,7 @@ static int trace__sys_exit(struct trace *trace, struct evsel *evsel,
 	struct thread *thread;
 	int id = perf_evsel__sc_tp_uint(evsel, id, sample), err = -1, callchain_ret = 0, printed = 0;
 	int alignment = trace->args_alignment;
-	struct syscall *sc = trace__syscall_info(trace, evsel, id);
+	struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
 	struct thread_trace *ttrace;
 
 	if (sc == NULL)
@@ -3164,7 +3222,7 @@ static int trace__event_handler(struct trace *trace, struct evsel *evsel,
 
 	if (evsel == trace->syscalls.events.bpf_output) {
 		int id = perf_evsel__sc_tp_uint(evsel, id, sample);
-		struct syscall *sc = trace__syscall_info(trace, evsel, id);
+		struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
 
 		if (sc) {
 			fprintf(trace->output, "%s(", sc->name);
@@ -3673,7 +3731,7 @@ static struct bpf_program *trace__find_syscall_bpf_prog(struct trace *trace, str
 
 static void trace__init_syscall_bpf_progs(struct trace *trace, int id)
 {
-	struct syscall *sc = trace__syscall_info(trace, NULL, id);
+	struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, id);
 
 	if (sc == NULL)
 		return;
@@ -3684,20 +3742,20 @@ static void trace__init_syscall_bpf_progs(struct trace *trace, int id)
 
 static int trace__bpf_prog_sys_enter_fd(struct trace *trace, int id)
 {
-	struct syscall *sc = trace__syscall_info(trace, NULL, id);
+	struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, id);
 	return sc ? bpf_program__fd(sc->bpf_prog.sys_enter) : bpf_program__fd(trace->skel->progs.syscall_unaugmented);
 }
 
 static int trace__bpf_prog_sys_exit_fd(struct trace *trace, int id)
 {
-	struct syscall *sc = trace__syscall_info(trace, NULL, id);
+	struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, id);
 	return sc ? bpf_program__fd(sc->bpf_prog.sys_exit) : bpf_program__fd(trace->skel->progs.syscall_unaugmented);
 }
 
 static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int key, unsigned int *beauty_array)
 {
 	struct tep_format_field *field;
-	struct syscall *sc = trace__syscall_info(trace, NULL, key);
+	struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, key);
 	const struct btf_type *bt;
 	char *struct_offset, *tmp, name[32];
 	bool can_augment = false;
@@ -3795,7 +3853,7 @@ static struct bpf_program *trace__find_usable_bpf_prog_entry(struct trace *trace
 try_to_find_pair:
 	for (int i = 0; i < trace->sctbl->syscalls.nr_entries; ++i) {
 		int id = syscalltbl__id_at_idx(trace->sctbl, i);
-		struct syscall *pair = trace__syscall_info(trace, NULL, id);
+		struct syscall *pair = trace__syscall_info(trace, NULL, EM_HOST, id);
 		struct bpf_program *pair_prog;
 		bool is_candidate = false;
 
@@ -3945,7 +4003,7 @@ static int trace__init_syscalls_bpf_prog_array_maps(struct trace *trace)
 	 */
 	for (int i = 0; i < trace->sctbl->syscalls.nr_entries; ++i) {
 		int key = syscalltbl__id_at_idx(trace->sctbl, i);
-		struct syscall *sc = trace__syscall_info(trace, NULL, key);
+		struct syscall *sc = trace__syscall_info(trace, NULL, EM_HOST, key);
 		struct bpf_program *pair_prog;
 		int prog_fd;
 
@@ -4760,7 +4818,10 @@ static size_t syscall__dump_stats(struct trace *trace, FILE *fp,
 			pct = avg ? 100.0 * stddev_stats(&stats->stats) / avg : 0.0;
 			avg /= NSEC_PER_MSEC;
 
-			sc = &trace->syscalls.table[entry->syscall];
+			sc = trace__syscall_info(trace, /*evsel=*/NULL, EM_HOST, entry->syscall);
+			if (!sc)
+				continue;
+
 			printed += fprintf(fp, "   %-15s", sc->name);
 			printed += fprintf(fp, " %8" PRIu64 " %6" PRIu64 " %9.3f %9.3f %9.3f",
 					   n, stats->nr_failures, entry->msecs, min, avg);
@@ -5217,12 +5278,10 @@ static int trace__config(const char *var, const char *value, void *arg)
 
 static void trace__exit(struct trace *trace)
 {
-	int i;
-
 	strlist__delete(trace->ev_qualifier);
 	zfree(&trace->ev_qualifier_ids.entries);
 	if (trace->syscalls.table) {
-		for (i = 0; i <= trace->sctbl->syscalls.max_id; i++)
+		for (size_t i = 0; i < trace->syscalls.table_size; i++)
 			syscall__exit(&trace->syscalls.table[i]);
 		zfree(&trace->syscalls.table);
 	}
-- 
2.48.1.601.g30ceb7b040-goog


