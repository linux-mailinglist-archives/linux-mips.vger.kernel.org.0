Return-Path: <linux-mips+bounces-7928-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A757A4335C
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 04:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC19A3B0ADB
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 03:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D5713632B;
	Tue, 25 Feb 2025 03:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFq52g4i"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C4ABE49;
	Tue, 25 Feb 2025 03:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740452733; cv=none; b=n6hV/AesuF6MdnU44afh/nVq3vc8ZGfE82CDich6T29VL/bfAJd5BTQSRK7IWAF3+zyEdCgs3ALktyIbNq2k2O81+izZSM7FtbyYi/ClMYF7J8OXhsCr5blOdqfbJECbfxjD/Jt36ikagGi36lV8fP+uRdNK3R4KSEfo0IDBtPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740452733; c=relaxed/simple;
	bh=nFx/BLGn/+pJuDUW967qxmpUkfbqlrvIzj+c3zapthY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtUUdsRGwCLGyZNfvVYKrqXNg/RXJSOCCGGD8JwNDM3tfsmqpybWz/s8+OLVrGL1dagmfph+RA9raet/qo/QXMTbWgclT8+paJqGvO57aAfzHVmW2UW/zZE7vm3T/kAu/BPxcXvy5ZoFRAH355WVcg6q31otZA60U/SHRM26Kno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFq52g4i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE96C4CED6;
	Tue, 25 Feb 2025 03:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740452733;
	bh=nFx/BLGn/+pJuDUW967qxmpUkfbqlrvIzj+c3zapthY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFq52g4iUS/ifuZ/pZNs3Myd7fKkY09PBChZvxJSRnCNqSBslwtQV506eTggMcGox
	 MSrjujs40NZuys2LMeOU7wlm6hDKWB6fhoPClt5gFTeOtPPtXwr8LDHKPFxDEVYD48
	 0WSMfmX8EmWI5D2II8vKrkk4Mlb6c6qQlv1ramQwFOr50uPUVffUozxgNtMllH65gt
	 SkSBW2oeDnPDMhasRGjaXziHAlkx04VObdG434sETY4hIii4AhS7TL8dJkynLzmnI3
	 n9UDJ7qiZ0V1k29Cv1zCveq7mGoY7vXEH421GBRSYr1C2m9nBo8SdMwZenfM1S7Exm
	 ZSrdKr20a8cVA==
Date: Mon, 24 Feb 2025 19:05:30 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/8] perf: Support multiple system call tables in the
 build
Message-ID: <Z70zejQJvppH8Sfh@google.com>
References: <20250219185657.280286-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219185657.280286-1-irogers@google.com>

On Wed, Feb 19, 2025 at 10:56:49AM -0800, Ian Rogers wrote:
> This work builds on the clean up of system call tables and removal of
> libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> 
> The system call table in perf trace is used to map system call numbers
> to names and vice versa. Prior to these changes, a single table
> matching the perf binary's build was present. The table would be
> incorrect if tracing say a 32-bit binary from a 64-bit version of
> perf, the names and numbers wouldn't match.
> 
> Change the build so that a single system call file is built and the
> potentially multiple tables are identifiable from the ELF machine type
> of the process being examined. To determine the ELF machine type, the
> executable's header is read from /proc/pid/exe with fallbacks to using
> the perf's binary type when unknown.
> 
> Remove some runtime types used by the system call tables and make
> equivalents generated at build time.

So I tested this with a test program.

  $ cat a.c
  #include <stdio.h>
  int main(void)
  {
  	char buf[4096];
  	FILE *fp = fopen("a.c", "r");
  	size_t len;
  
  	len = fread(buf, sizeof(buf), 1, fp);
  	fwrite(buf, 1, len, stdout);
  	fflush(stdout);
  	fclose(fp);
  	return 0;
  }
  
  $ gcc -o a64.out a.c
  $ gcc -o a32.out -m32 a.c
  
  $ ./perf version
  perf version 6.14.rc1.ge002a64f6188
  
  $ git show
  commit e002a64f61882626992dd6513c0db3711c06fea7 (HEAD -> perf-check)
  Author: Ian Rogers <irogers@google.com>
  Date:   Wed Feb 19 10:56:57 2025 -0800
  
      perf syscalltbl: Mask off ABI type for MIPS system calls
      
      Arnd Bergmann described that MIPS system calls don't necessarily start
      from 0 as an ABI prefix is applied:
      https://lore.kernel.org/lkml/8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com/
      When decoding the "id" (aka system call number) for MIPS ignore values
      greater-than 1000.
      
      Signed-off-by: Ian Rogers <irogers@google.com>

