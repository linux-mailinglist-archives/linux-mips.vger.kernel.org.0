Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE09326A84
	for <lists+linux-mips@lfdr.de>; Sat, 27 Feb 2021 00:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhBZXuP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Feb 2021 18:50:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:53038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230010AbhBZXuN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 26 Feb 2021 18:50:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14E2964F0D;
        Fri, 26 Feb 2021 23:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614383372;
        bh=FJfO+W8fyUECYOdGIep5b4LImXRbOi0Z1NVltz2ti4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rz2NZaYc4EGL6UjobhkxzdEbib/UErIdpjVVIgR7/PaCmVEpIn7vexehAOO9DBWgO
         mx+/FSmHekA3u1juygm16M3Aa4i9FbdSGVTQrK5L+FLUQWtzY3hGdLSwSxdh5OteR+
         4yfcW71HeYDkUG91CmtRncQwkX19EvdZu8PkdzcP/KCTVLPumKuwYvVIPnz99MHLGF
         IM4v15AuWS9lzqldeUjjT02K6iKDCR4RuYdIqVmyYFejOwOCavqWyMsmg+3ZpiqWRa
         s41SSiBflWbx0QG0FCabWeU90uXiMdi5dzhsETvHRELgQOx0XlxyRToWYEcvQkO3LJ
         Pv9j9eogJgyIw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id D5CF940CD9; Fri, 26 Feb 2021 20:49:29 -0300 (-03)
Date:   Fri, 26 Feb 2021 20:49:29 -0300
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
Message-ID: <YDmJCTxOBb7TGhqw@kernel.org>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
 <1d3c4abd-4b14-90e3-6528-457a8248cb52@loongson.cn>
 <YDZRxz1yRwgWc47F@kernel.org>
 <YDec9LIikZ9EVufH@kernel.org>
 <YDehtDi4q+lFO2l6@kernel.org>
 <YDeiR66J0ohidVSq@kernel.org>
 <8894bb31-ec2b-7324-9c7f-6820d12d951e@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8894bb31-ec2b-7324-9c7f-6820d12d951e@loongson.cn>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Fri, Feb 26, 2021 at 09:11:17AM +0800, Tiezhu Yang escreveu:
> On 02/25/2021 09:12 PM, Arnaldo Carvalho de Melo wrote:
> > Em Thu, Feb 25, 2021 at 10:10:12AM -0300, Arnaldo Carvalho de Melo escr=
eveu:
> > > Em Thu, Feb 25, 2021 at 09:49:56AM -0300, Arnaldo Carvalho de Melo es=
creveu:
> > > > Em Wed, Feb 24, 2021 at 10:16:55AM -0300, Arnaldo Carvalho de Melo =
escreveu:
> > > > > Em Mon, Feb 22, 2021 at 02:43:39PM +0800, Tiezhu Yang escreveu:
> > > > > > On 02/04/2021 11:35 AM, Tiezhu Yang wrote:
> > > > > > > v2: add R26 and R27 to the enum perf_event_mips_regs in patch=
 #1
> > > > > > >=20
> > > > > > > Tiezhu Yang (3):
> > > > > > >     MIPS: kernel: Support extracting off-line stack traces fr=
om user-space
> > > > > > >       with perf
> > > > > > >     perf tools: Support mips unwinding and dwarf-regs
> > > > > > >     perf tools: Generate mips syscalls_n64.c syscall table
> > > > > > Hi Arnaldo,
> > > > > >=20
> > > > > > The kernel part patch #1 has been merged.
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D1ddc96bd42da
> > > > > >=20
> > > > > > Could the perf tool patches #2 and #3 have a chance to be merge=
d before
> > > > > > 5.12-rc1?
> > > > > > If yes, we can use this feature in 5.12-rc1.
> > > > > Thanks, applied, should make it into 5.12-rc1.
> > > > First we'll have to fix this problem:
> > > >=20
> > > >    28    12.45 debian:experimental-x-mips64  : FAIL gcc version 10.=
2.1 20201224 (Debian 10.2.1-3)
> > > >                       from builtin-diff.c:12:
> > > >      /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fata=
l error: asm/perf_regs.h: No such file or directory
> > > >          7 | #include <asm/perf_regs.h>
> > > >            |          ^~~~~~~~~~~~~~~~~
> > > >      compilation terminated.
> > > >      In file included from util/perf_regs.h:30,
> > > >                       from util/event.h:15,
> > > >                       from util/branch.h:15,
> > > >                       from util/callchain.h:8,
> > > >                       from builtin-record.c:16:
> > > >      /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fata=
l error: asm/perf_regs.h: No such file or directory
>=20
> Sorry for the late reply. I asked for a leave yesterday.
>=20
> asm/perf_regs.h is a new added file in the patch #1,
> the patch link is:
> https://lore.kernel.org/patchwork/patch/1375477/
> the commit is:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/mips/include/uapi/asm/perf_regs.h?id=3D1ddc96bd42da
>=20
> So we should build patch #2 based on patch #1.

