Return-Path: <linux-mips+bounces-13008-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KnGMAcRd2nJbgEAu9opvQ
	(envelope-from <linux-mips+bounces-13008-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jan 2026 08:00:23 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7984AA2
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jan 2026 08:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA219300C804
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jan 2026 07:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F093287245;
	Mon, 26 Jan 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="io0Jn+3N"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C84286405
	for <linux-mips@vger.kernel.org>; Mon, 26 Jan 2026 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769410817; cv=none; b=fc3BIXmp3rhTtCpP9eCcYcdqQkKM1EjoRItLCvG38cu2gdyWXT2ACsbJVLHO+dB1mWKo3GsADs9162eb6HW0+8cdOjJMNe+S4eAEOeqKJisCbloDFMHqghSa4smz8qX3UbpUnM8XPn5vOHtI/nMo0lGGT2bopwsGG2ixi6gERp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769410817; c=relaxed/simple;
	bh=hIVMICCOrwOEHb7O10TcOjpQqCQ90wHru/xyyTPnNZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gl/BUXxfXn5csTgmEUCyKbd1yZEgcjq08yw+eMbUgI/GPJTmHugh6nUSdUD7NOpybQColXEoqYeTx6HC5MlnYlUd9FncRITpU95QL6j8Oif7lv/N6j+hOdAJ9np5Dq6h35PF2/v0BPpYvDgeuhoOOn3zD90fSPEAKT6HvgShKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=io0Jn+3N; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <646d9b5c-453c-4db8-b578-0f343e170379@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769410802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hybAGJDtwUTQyBJLSE6cgT3x4CprzyvIGdy1i62DoMg=;
	b=io0Jn+3NajuPHPI4XjqNt9sYHPn2FyPfP/1eLMYG5oEK9p8YQ2ayv0ii4eZsQi7AY5Kxh/
	8bRt82NClUXSKr1V31d6I/GqCfQd+DB4Ux8EDoCg31zgpyKNNatRAU/WP75QWfFgYjHG7n
	Oc4aJiIqhIpd+iDcwrxRH5wDMzgILbU=
Date: Mon, 26 Jan 2026 14:59:43 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
To: Andreas Larsson <andreas@gaisler.com>, david@kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 sparclinux <sparclinux@vger.kernel.org>, will@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, dev.jain@arm.com, ioworker0@gmail.com, linmag7@gmail.com
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
 <9199f28e-e2b7-48c8-b61f-0b787e322443@gaisler.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <9199f28e-e2b7-48c8-b61f-0b787e322443@gaisler.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13008-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.linux.dev,lists.infradead.org,bytedance.com,kernel.org,infradead.org,linux-foundation.org,gmail.com,arm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qi.zheng@linux.dev,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim,bytedance.com:email]
X-Rspamd-Queue-Id: 2BF7984AA2
X-Rspamd-Action: no action



