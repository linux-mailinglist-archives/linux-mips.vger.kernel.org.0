Return-Path: <linux-mips+bounces-7937-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35922A43415
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 05:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F413AAF13
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 04:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787EF1519A6;
	Tue, 25 Feb 2025 04:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0oJivfr0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9619FEEA9
	for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 04:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740457385; cv=none; b=Vj8H5oo/aVDB7sVQ2lNEjJW8L7cwxIRlhjmUcK31BhiITAiT24K4cYCWAvR5ceIkpAsHuv6g8u/QVRm2IksW2b+maPGS5AEaW8dZ/VKJmVqsHH2JLem4x/nKGnuZkY6oy+9qtuzIWox1NK6ei4wkdEsRbONrgX9+ScWX8lgDZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740457385; c=relaxed/simple;
	bh=DWPLoSRG/J0OapPShgl5xzWqS2ggoZTtWYPZ80ncuv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0zgIij11z+HDcyPTy0LEqgO5sgMQsUVZYIus7hYmD9QSN4khUxqEJ9aTVjcQfTKoCgYVBl+Z2/uoNRAdW1tMVxqk7bDbvL+RFW91qWVX/xZiKHrzNHmhT13TbkE9EM/e7NuKXTW/uBBZCV3Sgn+HZYYtAtZA4AQuh3fF+ubjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0oJivfr0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-221ac1f849fso60325ad.1
        for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 20:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740457382; x=1741062182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dnfDX8F9dAojLshWRzaoAh4tjNLeQ4DMe8LUFT9cv4=;
        b=0oJivfr0Fl8qyIK+6l6ViJMD6c9UTlDh6dq67fPHsunshde96kM2kLrb4dJZ3sxWrE
         5at3jIP+4GEpB1BCO4A5B/k1p4xEGB0UJTd+7PL+Jd1+Y+ldv1Zw3lwNuRz7lkBGQCQT
         zDX15cb42CUjOHUzvMrhO+9QWARZ0pAqH7/nuDbcevfg5OeWiy/PrxQfqmQ3dJNEcfAw
         0/dW+Ah0oS7Dl/GLYGHXMffeeym7c0Sq/Ciwq06DXWF0+4jdgEeXDvVi+Gwl1/72pgd4
         3Yrj92wjVL9RCLz0k4PEZcmeJnF6ry0Yx4zBHf/nQFxmpNf/cjBNVOvAjHsSK4o5DxBl
         Ifig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740457382; x=1741062182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dnfDX8F9dAojLshWRzaoAh4tjNLeQ4DMe8LUFT9cv4=;
        b=jfRvDY2cdg4k0bxz/CJxTmQPonIKjvljfTF5fI+Dtm3daONsrIPDSGNyEJAm7LcAhI
         mEMpzNrci64ZS0noUB9W7SHfSVi6FqQyFMezb//YNvweORVfUWYMQ/kP+3eTJ+Apbg7R
         uhivLAiozrszXiHqXsHjE7olR9p8yTIuq9BWkN/HccS+WsX5cAPzfqVT8mj5qUemaaik
         o1A4InNf6gpnJJHgqmFw2mjhnWt23xJkzWslZJGY9Tcac3v5G3wyNrvhlGT2lwoRGIJo
         I6kO+ohoLWp29LcIOW58z7UYwUG7S07qlE/cE1D+VyFYPLRB6HveM65R0NU1AogleVF3
         GpHA==
X-Forwarded-Encrypted: i=1; AJvYcCUPdpbLX3FmMg7KESjF04g3a4Yo7oCbGZezAyvqNMYQd1SR/1IEmZRl3qwEGPY/o5l4RP5Mm9v0AclT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9IUdOzh9vOKbZIS0FOTngePCiXxiz61mqgQclCuXqSgt5MPF7
	/zL8DjZcP6gtvdth3yFB7obFCfbAWeREjfdcdsnInipeEoxC/fho6+BzyzHgqMEm4lQUWCAt21p
	4VTSwCpIJkzfEGFqszboGznDau4KEefEOIrEW
