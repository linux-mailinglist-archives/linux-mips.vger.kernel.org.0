Return-Path: <linux-mips+bounces-13131-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CBSGuTthWlvIQQAu9opvQ
	(envelope-from <linux-mips+bounces-13131-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 06 Feb 2026 14:34:28 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A68FE2D6
	for <lists+linux-mips@lfdr.de>; Fri, 06 Feb 2026 14:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E3A0303AF05
	for <lists+linux-mips@lfdr.de>; Fri,  6 Feb 2026 13:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160B336EA91;
	Fri,  6 Feb 2026 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="Z9Z88ceb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548D222F01;
	Fri,  6 Feb 2026 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384809; cv=none; b=lTm0xgdqYB8s+byEFCm4kpJiUaoMSAFxzRWAuKHM6XMTVVFh8RUDPwNEYcBpDaQO2VUtUnye2WA9mtUdKoFqMT0Z/srCmWQwpIxDooKzDcvC4H+7OpaTxfdMSBRj89n4NvnfIGhC5VkfW6p34Ny+cSkAk0kqhse8Vke0DJvD/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384809; c=relaxed/simple;
	bh=Q4fwLaPjgYRjVXL9lLHQUYevXebKIZ+Ej0AuFFMIbG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHT8a9rQK3aaNa0/JYQHsmrHzJQjPSQ2tOhl+OLxHq8ozGFeM++sjZe61HB749lpGtbLHeY4t/uQaMoOlnmOdRnOAdVXeUlpIbKDUPhRe2rdq0pCBvjU+B6e6YTHHQiomuu2HuNOX+HAXaGcKYKkSwzb/6T2d769nCTqHgeMMjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=Z9Z88ceb reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4f6w5f1jGqz1FDXx;
	Fri,  6 Feb 2026 14:33:26 +0100 (CET)
Received: from [10.10.15.18] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4f6w5d3Z4Lz1FQVL;
	Fri,  6 Feb 2026 14:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1770384806;
	bh=vb13Vwh1fPqNxRNlEIYNEmJHIJtcIK4aczKvaS88OeA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Z9Z88cebMu7Ddw1jVWtT448QIvjHL3GiCwWDGvsQ01Wxtyv3l79H+bPYslc1UOB9Y
	 BdTB81cJcyiWlbAk4Xtv+cSCwqG0dm8ZtfsJ0+1NUs0nMYD/nsZAWUQ7EG3GW5LUcx
	 0wBqY7vrdo20aOPF/76QbRmshC7PSNXwuN38zJAxeBlYBIzyXSflwMh2TZ4DIboOxw
	 vVux+ighrR6Q5uNjNY7Izr87aZexRGjwxcfGrRU9WPwEYfMjDFCgLUCpuncK1iWdjy
	 /ZR4ft/NA5cLVxWSHqdmyJ6d7uUMeuP1zpoKteadSBJ5gNGxos6/Pw/tMDP1Ddpwbt
	 dhqXYTI9hYY9A==
Message-ID: <847afd79-e8f8-4547-8167-0125809de055@gaisler.com>
Date: Fri, 6 Feb 2026 14:33:24 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] mm: convert __HAVE_ARCH_TLB_REMOVE_TABLE to
 CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE config
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, richard.weiyang@gmail.com, will@kernel.org,
 peterz@infradead.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dev.jain@arm.com, ioworker0@gmail.com, linmag7@gmail.com,
 akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, sparclinux@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1769515122.git.zhengqi.arch@bytedance.com>
 <5ebfa3d4b56e63c6906bda5eccaa9f7194d3a86b.1769515122.git.zhengqi.arch@bytedance.com>
 <a404e9ec-35ff-44b1-b321-9cc4fbf72060@kernel.org>
 <1663ae90-3247-4e12-a25a-049fc3281e19@linux.dev>
 <538fef61-3903-407e-8486-538a28b99e9d@kernel.org>
 <53a1bbdd-26d1-454d-af06-169172278718@linux.dev>
 <c24c32bd-085d-460a-833a-a982eb5becaa@kernel.org>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <c24c32bd-085d-460a-833a-a982eb5becaa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gaisler.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13131-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[gaisler.com:s=simplycom2];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,infradead.org,arm.com,linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gaisler.com:~];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_SPAM(0.00)[0.263];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gaisler.com:mid,gaisler.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9A68FE2D6
X-Rspamd-Action: no action

On 2026-02-06 13:59, David Hildenbrand (Arm) wrote:
> On 2/6/26 12:58, Qi Zheng wrote:
>>
>>
>> On 2/6/26 7:45 PM, David Hildenbrand (Arm) wrote:
>>> On 2/6/26 12:13, Qi Zheng wrote:
>>>>
>>>>
>>>>
>>>> Ah, It's just simply aligned with the MMU_GATHER_RCU_TABLE_FREE above.
>>>
>>> But does that work as expected for !SMP?
>>
>> In the case of !SMP, tlb_remove_table() will not be called:
>>
>> static inline void pgtable_free_tlb(struct mmu_gather *tlb, void *table, bool is_page)
>> {
>>      pgtable_free(table, is_page);
>> }
> 
> Ah, okay. Confusing stuff. Would have been nice to document/mention that in the patch description.
> 
> So if it compiles, all good
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 

It looks a bit weird, but it is actually more logically correct than
before the patch. Before this in the !SMP sparc64 case
__HAVE_ARCH_TLB_REMOVE_TABLE was defined even with no actual
__tlb_remove_table() present. But it did not matter in practice.
But I agree that a mention would not hurt.

Tested both with SMP and !SMP

Tested-by: Andreas Larsson <andreas@gaisler.com> #sparc
Acked-by: Andreas Larsson <andreas@gaisler.com> #sparc

Cheers,
Andreas


