Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2733337D1
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 09:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhCJIuy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 03:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbhCJIuc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Mar 2021 03:50:32 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E64C06174A;
        Wed, 10 Mar 2021 00:50:32 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 18so32115967lff.6;
        Wed, 10 Mar 2021 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cXAwMKtrLhlTAKUm2JyzSR52zFEvTMF+n/fM4EEcXZQ=;
        b=T2jCzDOwOsOEX5EXpPC0yhOaXyo1+YjI/JSOIKQno+1XWayLhBq/5zb3bZ7jGiTWfM
         uMOdZUkqLNE74RY/+2Ge7iiQe/2z6+bVULEGHr6185ThcKjRY5YOzQ1gLPPentIvtOjY
         pwi1/DMr1CBWCWBkF2qL8lFcHHw3LpWWAN0AhtW8DxsnlkQxHNBItzTMSICkcnj4KqVT
         +MQWgllGArl0+S8xKUuQ2tN438CTTJ886Wb91ehPse8sYCLB8GIKzFU3DNjaHDVH8LWd
         IOh4KHjnLoHFIw7TIz5yluxCBrZkbvWJ4AYMwjoCxnDoi2Sx5qf6peWZmYFLh3yv7qxm
         w50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cXAwMKtrLhlTAKUm2JyzSR52zFEvTMF+n/fM4EEcXZQ=;
        b=JMgxdtd6lO3E+eRzQl6lbxlQQkEE4yqn51ObfTHrtEEsgoFKKAZJedJEe+4OuuvFw1
         QBC6iaxc1NPokk9a1KT2ctG1y/ByIO1nfWpucmArrNXReyV/gkWAvdm+rs6FiVKqGdX2
         JNNR3lY02H+KCfirEcJAsAiQX1z9I/UxhoZxMy9B7NU/nqqlbU1ud/9hlRCCosII1YFZ
         UFk0b5EUvcDOofH1T4JykdCg4lXJUEGtkj/iFWdb34khw1mjthaWzrw9RZTReCh3E0MY
         agWrQe34Lcq1ioXNDR+iQwM8eCvk0AJW1d3V5/k7Fyk7jqKt04jwfhAqXQcg0WM04T66
         a2XA==
X-Gm-Message-State: AOAM531TZuXecaWNo45Ff2i/MmkWJkglrYvtOxedccGxXswEznshCpNQ
        evjT+51Y4Wgf6cm9xERBgpo=
X-Google-Smtp-Source: ABdhPJzsFIEKJlb4GU7aZlayDwJj3SBRl3sio62s2wScFkSnGweomCVVKSqggJcQc02nYk8rWJBa6Q==
X-Received: by 2002:a05:6512:31d3:: with SMTP id j19mr1438210lfe.495.1615366230885;
        Wed, 10 Mar 2021 00:50:30 -0800 (PST)
Received: from [192.168.1.100] ([178.176.74.161])
        by smtp.gmail.com with ESMTPSA id k6sm2672986lfg.28.2021.03.10.00.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 00:50:30 -0800 (PST)
Subject: Re: [PATCH v4 3/7] MIPS: Loongson64: Add support for the
 Loongson-2K1000 to get cpu_clock_freq
To:     Qing Zhang <zhangqing@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>
References: <20210310075639.20372-1-zhangqing@loongson.cn>
 <20210310075639.20372-4-zhangqing@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <cb549804-4ee1-79ab-d872-3e95bf0cbe55@gmail.com>
Date:   Wed, 10 Mar 2021 11:50:20 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310075639.20372-4-zhangqing@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 10.03.2021 10:56, Qing Zhang wrote:

> Get the fixed-clock from the CPU0 node of the device tree.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Tested-by: Ming Wang <wangming01@loongson.cn>
> ---
> 
> v3-v4: Standard submission of information
>         Add return after error
> 
>   arch/mips/loongson64/time.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/mips/loongson64/time.c b/arch/mips/loongson64/time.c
> index 91e842b58365..2d84f9b20a9b 100644
> --- a/arch/mips/loongson64/time.c
> +++ b/arch/mips/loongson64/time.c
> @@ -11,9 +11,33 @@
>   #include <asm/hpet.h>
>   
>   #include <loongson.h>
> +#include <linux/clk.h>
> +#include <linux/of_clk.h>
>   
>   void __init plat_time_init(void)
>   {
> +	struct clk *clk = NULL;

    You don't seem to need this initializer.

> +	struct device_node *np;
> +
> +	if (loongson_sysconf.fw_interface == LOONGSON_DTB) {
> +		of_clk_init(NULL);
> +
> +		np = of_get_cpu_node(0, NULL);
> +		if (!np) {
> +			pr_err("Failed to get CPU node\n");
> +			return;
> +		}
> +
> +		clk = of_clk_get(np, 0);
> +		if (IS_ERR(clk)) {
> +			pr_err("Failed to get CPU clock: %ld\n", PTR_ERR(clk));
> +			return;
> +		}
> +
> +		cpu_clock_freq = clk_get_rate(clk);
> +		clk_put(clk);
> +	}
> +
>   	/* setup mips r4k timer */
>   	mips_hpt_frequency = cpu_clock_freq / 2;
>   
> 

