Return-Path: <linux-mips+bounces-6893-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 638D89E5D03
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 18:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCF6E18825F2
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 17:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63421224AFB;
	Thu,  5 Dec 2024 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jP47FIrX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IHxBnacu";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jP47FIrX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IHxBnacu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB22EB1F;
	Thu,  5 Dec 2024 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419495; cv=none; b=pYffi5QMD2ITCW3yoyQB41dNy8X1hpwBJihBufVB/SsIeQHN3IgXvPZNxg0ATm5Wfc3Ulpf3HKpmIjzzuSfHbRK8sxEogIrbJ42sTXbweMKkDmNHTtso5qgZHg/S+4x8nYIgPDNtiQBLIALNZpp+ZmSjC1JppNbiBGcKU0V4qxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419495; c=relaxed/simple;
	bh=16pU3/VAYTh+D3dm8LOcVfpbDQqaVgE7cn5iHyJafHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FeyHd0Tcu/BDXKOlnrCw27YG1HIWbMP+XCVzqmst6oiMDy/kmaCOqnnHrVky8sa0IUSQt8TQ54BJ7dVxuTTjcvV/Vk+CHfe98+5XgUpgYqKiXsvlxa8NM2eZ77OG/0vpu2OYAhcSKM02D4bC17jcw/zHMDRSVlsbxpC2B0Xmpcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jP47FIrX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IHxBnacu; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jP47FIrX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IHxBnacu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 26FE71F45E;
	Thu,  5 Dec 2024 17:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733419491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YLVXBpu8hX2IMUmLaDWa4TSaan2r+yBI/vCBSXLPPYk=;
	b=jP47FIrXJhJO53LTxI7x8HQWPhXItNpXc/8ISAkDQmQn1nCjpolBExWN+hokJkFvJIrxHW
	db6899M7qPFln7TP9txM1rOU4sTEhZ8iYMJr4djcRDjl2I5wQGC5p3p9s/5zCjCy/nedLU
	rp9G8cHddgu2WcpgxV3tPCo/yDEM5pg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733419491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YLVXBpu8hX2IMUmLaDWa4TSaan2r+yBI/vCBSXLPPYk=;
	b=IHxBnacuZtnlPUv5JZm5zHJ4FAf0sDT/M1kpGT23miLdbngLdfWppZFB+nLIbfTxh2YGQk
	TIdeBpc9iH7tHYCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=jP47FIrX;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=IHxBnacu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733419491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YLVXBpu8hX2IMUmLaDWa4TSaan2r+yBI/vCBSXLPPYk=;
	b=jP47FIrXJhJO53LTxI7x8HQWPhXItNpXc/8ISAkDQmQn1nCjpolBExWN+hokJkFvJIrxHW
	db6899M7qPFln7TP9txM1rOU4sTEhZ8iYMJr4djcRDjl2I5wQGC5p3p9s/5zCjCy/nedLU
	rp9G8cHddgu2WcpgxV3tPCo/yDEM5pg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733419491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YLVXBpu8hX2IMUmLaDWa4TSaan2r+yBI/vCBSXLPPYk=;
	b=IHxBnacuZtnlPUv5JZm5zHJ4FAf0sDT/M1kpGT23miLdbngLdfWppZFB+nLIbfTxh2YGQk
	TIdeBpc9iH7tHYCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05649132EB;
	Thu,  5 Dec 2024 17:24:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dJT7AOPhUWfXHgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 05 Dec 2024 17:24:51 +0000
Message-ID: <434596ce-5514-42f3-84f5-f8a70954f058@suse.cz>
Date: Thu, 5 Dec 2024 18:24:50 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Miaohe Lin
 <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko
 <glider@google.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
 <995E365D-5B83-41B3-A46C-6493D203A761@nvidia.com>
 <CAMuHMdW4=HScVk2C+vkG_JqO9uMCF2VoJTuGqSi1-H=86e2RqQ@mail.gmail.com>
 <056a2305-db07-4168-868b-164493ff8587@redhat.com>
 <F3805AF4-1660-4CEA-868E-2D1F4A70BCB3@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <F3805AF4-1660-4CEA-868E-2D1F4A70BCB3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 26FE71F45E
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:dkim];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 12/5/24 17:05, Zi Yan wrote:
> On 5 Dec 2024, at 3:10, David Hildenbrand wrote:
>>>
>>> Kernel log confirms it's enabled:
>>> -mem auto-init: stack:off, heap alloc:off, heap free:off
>>> +mem auto-init: stack:off, heap alloc:on, heap free:off
>>
>> If I'm not wrong that's expected ... because we'll be double-zeroing that memory, clearing the cache :)
>>
>> I guess the question is, how *effective* is CONFIG_INIT_ON_ALLOC_DEFAULT_ON on systems to prevent exposing un-zeroed data to userspace, when it doesn't end up doing the flush we really need.
> 
> Hi Geert,
> 
> Is it possible to run a 32bit kernel with HIGHMEM and
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON on the machine (of course with my patch
> reverted)? Just to check my reasoning below.
> 
> Thanks.
> 
> 
> Yes, it should work, since I forgot the actual issue is HIGHMEM+cache flush, not just cache flush is needed after clearing user page.
> 
> For arch which needs to flush cache after clearing user page, with HIGHMEM,
> init_on_alloc first clears the page using kmap_addr0 without flushing
> the cache, then clear_user_page() clears the page using kmap_addr1
> with cache flush. After returning to userspace, the cache lines of
> kmap_addr0 will be evicted and written back to RAM eventually, corrupting
> user data with 0s, because no one flushes them before returning to userspace.
> 
> For a proper fix, I will add ARCH_HAS_OPS_AFTER_CLEAR_USER_PAGE and
> make mips, sh, sparc, arm, xtensa, nios2, m68k, parisc, csky, arc, and powerpc
> select it, then make alloc_zeroed() returns false if
> ARCH_HAS_OPS_AFTER_CLEAR_USER_PAGE is enabled.
> 
> If my reasoning above is verified to be true, I will send a separate patch
> to disable CONFIG_INIT_ON_ALLOC_DEFAULT_ON if HIGHMEM &&
> ARCH_HAS_OPS_AFTER_CLEAR_USER_PAGE.

If your reasoning is true, wouldn't any other user of kmap_local_page() of a
highpage on such system also leave the cache unflushed in case the page is
ever reused as a userspace page?

> Best Regards,
> Yan, Zi


