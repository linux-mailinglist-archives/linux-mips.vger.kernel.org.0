Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3545A30A611
	for <lists+linux-mips@lfdr.de>; Mon,  1 Feb 2021 12:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbhBALBM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 06:01:12 -0500
Received: from elvis.franken.de ([193.175.24.41]:43229 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233145AbhBALAZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Feb 2021 06:00:25 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l6Wv9-00087b-00; Mon, 01 Feb 2021 11:59:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8C857C0CC6; Mon,  1 Feb 2021 11:43:38 +0100 (CET)
Date:   Mon, 1 Feb 2021 11:43:38 +0100
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
Message-ID: <20210201104338.GA6484@alpha.franken.de>
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
> +++ b/arch/mips/include/uapi/asm/perf_regs.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _ASM_MIPS_PERF_REGS_H
> +#define _ASM_MIPS_PERF_REGS_H
> +
> +enum perf_event_mips_regs {
> +	PERF_REG_MIPS_PC,
> +	PERF_REG_MIPS_R1,
> +	PERF_REG_MIPS_R2,
> +	PERF_REG_MIPS_R3,
> +	PERF_REG_MIPS_R4,
> +	PERF_REG_MIPS_R5,
> +	PERF_REG_MIPS_R6,
> +	PERF_REG_MIPS_R7,
> +	PERF_REG_MIPS_R8,
> +	PERF_REG_MIPS_R9,
> +	PERF_REG_MIPS_R10,
> +	PERF_REG_MIPS_R11,
> +	PERF_REG_MIPS_R12,
> +	PERF_REG_MIPS_R13,
> +	PERF_REG_MIPS_R14,
> +	PERF_REG_MIPS_R15,
> +	PERF_REG_MIPS_R16,
> +	PERF_REG_MIPS_R17,
> +	PERF_REG_MIPS_R18,
> +	PERF_REG_MIPS_R19,
> +	PERF_REG_MIPS_R20,
> +	PERF_REG_MIPS_R21,
> +	PERF_REG_MIPS_R22,
> +	PERF_REG_MIPS_R23,
> +	PERF_REG_MIPS_R24,
> +	PERF_REG_MIPS_R25,
> +	/*
> +	 * 26 and 27 are k0 and k1, they are always clobbered thus not
> +	 * stored.
> +	 */

haveing this hole here make all code more complicated. Does it hurt
to have R26 and R27 in the list ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
