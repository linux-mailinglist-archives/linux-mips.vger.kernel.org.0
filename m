Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC713325034
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 14:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhBYNNX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Feb 2021 08:13:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:57004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229491AbhBYNNW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Feb 2021 08:13:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 714EB64EBD;
        Thu, 25 Feb 2021 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614258761;
        bh=BpSfWI+sS2KyedBpB9dkCMLN3LXflEtQJ1HWiNwx3+4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H2nKdNbU1ga2DzRUYrC4adhWBcpKjAK6H3GGjvVn0iOuq9Ezi6UAHzqWHzz6w9jlM
         rPEkFKXH49fEggek4pmnYXGSOVlVCo2WhOx+bAJsWBFZG2bejqnDDYZtO3vUtK+Mv/
         L88Ei8Go9G2JkrvXPQC7Ty/Bdp32+gfdR4O/r7rX6dPS6TvbwZR9dRR0itIcY38rhG
         MXFHxoE7CZbL2ykQjvGzP7xjMkN3DUGut9JkLJyE5Y7p6DOZ08aSUde/GD3hokK7yC
         rjHy20la6MA0JrypIIuO/Hml7a6LjtJ12A03G9Dxzzzmj2eBJ6ZImWxZSWFgv/3yJt
         8E1XuQ/huUM6w==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 17CAE40CD9; Thu, 25 Feb 2021 10:12:39 -0300 (-03)
Date:   Thu, 25 Feb 2021 10:12:39 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: Re: [PATCH v2 0/3] Add some perf support for mips
Message-ID: <YDeiR66J0ohidVSq@kernel.org>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
 <1d3c4abd-4b14-90e3-6528-457a8248cb52@loongson.cn>
 <YDZRxz1yRwgWc47F@kernel.org>
 <YDec9LIikZ9EVufH@kernel.org>
 <YDehtDi4q+lFO2l6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YDehtDi4q+lFO2l6@kernel.org>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Thu, Feb 25, 2021 at 10:10:12AM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Thu, Feb 25, 2021 at 09:49:56AM -0300, Arnaldo Carvalho de Melo escrev=
eu:
> > Em Wed, Feb 24, 2021 at 10:16:55AM -0300, Arnaldo Carvalho de Melo escr=
eveu:
> > > Em Mon, Feb 22, 2021 at 02:43:39PM +0800, Tiezhu Yang escreveu:
> > > > On 02/04/2021 11:35 AM, Tiezhu Yang wrote:
> > > > > v2: add R26 and R27 to the enum perf_event_mips_regs in patch #1
> > > > >=20
> > > > > Tiezhu Yang (3):
> > > > >    MIPS: kernel: Support extracting off-line stack traces from us=
er-space
> > > > >      with perf
> > > > >    perf tools: Support mips unwinding and dwarf-regs
> > > > >    perf tools: Generate mips syscalls_n64.c syscall table
> > > >=20
> > > > Hi Arnaldo,
> > > >=20
> > > > The kernel part patch #1 has been merged.
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D1ddc96bd42da
> > > >=20
> > > > Could the perf tool patches #2 and #3 have a chance to be merged be=
fore
> > > > 5.12-rc1?
> > > > If yes, we can use this feature in 5.12-rc1.
> > >=20
> > > Thanks, applied, should make it into 5.12-rc1.
> >=20
> > First we'll have to fix this problem:
> >=20
> >   28    12.45 debian:experimental-x-mips64  : FAIL gcc version 10.2.1 2=
0201224 (Debian 10.2.1-3)
> >                      from builtin-diff.c:12:
> >     /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal err=
or: asm/perf_regs.h: No such file or directory
> >         7 | #include <asm/perf_regs.h>
> >           |          ^~~~~~~~~~~~~~~~~
> >     compilation terminated.
> >     In file included from util/perf_regs.h:30,
> >                      from util/event.h:15,
> >                      from util/branch.h:15,
> >                      from util/callchain.h:8,
> >                      from builtin-record.c:16:
> >     /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal err=
or: asm/perf_regs.h: No such file or directory
>=20
> I'm not finding it in the debian cross build packages:
>=20
> root@d77a78c0aa1c:/# apt-file find perf_regs.h | grep cross
> linux-libc-dev-amd64-cross: /usr/x86_64-linux-gnu/include/asm/perf_regs.h
> linux-libc-dev-arm64-cross: /usr/aarch64-linux-gnu/include/asm/perf_regs.h
> linux-libc-dev-armel-cross: /usr/arm-linux-gnueabi/include/asm/perf_regs.h
> linux-libc-dev-armhf-cross: /usr/arm-linux-gnueabihf/include/asm/perf_reg=
s.h
> linux-libc-dev-i386-cross: /usr/i686-linux-gnu/include/asm/perf_regs.h
> linux-libc-dev-powerpc-cross: /usr/powerpc-linux-gnu/include/asm/perf_reg=
s.h
> linux-libc-dev-ppc64-cross: /usr/powerpc64-linux-gnu/include/asm/perf_reg=
s.h
> linux-libc-dev-ppc64el-cross: /usr/powerpc64le-linux-gnu/include/asm/perf=
_regs.h
> linux-libc-dev-riscv64-cross: /usr/riscv64-linux-gnu/include/asm/perf_reg=
s.h
> linux-libc-dev-s390x-cross: /usr/s390x-linux-gnu/include/asm/perf_regs.h
> linux-libc-dev-x32-cross: /usr/x86_64-linux-gnux32/include/asm/perf_regs.h
> root@d77a78c0aa1c:/#
>=20
> Ideas?

