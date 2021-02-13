Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D587C31AAA5
	for <lists+linux-mips@lfdr.de>; Sat, 13 Feb 2021 10:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhBMJVI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Feb 2021 04:21:08 -0500
Received: from elvis.franken.de ([193.175.24.41]:52753 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229671AbhBMJVF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 13 Feb 2021 04:21:05 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lAr4j-0003E3-00; Sat, 13 Feb 2021 10:18:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 789BCC02AC; Sat, 13 Feb 2021 10:05:22 +0100 (CET)
Date:   Sat, 13 Feb 2021 10:05:22 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <kernelpatch@126.com>
Cc:     Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        kernel test robot <lkp@intel.com>,
        Xingxing Su <suxingxing@loongson.cn>
Subject: Re: [PATCH v2 RESEND] MIPS: Add basic support for ptrace single step
Message-ID: <20210213090522.GA4330@alpha.franken.de>
References: <fb37951.4.177977952f5.Coremail.kernelpatch@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb37951.4.177977952f5.Coremail.kernelpatch@126.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 13, 2021 at 02:20:46AM +0800, Tiezhu Yang wrote:
> From: Tiezhu Yang <yangtiezhu@loongson.cn>
> 
> In the current code, arch_has_single_step() is not defined on MIPS,
> that means MIPS does not support instruction single-step for user mode.
> 
> Delve is a debugger for the Go programming language, the ptrace syscall
> PtraceSingleStep() failed [1] on MIPS and then the single step function
> can not work well, we can see that PtraceSingleStep() definition returns
> ptrace(PTRACE_SINGLESTEP) [2].
> 
> So it is necessary to support ptrace single step on MIPS.
> 
> At the beginning, we try to use the Debug Single Step exception on the
> Loongson 3A4000 platform, but it has no effect when set CP0_DEBUG SSt
> bit, this is because CP0_DEBUG NoSSt bit is 1 which indicates no
> single-step feature available [3], so this way which is dependent on the
> hardware is almost impossible.
> 
> With further research, we find out there exists a common way used with
> break instruction in arch/alpha/kernel/ptrace.c, it is workable.
> 
> For the above analysis, define arch_has_single_step(), add the common
> function user_enable_single_step() and user_disable_single_step(), set
> flag TIF_SINGLESTEP for child process, use break instruction to set
> breakpoint.
> 
> We can use the following testcase to test it:
> tools/testing/selftests/breakpoints/step_after_suspend_test.c
> 
>  $ make -C tools/testing/selftests TARGETS=breakpoints
>  $ cd tools/testing/selftests/breakpoints
> 
> Without this patch:
> 
>  $ ./step_after_suspend_test -n
>  TAP version 13
>  1..4
>  # ptrace(PTRACE_SINGLESTEP) not supported on this architecture: Input/output error
>  ok 1 # SKIP CPU 0
>  # ptrace(PTRACE_SINGLESTEP) not supported on this architecture: Input/output error
>  ok 2 # SKIP CPU 1
>  # ptrace(PTRACE_SINGLESTEP) not supported on this architecture: Input/output error
>  ok 3 # SKIP CPU 2
>  # ptrace(PTRACE_SINGLESTEP) not supported on this architecture: Input/output error
>  ok 4 # SKIP CPU 3
>  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:4 error:0
> 
> With this patch:
> 
>  $ ./step_after_suspend_test -n
>  TAP version 13
>  1..4
>  ok 1 CPU 0
>  ok 2 CPU 1
>  ok 3 CPU 2
>  ok 4 CPU 3
>  # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> [1] https://github.com/go-delve/delve/blob/master/pkg/proc/native/threads_linux.go#L50
> [2] https://github.com/go-delve/delve/blob/master/vendor/golang.org/x/sys/unix/syscall_linux.go#L1573
> [3] http://www.t-es-t.hu/download/mips/md00047f.pdf
> 
> Reported-by: Guoqi Chen <chenguoqi@loongson.cn>
> Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> 
> RESEND due to send to mail list failed, sorry for that.
> 
> v2: make union mips_instruction mips_insn = { 0 };
>     to fix uninitialized build warning used with clang
>     reported by kernel test robot.
> 
>  arch/mips/include/asm/ptrace.h      |   2 +
>  arch/mips/include/asm/thread_info.h |   5 ++
>  arch/mips/kernel/ptrace.c           | 108 ++++++++++++++++++++++++++++++++++++
>  arch/mips/kernel/signal.c           |   2 +-
>  4 files changed, 116 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
