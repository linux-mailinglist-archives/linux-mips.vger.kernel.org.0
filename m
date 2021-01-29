Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CA9308C05
	for <lists+linux-mips@lfdr.de>; Fri, 29 Jan 2021 18:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhA2R6u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Jan 2021 12:58:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:41974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbhA2R6t (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 Jan 2021 12:58:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBFAF64E07;
        Fri, 29 Jan 2021 17:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611943088;
        bh=O1kMHmCIAMtpNgKBwX1ZGNj9omrf1C81ck/T7oQqjZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qfSLujWQ06P9+v81FqjHGaSx7Lt7wkwNrnymvUjYdQ3t4Vd6ii1yJuCZbuoL2W5Qb
         H4GdTTsCVbf6ZFyPbSJXrYPD8yFGmj6xL07YaU1O2HypX8VSgEq7E8Dd7wqL6mSZ/m
         TjVDuLEzlAoJswCMpCK/yqd0xYau+l5z+9zjOdcv76+FNXpM2rDD+AiWsQSG8nKlWr
         ugtbffZtfkuLQGhZH+ebGd+BdvNKJvKd8Lo6wdmm3sx6pTSRbea7ZplNyO3fAKlwmT
         eJolwE8Wa2KLMeh5eC3yRs9VPaRkTyGfky3F/bFoqnu0SGLaCXULbVoiDOlM96GCYS
         OFAENuEc6S7GA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 8DF4540513; Fri, 29 Jan 2021 14:58:05 -0300 (-03)
Date:   Fri, 29 Jan 2021 14:58:05 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        David Daney <david.daney@cavium.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Archer Yan <ayan@wavecomp.com>, x86@kernel.org
Subject: Re: [PATCH 1/3] MIPS: kernel: Support extracting off-line stack
 traces from user-space with perf
Message-ID: <20210129175805.GD794568@kernel.org>
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
 <20210104105904.GK3021@hirez.programming.kicks-ass.net>
 <0712b131-715a-a83a-bc9e-61405824ff0e@flygoat.com>
 <20210105101806.GG3040@hirez.programming.kicks-ass.net>
 <20210127211506.GA21163@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210127211506.GA21163@alpha.franken.de>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Wed, Jan 27, 2021 at 10:15:06PM +0100, Thomas Bogendoerfer escreveu:
> On Tue, Jan 05, 2021 at 11:18:06AM +0100, Peter Zijlstra wrote:
> > On Tue, Jan 05, 2021 at 11:45:37AM +0800, Jiaxun Yang wrote:
> > > 在 2021/1/4 下午6:59, Peter Zijlstra 写道:
> > > > On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
> > > > > +u64 perf_reg_abi(struct task_struct *tsk)
> > > > > +{
> > > > > +	if (test_tsk_thread_flag(tsk, TIF_32BIT_REGS))
> > > > > +		return PERF_SAMPLE_REGS_ABI_32;
> > > > > +	else
> > > > > +		return PERF_SAMPLE_REGS_ABI_64;
> > > > > +}
> > > > So we recently changed this on x86 to not rely on TIF flags. IIRC the
> > > > problem is that on x86 you can change the mode of a task without the
> > > > kernel being aware of it. Is something like that possible on MIPS as
> > > > well?
> > > 
> > > Hi all,
> > > 
> > > In MIPS world it's impossible to raise a thread to 64bit without kernel
> > > aware.
> > > Without STATUS.UX set it will trigger reserved instruction exception when
> > > trying
> > > to run 64bit instructions.
> > 
> > The other way around is the case on x86, a 64bit program can create and
> > execute 32bit code sections without the kernel being aware. But if
> > clearing STATUS.UX has the same issue as setting it, that should not be
> > a problem for you.
> > 
> > > However it may be possible to run with 32bit ABI without
> > > TIF_32BIT_REGS if user program didn't get ELF ABI right. I think
> > > that's out of our current consideration.
> > 
> > Fair enough.
> > 
> > > > The thing x86 does today is look at it's pt_regs state to determine the
> > > > actual state.
> > > It is possible to look at pt_regs Status.UX bit on MIPS. But it seems
> > > unnecessary
> > > as user can't change it.
> > 
> > Ok, good. Then no objection, proceed! :-)
> 
> this patch aims more to mips-next, while patch 2 and 3 are targeting
> tools/perf. Should I take them into mips-next, too ?

I'll process the tools/perf ones, if you took the time to actually
review them, please say so and I'll add a Reviewed-by tag stating that.

I've replied to another message in this thread with reasoning about the
value of processing kernel bits in the relevant arch tree while the
tooling one via my perf/core branch.

- Arnaldo
