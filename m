Return-Path: <linux-mips+bounces-13011-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPhqOuOheGljrgEAu9opvQ
	(envelope-from <linux-mips+bounces-13011-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 12:30:43 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7356493996
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 12:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 735FE302002D
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 11:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7188346FA4;
	Tue, 27 Jan 2026 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlhbehXu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F8346FA0;
	Tue, 27 Jan 2026 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513402; cv=none; b=broollR9zSSknrmd1pVUIX29S0tgl6I6ZxXnxooJqi1QFh85AVCyMiPK3LRXxByHj1Tt4PO7cELl686gjL5o+2l5jyK5SXSdORH/0Vf2RwwwE/X7U9R5pFplfvv5g9MUfvM5sGNYWuEtsDd/w6DWLWyflkpuVBG2PsqqCdj+eRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513402; c=relaxed/simple;
	bh=3MHBv5qz4r9u9+OGOCDEClZYEfFFg6c1ucfZG1KC7LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcqaInAT5HaqZCDkQbfZwpqJpjycmx3k9pbTlg/XfNU7Exm8KKrpDPDh3yZH+dVyLVRC/VkoasB/Bz/RNWMH5OqG3VtqQYv3xLiFk5lfUgMdhvV6R3hEaok0rsOqClqA//jJ3KAkHdHQO9ZoXu7KOJwQoPQM2R1R0gAOJNqrzFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlhbehXu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC14C16AAE;
	Tue, 27 Jan 2026 11:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769513402;
	bh=3MHBv5qz4r9u9+OGOCDEClZYEfFFg6c1ucfZG1KC7LY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RlhbehXugRDNE89V27O40PiZgmYwl8Axy1aRlayHkNTbaRn5r/3c0+37Ma5pvSeZe
	 O7sTRbMiVAo07NKBxmafRF7t34czQjKMW/sq9HxMBYOiNR4Zl9dOee3g+V8Po9fTYZ
	 2eEWEWiiO2wYWOCD/n4br4sozm5WAPlhI8RJLSKi5xKub3eJRYzzYG24jCmWiFcFUg
	 IX53gmZo5JOszng/6q+mQgk6cziuIvl7M72wjS/cAlM3dob+Aq9bXSJHb4SvCJkg0K
	 OIuTx+JPafcw9mUmlf668e0O1J0wyj+A1wI37rJX9dc3WwLqV1PBDLfji4UTmsHasY
	 JFcuwUAZ5jnOQ==
Message-ID: <b95f042f-8fc8-4b6c-b9db-b198efdd0973@kernel.org>
Date: Tue, 27 Jan 2026 12:29:55 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>, Andreas Larsson <andreas@gaisler.com>
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
 <646d9b5c-453c-4db8-b578-0f343e170379@linux.dev>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
In-Reply-To: <646d9b5c-453c-4db8-b578-0f343e170379@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13011-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.linux.dev,lists.infradead.org,bytedance.com,kernel.org,infradead.org,linux-foundation.org,gmail.com,arm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bytedance.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7356493996
X-Rspamd-Action: no action

On 1/26/26 07:59, Qi Zheng wrote:
> 
> 
> On 1/23/26 11:15 PM, Andreas Larsson wrote:
>> On 2025-12-17 10:45, Qi Zheng wrote:
>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>
>>> The PT_RECLAIM can work on all architectures that support
>>> MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>>> MMU_GATHER_RCU_TABLE_FREE.
>>>
>>> BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>>> to turn it off.
>>>
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>> ---
>>>    arch/x86/Kconfig | 1 -
>>>    mm/Kconfig       | 9 ++-------
>>>    2 files changed, 2 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>>> index 80527299f859a..0d22da56a71b0 100644
>>> --- a/arch/x86/Kconfig
>>> +++ b/arch/x86/Kconfig
>>> @@ -331,7 +331,6 @@ config X86
>>>    	select FUNCTION_ALIGNMENT_4B
>>>    	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>>>    	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>>> -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>>>    	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>>>    	select SCHED_SMT			if SMP
>>>    	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>>> diff --git a/mm/Kconfig b/mm/Kconfig
>>> index bd0ea5454af82..fc00b429b7129 100644
>>> --- a/mm/Kconfig
>>> +++ b/mm/Kconfig
>>> @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>>>    	  The architecture has hardware support for userspace shadow call
>>>              stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>>>    
>>> -config ARCH_SUPPORTS_PT_RECLAIM
>>> -	def_bool n
>>> -
>>>    config PT_RECLAIM
>>> -	bool "reclaim empty user page table pages"
>>> -	default y
>>> -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>>> -	select MMU_GATHER_RCU_TABLE_FREE
>>> +	def_bool y
>>> +	depends on MMU_GATHER_RCU_TABLE_FREE
>>>    	help
>>>    	  Try to reclaim empty user page table pages in paths other than munmap
>>>    	  and exit_mmap path.
>>
>> Hi,
>>
>> This patch unfortunately results in a WARN_ON_ONCE and unaligned
>> accesses on sparc64:
>>
>> $ stress-ng --mmaphuge 20 -t 60
>> stress-ng: info:  [559] setting to a 1 min run per stressor
>> stress-ng: info:  [559] dispatching hogs: 20 mmaphuge
>> [  560.592569] ------------[ cut here ]------------
>> [  560.592663] WARNING: kernel/rcu/tree.c:3098 at __call_rcu_common.constprop.0+0x200/0x760, CPU#4: stress-ng-mmaph/568
>> [  560.592777] CPU: 4 UID: 1000 PID: 568 Comm: stress-ng-mmaph Not tainted 6.19.0-rc5-00127-g62fc9f6ccb97 #8 VOLUNTARY
>> [  560.592805] Call Trace:
>> [  560.592812] [<00000000004368b8>] dump_stack+0x8/0x60
>> [  560.592844] [<0000000000482a60>] __warn+0xe0/0x140
>> [  560.592878] [<0000000000482b64>] warn_slowpath_fmt+0xa4/0x120
>> [  560.592901] [<0000000000526a40>] __call_rcu_common.constprop.0+0x200/0x760
>> [  560.592931] [<0000000000526fd0>] call_rcu+0x10/0x20
>> [  560.592954] [<0000000000730838>] tlb_remove_table+0x98/0xc0
>> [  560.592986] [<000000000071bec4>] free_pgd_range+0x224/0x4c0
>> [  560.593021] [<000000000071c35c>] free_pgtables+0x1fc/0x240
>> [  560.593042] [<000000000074a6f0>] vms_clear_ptes+0x110/0x140
>> [  560.593068] [<000000000074c3dc>] vms_complete_munmap_vmas+0x5c/0x280
>> [  560.593094] [<000000000074de5c>] do_vmi_align_munmap+0x1dc/0x260
>> [  560.593117] [<000000000074df80>] do_vmi_munmap+0xa0/0x140
>> [  560.593142] [<000000000074fb2c>] __vm_munmap+0x8c/0x160
>> [  560.593168] [<000000000072cfd4>] vm_munmap+0x14/0x40
>> [  560.593190] [<00000000004402a8>] sys_64_munmap+0x88/0xa0
>> [  560.593221] [<0000000000406274>] linux_sparc_syscall+0x34/0x44
>> [  560.593274] ---[ end trace 0000000000000000 ]---
>> [  560.593960] log_unaligned: 209 callbacks suppressed
>> [  560.593979] Kernel unaligned access at TPC[526a4c] __call_rcu_common.constprop.0+0x20c/0x760
>> [  560.594121] Kernel unaligned access at TPC[526864] __call_rcu_common.constprop.0+0x24/0x760
>> [  560.594198] Kernel unaligned access at TPC[52b3c4] rcu_segcblist_enqueue+0x24/0x40
>> [  560.594275] Kernel unaligned access at TPC[526860] __call_rcu_common.constprop.0+0x20/0x760
>> [  560.594360] Kernel unaligned access at TPC[526864] __call_rcu_common.constprop.0+0x24/0x760
>> [  567.054127] log_unaligned: 1105 callbacks suppressed
>> [  567.054167] Kernel unaligned access at TPC[526860] __call_rcu_common.constprop.0+0x20/0x760
>> [  567.054331] Kernel unaligned access at TPC[526864] __call_rcu_common.constprop.0+0x24/0x760
>> [  567.054410] Kernel unaligned access at TPC[52b3c4] rcu_segcblist_enqueue+0x24/0x40
> 
> Thanks for your report!
> 
> On sparc64, pmd and pud levels are not of struct page:

Can you elaborate, I don't understand what you mean :)

Is it also a problem on architectures like s390x and ppc, where we 
squeeze multiple page tables into a physical pages?

> 
> __pmd_free_tlb/__pud_free_tlb
> --> pgtable_free_tlb(tlb, pud/pmd, false). <=== is_page == false
>       --> tlb_remove_table
> 
> So in __tlb_remove_table_one(), the table cannot be treated as
> ptdesc because it does not have an pt_rcu_head member.
> 
> Hi David, it seems we still need to keep ARCH_SUPPORTS_PT_RECLAIM?

Or we invert it and only disable it for the known-problematic architectures?

-- 
Cheers

David

