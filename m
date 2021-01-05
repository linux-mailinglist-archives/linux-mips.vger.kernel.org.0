Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526452EA876
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 11:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbhAEKTG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 05:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbhAEKTG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jan 2021 05:19:06 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39C7C061796;
        Tue,  5 Jan 2021 02:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=k9Tv8IK1so2yR0WlHT3NfT9JGq1L6JF4IPupMKVOxNw=; b=MzyWcsePowyQtwpwIKUqkI2K7r
        VS3r52v8A0fh5aR4ejVwOLTdhzL7keIV3I8mn50nFP0VP4NgNe5bCG+Gk/SVy5S8OTMBNsbtm82WX
        V3yo1KTzeowwCKbLpWWYWD8keXkmX8NuStrfUgrqWWgx51Dam9NV3HKaHiRN72Im6XSVBucFuRYMG
        tL6zsfqGvg2Ops0sqGnsFuOY9EEF+Ow5GJK4FD80uGRqmyM4NhMz+xqCJIzLeltucy6PWR+yGKqCY
        2+LXk7f4SmhQhXLNLRi35DyH92+XpGXCblCs1WaJhQlt8iUbl308PvU1Z4NVntQ4sEjCssTR6RdJz
        aFm1Qhvg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kwjPl-0006RF-F6; Tue, 05 Jan 2021 10:18:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4358D3013E5;
        Tue,  5 Jan 2021 11:18:07 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 0F7DC2121353E; Tue,  5 Jan 2021 11:18:07 +0100 (CET)
Date:   Tue, 5 Jan 2021 11:18:06 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
Message-ID: <20210105101806.GG3040@hirez.programming.kicks-ass.net>
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
 <20210104105904.GK3021@hirez.programming.kicks-ass.net>
 <0712b131-715a-a83a-bc9e-61405824ff0e@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0712b131-715a-a83a-bc9e-61405824ff0e@flygoat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 05, 2021 at 11:45:37AM +0800, Jiaxun Yang wrote:
> 在 2021/1/4 下午6:59, Peter Zijlstra 写道:
> > On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
> > > +u64 perf_reg_abi(struct task_struct *tsk)
> > > +{
> > > +	if (test_tsk_thread_flag(tsk, TIF_32BIT_REGS))
> > > +		return PERF_SAMPLE_REGS_ABI_32;
> > > +	else
> > > +		return PERF_SAMPLE_REGS_ABI_64;
> > > +}
> > So we recently changed this on x86 to not rely on TIF flags. IIRC the
> > problem is that on x86 you can change the mode of a task without the
> > kernel being aware of it. Is something like that possible on MIPS as
> > well?
> 
> Hi all,
> 
> In MIPS world it's impossible to raise a thread to 64bit without kernel
> aware.
> Without STATUS.UX set it will trigger reserved instruction exception when
> trying
> to run 64bit instructions.

The other way around is the case on x86, a 64bit program can create and
execute 32bit code sections without the kernel being aware. But if
clearing STATUS.UX has the same issue as setting it, that should not be
a problem for you.

> However it may be possible to run with 32bit ABI without
> TIF_32BIT_REGS if user program didn't get ELF ABI right. I think
> that's out of our current consideration.

Fair enough.

> > The thing x86 does today is look at it's pt_regs state to determine the
> > actual state.
> It is possible to look at pt_regs Status.UX bit on MIPS. But it seems
> unnecessary
> as user can't change it.

Ok, good. Then no objection, proceed! :-)
