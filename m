Return-Path: <linux-mips+bounces-7998-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFBAA46FA9
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 00:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 627F116CDCC
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 23:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1602427005D;
	Wed, 26 Feb 2025 23:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccLwNz0J"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB65327004B;
	Wed, 26 Feb 2025 23:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613651; cv=none; b=HCgL8vw+V7WA33uSGO7uXifq6fSYx65l9jsjKstGj4RptrbzufZsJK/tCgG9nRX4P1qvZ5PolBV20LgNeU2SXhOrNC9lAjyXmTKk/TWh3NfC1nxtbjq4tbASIh/W0Y7+PT43BQ6uOBBl7S6fMSeU7/dvbSKHT6uv3EYQWmrvAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613651; c=relaxed/simple;
	bh=9gh38cLMFslMKg9mxXqa/8TIiaIyScOmY7iBmk/7J+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ig+xk2/nJmXZtjREfLl5PW9fyfKDSecLP4fEdkp2W2howbunmUruwT3tXizUzK+s40d8ekBP8L6cpwDoghLHxmYER7wX9r5hgQQLcdosQbayev2s1WlZ4dneYGpasjYKytkuZAp8yEvGMGyN1wunlnO1IKFgNBgDySeOxQE0WdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccLwNz0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D2CC4CED6;
	Wed, 26 Feb 2025 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740613650;
	bh=9gh38cLMFslMKg9mxXqa/8TIiaIyScOmY7iBmk/7J+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccLwNz0JqSL2cY/6ZgKbo3RBuAAjgne4TJXxfOD7rihL/L9trPi1YF8vosAn0jhY0
	 PXxM8QfCKDAAl4VBg4GmwRKOnFf/mTkfVTC/oLVg+2nEAqsisSf828LAX0nMZcaRiM
	 eP9wpZcxP2SoknA3ClZbZvCNLQZrHJdpV2CD3U4Ro7URpToeVFR9/N3FcZKAJOMvny
	 oot69foyQLUf3qYNRMBiFdJT6K2Fxa2u409gSm+pGSSA9Gr/sJ7NoeiFbmjwswHcjr
	 EKKcuhXwmQlbrGhNbVBviIFmfAbJ52s/Kqj+Efh6SoifMX47/veK/or6DFrSigNlpy
	 lhKE8RMM7deXQ==
Date: Wed, 26 Feb 2025 15:47:27 -0800
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
Message-ID: <Z7-oD7ZZmvwla351@google.com>
References: <20250219185657.280286-1-irogers@google.com>
 <Z70zejQJvppH8Sfh@google.com>
 <CAP-5=fU8Xw-aeCGUOFo8Zph=xagHv43jo+BkXY5vUai5tUsmDA@mail.gmail.com>
 <Z71X5wXm1bQ7RM4m@google.com>
 <Z76A3sU46Jxpc2s5@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z76A3sU46Jxpc2s5@google.com>

