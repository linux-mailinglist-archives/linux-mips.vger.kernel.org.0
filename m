Return-Path: <linux-mips+bounces-149-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE2A7F39A2
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 23:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBEA41C20961
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 22:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3FF2838E;
	Tue, 21 Nov 2023 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2/RI8eu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F37F10EB;
	Tue, 21 Nov 2023 14:57:10 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28014fed9efso4839522a91.0;
        Tue, 21 Nov 2023 14:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700607429; x=1701212229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+EFg98kTfCiA5bJ0hLVEAxGuf511Fc6FKmEpnkyoH0=;
        b=L2/RI8eud8oCzmcYHwdKZeb84WHnS+jTdlkfVv5EWu5iKAGwJpn5u62uuLjiZUSlTx
         EUU8yhwGcIVN4jsds3uo40iADvgcw1RndSu6dtBByu58jmW9S+U0XGvuhNcioycV+kxm
         V7Y349RWPC62d8wl/et5tFdUfucRx5O+OlYjdqnlOeo0zFK6g04klTYRKyW+r7tJJhnI
         mN21S8s2bKCr6z/KAQ3I4LcdVIDpsF/0DciH+EkaqQ6zrX3K93f5zof41x1UynDzC6xu
         ND4rJNTjs8TpqmppcrFqxsJ5qEn7g6NJrqkN5svizWW/uxvQGx9sAZ9VVA5JNvbB+A93
         pflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700607429; x=1701212229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+EFg98kTfCiA5bJ0hLVEAxGuf511Fc6FKmEpnkyoH0=;
        b=eOYs5kUbOmro6+9aJ3p3pwSthlHBWBfMnSZjJ68vdXwMz/I+bA0qjO5+mTpYY+H2re
         r6M5bzy9sw6i6iWRNp+8zeFuU+h9UB0lCEJwHwQLcQ4GcuANQvDO08afyzWwp8WlmHxR
         9bXArAAZIBobsoKiJVVukzpjc7ZiWYAfZgro3iKCiEzvyqg7ehUE7kT7zllu1/mm+djG
         p7/U5JD+CmmETvHO9xfZK6riVvU7wSfolAaqzGR4ktZLRnMUEHUIR3nAASdB+vlfpRqT
         N3NiTbK3yrovEZyAIC+v8bXY1syz44SDqbGNctT4usYXS7XlSSW1n7OcyNhhxs6JiHpC
         kP/Q==
X-Gm-Message-State: AOJu0Yzct+6vi7xRJTdZV9BpDxLfBCj+4evK8gmFJydTG3brtngH4cQn
	j/n4AfCgQTHhKISYpzEbb20=
X-Google-Smtp-Source: AGHT+IHAZfTYnEfvM9N+zU+BwpEcd7b2hFqzj/wQ/s49uhp3ltuCY1GxTKUsvtdHQvGJMpOyeG5YFg==
X-Received: by 2002:a17:90b:4ace:b0:27f:f260:ceaf with SMTP id mh14-20020a17090b4ace00b0027ff260ceafmr679899pjb.10.1700607429547;
        Tue, 21 Nov 2023 14:57:09 -0800 (PST)
Received: from bangji.hsd1.ca.comcast.net ([2601:647:6780:42e0:7377:923f:1ff3:266d])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709026bcc00b001cc47c1c29csm8413189plt.84.2023.11.21.14.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 14:57:09 -0800 (PST)
Sender: Namhyung Kim <namhyung@gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: [PATCH 14/14] tools/perf: Update tools's copy of mips syscall table
Date: Tue, 21 Nov 2023 14:56:49 -0800
Message-ID: <20231121225650.390246-14-namhyung@kernel.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231121225650.390246-1-namhyung@kernel.org>
References: <20231121225650.390246-1-namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

The way these headers are used in perf are not restricted to just
including them to compile something.

There are sometimes used in scripts that convert defines into string
tables, etc, so some change may break one of these scripts, or new MSRs
may use some different #define pattern, etc.

E.g.:

  $ ls -1 tools/perf/trace/beauty/*.sh | head -5
  tools/perf/trace/beauty/arch_errno_names.sh
  tools/perf/trace/beauty/drm_ioctl.sh
  tools/perf/trace/beauty/fadvise.sh
  tools/perf/trace/beauty/fsconfig.sh
  tools/perf/trace/beauty/fsmount.sh
  $
  $ tools/perf/trace/beauty/fadvise.sh
  static const char *fadvise_advices[] = {
        [0] = "NORMAL",
        [1] = "RANDOM",
        [2] = "SEQUENTIAL",
        [3] = "WILLNEED",
        [4] = "DONTNEED",
        [5] = "NOREUSE",
  };
  $

The tools/perf/check-headers.sh script, part of the tools/ build
process, points out changes in the original files.

So its important not to touch the copies in tools/ when doing changes in
the original kernel headers, that will be done later, when
check-headers.sh inform about the change to the perf tools hackers.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
index 80be0e98ea0c..116ff501bf92 100644
--- a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
+++ b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
@@ -367,3 +367,7 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	n64	cachestat			sys_cachestat
 452	n64	fchmodat2			sys_fchmodat2
+453	n64	map_shadow_stack		sys_map_shadow_stack
+454	n64	futex_wake			sys_futex_wake
+455	n64	futex_wait			sys_futex_wait
+456	n64	futex_requeue			sys_futex_requeue
-- 
2.43.0.rc1.413.gea7ed67945-goog


