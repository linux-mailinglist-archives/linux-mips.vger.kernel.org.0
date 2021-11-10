Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DED244CDCF
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 00:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbhKJX3l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 18:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbhKJX3k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Nov 2021 18:29:40 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD28C061766;
        Wed, 10 Nov 2021 15:26:52 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso611066wmr.4;
        Wed, 10 Nov 2021 15:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=R6O9A/OL5ACgvQEGejdhPcPZuKA5+f9vmTg+6KRmPmI=;
        b=NSGJ6OX9zBWV6MRcXoeVJOtR/k5oZpSBMEJwB/qfq0ATP4B2IkysL9hi9bxoA3HamZ
         C1CIOKNgk9Hl6EdtxdqmyehVPktGIAqw7saxRXlFR8VPuv8jtkrtmv3tYLtFNEwt1kip
         lN1AEStRg+GiI8YD071a7KOmPCtUDd504lLE6nIypUegd97sQNEyuGxzn66pwPEbhkGu
         iNM2SEkbrKeeEC/38YIiIOMs2LWjLyvpd9kCB2xJYFQmJ6ExTn3ObPj+pnaY2jK0JmfT
         xnvH+g636gn7/nzq+TgEQNakC1enRHSI32JgDMvSIWgbXEy/spno8wMrh/DpIzHk5TQr
         ubsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=R6O9A/OL5ACgvQEGejdhPcPZuKA5+f9vmTg+6KRmPmI=;
        b=hZ0CxhVtQ9d/QEGxaXBNyxN9cqMSww2RZJhSY5Ae8q0ukPQDfBqPHALrKm4TOjFq7l
         rgHD5/opkHT6jwhsrOnKC3HU/xj9dtzfMPw9Y4TEaUAIusD/Z8Rfhw7iScXgwoyV5ERG
         NhNjeNOfKsjM99boKS8Sm47D+ae/2eed8Ge54UySZRnvRKm8xhtA87v+sOMsWaGT2S7W
         YmK01pcNQ22OI7oZeHxAdcXaa0KRXSdvnKFH6ijwVOPunJ/1uoj9SNV8l3I61HD4BaX/
         aNDejwwNKFIKNQCQbNdIQot4B95rduCKSByLc7NFxrtWm5FCWxMRNMYzF00ovuk9mbsz
         7+MQ==
X-Gm-Message-State: AOAM533Dl7kCPhWEXuWV1rssr5jPPAPVOLQQ6RWvOV1XlJ4+v/14dbFg
        LwiO2SspGLeU+dtGPV1sjhfUI/1wfw==
X-Google-Smtp-Source: ABdhPJxcGvd0OqqXpXuj2zNqTO1L7vDEgYMCd4MLPq0BllVIT5d4eX9JL46/fV7byNLEMavBVgCWSA==
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr3503000wmg.20.1636586811264;
        Wed, 10 Nov 2021 15:26:51 -0800 (PST)
Received: from [192.168.0.209] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id i15sm6872040wmb.20.2021.11.10.15.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 15:26:50 -0800 (PST)
From:   "Colin King (gmail)" <colin.i.king@googlemail.com>
X-Google-Original-From: "Colin King (gmail)" <colin.i.king@gmail.com>
Message-ID: <74e233c2-fe6a-4f90-4e26-14eb5c72321b@gmail.com>
Date:   Wed, 10 Nov 2021 23:26:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MIPS: generic/yamon-dt: fix uninitialized variable error
Content-Language: en-US
To:     Colin Ian King <colin.i.king@googlemail.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211110232538.1372250-1-colin.i.king@gmail.com>
In-Reply-To: <20211110232538.1372250-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/11/2021 23:25, Colin Ian King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where fw_getenv returns an error when fetching values
> for ememsizea and memsize then variable phys_memsize is not assigned
> a variable and will be uninitialized on a zero check of phys_memsize.
> Fix this by initializing phys_memsize to zero.
> 
> Cleans up cppcheck error:
> arch/mips/generic/yamon-dt.c:100:7: error: Uninitialized variable: phys_memsize [uninitvar]
> 
> Fixes: f41d2430bbd6 ("MIPS: generic/yamon-dt: Support > 256MB of RAM")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   arch/mips/generic/yamon-dt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/generic/yamon-dt.c b/arch/mips/generic/yamon-dt.c
> index a3aa22c77cad..a07a5edbcda7 100644
> --- a/arch/mips/generic/yamon-dt.c
> +++ b/arch/mips/generic/yamon-dt.c
> @@ -75,7 +75,7 @@ static unsigned int __init gen_fdt_mem_array(
>   __init int yamon_dt_append_memory(void *fdt,
>   				  const struct yamon_mem_region *regions)
>   {
> -	unsigned long phys_memsize, memsize;
> +	unsigned long phys_memsize = 0, memsize;
>   	__be32 mem_array[2 * MAX_MEM_ARRAY_ENTRIES];
>   	unsigned int mem_entries;
>   	int i, err, mem_off;
> 

Oops, old SoB. I'll resend a V2.
