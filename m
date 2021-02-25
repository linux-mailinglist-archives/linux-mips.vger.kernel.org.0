Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 193EC32502B
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 14:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhBYNK7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Feb 2021 08:10:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:56176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229919AbhBYNKz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Feb 2021 08:10:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A62B364F14;
        Thu, 25 Feb 2021 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614258614;
        bh=QJtYXSGO/SdBVtbPRfmRNqo5ZzftkRJCRZSNTCuYkGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cevttnrJqn04pWPo2NKC8lloj2m5zSJF8jEm/iA30u2vnKz2E18pKuXTXblhUKWX7
         PjjeieynjSMTsbWIIXnncpx+8OEIt3OV4P4Il+iEjEwqxVvF/G2NluNV2k2yN3zWAk
         dsrEzarcw35Yj4H30Zj3saZMuCyBsGuDoOW4+0uhpd/mLd6nnMauz7C7JAqnNFkrMQ
         6tSASfiQ8Im4HZ+qCHx8rL5XUz437XObGYc2HpHFHO4LRqjT1djV/xtn8WpXefed7G
         X4PMgx1L9h0CCavYcyIDsuXBFYQyAhDcldO2X2r/t3FohRW6knGMiB0e/broOJsVeJ
         LULC3a2HJoG7w==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 1B1C440CD9; Thu, 25 Feb 2021 10:10:12 -0300 (-03)
Date:   Thu, 25 Feb 2021 10:10:12 -0300
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
Message-ID: <YDehtDi4q+lFO2l6@kernel.org>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
 <1d3c4abd-4b14-90e3-6528-457a8248cb52@loongson.cn>
 <YDZRxz1yRwgWc47F@kernel.org>
 <YDec9LIikZ9EVufH@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDec9LIikZ9EVufH@kernel.org>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Thu, Feb 25, 2021 at 09:49:56AM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Wed, Feb 24, 2021 at 10:16:55AM -0300, Arnaldo Carvalho de Melo escreveu:
> > Em Mon, Feb 22, 2021 at 02:43:39PM +0800, Tiezhu Yang escreveu:
> > > On 02/04/2021 11:35 AM, Tiezhu Yang wrote:
> > > > v2: add R26 and R27 to the enum perf_event_mips_regs in patch #1
> > > > 
> > > > Tiezhu Yang (3):
> > > >    MIPS: kernel: Support extracting off-line stack traces from user-space
> > > >      with perf
> > > >    perf tools: Support mips unwinding and dwarf-regs
> > > >    perf tools: Generate mips syscalls_n64.c syscall table
> > > 
> > > Hi Arnaldo,
> > > 
> > > The kernel part patch #1 has been merged.
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ddc96bd42da
> > > 
> > > Could the perf tool patches #2 and #3 have a chance to be merged before
> > > 5.12-rc1?
> > > If yes, we can use this feature in 5.12-rc1.
> > 
> > Thanks, applied, should make it into 5.12-rc1.
> 
> First we'll have to fix this problem:
> 
>   28    12.45 debian:experimental-x-mips64  : FAIL gcc version 10.2.1 20201224 (Debian 10.2.1-3)
>                      from builtin-diff.c:12:
>     /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
>         7 | #include <asm/perf_regs.h>
>           |          ^~~~~~~~~~~~~~~~~
>     compilation terminated.
>     In file included from util/perf_regs.h:30,
>                      from util/event.h:15,
>                      from util/branch.h:15,
>                      from util/callchain.h:8,
>                      from builtin-record.c:16:
>     /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory

I'm not finding it in the debian cross build packages:

root@d77a78c0aa1c:/# apt-file find perf_regs.h | grep cross
linux-libc-dev-amd64-cross: /usr/x86_64-linux-gnu/include/asm/perf_regs.h
linux-libc-dev-arm64-cross: /usr/aarch64-linux-gnu/include/asm/perf_regs.h
linux-libc-dev-armel-cross: /usr/arm-linux-gnueabi/include/asm/perf_regs.h
linux-libc-dev-armhf-cross: /usr/arm-linux-gnueabihf/include/asm/perf_regs.h
linux-libc-dev-i386-cross: /usr/i686-linux-gnu/include/asm/perf_regs.h
linux-libc-dev-powerpc-cross: /usr/powerpc-linux-gnu/include/asm/perf_regs.h
linux-libc-dev-ppc64-cross: /usr/powerpc64-linux-gnu/include/asm/perf_regs.h
linux-libc-dev-ppc64el-cross: /usr/powerpc64le-linux-gnu/include/asm/perf_regs.h
linux-libc-dev-riscv64-cross: /usr/riscv64-linux-gnu/include/asm/perf_regs.h
linux-libc-dev-s390x-cross: /usr/s390x-linux-gnu/include/asm/perf_regs.h
linux-libc-dev-x32-cross: /usr/x86_64-linux-gnux32/include/asm/perf_regs.h
root@d77a78c0aa1c:/#

Ideas?

- Arnaldo
