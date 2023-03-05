Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F84F6AAE98
	for <lists+linux-mips@lfdr.de>; Sun,  5 Mar 2023 09:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCEIll (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Mar 2023 03:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjCEIll (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Mar 2023 03:41:41 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE8114EBD
        for <linux-mips@vger.kernel.org>; Sun,  5 Mar 2023 00:41:39 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bi9so8902964lfb.2
        for <linux-mips@vger.kernel.org>; Sun, 05 Mar 2023 00:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678005698;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/6jq56Yvc36xd1OM1A2FdfBvyFdAynxYAYf7yoRefU=;
        b=pP/gZGnFOsR0wCNbLoe32dFHLTNuaNiBtIRtGyO9SioqV5xsoH7ePuv0xEjVbPSXEe
         Y1bFIlVfF84xlI35V6QoyWedzr05Xp+uiJha6gZtqnsaEXyWa8IRUW04BnH7+d3gZHum
         0drC3qBIdt5SmMEc3cgw/ipn73zblPw3Ey3VlrxAuS+I9Y5ad4WaV1dFeLGGF3wJsmPh
         vjvxB4TlAvjpT37DTYT8+Qe4QTu6rgPIMk09dnxQYdb70M+JJU4m67K6P1WPcDG7jEqL
         j0HCDrIxPzG5HyGPTFN4PUF2gpfmWLGy2xRIBoUmVjHlWmEerohe/fs+IkDJsEx9nTOi
         ONSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678005698;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/6jq56Yvc36xd1OM1A2FdfBvyFdAynxYAYf7yoRefU=;
        b=D7sLCY/3C41rRlNBlvYMz6/8W14L7E8DqFhl+9l+JjkQAGxkzAoLQDiW0aSd+1dDqA
         VdgLpeu9p4f1kexSlfSJRnlGCWwmFj0aewgny46g+7te1FbwfeUjn60PVgAt8bvmeJsr
         2W2pNnuUsUCZQqpmLW31p9xQkAE8/diqB/mX9MkkOj43wsflAGyTUWqf35vzTopzKQH/
         MmE9VgiMoYLV125tV7ajfqMPYRgKJ+IpOrnriOVAjnH9R2OEisaX1eTOv5s8LbYPMz1o
         H3xpGHAoS5q9xMce4H1k4DiJqYDGix+JsXJXcy5F8fGa7fWWVa3MZfHUD6Ku0c2ncJCZ
         AfVg==
X-Gm-Message-State: AO0yUKUyeoa/ILPUa8MyzdVD5z0eSY/VCGMnr0x1Q3AMHeZlfm7j9MCl
        pZav/Xr/f12Sxknhi98IG7p5dFxOp8A=
X-Google-Smtp-Source: AK7set8K7EUQYZl/Ut9AIRGhjvwu5TxRVlV73aqye7TMxkcTM2mAHWJ8joWqC/Xk7qf3Hje9uxRLDQ==
X-Received: by 2002:a05:6512:4d9:b0:4db:3e7e:51dc with SMTP id w25-20020a05651204d900b004db3e7e51dcmr2115824lfq.55.1678005697860;
        Sun, 05 Mar 2023 00:41:37 -0800 (PST)
Received: from [192.168.1.103] ([178.176.79.54])
        by smtp.gmail.com with ESMTPSA id t8-20020a2e9d08000000b00295a3a64816sm1174092lji.2.2023.03.05.00.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 00:41:37 -0800 (PST)
Subject: Re: [PATCH 06/12] MIPS: c-octeon: Provide alternative SMP cache flush
 function
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org
References: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
 <20230304221524.47160-7-jiaxun.yang@flygoat.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <defab4e3-85c7-1fed-729f-6eb12a4b7a0c@gmail.com>
Date:   Sun, 5 Mar 2023 11:41:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230304221524.47160-7-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 3/5/23 1:15 AM, Jiaxun Yang wrote:

> Curretly c-octeon relies on octeon's own smp function to flush

   Currently.

> I-Cache. However this function is not available on generic platform.
> 
> Just use smp_call_function_many on generic platform.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/mm/c-octeon.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
> index c7ed589de882..61db09e5044c 100644
> --- a/arch/mips/mm/c-octeon.c
> +++ b/arch/mips/mm/c-octeon.c
> @@ -83,8 +83,14 @@ static void octeon_flush_icache_all_cores(struct vm_area_struct *vma)
>  	else
>  		mask = *cpu_online_mask;
>  	cpumask_clear_cpu(cpu, &mask);
> -	for_each_cpu(cpu, &mask)
> +#ifdef CONFIG_CAVIUM_OCTEON_SOC
> +	for_each_cpu(cpu, &mask) {
>  		octeon_send_ipi_single(cpu, SMP_ICACHE_FLUSH);
> +	}

   I think {} aren't needed here.

> +#else
> +	smp_call_function_many(&mask, (smp_call_func_t)octeon_local_flush_icache,
> +			       NULL, 1);
> +#endif
>  
>  	preempt_enable();
>  #endif

MBR, Sergey
