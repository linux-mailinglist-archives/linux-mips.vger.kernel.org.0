Return-Path: <linux-mips+bounces-14756-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLJlD/tfFWp7UgcAu9opvQ
	(envelope-from <linux-mips+bounces-14756-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 10:55:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F575D2C80
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 10:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63C523030D62
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 08:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB7B304BDC;
	Tue, 26 May 2026 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rg0V6uBU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D33CEB8E
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785413; cv=none; b=mls/0pu37Gp18DesEU+vV6lKXrtMOTXLfa3DUH6n//j7sNP+BU9pjQLZ2/o0PfDYWLPNmQ/5XBdIqHcw/iz6sMRD+QirKmcnIv/5MN2BWEK73Oz5YI+19tAC6p8Ut6WYfkyiDF9d1AIBlBDevLedFeegsUl2TuhFn9xp00Xrg8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785413; c=relaxed/simple;
	bh=qmOiOS/8u8gLUHjlJbsVBgeo2YCGwMApwnR6otduJNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMCSYtSA00lvTpAt52Dfig8dUC5P1UqLib2L+LnYpAgG6Ab1cqT2xAczulHsEgNClOdG/yPbzEkQ7RQ84VCfA4dFtb84raNd+/EaW9/pCh03zdpoamr8j9qwceBGmBcjJx9Dl0VdNfI03GjOBe+PBZUYt5IrzjFeh7UcAx/hM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rg0V6uBU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so7397430f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 01:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779785410; x=1780390210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fs0o4f88e2YzBUp5ZB+5ZHTjPRkuo/KbEFrLF09ncXU=;
        b=Rg0V6uBU3aQlyjOEskEzdkTUjn+dTH0L3k2l7hIQLipcxvb13TV5TEZlMlcup8ib0v
         q3NACcjYjDv/DNxi+ei1x1sUQe6Wl/kJHuMfHeNAyTJg1WkX4fACvMmkBloPgQAegjI4
         g3t31Qerv4nZcICOMhAhy/gtPM6gBX14CqkUJ/cIPAFWObM6olgDWZgzYNK2pNeJHnx/
         ITUZAX2q4d9uEoSXEqsubHGcbCq+C5nw1FZVtPdIg2r0SuQKUIBCalavesFCcxuOcepT
         vkDU0cyX9dBxMV5bCq6gtCrAdbp1PTvBXfyad/nTN7jaoV5zgS6RyjiOqhNPUnC6bhd4
         9xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785410; x=1780390210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fs0o4f88e2YzBUp5ZB+5ZHTjPRkuo/KbEFrLF09ncXU=;
        b=oArNqL48fXw41Z+TMKOUNIESLTWFTNh4CkTf8laYUGeVXS6A+2sW2fg4v5C07Avebh
         Rmjf5UOTYsf8+GypKEH+nhHuaU15mKgfXLzzhc7TyC14XWvClGkSjI/jYtipnfC3V9lH
         mg2aGvQUsnsJ+fzqMlaBC907/4rTG9mUURSpUU0XsaOht5+lykLdOyj/Mt+lQCqKScYH
         vavslzqavbCE5ViH8hOVtv0FFP683AlQYxNExwprS8D5diXQHdTfAlni6Wkk4+FPXi6N
         NJlFISX6NJu25sRj9Au1lC11R0vtshw95wW0mFJeWz/NIBDJHtIvhud0Qdbog7ZxAjIX
         4CNA==
X-Forwarded-Encrypted: i=1; AFNElJ/uY+eiuWGSZ+wJJUUqEWQGdHItdcK3GQieeARg68VwHXrIbKJ9PAVcmJLN3DryAoU1QaY6Dk5jVIS6@vger.kernel.org
X-Gm-Message-State: AOJu0YyOghYBm/XXBcQoTGLIXRGbHI+1lHwaTWALwg2Kzqm8uSLyx9CF
	Nm74f/YODUcf+Dj+Ifgq3qAMGqMy+OC/ybnfxtSTRIOZ5eKTfCht3U/KdwZaku0RgWU=
X-Gm-Gg: Acq92OGe/R+0kkmAKm7uiacjhAlMIbBCARvcYMDDN2Gsnkk6YgO/Smw/jGljLyptWDv
	uFPHpavma9HIU1fvKax2ZGpX+nvPl3/Iro3Zdg8Eb207qD1fzW4Pft0YTu54gt8q3GBYuM2hd12
	2U/QdrluGXUIxq9UfCfyPLPE0IkWpArTMW6aBj4zpLLatYCMZOWqYfMko99uo27ZAg/cN9paBiy
	bGVXy6fX0Wr6wUj/Ou6zyTtkFSclXXSBt78I2p2/0bxyLfIYKKJbimsKHomsP5zflm0EmWakMLd
	VTs1o1unNcVt5v/Zw9O0hlwsHWRkRxeK6j09B6v2Sk4rdkJYjjpXbe75TJZKlmC6OaSWmVAgYZP
	C6ZiakNy6zeLQ2m9OqkiKox0yo+sSw/jZqqBysvu/f0R5Q0/l5orWYzqSMc73XLwJEgai+tppv9
	3jiuJ+cjiH160p0q690d7ESwGgUjsEA6J6Ik8/2xRiJL5yWF1YGsJEvsdIta7pPxic2xIlzEOT0
	Zn/FL9OHeXZesfRGIsDZQ==
X-Received: by 2002:a05:600d:108:10b0:490:53b0:9e5a with SMTP id 5b1f17b1804b1-49053b09ff3mr132814555e9.5.1779785409766;
        Tue, 26 May 2026 01:50:09 -0700 (PDT)
Received: from [10.202.80.174] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a676e195asm6215388a91.1.2026.05.26.01.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 01:50:08 -0700 (PDT)
Message-ID: <4c776dd6-528e-46a6-bcf0-795b84c7ac19@suse.com>
Date: Tue, 26 May 2026 16:50:03 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MIPS: mm: Fix out-of-bounds write in maar_res_walk()
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Liam R. Howlett" <liam@infradead.org>, akpm@linux-foundation.org,
 rppt@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com,
 paulburton@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <d060de27-6fdb-452b-95f3-dbcc48db17ff@suse.com>
 <sa4yfm5wnkrzhyviympfo4oenfqytvu7lrtrcbzt3fb5x3jf6v@oolrew3tlyxg>
 <983654c3-98a5-46bc-8e8c-e0e780c7dc61@suse.com>
 <ahVEYycsosURdepH@alpha.franken.de>
Content-Language: en-US
From: Yadan Fan <ydfan@suse.com>
In-Reply-To: <ahVEYycsosURdepH@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14756-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ydfan@suse.com,linux-mips@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E7F575D2C80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

On 5/26/26 14:57, Thomas Bogendoerfer wrote:
> On Tue, May 26, 2026 at 08:51:25AM +0800, Yadan Fan wrote:
>> Hi Liam,
>>
>> On 5/25/26 22:15, Liam R. Howlett wrote:
>>> On 26/05/25 07:06PM, Yadan Fan wrote:
>>>> maar_res_walk() uses wi->num_cfg as the index into the fixed-size
>>>> wi->cfg array, but checks whether the array is full only after it has
>>>> filled the selected entry. If walk_system_ram_range() reports more than
>>>> 16 memory ranges, the overflow call writes one struct maar_config past
>>>> the end of the array before WARN_ON() prevents num_cfg from advancing.
>>>>
>>>> Move the full-array check before taking the array slot. Keep the
>>>> existing behavior of warning and returning 0 when the scratch array has
>>>> no room left.
>>>>
>>>> Fixes: a5718fe8f70f ("MIPS: mm: Drop boot_mem_map")
>>>> Signed-off-by: Yadan Fan <ydfan@suse.com>
>>>> ---
>>>>  arch/mips/mm/init.c | 12 ++++++++----
>>>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
>>>> index 55b25e85122a..0ba958b7ffa5 100644
>>>> --- a/arch/mips/mm/init.c
>>>> +++ b/arch/mips/mm/init.c
>>>> @@ -272,9 +272,15 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
>>>>  			 void *data)
>>>>  {
>>>>  	struct maar_walk_info *wi = data;
>>>> -	struct maar_config *cfg = &wi->cfg[wi->num_cfg];
>>>> +	struct maar_config *cfg;
>>>>  	unsigned int maar_align;
>>>>  
>>>> +	/* Ensure we don't overflow the cfg array */
>>>> +	if (WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
>>>> +		return 0;
>>>
>>> We should probably change this to WARN_ON_ONCE() if we're moving it?
>>
>> Yes, it should be WARN_ON_ONCE() to avoid repeated warnings later once wi->num_cfg reached ARRAY_SIZE(wi->cfg),
>> I will change it in patch V2.
> 
> no need for that, just return -1 in the error case, this will terminate
> the walk

Right, I will change this in v3.

> 
>>>
>>>> +
>>>> +	cfg = &wi->cfg[wi->num_cfg];
>>>> +
>>>>  	/* MAAR registers hold physical addresses right shifted by 4 bits */
>>>>  	maar_align = BIT(MIPS_MAAR_ADDR_SHIFT + 4);
>>>>  
>>>> @@ -283,9 +289,7 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
>>>>  	cfg->upper = ALIGN_DOWN(PFN_PHYS(start_pfn + nr_pages), maar_align) - 1;
>>>>  	cfg->attrs = MIPS_MAAR_S;
>>>>  
>>>> -	/* Ensure we don't overflow the cfg array */
>>>> -	if (!WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
>>>> -		wi->num_cfg++;
>>>> +	wi->num_cfg++;
>>>
>>> AFAICT, this is the only place num_cfg is incremented.  Since we are
>>> trying to avoid overflow, I think the initial logic is flawed in that we
>>> do trigger too late - we can write one beyond the array index max (to
>>> the array size).
>>>
>>> But what you have done changes the functionality in a subtle way - we
>>> won't keep overwriting the last entry (as, I think was the initial
>>> intent here?)
>>
>> Yes.
> 
> no it wasn't. Before the switch to maas_res_walk the to be filled array
> was exactly the needed size. Now we don't know how many entries there
> are, but the limiting point is the numer of configured maar entries,
> which might be even less than the 16 entries of the array. So we have
> to deal with this problem anyway.
> 
> Thomas.
> 

Thanks,
Yadan


