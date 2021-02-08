Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D79A31334D
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 14:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhBHNaM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 08:30:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhBHNaJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 08:30:09 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FFCC06178A;
        Mon,  8 Feb 2021 05:29:28 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b2so22262240lfq.0;
        Mon, 08 Feb 2021 05:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RyLwPT3GHw6JYmtTI8M0PyhX/t7afEssKqL/jTmTA/w=;
        b=EHnCAVxivzOfmrOhaDUYBJyzfNrySt8i0cZZD2d2goY15qOIQmGlAcucOfuYzQG1xh
         YhwOf6lpZt/i2mj8BnVzubwiahPCfnGcT4l6xMwZHI/4cM8A2B88ijqSEbntq/Q2oInD
         P1/P9MMwWCR+mdTjLx1qR6cHocfiEYE3uh4GjbxkryFfvjaTtbuaa4PzMTP2TcxbjuWo
         OoaiU6gbK/gShxwKEmsakDlOMwLSLvFuhMwqRE8WxUVmTuKaK8EnFGT+dzS+RIg4NcyG
         wtTqipo2fz/iWZL2dHQP1T/5j6uO38s+HealdetTsjkhBPKx3CCQ/PBsw2Y4x/ZL9Pd+
         hIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=RyLwPT3GHw6JYmtTI8M0PyhX/t7afEssKqL/jTmTA/w=;
        b=qyrBYHDDXKPYtqfj+Zh4MKD98qJrQa1e3jRAVu1SI78f4bGMtMCoXlO0t21lceXDjt
         RpJmbP9d46i6d8CD3y2adfj60o03vXM//gF6eO4jpsQPprWHVRdKsHmxx/UJwXNTv0vO
         /1yrRulllzOvEtrc01w1VBoG727PlfWLAtXG7ZkXmzGZqukZAxp6tThOgM0yLEmgSw4v
         Fjf+uZQhv/JuRfuJTMpKQ5DpI5CjngHAVqxhJkDxZAb2olARmxqdWF3OmsUHVtdYwslF
         GzSkAFIso1xc5HAlzH8mZrxa1ozhUXgAXXURuReW8B1dvSx1XrEuF7ep7LVLE+qZ/8Zr
         ADtg==
X-Gm-Message-State: AOAM532zbKR3T+B53JADpKbGVUMTYRa12XnnDhw+9GocyNBFhpVc7h/M
        va5OcuUBilR8bkNNiqZiRhQ=
X-Google-Smtp-Source: ABdhPJwzJwOAkF0PQ/K2SKXSYwaRQoZvGUVhTfspK6P+g/O34bn3mfv0tc0vw6CCn2PRQtFqewbC5w==
X-Received: by 2002:a05:6512:2201:: with SMTP id h1mr10001623lfu.480.1612790967001;
        Mon, 08 Feb 2021 05:29:27 -0800 (PST)
Received: from ikhorn (ip-0439.rusanovka-net.kiev.ua. [94.244.4.57])
        by smtp.gmail.com with ESMTPSA id f25sm2093050lfk.218.2021.02.08.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:29:26 -0800 (PST)
Date:   Mon, 8 Feb 2021 15:29:24 +0200
From:   Ivan Khoronzhuk <ivan.khoronzhuk@gmail.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Ivan Khoronzhuk <ikhoronz@cisco.com>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        yangtiezhu@loongson.cn
Subject: Re: [PATCH] mips: kernel: setup: fix crash kernel resource allocation
Message-ID: <20210208132923.GB4740@ikhorn>
Mail-Followup-To: Mike Rapoport <rppt@kernel.org>,
        Ivan Khoronzhuk <ikhoronz@cisco.com>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        yangtiezhu@loongson.cn
References: <20210206125940.111766-1-ikhoronz@cisco.com>
 <20210207091842.GU242749@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210207091842.GU242749@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Feb 07, 2021 at 11:18:42AM +0200, Mike Rapoport wrote:
>On Sat, Feb 06, 2021 at 12:59:40PM +0000, Ivan Khoronzhuk wrote:
>> In order to avoid crash kernel corruption, its memory is reserved
>> early in memblock and as result, in time when resources are inited
>> it's not present in memblock.memory, so crash kernel memory is out
>> of ranges listed with for_each_mem_range(). To avoid it and still
>> keep memory reserved lets reseve it out of loop by inserting it in
>> iomem_resource.
>
>Unless I misread the code, the crash kernel memory is actually allocated
>from memblock (memblock_find_in_range + memblock_reserve), but for some
>reason memblock_reserve(<crash kernel>) is called outside
>mips_parse_crashkernel(). So the crash kernel memory is surely in both
>memblock.memory and memblock.reserved and it will be covered by
>for_each_mem_range().
>
>The mips_parse_crashkernel() function and the following reservation of
>crash kernel memory should be merged, IMO, and this can be further
>simplified with memblock_alloc() helpers.
>
>Is there a particular issue you are trying to fix?

Yes, sorry, according to local code, seems like memory was not added
(was reverted memblock_find_in_range for some other reson while
porting), so I had only reserve. The issue is in another place,
so ignoe this patch, for now.

>
>> Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
>> Signed-off-by: Ivan Khoronzhuk <ikhoronz@cisco.com>
>> ---
>> Based on linux-next/master
>>
>>  arch/mips/kernel/setup.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>> index 3785c72bc3bc..25e376ef2f2a 100644
>> --- a/arch/mips/kernel/setup.c
>> +++ b/arch/mips/kernel/setup.c
>> @@ -473,14 +473,15 @@ static void __init mips_parse_crashkernel(void)
>>  	crashk_res.end	 = crash_base + crash_size - 1;
>>  }
>>
>> -static void __init request_crashkernel(struct resource *res)
>> +static void __init request_crashkernel(void)
>>  {
>>  	int ret;
>>
>>  	if (crashk_res.start == crashk_res.end)
>>  		return;
>>
>> -	ret = request_resource(res, &crashk_res);
>> +	/* The crashk resource shoud be located in normal mem */
>> +	ret = insert_resource(&iomem_resource, &crashk_res);
>>  	if (!ret)
>>  		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
>>  			(unsigned long)(resource_size(&crashk_res) >> 20),
>> @@ -734,8 +735,9 @@ static void __init resource_init(void)
>>  		request_resource(res, &code_resource);
>>  		request_resource(res, &data_resource);
>>  		request_resource(res, &bss_resource);
>> -		request_crashkernel(res);
>>  	}
>> +
>> +	request_crashkernel();
>>  }
>>
>>  #ifdef CONFIG_SMP
>> --
>> 2.23.1
>>
>
>-- 
>Sincerely yours,
>Mike.

-- 
Regards,
Ivan Khoronzhuk