yeah, my bad, since perf wasn't supported on MIPS, how could cross build
environments have the needed files? Stooooopid me, sorry. :-) I'll
retest after adding the needed files to my test containers.

- Arnaldo
=20
> Thanks,
> Tiezhu
>=20
> > > I'm not finding it in the debian cross build packages:
> > >=20
> > > root@d77a78c0aa1c:/# apt-file find perf_regs.h | grep cross
> > > linux-libc-dev-amd64-cross: /usr/x86_64-linux-gnu/include/asm/perf_re=
gs.h
> > > linux-libc-dev-arm64-cross: /usr/aarch64-linux-gnu/include/asm/perf_r=
egs.h
> > > linux-libc-dev-armel-cross: /usr/arm-linux-gnueabi/include/asm/perf_r=
egs.h
> > > linux-libc-dev-armhf-cross: /usr/arm-linux-gnueabihf/include/asm/perf=
_regs.h
> > > linux-libc-dev-i386-cross: /usr/i686-linux-gnu/include/asm/perf_regs.h
> > > linux-libc-dev-powerpc-cross: /usr/powerpc-linux-gnu/include/asm/perf=
_regs.h
> > > linux-libc-dev-ppc64-cross: /usr/powerpc64-linux-gnu/include/asm/perf=
_regs.h
> > > linux-libc-dev-ppc64el-cross: /usr/powerpc64le-linux-gnu/include/asm/=
perf_regs.h
> > > linux-libc-dev-riscv64-cross: /usr/riscv64-linux-gnu/include/asm/perf=
_regs.h
> > > linux-libc-dev-s390x-cross: /usr/s390x-linux-gnu/include/asm/perf_reg=
s.h
> > > linux-libc-dev-x32-cross: /usr/x86_64-linux-gnux32/include/asm/perf_r=
egs.h
> > > root@d77a78c0aa1c:/#
> > >=20
> > > Ideas?
> > Trying with:
> >=20
> > [perfbuilder@five x-mips]$ db
> > acmel/linux-perf-tools-build-ubuntu:19.10-x-mips
> > STEP 1: FROM ubuntu:21.04
> > STEP 2: MAINTAINER Arnaldo Carvalho de Melo <acme@kernel.org>
> > STEP 3: ENV ARCH mips
> > STEP 4: ENV TARGET mips-linux-gnu
> > STEP 5: ENV CROSS_COMPILE=3D${TARGET}-
> > STEP 6: RUN apt-get -y update &&     apt-get -y install make gcc-${TARG=
ET} g++-${TARGET} flex bison git python3 &&     apt-get -y install curl wge=
t bzip2 xz-utils file &&     export ELFUTILS_VER=3D0.173 &&     export ZLIB=
_VER=3D1.2.11 &&     export INSTALLDIR=3D/usr/${TARGET} &&     export PATH=
=3D$INSTALLDIR/bin:$PATH &&     export TARGETMACH=3D${TARGET} &&     export=
 CROSS=3D${TARGET}- &&     export CC=3D${CROSS}gcc &&     export LD=3D${CRO=
SS}ld &&     export AS=3D${CROSS}as &&     wget -q http://zlib.net/zlib-${Z=
LIB_VER}.tar.gz &&     wget -q https://fedorahosted.org/releases/e/l/elfuti=
ls/${ELFUTILS_VER}/elfutils-${ELFUTILS_VER}.tar.bz2 &&     tar xf zlib-${ZL=
IB_VER}.tar.gz &&     cd zlib-${ZLIB_VER} &&     ./configure --prefix=3D${I=
NSTALLDIR} &&     make &&     make install &&     cd .. &&     rm -rf zlib-=
${ZLIB_VER} &&     rm -f zlib-${ZLIB_VER}.tar.gz &&     tar xf elfutils-${E=
LFUTILS_VER}.tar.bz2 &&     cd elfutils-${ELFUTILS_VER} &&     ./configure =
--host=3D${TARGET} --prefix=3D${INSTALLDIR} &&     make &&     make install=
 &&     cd .. &&     rm -rf elfutils-${ELFUTILS_VER}* &&     git clone http=
s://github.com/Linaro/OpenCSD.git &&     make -C OpenCSD/decoder/build/linu=
x/ CROSS_COMPILE=3D${CROSS} install &&     rm -rf OpenCSD &&     apt-get -y=
 remove wget bzip2 &&     apt-get -y clean &&     unset TARGET INSTALLDIR T=
ARGETMACH CROSS CC LD AS &&     mkdir -m 777 -p /git /tmp/build/perf /tmp/b=
uild/objtool /tmp/build/linux &&     groupadd -r perfbuilder &&     useradd=
 -m -r -g perfbuilder perfbuilder &&     chown -R perfbuilder.perfbuilder /=
tmp/build/ /git/
>=20

--=20

- Arnaldo