X-Gm-Gg: ASbGncuxD1aPDFjDLOfHW39ArDJwiVYV27j5nRZ/cKLmlxOv6UxFurUbdZ0RZ50sy18
	GykcV1rUaNT934Ak9vy+I+BftKMTr/KttUupOIc5xkzNSiGj/uUwdGOJIad9YjtxxZo6B0B8zvp
	JuUWay2uGd
X-Google-Smtp-Source: AGHT+IGUMbhMl6/Gef1QJ3tKC8kP3/Phfar/m5jTSCYGPTt5wQk8z6TdzhgYsgrIeWo9sJfXlqvs8z66UVyg6GElTN4=
X-Received: by 2002:a17:902:db11:b0:216:4d90:47af with SMTP id
 d9443c01a7336-22307aad240mr1981295ad.29.1740457381632; Mon, 24 Feb 2025
 20:23:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219185657.280286-1-irogers@google.com> <Z702_CQ7nMx9fZQn@google.com>
In-Reply-To: <Z702_CQ7nMx9fZQn@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 24 Feb 2025 20:22:50 -0800
X-Gm-Features: AWEUYZlRSCuMXpRnG9e51tFeDQNCY7-ORGGSWmNrzSa339fgNrVuz98Z_FTpe8s
Message-ID: <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] perf: Support multiple system call tables in the build
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 7:20=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, Feb 19, 2025 at 10:56:49AM -0800, Ian Rogers wrote:
> > This work builds on the clean up of system call tables and removal of
> > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> >
> > The system call table in perf trace is used to map system call numbers
> > to names and vice versa. Prior to these changes, a single table
> > matching the perf binary's build was present. The table would be
> > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > perf, the names and numbers wouldn't match.
> >
> > Change the build so that a single system call file is built and the
> > potentially multiple tables are identifiable from the ELF machine type
> > of the process being examined. To determine the ELF machine type, the
> > executable's header is read from /proc/pid/exe with fallbacks to using
> > the perf's binary type when unknown.
>
> Hmm.. then this is limited to live mode and potentially detect wrong
> machine type if it reads an old data, right?
>
> Also IIUC fallback to the perf binary means it cannot use cross-machine
> table.  For example, it cannot process data from ARM64 on x86, no?  It
> seems it should use perf_env.arch.

The perf env arch is kind of horrid. On x86 it has the value x86 and
then there is an extra 64bit flag, who knows how x32 should be encoded
- but we barely support x32 as-is. I'd rather we added a new feature
for the e_machine/e_flags of the executable and worked with those, but
it is kind of weird with doing system wide mode. I didn't want to drag
that into this patch series anyway as there is already enough here.

> One more concern is BPF.  The BPF should know about the ABI of the
> current process so that it can augment the syscall arguments correctly.
> Currently it only checks the syscall number but it can be different on
> 32-bit and 64-bit.