It works well with 64bit.

  $ sudo ./perf trace ./a64.out |& tail
       0.266 ( 0.007 ms): a64.out/858681 munmap(addr: 0x7f392723a000, len: 109058)                             = 0
       0.286 ( 0.002 ms): a64.out/858681 getrandom(ubuf: 0x7f3927232178, len: 8, flags: NONBLOCK)              = 8
       0.289 ( 0.001 ms): a64.out/858681 brk()                                                                 = 0x56419ecf7000
       0.291 ( 0.002 ms): a64.out/858681 brk(brk: 0x56419ed18000)                                              = 0x56419ed18000
       0.299 ( 0.009 ms): a64.out/858681 openat(dfd: CWD, filename: "a.c")                                     = 3
       0.312 ( 0.001 ms): a64.out/858681 fstat(fd: 3, statbuf: 0x7ffdfadf1eb0)                                 = 0
       0.315 ( 0.002 ms): a64.out/858681 read(fd: 3, buf: 0x7ffdfadf2030, count: 4096)                         = 211
       0.318 ( 0.009 ms): a64.out/858681 read(fd: 3, buf: 0x56419ecf7480, count: 4096)                         = 0
       0.330 ( 0.001 ms): a64.out/858681 close(fd: 3)                                                          = 0
       0.338 (         ): a64.out/858681 exit_group()                                                          = ?

But 32bit is still broken and use 64bit syscall table wrongly.

  $ file a32.out
  a32.out: ELF 32-bit LSB pie executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2,
  BuildID[sha1]=6eea873c939012e6c715e8f030261642bf61cb4e, for GNU/Linux 3.2.0, not stripped

  $ sudo ./perf trace ./a32.out |& tail
       0.296 ( 0.001 ms): a32.out/858699 getxattr(pathname: "", name: "������", value: 0xf7f6ce14, size: 1)  = 0
       0.305 ( 0.007 ms): a32.out/858699 fchmod(fd: -134774784, mode: IFLNK|ISUID|ISVTX|IWOTH|0x10000)         = 0
       0.333 ( 0.001 ms): a32.out/858699 recvfrom(size: 4160146964, flags: RST|0x20000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) = 1481879552
       0.335 ( 0.004 ms): a32.out/858699 recvfrom(fd: 1482014720, ubuf: 0xf7f71278, size: 4160146964, flags: NOSIGNAL|MORE|WAITFORONE|BATCH|SPLICE_PAGES|CMSG_CLOEXEC|0x10500000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) = 1482014720
       0.355 ( 0.002 ms): a32.out/858699 recvfrom(fd: 1482018816, ubuf: 0x5855d000, size: 4160146964, flags: RST|NOSIGNAL|MORE|WAITFORONE|BATCH|SPLICE_PAGES|CMSG_CLOEXEC|0x10500000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) = 1482018816
       0.362 ( 0.010 ms): a32.out/858699 preadv(fd: 4294967196, vec: (struct iovec){.iov_base = (void *)0x1b01000000632e62,.iov_len = (__kernel_size_t)1125899909479171,}, pos_h: 4160146964) = 3
       0.385 ( 0.002 ms): a32.out/858699 close(fd: 3)                                                          = 211
       0.388 ( 0.001 ms): a32.out/858699 close(fd: 3)                                                          = 0
       0.393 ( 0.002 ms): a32.out/858699 lstat(filename: "")                                                   = 0
       0.396 ( 0.004 ms): a32.out/858699 recvfrom(fd: 1482014720, size: 4160146964, flags: NOSIGNAL|MORE|WAITFORONE|BATCH|SPLICE_PAGES|CMSG_CLOEXEC|0x10500000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) = 1482014720

