Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735B245DE6C
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 17:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239549AbhKYQPq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 11:15:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:41068 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356570AbhKYQNp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 11:13:45 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mqHKR-0005zr-00; Thu, 25 Nov 2021 17:10:31 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CBB14C2F81; Thu, 25 Nov 2021 16:54:58 +0100 (CET)
Date:   Thu, 25 Nov 2021 16:54:58 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Fix using smp_processor_id() in preemptible in
 show_cpuinfo()
Message-ID: <20211125155458.GA11524@alpha.franken.de>
References: <1637840372-27773-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637840372-27773-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 25, 2021 at 07:39:32PM +0800, Tiezhu Yang wrote:
> There exists the following issue under DEBUG_PREEMPT:
> 
>  BUG: using smp_processor_id() in preemptible [00000000] code: systemd/1
>  caller is show_cpuinfo+0x460/0xea0
>  ...
>  Call Trace:
>  [<ffffffff8020f0dc>] show_stack+0x94/0x128
>  [<ffffffff80e6cab4>] dump_stack_lvl+0x94/0xd8
>  [<ffffffff80e74c5c>] check_preemption_disabled+0x104/0x110
>  [<ffffffff802209c8>] show_cpuinfo+0x460/0xea0
>  [<ffffffff80539d54>] seq_read_iter+0xfc/0x4f8
>  [<ffffffff804fcc10>] new_sync_read+0x110/0x1b8
>  [<ffffffff804ff57c>] vfs_read+0x1b4/0x1d0
>  [<ffffffff804ffb18>] ksys_read+0xd0/0x110
>  [<ffffffff8021c090>] syscall_common+0x34/0x58
> 
> We can see the following call trace:
>  show_cpuinfo()
>    cpu_has_fpu
>      current_cpu_data
>        smp_processor_id()
> 
>  $ addr2line -f -e vmlinux 0xffffffff802209c8
>  show_cpuinfo
>  arch/mips/kernel/proc.c:188
> 
>  $ head -188 arch/mips/kernel/proc.c | tail -1
> 	 if (cpu_has_fpu)
> 
>  arch/mips/include/asm/cpu-features.h
>  #  define cpu_has_fpu		(current_cpu_data.options & MIPS_CPU_FPU)
> 
>  arch/mips/include/asm/cpu-info.h
>  #define current_cpu_data cpu_data[smp_processor_id()]
> 
> Based on the above analysis, fix the issue by using raw_cpu_has_fpu
> which calls raw_smp_processor_id() in show_cpuinfo().
> 
> Fixes: 626bfa037299 ("MIPS: kernel: proc: add CPU option reporting")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/kernel/proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 376a6e2..9f47a88 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -185,7 +185,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  		seq_puts(m, " tx39_cache");
>  	if (cpu_has_octeon_cache)
>  		seq_puts(m, " octeon_cache");
> -	if (cpu_has_fpu)
> +	if (raw_cpu_has_fpu)
>  		seq_puts(m, " fpu");
>  	if (cpu_has_32fpr)
>  		seq_puts(m, " 32fpr");
> -- 
> 2.1.0

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