That's right. This change is trying to clean up
tools/perf/util/syscalltbl.c and the perf trace usage. I didn't go as
far as making BPF programs pair system call number with e_machine and
e_flags, there is enough here and the behavior after these patches
matches the behavior before - that is to assume the system call ABI
matches that of the perf binary.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> >
> > Remove some runtime types used by the system call tables and make
> > equivalents generated at build time.
> >
> > v3: Add Charlie's reviewed-by tags. Incorporate feedback from Arnd
> >     Bergmann <arnd@arndb.de> on additional optional column and MIPS
> >     system call numbering. Rebase past Namhyung's global system call
> >     statistics and add comments that they don't yet support an
> >     e_machine other than EM_HOST.
> >
> > v2: Change the 1 element cache for the last table as suggested by
> >     Howard Chu, add Howard's reviewed-by tags.
> >     Add a comment and apology to Charlie for not doing better in
> >     guiding:
> >     https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1=
-5b304e408e11@rivosinc.com/
> >     After discussion on v1 and he agreed this patch series would be
> >     the better direction.
> >
> > Ian Rogers (8):
> >   perf syscalltble: Remove syscall_table.h
> >   perf trace: Reorganize syscalls
> >   perf syscalltbl: Remove struct syscalltbl
> >   perf thread: Add support for reading the e_machine type for a thread
> >   perf trace beauty: Add syscalltbl.sh generating all system call table=
s
> >   perf syscalltbl: Use lookup table containing multiple architectures
> >   perf build: Remove Makefile.syscalls
> >   perf syscalltbl: Mask off ABI type for MIPS system calls
> >
> >  tools/perf/Makefile.perf                      |  10 +-
> >  tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
> >  .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
> >  tools/perf/arch/alpha/include/syscall_table.h |   2 -
> >  tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
> >  .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
> >  tools/perf/arch/arc/include/syscall_table.h   |   2 -
> >  tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
> >  .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
> >  tools/perf/arch/arm/include/syscall_table.h   |   2 -
> >  tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
> >  .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
> >  tools/perf/arch/arm64/include/syscall_table.h |   8 -
> >  tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
> >  .../csky/entry/syscalls/Makefile.syscalls     |   3 -
> >  tools/perf/arch/csky/include/syscall_table.h  |   2 -
> >  .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
> >  .../entry/syscalls/Makefile.syscalls          |   3 -
> >  .../arch/loongarch/include/syscall_table.h    |   2 -
> >  tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
> >  .../mips/entry/syscalls/Makefile.syscalls     |   5 -
> >  tools/perf/arch/mips/include/syscall_table.h  |   2 -
> >  tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
> >  .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
> >  .../perf/arch/parisc/include/syscall_table.h  |   8 -
> >  tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
> >  .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
> >  .../perf/arch/powerpc/include/syscall_table.h |   8 -
> >  tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
> >  .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
> >  tools/perf/arch/riscv/include/syscall_table.h |   8 -
> >  tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
> >  .../s390/entry/syscalls/Makefile.syscalls     |   5 -
> >  tools/perf/arch/s390/include/syscall_table.h  |   2 -
> >  tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
> >  .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
> >  tools/perf/arch/sh/include/syscall_table.h    |   2 -
> >  tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
> >  .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
> >  tools/perf/arch/sparc/include/syscall_table.h |   8 -
> >  tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
> >  .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
> >  tools/perf/arch/x86/include/syscall_table.h   |   8 -
> >  tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
> >  .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
> >  .../perf/arch/xtensa/include/syscall_table.h  |   2 -
> >  tools/perf/builtin-trace.c                    | 290 +++++++++++-------
> >  tools/perf/scripts/Makefile.syscalls          |  61 ----
> >  tools/perf/scripts/syscalltbl.sh              |  86 ------
> >  tools/perf/trace/beauty/syscalltbl.sh         | 274 +++++++++++++++++
> >  tools/perf/util/syscalltbl.c                  | 148 ++++-----
> >  tools/perf/util/syscalltbl.h                  |  22 +-
> >  tools/perf/util/thread.c                      |  50 +++
> >  tools/perf/util/thread.h                      |  14 +-
> >  54 files changed, 616 insertions(+), 509 deletions(-)
> >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscall=
s
> >  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscall=
s
> >  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscal=
ls
> >  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.s=
yscalls
> >  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscal=
ls
> >  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.sysc=
alls
> >  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.sys=
calls
> >  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscal=
ls
> >  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
> >  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscall=
s
> >  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.sysc=
alls
> >  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
> >  delete mode 100644 tools/perf/scripts/Makefile.syscalls
> >  delete mode 100755 tools/perf/scripts/syscalltbl.sh
> >  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> >
> > --
> > 2.48.1.601.g30ceb7b040-goog
> >

