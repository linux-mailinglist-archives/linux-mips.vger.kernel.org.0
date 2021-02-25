Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD106324FF5
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 13:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhBYMum (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Feb 2021 07:50:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:50268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229571AbhBYMul (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Feb 2021 07:50:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03F9964EB7;
        Thu, 25 Feb 2021 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614257399;
        bh=sCUZudoGK1HEV+ydY8VPfIfuz7gTGzgYxugHb/PWcVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DHQgaDBtrPbjelxAw7YyVyAFYnWrih/cFR9F3ckcyxeLDDG38HLqOzU4c0iSwc+ZU
         kiJ5Y0eVBmS7BRkPQwhmuINBwu65y1fvZzr0hCqZRN9a+Xl73xGVK59KPQyqk2+cTc
         fOeBRSnniiSiu06wUggFQ1isO4tsGJwPelIpNzxzbEk3VsWTZzd8WQwLpgZN7r6oZS
         vBH9kfGVuINvPMMaCf/2xqdrsSdnVqlWtCzDYcPjlH7VCdKbUOWFx8rZ8foaD4mQ3R
         Zi/23LEv4kx1sHBjrm7JJF5KTgF9M1UHO54ot2nrxIRx7F2zwOzlWNmvvdmpA/uiRw
         CKnYUwd26C7yg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 2666640CD9; Thu, 25 Feb 2021 09:49:56 -0300 (-03)
Date:   Thu, 25 Feb 2021 09:49:56 -0300
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
Message-ID: <YDec9LIikZ9EVufH@kernel.org>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
 <1d3c4abd-4b14-90e3-6528-457a8248cb52@loongson.cn>
 <YDZRxz1yRwgWc47F@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDZRxz1yRwgWc47F@kernel.org>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Wed, Feb 24, 2021 at 10:16:55AM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Mon, Feb 22, 2021 at 02:43:39PM +0800, Tiezhu Yang escreveu:
> > On 02/04/2021 11:35 AM, Tiezhu Yang wrote:
> > > v2: add R26 and R27 to the enum perf_event_mips_regs in patch #1
> > > 
> > > Tiezhu Yang (3):
> > >    MIPS: kernel: Support extracting off-line stack traces from user-space
> > >      with perf
> > >    perf tools: Support mips unwinding and dwarf-regs
> > >    perf tools: Generate mips syscalls_n64.c syscall table
> > 
> > Hi Arnaldo,
> > 
> > The kernel part patch #1 has been merged.
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ddc96bd42da
> > 
> > Could the perf tool patches #2 and #3 have a chance to be merged before
> > 5.12-rc1?
> > If yes, we can use this feature in 5.12-rc1.
> 
> Thanks, applied, should make it into 5.12-rc1.

First we'll have to fix this problem:

  28    12.45 debian:experimental-x-mips64  : FAIL gcc version 10.2.1 20201224 (Debian 10.2.1-3)
                     from builtin-diff.c:12:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/branch.h:15,
                     from util/callchain.h:8,
                     from builtin-record.c:16:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/session.h:6,
                     from builtin-buildid-list.c:17:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/session.h:6,
                     from builtin-evlist.c:16:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/session.h:6,
                     from builtin-buildid-cache.c:24:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from builtin-annotate.c:24:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/thread.h:16,
                     from builtin-sched.c:11:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/branch.h:15,
                     from builtin-report.c:24:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from builtin-stat.c:49:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/thread.h:16,
                     from builtin-timechart.c:24:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
  29    12.79 debian:experimental-x-mipsel  : FAIL gcc version 10.2.1 20201224 (Debian 10.2.1-3)
                     from builtin-diff.c:12:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/branch.h:15,
                     from util/callchain.h:8,
                     from builtin-record.c:16:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/session.h:6,
                     from builtin-buildid-list.c:17:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from builtin-stat.c:49:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from builtin-annotate.c:24:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/session.h:6,
                     from builtin-evlist.c:16:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/thread.h:16,
                     from builtin-sched.c:11:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/thread.h:16,
                     from builtin-timechart.c:24:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/branch.h:15,
                     from builtin-report.c:24:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from util/session.h:6,
                     from builtin-buildid-cache.c:24:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.
    In file included from util/perf_regs.h:30,
                     from util/event.h:15,
                     from builtin-top.c:31:
    /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
        7 | #include <asm/perf_regs.h>
          |          ^~~~~~~~~~~~~~~~~
    compilation terminated.



