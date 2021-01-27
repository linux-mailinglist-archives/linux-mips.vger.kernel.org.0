Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10143065D3
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 22:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbhA0VQc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 16:16:32 -0500
Received: from elvis.franken.de ([193.175.24.41]:60530 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231927AbhA0VQb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 16:16:31 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l4s9k-0003fj-00; Wed, 27 Jan 2021 22:15:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F222CC0AAF; Wed, 27 Jan 2021 22:15:06 +0100 (CET)
Date:   Wed, 27 Jan 2021 22:15:06 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Message-ID: <20210127211506.GA21163@alpha.franken.de>
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
 <20210104105904.GK3021@hirez.programming.kicks-ass.net>
 <0712b131-715a-a83a-bc9e-61405824ff0e@flygoat.com>
 <20210105101806.GG3040@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210105101806.GG3040@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 05, 2021 at 11:18:06AM +0100, Peter Zijlstra wrote:
> On Tue, Jan 05, 2021 at 11:45:37AM +0800, Jiaxun Yang wrote:
> > 在 2021/1/4 下午6:59, Peter Zijlstra 写道:
> > > On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
> > > > +u64 perf_reg_abi(struct task_struct *tsk)
> > > > +{
> > > > +	if (test_tsk_thread_flag(tsk, TIF_32BIT_REGS))
> > > > +		return PERF_SAMPLE_REGS_ABI_32;
> > > > +	else
> > > > +		return PERF_SAMPLE_REGS_ABI_64;
> > > > +}
> > > So we recently changed this on x86 to not rely on TIF flags. IIRC the
> > > problem is that on x86 you can change the mode of a task without the
> > > kernel being aware of it. Is something like that possible on MIPS as
> > > well?
> > 
> > Hi all,
> > 
> > In MIPS world it's impossible to raise a thread to 64bit without kernel
> > aware.
> > Without STATUS.UX set it will trigger reserved instruction exception when
> > trying
> > to run 64bit instructions.
> 
> The other way around is the case on x86, a 64bit program can create and
> execute 32bit code sections without the kernel being aware. But if
> clearing STATUS.UX has the same issue as setting it, that should not be
> a problem for you.
> 
> > However it may be possible to run with 32bit ABI without
> > TIF_32BIT_REGS if user program didn't get ELF ABI right. I think
> > that's out of our current consideration.
> 
> Fair enough.
> 
> > > The thing x86 does today is look at it's pt_regs state to determine the
> > > actual state.
> > It is possible to look at pt_regs Status.UX bit on MIPS. But it seems
> > unnecessary
> > as user can't change it.
> 
> Ok, good. Then no objection, proceed! :-)

this patch aims more to mips-next, while patch 2 and 3 are targeting
tools/perf. Should I take them into mips-next, too ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