On 1/23/26 11:15 PM, Andreas Larsson wrote:
> On 2025-12-17 10:45, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> The PT_RECLAIM can work on all architectures that support
>> MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>> MMU_GATHER_RCU_TABLE_FREE.
>>
>> BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>> to turn it off.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   arch/x86/Kconfig | 1 -
>>   mm/Kconfig       | 9 ++-------
>>   2 files changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index 80527299f859a..0d22da56a71b0 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -331,7 +331,6 @@ config X86
>>   	select FUNCTION_ALIGNMENT_4B
>>   	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>>   	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>> -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>>   	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>>   	select SCHED_SMT			if SMP
>>   	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index bd0ea5454af82..fc00b429b7129 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>>   	  The architecture has hardware support for userspace shadow call
>>             stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>>   
>> -config ARCH_SUPPORTS_PT_RECLAIM
>> -	def_bool n
>> -
>>   config PT_RECLAIM
>> -	bool "reclaim empty user page table pages"
>> -	default y
>> -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>> -	select MMU_GATHER_RCU_TABLE_FREE
>> +	def_bool y
>> +	depends on MMU_GATHER_RCU_TABLE_FREE
>>   	help
>>   	  Try to reclaim empty user page table pages in paths other than munmap
>>   	  and exit_mmap path.
> 
> Hi,
> 
> This patch unfortunately results in a WARN_ON_ONCE and unaligned
> accesses on sparc64:
> 
> $ stress-ng --mmaphuge 20 -t 60
> stress-ng: info:  [559] setting to a 1 min run per stressor
> stress-ng: info:  [559] dispatching hogs: 20 mmaphuge
> [  560.592569] ------------[ cut here ]------------
> [  560.592663] WARNING: kernel/rcu/tree.c:3098 at __call_rcu_common.constprop.0+0x200/0x760, CPU#4: stress-ng-mmaph/568
> [  560.592777] CPU: 4 UID: 1000 PID: 568 Comm: stress-ng-mmaph Not tainted 6.19.0-rc5-00127-g62fc9f6ccb97 #8 VOLUNTARY
> [  560.592805] Call Trace:
> [  560.592812] [<00000000004368b8>] dump_stack+0x8/0x60
> [  560.592844] [<0000000000482a60>] __warn+0xe0/0x140
> [  560.592878] [<0000000000482b64>] warn_slowpath_fmt+0xa4/0x120
> [  560.592901] [<0000000000526a40>] __call_rcu_common.constprop.0+0x200/0x760
> [  560.592931] [<0000000000526fd0>] call_rcu+0x10/0x20
> [  560.592954] [<0000000000730838>] tlb_remove_table+0x98/0xc0
> [  560.592986] [<000000000071bec4>] free_pgd_range+0x224/0x4c0
> [  560.593021] [<000000000071c35c>] free_pgtables+0x1fc/0x240
> [  560.593042] [<000000000074a6f0>] vms_clear_ptes+0x110/0x140
> [  560.593068] [<000000000074c3dc>] vms_complete_munmap_vmas+0x5c/0x280
> [  560.593094] [<000000000074de5c>] do_vmi_align_munmap+0x1dc/0x260
> [  560.593117] [<000000000074df80>] do_vmi_munmap+0xa0/0x140
> [  560.593142] [<000000000074fb2c>] __vm_munmap+0x8c/0x160
> [  560.593168] [<000000000072cfd4>] vm_munmap+0x14/0x40
> [  560.593190] [<00000000004402a8>] sys_64_munmap+0x88/0xa0
> [  560.593221] [<0000000000406274>] linux_sparc_syscall+0x34/0x44
> [  560.593274] ---[ end trace 0000000000000000 ]---
> [  560.593960] log_unaligned: 209 callbacks suppressed
> [  560.593979] Kernel unaligned access at TPC[526a4c] __call_rcu_common.constprop.0+0x20c/0x760
> [  560.594121] Kernel unaligned access at TPC[526864] __call_rcu_common.constprop.0+0x24/0x760
> [  560.594198] Kernel unaligned access at TPC[52b3c4] rcu_segcblist_enqueue+0x24/0x40
> [  560.594275] Kernel unaligned access at TPC[526860] __call_rcu_common.constprop.0+0x20/0x760
> [  560.594360] Kernel unaligned access at TPC[526864] __call_rcu_common.constprop.0+0x24/0x760
> [  567.054127] log_unaligned: 1105 callbacks suppressed
> [  567.054167] Kernel unaligned access at TPC[526860] __call_rcu_common.constprop.0+0x20/0x760
> [  567.054331] Kernel unaligned access at TPC[526864] __call_rcu_common.constprop.0+0x24/0x760
> [  567.054410] Kernel unaligned access at TPC[52b3c4] rcu_segcblist_enqueue+0x24/0x40

Thanks for your report!

On sparc64, pmd and pud levels are not of struct page:

__pmd_free_tlb/__pud_free_tlb
--> pgtable_free_tlb(tlb, pud/pmd, false). <=== is_page == false
     --> tlb_remove_table

So in __tlb_remove_table_one(), the table cannot be treated as
ptdesc because it does not have an pt_rcu_head member.

Hi David, it seems we still need to keep ARCH_SUPPORTS_PT_RECLAIM?

Thanks,
Qi

> ...
> 
> I bisected to this one on mm-unstable from approximately 2026-01-12.
> 
> The warning is from
> 
> 	/* Misaligned rcu_head! */
> 	WARN_ON_ONCE((unsigned long)head & (sizeof(void *) - 1));
> 
> in __call_rcu_common() and the unaligned accesses follows from there.
> 
> Regards,
> Andreas
> 