The last 5 should be openat, read, read, close and brk(?).

Thanks,
Namhyung

> 
> v3: Add Charlie's reviewed-by tags. Incorporate feedback from Arnd
>     Bergmann <arnd@arndb.de> on additional optional column and MIPS
>     system call numbering. Rebase past Namhyung's global system call
>     statistics and add comments that they don't yet support an
>     e_machine other than EM_HOST.
> 
> v2: Change the 1 element cache for the last table as suggested by
>     Howard Chu, add Howard's reviewed-by tags.
>     Add a comment and apology to Charlie for not doing better in
>     guiding:
>     https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1-5b304e408e11@rivosinc.com/
>     After discussion on v1 and he agreed this patch series would be
>     the better direction.
> 
> Ian Rogers (8):
>   perf syscalltble: Remove syscall_table.h
>   perf trace: Reorganize syscalls
>   perf syscalltbl: Remove struct syscalltbl
>   perf thread: Add support for reading the e_machine type for a thread
>   perf trace beauty: Add syscalltbl.sh generating all system call tables
>   perf syscalltbl: Use lookup table containing multiple architectures
>   perf build: Remove Makefile.syscalls
>   perf syscalltbl: Mask off ABI type for MIPS system calls
> 
>  tools/perf/Makefile.perf                      |  10 +-
>  tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
>  .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
>  tools/perf/arch/alpha/include/syscall_table.h |   2 -
>  tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
>  .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
>  tools/perf/arch/arc/include/syscall_table.h   |   2 -
>  tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
>  .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
>  tools/perf/arch/arm/include/syscall_table.h   |   2 -
>  tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
>  .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
>  tools/perf/arch/arm64/include/syscall_table.h |   8 -
>  tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
>  .../csky/entry/syscalls/Makefile.syscalls     |   3 -
>  tools/perf/arch/csky/include/syscall_table.h  |   2 -
>  .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
>  .../entry/syscalls/Makefile.syscalls          |   3 -
>  .../arch/loongarch/include/syscall_table.h    |   2 -
>  tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
>  .../mips/entry/syscalls/Makefile.syscalls     |   5 -
>  tools/perf/arch/mips/include/syscall_table.h  |   2 -
>  tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
>  .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
>  .../perf/arch/parisc/include/syscall_table.h  |   8 -
>  tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
>  .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
>  .../perf/arch/powerpc/include/syscall_table.h |   8 -
>  tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
>  .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
>  tools/perf/arch/riscv/include/syscall_table.h |   8 -
>  tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
>  .../s390/entry/syscalls/Makefile.syscalls     |   5 -
>  tools/perf/arch/s390/include/syscall_table.h  |   2 -
>  tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
>  .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
>  tools/perf/arch/sh/include/syscall_table.h    |   2 -
>  tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
>  .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
>  tools/perf/arch/sparc/include/syscall_table.h |   8 -
>  tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
>  .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
>  tools/perf/arch/x86/include/syscall_table.h   |   8 -
>  tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
>  .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
>  .../perf/arch/xtensa/include/syscall_table.h  |   2 -
>  tools/perf/builtin-trace.c                    | 290 +++++++++++-------
>  tools/perf/scripts/Makefile.syscalls          |  61 ----
>  tools/perf/scripts/syscalltbl.sh              |  86 ------
>  tools/perf/trace/beauty/syscalltbl.sh         | 274 +++++++++++++++++
>  tools/perf/util/syscalltbl.c                  | 148 ++++-----
>  tools/perf/util/syscalltbl.h                  |  22 +-
>  tools/perf/util/thread.c                      |  50 +++
>  tools/perf/util/thread.h                      |  14 +-
>  54 files changed, 616 insertions(+), 509 deletions(-)
>  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
>  delete mode 100644 tools/perf/scripts/Makefile.syscalls
>  delete mode 100755 tools/perf/scripts/syscalltbl.sh
>  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> 
> -- 
> 2.48.1.601.g30ceb7b040-goog
> 

