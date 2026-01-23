Return-Path: <linux-mips+bounces-12990-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ3iKFWRc2l0xAAAu9opvQ
	(envelope-from <linux-mips+bounces-12990-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 16:18:45 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD077B0F
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 16:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F605300B253
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 15:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B77F28BA83;
	Fri, 23 Jan 2026 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="ag1WRAWJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D192737FC;
	Fri, 23 Jan 2026 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181366; cv=none; b=Yx1G86mcpJq9y/it/MyZfuCPYXJcx7uBLXK0bjhnvf28qKRWQ+Rlo4xt4D2FdfXOr0TTS03e0B150YNqw+syKO+4tYFcDsXLcwLhg4/XqomVHxt77FMEpANzr+FwwwitTCyUpnYW4tlA0WpsBTq3vSmNWOgAkuAo/2RZgE0ulZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181366; c=relaxed/simple;
	bh=rXpme69WV3lZbMqXo4BPlwMSPALTvMzyYlkYjeNanmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auV1HukBw4WzomRHrBleG82TZOD5Fy0+u9VfGq1HCAXCKKLJl8fSrqXLviORIoaF5FRfhQg5ygBXnKCVSSdijGq/cnmlfLXX/AH7HVxGUQ8M67n5Qcs4BiyFNjPbkCt61gM5lLw+ovQ/VOPjt39CpuQQLKDR8l13dpslH+1bnco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=ag1WRAWJ reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4dyM2M6CZPz1DHVR;
	Fri, 23 Jan 2026 16:15:55 +0100 (CET)
Received: from [10.10.15.21] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4dyM2M10Vkz1FDXX;
	Fri, 23 Jan 2026 16:15:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1769181355;
	bh=bZOD1qxujIU3XqsrT9Q0is3A3LXGMfjZia6aaXxikQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ag1WRAWJtsN0/+CXBOsevJVeLpSL3/UnOj7eGnW5g7r2ql6jKEN6uMQEFz39jpWTj
	 70hB6mp8Ve1s6Wp5eFrGmiH/PwtssmQd+OO1x2dJ25+zQ8YZn2M7a8oa0nbx1j6rlf
	 1jVZ+eG2KhetS8xTd2rubzhycPTOvv5H3QVv5BOpKDJUbmQFZnHbjmifqmRJK+rcmN
	 m8LMVMH5b3JJXy0dqOhyCLj8N4ZpFxTGlppCWijPb5T9bTpg9tndXUgxZ+8Iusk4Vm
	 o7IvTCBgZd7VuKCb0Zw5Xn08LvlpLoHpw8Ts3iS9q1RU+69VDDLKM0eepskCzawiEl
	 rXuEIPQaRFOug==
Message-ID: <9199f28e-e2b7-48c8-b61f-0b787e322443@gaisler.com>
Date: Fri, 23 Jan 2026 16:15:54 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, peterz@infradead.org, dev.jain@arm.com,
 akpm@linux-foundation.org, david@kernel.org, ioworker0@gmail.com,
 linmag7@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 sparclinux <sparclinux@vger.kernel.org>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gaisler.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12990-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[gaisler.com:s=simplycom2];
	DKIM_TRACE(0.00)[gaisler.com:~];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,gmail.com,infradead.org,arm.com,linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bytedance.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gaisler.com:mid]
X-Rspamd-Queue-Id: 42AD077B0F
X-Rspamd-Action: no action

On 2025-12-17 10:45, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> The PT_RECLAIM can work on all architectures that support
> MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
> MMU_GATHER_RCU_TABLE_FREE.
> 
> BTW, change PT_RECLAIM to be enabled by default, since nobody should want
> to turn it off.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  arch/x86/Kconfig | 1 -
>  mm/Kconfig       | 9 ++-------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 80527299f859a..0d22da56a71b0 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -331,7 +331,6 @@ config X86
>  	select FUNCTION_ALIGNMENT_4B
>  	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>  	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
> -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>  	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>  	select SCHED_SMT			if SMP
>  	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
> diff --git a/mm/Kconfig b/mm/Kconfig
> index bd0ea5454af82..fc00b429b7129 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>  	  The architecture has hardware support for userspace shadow call
>            stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>  
> -config ARCH_SUPPORTS_PT_RECLAIM
> -	def_bool n
> -
>  config PT_RECLAIM
> -	bool "reclaim empty user page table pages"
> -	default y
> -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
> -	select MMU_GATHER_RCU_TABLE_FREE
> +	def_bool y
> +	depends on MMU_GATHER_RCU_TABLE_FREE
>  	help
>  	  Try to reclaim empty user page table pages in paths other than munmap
>  	  and exit_mmap path.

