Return-Path: <linux-mips+bounces-13127-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHPCARXNhWn0GgQAu9opvQ
	(envelope-from <linux-mips+bounces-13127-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 06 Feb 2026 12:14:29 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305AFD11B
	for <lists+linux-mips@lfdr.de>; Fri, 06 Feb 2026 12:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6110730091E5
	for <lists+linux-mips@lfdr.de>; Fri,  6 Feb 2026 11:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0FE396B87;
	Fri,  6 Feb 2026 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RaPi3BqZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C8F3644BA;
	Fri,  6 Feb 2026 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376463; cv=none; b=QWTIC1p2ywDzIgLxBaTSA3UXpkraY2e+wHMjup+VhovPp4a5+OjCPadvAh57k2D+E9ScadJ/OQPHJ7rLD6g/ah1weSlstyZdQjk5k70ueaCyWA+Iqt/dpLBFYekGp6pLqQvdQJSvr+7i8bYkcCHamHynpSRoonLK207B/UnICWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376463; c=relaxed/simple;
	bh=tRTch7DcVYVaxVVMhGdmN8hWxvXz/LeeIkso6ntFpkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVMdnY2AuPLHNkRylyjwRDSitTK5Zh2NmXafYR1Zk5SOCreouXbHEvpWeccYynAe8ZMgZutPk60iuiP/zjJsR8f3Ffop+ZccfQFy5/9vIFh2WNVNnOlC6nDaxjaRkrOVU552MDBIwITizn0SfNAUmX9+05VJLicMtsQcQjAhUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RaPi3BqZ; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <1663ae90-3247-4e12-a25a-049fc3281e19@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770376450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t10+cy0YbJp1qzuAruOEDHFVPEgf+sIN5MYp954+hik=;
	b=RaPi3BqZPsLqUSHKWvjkyZ/Bf9ppgLwDMnRp3djinkfcParF3X0U5UOMZXVjnrIIj+XKGG
	qik03O+yZh0BczTm4tqsQ4ypqJYxgFR02cW1b2w7PUE2iHSCCwxRYQBdSb0+Sx1HZWERjm
	cI4FFTRQSuQeqxHQ+OOhNwrumpE+hso=
Date: Fri, 6 Feb 2026 19:13:59 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 7/8] mm: convert __HAVE_ARCH_TLB_REMOVE_TABLE to
 CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE config
To: "David Hildenbrand (Arm)" <david@kernel.org>, andreas@gaisler.com,
 richard.weiyang@gmail.com, will@kernel.org, peterz@infradead.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dev.jain@arm.com,
 ioworker0@gmail.com, linmag7@gmail.com, akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, sparclinux@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1769515122.git.zhengqi.arch@bytedance.com>
 <5ebfa3d4b56e63c6906bda5eccaa9f7194d3a86b.1769515122.git.zhengqi.arch@bytedance.com>
 <a404e9ec-35ff-44b1-b321-9cc4fbf72060@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <a404e9ec-35ff-44b1-b321-9cc4fbf72060@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13127-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gaisler.com,gmail.com,infradead.org,arm.com,linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qi.zheng@linux.dev,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bytedance.com:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 1305AFD11B
X-Rspamd-Action: no action



On 2/6/26 7:06 PM, David Hildenbrand (Arm) wrote:
> On 1/27/26 13:13, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> For architectures that define __HAVE_ARCH_TLB_REMOVE_TABLE, the page
>> tables at the pmd/pud level are generally not of struct ptdesc type, and
>> do not have pt_rcu_head member, thus these architectures cannot support
>> PT_RECLAIM.
>>
>> In preparation for enabling PT_RECLAIM on more architectures, convert
>> __HAVE_ARCH_TLB_REMOVE_TABLE to CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE config,
>> so that we can make conditional judgments in Kconfig.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   arch/powerpc/Kconfig            | 1 +
>>   arch/powerpc/include/asm/tlb.h  | 1 -
>>   arch/sparc/Kconfig              | 1 +
>>   arch/sparc/include/asm/tlb_64.h | 1 -
>>   include/asm-generic/tlb.h       | 2 +-
>>   mm/Kconfig                      | 3 +++
>>   6 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 9537a61ebae02..b47aa8fd62742 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -304,6 +304,7 @@ config PPC
>>       select LOCK_MM_AND_FIND_VMA
>>       select MMU_GATHER_PAGE_SIZE
>>       select MMU_GATHER_RCU_TABLE_FREE
>> +    select HAVE_ARCH_TLB_REMOVE_TABLE
>>       select MMU_GATHER_MERGE_VMAS
>>       select MMU_LAZY_TLB_SHOOTDOWN        if PPC_BOOK3S_64
>>       select MODULES_USE_ELF_RELA
>> diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/ 
>> asm/tlb.h
>> index 2058e8d3e0138..1ca7d4c4b90db 100644
>> --- a/arch/powerpc/include/asm/tlb.h
>> +++ b/arch/powerpc/include/asm/tlb.h
>> @@ -37,7 +37,6 @@ extern void tlb_flush(struct mmu_gather *tlb);
>>    */
>>   #define tlb_needs_table_invalidate()    radix_enabled()
>> -#define __HAVE_ARCH_TLB_REMOVE_TABLE
>>   /* Get the generic bits... */
>>   #include <asm-generic/tlb.h>
>> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
>> index a630d373e6453..25fa2908d6152 100644
>> --- a/arch/sparc/Kconfig
>> +++ b/arch/sparc/Kconfig
>> @@ -74,6 +74,7 @@ config SPARC64
>>       select HAVE_KRETPROBES
>>       select HAVE_KPROBES
>>       select MMU_GATHER_RCU_TABLE_FREE if SMP
>> +    select HAVE_ARCH_TLB_REMOVE_TABLE if SMP
> 
> Why the SMP? At least in tlb_64.h, it was not protected by SMP IIUC.

Ah, It's just simply aligned with the MMU_GATHER_RCU_TABLE_FREE above.

> 
> Apart from that LGTM.

Thanks!

> 