Trying with:

[perfbuilder@five x-mips]$ db
acmel/linux-perf-tools-build-ubuntu:19.10-x-mips
STEP 1: FROM ubuntu:21.04
STEP 2: MAINTAINER Arnaldo Carvalho de Melo <acme@kernel.org>
STEP 3: ENV ARCH mips
STEP 4: ENV TARGET mips-linux-gnu
STEP 5: ENV CROSS_COMPILE=3D${TARGET}-
STEP 6: RUN apt-get -y update &&     apt-get -y install make gcc-${TARGET} =
g++-${TARGET} flex bison git python3 &&     apt-get -y install curl wget bz=
ip2 xz-utils file &&     export ELFUTILS_VER=3D0.173 &&     export ZLIB_VER=
=3D1.2.11 &&     export INSTALLDIR=3D/usr/${TARGET} &&     export PATH=3D$I=
NSTALLDIR/bin:$PATH &&     export TARGETMACH=3D${TARGET} &&     export CROS=
S=3D${TARGET}- &&     export CC=3D${CROSS}gcc &&     export LD=3D${CROSS}ld=
 &&     export AS=3D${CROSS}as &&     wget -q http://zlib.net/zlib-${ZLIB_V=
ER}.tar.gz &&     wget -q https://fedorahosted.org/releases/e/l/elfutils/${=
ELFUTILS_VER}/elfutils-${ELFUTILS_VER}.tar.bz2 &&     tar xf zlib-${ZLIB_VE=
R}.tar.gz &&     cd zlib-${ZLIB_VER} &&     ./configure --prefix=3D${INSTAL=
LDIR} &&     make &&     make install &&     cd .. &&     rm -rf zlib-${ZLI=
B_VER} &&     rm -f zlib-${ZLIB_VER}.tar.gz &&     tar xf elfutils-${ELFUTI=
LS_VER}.tar.bz2 &&     cd elfutils-${ELFUTILS_VER} &&     ./configure --hos=
t=3D${TARGET} --prefix=3D${INSTALLDIR} &&     make &&     make install &&  =
   cd .. &&     rm -rf elfutils-${ELFUTILS_VER}* &&     git clone https://g=
ithub.com/Linaro/OpenCSD.git &&     make -C OpenCSD/decoder/build/linux/ CR=
OSS_COMPILE=3D${CROSS} install &&     rm -rf OpenCSD &&     apt-get -y remo=
ve wget bzip2 &&     apt-get -y clean &&     unset TARGET INSTALLDIR TARGET=
MACH CROSS CC LD AS &&     mkdir -m 777 -p /git /tmp/build/perf /tmp/build/=
objtool /tmp/build/linux &&     groupadd -r perfbuilder &&     useradd -m -=
r -g perfbuilder perfbuilder &&     chown -R perfbuilder.perfbuilder /tmp/b=
uild/ /git/

