Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC42030FF02
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 22:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhBDVBq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 16:01:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:52905 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229511AbhBDVBp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Feb 2021 16:01:45 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7ljq-0002rO-02; Thu, 04 Feb 2021 22:00:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F1755C0D71; Thu,  4 Feb 2021 21:59:45 +0100 (CET)
Date:   Thu, 4 Feb 2021 21:59:45 +0100
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
        Juxin Gao <gaojuxin@loongson.cn>,
        David Daney <david.daney@cavium.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Archer Yan <ayan@wavecomp.com>
Subject: Re: [PATCH v2 1/3] MIPS: kernel: Support extracting off-line stack
 traces from user-space with perf
Message-ID: <20210204205945.GC19460@alpha.franken.de>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
 <1612409724-3516-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612409724-3516-2-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 04, 2021 at 11:35:22AM +0800, Tiezhu Yang wrote:
> Add perf_event_mips_regs/perf_reg_value/perf_reg_validate to support
> features HAVE_PERF_REGS/HAVE_PERF_USER_STACK_DUMP in kernel.
> 
> [ayan@wavecomp.com: Repick this patch for unwinding userstack backtrace
>  by perf and libunwind on MIPS based CPU.]
> 
> [ralf@linux-mips.org: Add perf_get_regs_user() which is required after
> 'commit 88a7c26af8da ("perf: Move task_pt_regs sampling into arch code")'.]
> 
> [yangtiezhu@loongson.cn: Fix build error about perf_get_regs_user() after
> commit 76a4efa80900 ("perf/arch: Remove perf_sample_data::regs_user_copy"),
> and also separate the original patches into two parts (MIPS kernel and perf
> tools) to merge easily.]
> 
> The original patches:
> https://lore.kernel.org/patchwork/patch/1126521/
> https://lore.kernel.org/patchwork/patch/1126520/
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Archer Yan <ayan@wavecomp.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> v2: add R26 and R27 to the enum perf_event_mips_regs
> 
>  arch/mips/Kconfig                      |  2 +
>  arch/mips/include/uapi/asm/perf_regs.h | 40 ++++++++++++++++++++
>  arch/mips/kernel/Makefile              |  2 +-
>  arch/mips/kernel/perf_regs.c           | 68 ++++++++++++++++++++++++++++++++++
>  4 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/include/uapi/asm/perf_regs.h
>  create mode 100644 arch/mips/kernel/perf_regs.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
