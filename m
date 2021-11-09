Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE2944A561
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 04:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238392AbhKIDnQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Nov 2021 22:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbhKIDnP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Nov 2021 22:43:15 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E32BC061570;
        Mon,  8 Nov 2021 19:40:30 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id l7-20020a0568302b0700b0055ae988dcc8so25706417otv.12;
        Mon, 08 Nov 2021 19:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ngf7gMSmerJywq9FT1nmK0MF999khKfLCR+AcnfxNMQ=;
        b=SgD+hdWa+2seXlQCkKpoRKCrhkCBmsBAsA0lNjKhKFgbseqprw/RrPOoN5FWhzzxu+
         nnzEmMXeCVidwaoM1z3EPzXqg5VO6w2G5PZZq14jVbigu2C19wkYM8f65J2ncaEWyGN8
         yX31GJVwY8+Fufbyt4WdtwgBozpxYcUwqjIhtkMeexFO72TSxRsPRMd21Oh1LefTwxh8
         d0v7D2tcJFqKT/RM9Z3QSoZhdzob06lOUS31QTsxK5jCBu9C1OsO9dlJZj9Nk8nhXjQS
         Qh4zmaFSS3C6vA2HObzyc9PD0Q/5SXV3JX6MoxFnpvHqxpfYrsVEyUaOJ5pXJIiH3A60
         3Qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ngf7gMSmerJywq9FT1nmK0MF999khKfLCR+AcnfxNMQ=;
        b=vLdK+rVNEdXdLdkFmYWsoDbILKLWto2Q7e31YzrrHrbQBRDLaBixVqF8kH8Gvp6/F+
         rmAw1o3CNW5qU/PPdZiLxd0YGwFHyZ69pzj0GrX21aOZ96NT7ysNrcEcMCAUBBJOP5TV
         QudGN/bffGONc/ilQ3CeJ883vZM56PunxKokoMTphRu0werHMozVUla+rsBuc3a9cYIA
         eFqNCcFm9TbhGzwtCQ8/K4QINNBfU5CUW4ArWkBr/Pu4jhovmehcRgsgI1gY2T/haMCc
         2tCaXvnQV8jDztSTCZa3n04rGkvunVm2O3tkK8xL/ONh9nNO09ZASjBp/RPSTrOm8z6z
         qQ1Q==
X-Gm-Message-State: AOAM533Bo0xTS60a5azpq4AQqbhqKD/RLKsSGX81nwjIMhX+WF6V/7i2
        pW5G4XY1KpEDYzSugXVPbHRqcBoR+3Cu8A==
X-Google-Smtp-Source: ABdhPJw3f8Ay3G1EDWJUNRllFAAAFW0bUDm4B+jKzCzsFi30KG8ZWSNGukedQxGYJzFkSakpu0UllQ==
X-Received: by 2002:a05:6830:563:: with SMTP id f3mr3427366otc.205.1636429229554;
        Mon, 08 Nov 2021 19:40:29 -0800 (PST)
Received: from ?IPV6:2600:1700:dfe0:49f0:2dd5:c15e:10f0:cfd? ([2600:1700:dfe0:49f0:2dd5:c15e:10f0:cfd])
        by smtp.gmail.com with ESMTPSA id t13sm2015266oiw.30.2021.11.08.19.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 19:40:28 -0800 (PST)
Message-ID: <04935513-dea8-ab98-ed97-8ef778e44318@gmail.com>
Date:   Mon, 8 Nov 2021 19:40:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] irqchip/irq-bcm7120-l2: add put_device() after
 of_find_device_by_node()
Content-Language: en-US
To:     cgel.zte@gmail.com
Cc:     tglx@linutronix.de, maz@kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Ye Guojin <ye.guojin@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20211109032943.129855-1-ye.guojin@zte.com.cn>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211109032943.129855-1-ye.guojin@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/8/2021 7:29 PM, cgel.zte@gmail.com wrote:
> From: Ye Guojin <ye.guojin@zte.com.cn>
> 
> This was found by coccicheck:
> ./drivers/irqchip/irq-bcm7120-l2.c,328,1-7,ERROR  missing put_device;
> call of_find_device_by_node on line 234, but without a corresponding
> object release within this function.
> ./drivers/irqchip/irq-bcm7120-l2.c,341,1-7,ERROR  missing put_device;
> call of_find_device_by_node on line 234, but without a corresponding
> object release within this function.
> 
> Addtionally, fixup the potential problem that memory is not released
> before return.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
> ---
>   drivers/irqchip/irq-bcm7120-l2.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
> index d80e67a6aad2..aaa70619f3c0 100644
> --- a/drivers/irqchip/irq-bcm7120-l2.c
> +++ b/drivers/irqchip/irq-bcm7120-l2.c
> @@ -325,7 +325,7 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
>   	pr_info("registered %s intc (%pOF, parent IRQ(s): %d)\n",
>   		intc_name, dn, data->num_parent_irqs);
>   
> -	return 0;
> +	ret = 0;

That cannot be right, we would take the irq_free_domain label and 
unregister the interrupt domain. The put_device() ought to be done when 
we stop making use of the platform_device, that is at line 246 after we 
call platform_irq_count().

Thanks!
-- 
Florian