Hi,

This patch unfortunately results in a WARN_ON_ONCE and unaligned
accesses on sparc64:

$ stress-ng --mmaphuge 20 -t 60
stress-ng: info:  [559] setting to a 1 min run per stressor
stress-ng: info:  [559] dispatching hogs: 20 mmaphuge
[  560.592569] ------------[ cut here ]------------
[  560.592663] WARNING: kernel/rcu/tree.c:3098 at __call_rcu_common.constprop.0+0x200/0x760, CPU#4: stress-ng-mmaph/568
[  560.592777] CPU: 4 UID: 1000 PID: 568 Comm: stress-ng-mmaph Not tainted 6.19.0-rc5-00127-g62fc9f6ccb97 #8 VOLUNTARY
[  560.592805] Call Trace:
[  560.592812] [<00000000004368b8>] dump_stack+0x8/0x60
[  560.592844] [<0000000000482a60>] __warn+0xe0/0x140
[  560.592878] [<0000000000482b64>] warn_slowpath_fmt+0xa4/0x120
[  560.592901] [<0000000000526a40>] __call_rcu_common.constprop.0+0x200/0x760
[  560.592931] [<0000000000526fd0>] call_rcu+0x10/0x20
[  560.592954] [<0000000000730838>] tlb_remove_table+0x98/0xc0
[  560.592986] [<000000000071bec4>] free_pgd_range+0x224/0x4c0
[  560.593021] [<000000000071c35c>] free_pgtables+0x1fc/0x240
[  560.593042] [<000000000074a6f0>] vms_clear_ptes+0x110/0x140
[  560.593068] [<000000000074c3dc>] vms_complete_munmap_vmas+0x5c/0x280
[  560.593094] [<000000000074de5c>] do_vmi_align_munmap+0x1dc/0x260
[  560.593117] [<000000000074df80>] do_vmi_munmap+0xa0/0x140
[  560.593142] [<000000000074fb2c>] __vm_munmap+0x8c/0x160
[  560.593168] [<000000000072cfd4>] vm_munmap+0x14/0x40
[  560.593190] [<00000000004402a8>] sys_64_munmap+0x88/0xa0
[  560.593221] [<0000000000406274>] linux_sparc_syscall+0x34/0x44
[  560.593274] ---[ end trace 0000000000000000 ]---
[  560.593960] log_unaligned: 209 callbacks suppressed
[  560.593979] Kernel unaligned access at TPC[526a4c] __call_rcu_common.constprop.0+0x20c/0x760
[  560.594121] Kernel unaligned access at TPC[526864] __call_rcu_common.constprop.0+0x24/0x760
[  560.594198] Kernel unaligned access at TPC[52b3c4] rcu_segcblist_enqueue+0x24/0x40
[  560.594275] Kernel unaligned access at TPC[526860] __call_rcu_common.constprop.0+0x20/0x760
[  560.594360] Kernel unaligned access at TPC[526864] __call_rcu_common.constprop.0+0x24/0x760
[  567.054127] log_unaligned: 1105 callbacks suppressed
[  567.054167] Kernel unaligned access at TPC[526860] __call_rcu_common.constprop.0+0x20/0x760
[  567.054331] Kernel unaligned access at TPC[526864] __call_rcu_common.constprop.0+0x24/0x760
[  567.054410] Kernel unaligned access at TPC[52b3c4] rcu_segcblist_enqueue+0x24/0x40
...

I bisected to this one on mm-unstable from approximately 2026-01-12.

The warning is from 

	/* Misaligned rcu_head! */
	WARN_ON_ONCE((unsigned long)head & (sizeof(void *) - 1));

in __call_rcu_common() and the unaligned accesses follows from there.

Regards,
Andreas