On Tue, Feb 25, 2025 at 06:47:58PM -0800, Namhyung Kim wrote:
> On Mon, Feb 24, 2025 at 09:40:55PM -0800, Namhyung Kim wrote:
> > On Mon, Feb 24, 2025 at 08:37:01PM -0800, Ian Rogers wrote:
> > > On Mon, Feb 24, 2025 at 7:05 PM Namhyung Kim <namhyung@kernel.org> wrote:
> > > >
> > > > On Wed, Feb 19, 2025 at 10:56:49AM -0800, Ian Rogers wrote:
> > > > > This work builds on the clean up of system call tables and removal of
> > > > > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> > > > >
> > > > > The system call table in perf trace is used to map system call numbers
> > > > > to names and vice versa. Prior to these changes, a single table
> > > > > matching the perf binary's build was present. The table would be
> > > > > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > > > > perf, the names and numbers wouldn't match.
> > > > >
> > > > > Change the build so that a single system call file is built and the
> > > > > potentially multiple tables are identifiable from the ELF machine type
> > > > > of the process being examined. To determine the ELF machine type, the
> > > > > executable's header is read from /proc/pid/exe with fallbacks to using
> > > > > the perf's binary type when unknown.
> > > > >
> > > > > Remove some runtime types used by the system call tables and make
> > > > > equivalents generated at build time.
> > > >
> > > > So I tested this with a test program.
> > > >
> > > >   $ cat a.c
> > > >   #include <stdio.h>
> > > >   int main(void)
> > > >   {
> > > >         char buf[4096];
> > > >         FILE *fp = fopen("a.c", "r");
> > > >         size_t len;
> > > >
> > > >         len = fread(buf, sizeof(buf), 1, fp);
> > > >         fwrite(buf, 1, len, stdout);
> > > >         fflush(stdout);
> > > >         fclose(fp);
> > > >         return 0;
> > > >   }
> > > >
> > > >   $ gcc -o a64.out a.c
> > > >   $ gcc -o a32.out -m32 a.c
> > > >
> > > >   $ ./perf version
> > > >   perf version 6.14.rc1.ge002a64f6188
> > > >
> > > >   $ git show
> > > >   commit e002a64f61882626992dd6513c0db3711c06fea7 (HEAD -> perf-check)
> > > >   Author: Ian Rogers <irogers@google.com>
> > > >   Date:   Wed Feb 19 10:56:57 2025 -0800
> > > >
> > > >       perf syscalltbl: Mask off ABI type for MIPS system calls
> > > >
> > > >       Arnd Bergmann described that MIPS system calls don't necessarily start
> > > >       from 0 as an ABI prefix is applied:
> > > >       https://lore.kernel.org/lkml/8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com/
> > > >       When decoding the "id" (aka system call number) for MIPS ignore values
> > > >       greater-than 1000.
> > > >
> > > >       Signed-off-by: Ian Rogers <irogers@google.com>
> > > >
> > > > It works well with 64bit.
> > > >
> > > >   $ sudo ./perf trace ./a64.out |& tail
> > > >        0.266 ( 0.007 ms): a64.out/858681 munmap(addr: 0x7f392723a000, len: 109058)                             = 0
> > > >        0.286 ( 0.002 ms): a64.out/858681 getrandom(ubuf: 0x7f3927232178, len: 8, flags: NONBLOCK)              = 8
> > > >        0.289 ( 0.001 ms): a64.out/858681 brk()                                                                 = 0x56419ecf7000
> > > >        0.291 ( 0.002 ms): a64.out/858681 brk(brk: 0x56419ed18000)                                              = 0x56419ed18000
> > > >        0.299 ( 0.009 ms): a64.out/858681 openat(dfd: CWD, filename: "a.c")                                     = 3
> > > >        0.312 ( 0.001 ms): a64.out/858681 fstat(fd: 3, statbuf: 0x7ffdfadf1eb0)                                 = 0
> > > >        0.315 ( 0.002 ms): a64.out/858681 read(fd: 3, buf: 0x7ffdfadf2030, count: 4096)                         = 211
> > > >        0.318 ( 0.009 ms): a64.out/858681 read(fd: 3, buf: 0x56419ecf7480, count: 4096)                         = 0
> > > >        0.330 ( 0.001 ms): a64.out/858681 close(fd: 3)                                                          = 0
> > > >        0.338 (         ): a64.out/858681 exit_group()                                                          = ?
> > > >
> > > > But 32bit is still broken and use 64bit syscall table wrongly.
> > > >
> > > >   $ file a32.out
> > > >   a32.out: ELF 32-bit LSB pie executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2,
> > > >   BuildID[sha1]=6eea873c939012e6c715e8f030261642bf61cb4e, for GNU/Linux 3.2.0, not stripped
> > > >
> > > >   $ sudo ./perf trace ./a32.out |& tail
> > > >        0.296 ( 0.001 ms): a32.out/858699 getxattr(pathname: "", name: "������", value: 0xf7f6ce14, size: 1)  = 0
> > > >        0.305 ( 0.007 ms): a32.out/858699 fchmod(fd: -134774784, mode: IFLNK|ISUID|ISVTX|IWOTH|0x10000)         = 0
> > > >        0.333 ( 0.001 ms): a32.out/858699 recvfrom(size: 4160146964, flags: RST|0x20000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) = 1481879552
> > > >        0.335 ( 0.004 ms): a32.out/858699 recvfrom(fd: 1482014720, ubuf: 0xf7f71278, size: 4160146964, flags: NOSIGNAL|MORE|WAITFORONE|BATCH|SPLICE_PAGES|CMSG_CLOEXEC|0x10500000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) = 1482014720
> > > >        0.355 ( 0.002 ms): a32.out/858699 recvfrom(fd: 1482018816, ubuf: 0x5855d000, size: 4160146964, flags: RST|NOSIGNAL|MORE|WAITFORONE|BATCH|SPLICE_PAGES|CMSG_CLOEXEC|0x10500000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) = 1482018816
> > > >        0.362 ( 0.010 ms): a32.out/858699 preadv(fd: 4294967196, vec: (struct iovec){.iov_base = (void *)0x1b01000000632e62,.iov_len = (__kernel_size_t)1125899909479171,}, pos_h: 4160146964) = 3
> > > >        0.385 ( 0.002 ms): a32.out/858699 close(fd: 3)                                                          = 211
> > > >        0.388 ( 0.001 ms): a32.out/858699 close(fd: 3)                                                          = 0
> > > >        0.393 ( 0.002 ms): a32.out/858699 lstat(filename: "")                                                   = 0
> > > >        0.396 ( 0.004 ms): a32.out/858699 recvfrom(fd: 1482014720, size: 4160146964, flags: NOSIGNAL|MORE|WAITFORONE|BATCH|SPLICE_PAGES|CMSG_CLOEXEC|0x10500000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) = 1482014720
> > > >
> > > > The last 5 should be openat, read, read, close and brk(?).
> > > 
> > > That's strange as nearly the same test works for me:
> > > ```
> > > $ git show
> > > commit 7920020237af8138f7be1a21be9a2918a71ddc5e (HEAD -> ptn-syscalltbl)
> > > Author: Ian Rogers <irogers@google.com>
> > > Date:   Fri Jan 31 21:34:07 2025 -0800
> > > 
> > >    perf syscalltbl: Mask off ABI type for MIPS system calls
> > > 
> > >    Arnd Bergmann described that MIPS system calls don't necessarily start
> > >    from 0 as an ABI prefix is applied:
> > >    https://lore.kernel.org/lkml/8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com/
> > >    When decoding the "id" (aka system call number) for MIPS ignore values
> > >    greater-than 1000.
> > > 
> > >    Signed-off-by: Ian Rogers <irogers@google.com>
> > > ..
> > > $ file a.out
> > > a.out: ELF 32-bit LSB pie executable, Intel 80386, version 1 (SYSV),
> > > dynamically linked, interpreter /lib/ld-linux.so.2,
> > > BuildID[sha1]=3fcd28f85a27a3108941661a91dbc675c06868f9, for GNU/Linux
> > > 3.2.0, not stripped
> > > $ sudo /tmp/perf/perf trace ./a.out
> > > ...
> > >          ? (         ): a.out/218604  ... [continued]: execve())
> > >                                     = 0
> > >      0.067 ( 0.003 ms): a.out/218604 brk()
> > >                                     = 0x5749e000
> > >      0.154 ( 0.007 ms): a.out/218604 access(filename: 0xf7fc7f28,
> > > mode: R)                                 = -1 ENOENT (No such file or
> > > directory)
> > >      0.168 ( 0.023 ms): a.out/218604 openat(dfd: CWD, filename:
> > > 0xf7fc44c3, flags: RDONLY|CLOEXEC|LARGEFILE) = 3
> > >      0.193 ( 0.006 ms): a.out/218604 statx(dfd:
> > > 3</proc/218604/status>, filename: 0xf7fc510a, flags:
> > > NO_AUTOMOUNT|EMPTY_PATH, mask:
> > > TYPE|MODE|NLINK|UID|GID|ATIME|MTIME|CTIME|INO|SIZE|BLOCKS, buffer:
> > > 0xffaa6b88) = 0
> > >      0.212 ( 0.002 ms): a.out/218604 close(fd: 3</proc/218604/status>)
> > >                                     = 0
> > >      0.233 ( 0.019 ms): a.out/218604 openat(dfd: CWD, filename:
> > > 0xf7f973e0, flags: RDONLY|CLOEXEC|LARGEFILE) = 3
> > >      0.255 ( 0.004 ms): a.out/218604 read(fd: 3</proc/218604/status>,
> > > buf: 0xffaa6df0, count: 512)         = 512
> > >      0.262 ( 0.003 ms): a.out/218604 statx(dfd:
> > > 3</proc/218604/status>, filename: 0xf7fc510a, flags:
> > > NO_AUTOMOUNT|EMPTY_PATH, mask:
> > > TYPE|MODE|NLINK|UID|GID|ATIME|MTIME|CTIME|INO|SIZE|BLOCKS, buffer:
> > > 0xffaa6b38) = 0
> > >      0.347 ( 0.002 ms): a.out/218604 close(fd: 3</proc/218604/status>)
> > >                                     = 0
> > >      0.372 ( 0.002 ms): a.out/218604 set_tid_address(tidptr:
> > > 0xf7f98528)                                   = 218604 (a.out)
> > >      0.376 ( 0.002 ms): a.out/218604 set_robust_list(head: 0xf7f9852c,
> > > len: 12)                            =
> > >      0.381 ( 0.002 ms): a.out/218604 rseq(rseq: 0xf7f98960, rseq_len:
> > > 32, sig: 1392848979)                 =
> > >      0.469 ( 0.010 ms): a.out/218604 mprotect(start: 0xf7f6e000, len:
> > > 8192, prot: READ)                    = 0
> > >      0.489 ( 0.007 ms): a.out/218604 mprotect(start: 0x5661a000, len:
> > > 4096, prot: READ)                    = 0
> > >      0.503 ( 0.007 ms): a.out/218604 mprotect(start: 0xf7fd0000, len:
> > > 8192, prot: READ)                    = 0
> > >      0.550 ( 0.015 ms): a.out/218604 munmap(addr: 0xf7f7b000, len:
> > > 111198)                                 = 0
> > >      0.589 ( 0.035 ms): a.out/218604 openat(dfd: CWD, filename:
> > > 0x56619008)                                = 3
> > >      0.627 ( 0.024 ms): a.out/218604 read(fd: 3</proc/218604/status>,
> > > buf: 0xffaa68fc, count: 4096)        = 1437
> > >      0.654 ( 0.090 ms): a.out/218604 write(fd: 1</dev/pts/3>, buf: ,
> > > count: 1437)                          = 1437
> > >      0.766 (1000.164 ms): a.out/218604 clock_nanosleep(rqtp:
> > > 0xffaa6824, rmtp: 0xffaa681c)                   = 0
> > >   1000.942 (         ): a.out/218604 exit_group()
> > > $ file /tmp/perf/perf
> > > /tmp/perf/perf: ELF 64-bit LSB pie executable, x86-64, version 1
> > > (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2,
> > > BuildID[sha1]=60b07f65d2559a7193b2d1d36cfa00054dfbd076, for GNU/Linux
> > > 3.2.0, with debug_info, not stripped
> > > ```
> > > Perhaps your a.out binary was built as an x32 one?
> > > Looking under the covers with gdb:
> > > ```
> > > $ sudo gdb --args /tmp/perf/perf trace ./a.out
> > > GNU gdb (Debian 15.1-1) 15.1
> > > ...
> > > Reading symbols from /tmp/perf/perf...
> > > (gdb) b syscalltbl__name
> > > Breakpoint 1 at 0x23a51b: file util/syscalltbl.c, line 47.
> > > (gdb) r
> > > ...
> > > [Detaching after vfork from child process 218826]
> > > 
> > > Breakpoint 1, syscalltbl__name (e_machine=3, id=11) at util/syscalltbl.c:47
> > > 47              const struct syscalltbl *table = find_table(e_machine);
> > > ```
> > > So the e_machine is 3 which corresponds to EM_386.
> > > 
> > > I've not fixed every use of syscalltbl but I believe this one is working.
> > 
> > Strange.  I'm seeing 62 (x86_64).
> > 
> >   $ sudo gdb -q --args ./perf trace ./a32.out
> >   Reading symbols from ./perf...
> >   (gdb) b syscalltbl__name
> >   Breakpoint 1 at 0x27998b: file util/syscalltbl.c, line 46.
> >   (gdb) r
> >   Starting program: /home/namhyung/tmp/perf trace ./a32.out
> >   [Thread debugging using libthread_db enabled]
> >   Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
> >   [Detaching after fork from child process 886888]
> >   
> >   Breakpoint 1, syscalltbl__name (e_machine=62, id=156) at util/syscalltbl.c:46
> >   46	{
> > 
> > But the binary is i386.
> > 
> >   $ file a32.out
> >   a32.out: ELF 32-bit LSB pie executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2,
> >   BuildID[sha1]=6eea873c939012e6c715e8f030261642bf61cb4e, for GNU/Linux 3.2.0, not stripped
> >   
> >   $ readelf -h a32.out
> >   ELF Header:
> >     Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00 
> >     Class:                             ELF32
> >     Data:                              2's complement, little endian
> >     Version:                           1 (current)
> >     OS/ABI:                            UNIX - System V
> >     ABI Version:                       0
> >     Type:                              DYN (Position-Independent Executable file)
> >     Machine:                           Intel 80386
> >     Version:                           0x1
> >     Entry point address:               0x10a0
> >     Start of program headers:          52 (bytes into file)
> >     Start of section headers:          13932 (bytes into file)
> >     Flags:                             0x0
> >     Size of this header:               52 (bytes)
> >     Size of program headers:           32 (bytes)
> >     Number of program headers:         11
> >     Size of section headers:           40 (bytes)
> >     Number of section headers:         30
> >     Section header string table index: 29
> > 
> >   $ hexdump -C -n 32 a32.out
> >   00000000  7f 45 4c 46 01 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
> >   00000010  03 00 03 00 01 00 00 00  a0 10 00 00 34 00 00 00  |............4...|
> >   00000020  ----- -----
> >               ^     ^
> > 	      |     |
> > 	   ET_DYN   |
> > 	          EM_386
> > 
> 
> I found it failed to open /proc/PID/exe for some reason.  It failed with
> ENOENT but I've confirmed there's /proc/PID directory.  Strange...

It sometimes succeeded and showed the correct syscall names. :(

I don't know what's the problem on my machine.  But I think this is a
pre-exisiting problem and this patch improves it.

Thanks,
Namhyung


