Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBD930D7C8
	for <lists+linux-mips@lfdr.de>; Wed,  3 Feb 2021 11:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbhBCKlk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 05:41:40 -0500
Received: from elvis.franken.de ([193.175.24.41]:49448 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233684AbhBCKlj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 05:41:39 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7FaD-0005T6-04; Wed, 03 Feb 2021 11:40:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 45D7DC0D4A; Wed,  3 Feb 2021 11:40:09 +0100 (CET)
Date:   Wed, 3 Feb 2021 11:40:09 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        David Daney <david.daney@cavium.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Archer Yan <ayan@wavecomp.com>
Subject: Re: [PATCH 1/3] MIPS: kernel: Support extracting off-line stack
 traces from user-space with perf
Message-ID: <20210203104009.GE7586@alpha.franken.de>
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
 <20210201104338.GA6484@alpha.franken.de>
 <7c081c6f-bf47-353d-95c0-52e8640dc938@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c081c6f-bf47-353d-95c0-52e8640dc938@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 01, 2021 at 08:56:06PM +0800, Tiezhu Yang wrote:
> On 02/01/2021 06:43 PM, Thomas Bogendoerfer wrote:
> > On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
> > > +++ b/arch/mips/include/uapi/asm/perf_regs.h
> > > @@ -0,0 +1,42 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > +#ifndef _ASM_MIPS_PERF_REGS_H
> > > +#define _ASM_MIPS_PERF_REGS_H
> > > +
> > > +enum perf_event_mips_regs {
> > > +	PERF_REG_MIPS_PC,
> > > +	PERF_REG_MIPS_R1,
> > > +	PERF_REG_MIPS_R2,
> > > +	PERF_REG_MIPS_R3,
> > > +	PERF_REG_MIPS_R4,
> > > +	PERF_REG_MIPS_R5,
> > > +	PERF_REG_MIPS_R6,
> > > +	PERF_REG_MIPS_R7,
> > > +	PERF_REG_MIPS_R8,
> > > +	PERF_REG_MIPS_R9,
> > > +	PERF_REG_MIPS_R10,
> > > +	PERF_REG_MIPS_R11,
> > > +	PERF_REG_MIPS_R12,
> > > +	PERF_REG_MIPS_R13,
> > > +	PERF_REG_MIPS_R14,
> > > +	PERF_REG_MIPS_R15,
> > > +	PERF_REG_MIPS_R16,
> > > +	PERF_REG_MIPS_R17,
> > > +	PERF_REG_MIPS_R18,
> > > +	PERF_REG_MIPS_R19,
> > > +	PERF_REG_MIPS_R20,
> > > +	PERF_REG_MIPS_R21,
> > > +	PERF_REG_MIPS_R22,
> > > +	PERF_REG_MIPS_R23,
> > > +	PERF_REG_MIPS_R24,
> > > +	PERF_REG_MIPS_R25,
> > > +	/*
> > > +	 * 26 and 27 are k0 and k1, they are always clobbered thus not
> > > +	 * stored.
> > > +	 */
> > haveing this hole here make all code more complicated. Does it hurt
> > to have R26 and R27 in the list ?
> 
> I think there is no effect if have R26 and R27 in the list.
> 
> In the perf_reg_value(), PERF_REG_MIPS_R{26,27} are default case.

why make them special ? After all they are real registers and are only
defined special by current ABIs.

> Should I modify enum perf_event_mips_regs to add R26 and R27,
> and then send v2?

yes please.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
