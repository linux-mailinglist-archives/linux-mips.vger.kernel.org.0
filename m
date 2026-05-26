Return-Path: <linux-mips+bounces-14736-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EExPGKjuFGofRgcAu9opvQ
	(envelope-from <linux-mips+bounces-14736-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:51:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE2C5CF530
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47D4E301E954
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 00:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E018280CF6;
	Tue, 26 May 2026 00:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Loz8r3hh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB20A22AE65
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 00:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779756696; cv=none; b=O5Jkjw3qNlkK4gsBg8ljsTkEX/lbBNOV0Q66HIHj5fXveGeXHajQKBkwo+gSX6r4MiBq1M32pe7dbRlNOEOg6LXjowtOVXbT5/+YcOzmeUK9d/MF8d/6r9OCLmQgKto//NBTf/HpEvgjFW5n3ivS8O5nbmycDkdtbDr8wehb7yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779756696; c=relaxed/simple;
	bh=YHxUoWZ3KTF2di8VYjrcHbb0me7uToNfc0hyJGb1qZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxn97EEH5IhZK6Dcd6Cu3miSudgKFiHjsiCOdDL2kZ7USt38eSxJ27bZ/KqkaJyKAeBNIhrVgzoTEneFdO1F0lJUiwcHxm70qQFWc73mu2R535TeREimIgjEo1bI7zgqN4G3PV96uMBDc93NQpslYxWrXMDx/Ixi8sVXGldTvbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Loz8r3hh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso53854025e9.3
        for <linux-mips@vger.kernel.org>; Mon, 25 May 2026 17:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779756692; x=1780361492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3bICaotEcFBSHr6aI2IzMVwvas+ixkBgDm+KS5EZIw=;
        b=Loz8r3hhIK0I9KUTA2kq4c+EdTdlohWvHA0PL1WkXAh9xKinbP0YIKxOBl1nUjfaDR
         dpTmFnXg7LDIeCc8IR+2vUUT2PcuatClXwrJ+SLj/GvkWjXKrJ0iFbgZIytqgdx2I3TP
         LwoWI5Y3h85K1vD8zmTKJ0XQOk1zAgl+mvsGcxvg3Q2/e3P02oYxhubRb3N01uKP9iQW
         Z/cY3XwlOvLfm58edzen5Rfs7eVwP3qW10HcwmXG2U8lqKvc3P/ZayxiqRXfi5Stya9W
         ajx4AujiDF/w5cWzpB/+U4jmV7eFm6XzYWppG+NlordiiScbGRqvQKvYnqVqHIWIyQt4
         lwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779756692; x=1780361492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3bICaotEcFBSHr6aI2IzMVwvas+ixkBgDm+KS5EZIw=;
        b=NDKVY0nbFeX71RD2/TaGIYrOOu4D8rVFYZlRmKhxz4FwE1CHRXgq4SiN+hUGGgmRdI
         udDocM4te4BLPHgrLDGI3fqpR+Nd1TFt5Ym/z3Nibg+G/ueYjJS8ybBJ4a36RjoQscZQ
         7PTPiy9X0K4S4q84jWCvdqEhjNizpl2HjKL6fJrI3aVHm8vZwaD5a7rBpH4moFNv0zby
         cCLS8el2e5fOHuvuh4u4rZMNMin0Qg+L52EfcINoH+bGGx1WyqNAr3k19Uy/0GDFAQII
         JRHmyHKGvqXN0Ohcgi414PR8cWPORgnQ/cDA74gN5P5n5XPim+GU/0wtDbg687jMpH4i
         4GUw==
X-Forwarded-Encrypted: i=1; AFNElJ+sQDQGzAEPkeJ99DiKUYDrWw+nDzkWDyFBgJia+vsbBSQhyS3OT8lymh+4EketrKfEajircvxIlDhT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2FG7XkMlq7FM982aQHo6otP7nYrW2Ngrv9FF23wQylFogdzLP
	EuF0rzqLI9V6MrHQy0I97y7322QNWG23ff/NNyuUopU0anzqA649GSK5fQMEZyIpzfg=
X-Gm-Gg: Acq92OH+wrxgRXuDWzimPT++LttbRdZDgZhstTHPaWu6JwZ4BqFKSqPIXZbG8TVK5a5
	ZorwaoukwkmyGdbwSFDb45S0ft/HxcXqrGu/NMTevJT8SC1ZQWvMnRQWx2H2tiCLKQyng2lW2eG
	McvxgT/xPqs48DG2Pzh/kwQibd8z0Jda1XOmn7YgxZYo4m3PyKLGaCWy9kAn6N1XhViTs4vV91q
	vuFsiu9Ghutp+yyYytU/vwr2QJ7Sx+CB6bpzIkloCLsbrDHE0+EYkxOJp2/BuB9yB6f5sj8rI+w
	73LM3mMFVbU8tLV25rZQqHkQqVveIp9GAqfzmyUNV9VgaKU207uvQIX93lTxYqVTajQWZYtOAzi
	2ThpArcZYnicvON+FH9vERT0+pF7iM85gPfMszA5aYew5PUE3fjctPEISGvtvIQiXzy2vyVXP4n
	viqcitvD+sY2XOoArMvxhV/nfeO0jKQM25cvlZwS4tLb3Dfdq8uQlY/txt0vhxWEePMGeDxQrfy
	LPMIZDJiZjxnvm9PzDgTg==
X-Received: by 2002:a05:600c:4743:b0:490:53d3:4767 with SMTP id 5b1f17b1804b1-49053d34a6dmr185533335e9.7.1779756691883;
        Mon, 25 May 2026 17:51:31 -0700 (PDT)
Received: from [10.202.80.174] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1b3d2sm11824920b3a.26.2026.05.25.17.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 17:51:30 -0700 (PDT)
Message-ID: <983654c3-98a5-46bc-8e8c-e0e780c7dc61@suse.com>
Date: Tue, 26 May 2026 08:51:25 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MIPS: mm: Fix out-of-bounds write in maar_res_walk()
To: "Liam R. Howlett" <liam@infradead.org>
Cc: tsbogend@alpha.franken.de, akpm@linux-foundation.org, rppt@kernel.org,
 catalin.marinas@arm.com, jiaxun.yang@flygoat.com, paulburton@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d060de27-6fdb-452b-95f3-dbcc48db17ff@suse.com>
 <sa4yfm5wnkrzhyviympfo4oenfqytvu7lrtrcbzt3fb5x3jf6v@oolrew3tlyxg>
Content-Language: en-US
From: Yadan Fan <ydfan@suse.com>
In-Reply-To: <sa4yfm5wnkrzhyviympfo4oenfqytvu7lrtrcbzt3fb5x3jf6v@oolrew3tlyxg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14736-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ydfan@suse.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BAE2C5CF530
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Liam,

On 5/25/26 22:15, Liam R. Howlett wrote:
> On 26/05/25 07:06PM, Yadan Fan wrote:
>> maar_res_walk() uses wi->num_cfg as the index into the fixed-size
>> wi->cfg array, but checks whether the array is full only after it has
>> filled the selected entry. If walk_system_ram_range() reports more than
>> 16 memory ranges, the overflow call writes one struct maar_config past
>> the end of the array before WARN_ON() prevents num_cfg from advancing.
>>
>> Move the full-array check before taking the array slot. Keep the
>> existing behavior of warning and returning 0 when the scratch array has
>> no room left.
>>
>> Fixes: a5718fe8f70f ("MIPS: mm: Drop boot_mem_map")
>> Signed-off-by: Yadan Fan <ydfan@suse.com>
>> ---
>>  arch/mips/mm/init.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
>> index 55b25e85122a..0ba958b7ffa5 100644
>> --- a/arch/mips/mm/init.c
>> +++ b/arch/mips/mm/init.c
>> @@ -272,9 +272,15 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
>>  			 void *data)
>>  {
>>  	struct maar_walk_info *wi = data;
>> -	struct maar_config *cfg = &wi->cfg[wi->num_cfg];
>> +	struct maar_config *cfg;
>>  	unsigned int maar_align;
>>  
>> +	/* Ensure we don't overflow the cfg array */
>> +	if (WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
>> +		return 0;
> 
> We should probably change this to WARN_ON_ONCE() if we're moving it?

Yes, it should be WARN_ON_ONCE() to avoid repeated warnings later once wi->num_cfg reached ARRAY_SIZE(wi->cfg),
I will change it in patch V2.

> 
>> +
>> +	cfg = &wi->cfg[wi->num_cfg];
>> +
>>  	/* MAAR registers hold physical addresses right shifted by 4 bits */
>>  	maar_align = BIT(MIPS_MAAR_ADDR_SHIFT + 4);
>>  
>> @@ -283,9 +289,7 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
>>  	cfg->upper = ALIGN_DOWN(PFN_PHYS(start_pfn + nr_pages), maar_align) - 1;
>>  	cfg->attrs = MIPS_MAAR_S;
>>  
>> -	/* Ensure we don't overflow the cfg array */
>> -	if (!WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
>> -		wi->num_cfg++;
>> +	wi->num_cfg++;
> 
> AFAICT, this is the only place num_cfg is incremented.  Since we are
> trying to avoid overflow, I think the initial logic is flawed in that we
> do trigger too late - we can write one beyond the array index max (to
> the array size).
> 
> But what you have done changes the functionality in a subtle way - we
> won't keep overwriting the last entry (as, I think was the initial
> intent here?)

Yes.

> 
> I don't think what you did is wrong, but I think this is changing the
> intended functionality and you should say so in the commit log.  Right
> now you are saying it doesn't change it, but I think it does - although
> before we were overwriting beyond the array max so I doubt it makes a
> difference and this is obviously better.

Yes, it's a behavior change indeed, I will say so for this in commit log in patch V2.

Thanks,
Yadan

