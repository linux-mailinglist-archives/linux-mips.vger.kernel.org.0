Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120A332362C
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 04:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbhBXDqM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 22:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbhBXDqK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 22:46:10 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F957C061574;
        Tue, 23 Feb 2021 19:45:30 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id p21so579394pgl.12;
        Tue, 23 Feb 2021 19:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3EYKZdzP8wPK+dl4JH9FQMcbV9MXoGxkn/hUlPNy/N4=;
        b=hb3Oio76zlDKmXmAfjlWGvJ6I30v+XGIk/wKws+9y7gLSCe1lK3YF3YJ9le/RhQN9l
         qNDpDrQOi7egkukA/iYXfWen9SbcPzqN8qy69dRabb7C4wdfOJgYnGEjeFMTlHclv4+i
         XAQX7RNx/trHnM0UrpVHL1OlU4uZt7fKd3A/AWHoYVc+/PlXjAtt4KkPQ8lw0F+9r715
         m5+LntjO0YTzqNdD8n0FPMcou4YEYIx4O65PnOGvLHZlB6pDwILf+56MsSjkLdTIv3XX
         qB7n+AUIXaN+JVJt73nBxGlRnhZ0RkEU9UwuG84HOi231sgPrUN39nR6ZH+Zad07MDsv
         qnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3EYKZdzP8wPK+dl4JH9FQMcbV9MXoGxkn/hUlPNy/N4=;
        b=ZrYbC+9Buk3TboRZuDR7kE2za/Qvwojirl1ff9vLV4AW3O7F9pCS9BYmWWkEnzzdQI
         pY0QaCLotf9OgyH+1YTIF64cniWyWTDo1kgiZmL7+0+56AzM4GO/CLOirs7D95MS0OqF
         i66yB/30JGkQu0wi7nwkCq5Gp97rKlyf1bdiPC9dCtKCfvZnimWPsfCfEt3dUVuhxR0m
         LByzrx39VumPkz+fPw0d7hPfljycJ98qdMBZvB3WvylBMxNH/Rt1PAQQXAP/S2CFMhyr
         nj0JHDWMGYLnRIS9H6juGMKBkb+KP/7dkeO7T2PA0fNS5dYUCJ8IaP66juE4V0jueMJQ
         bu7Q==
X-Gm-Message-State: AOAM530V86XTL5/z/ZZzgiG2f0RY/UPIvQxpPUofGIyyBMVUJ0RTbbL2
        K6SQR3QckKSGJ39KC76CsBzYoZ/SCrQ=
X-Google-Smtp-Source: ABdhPJz/boSaaNz8rRaQc41xshZw+5Dn6w2TVWd+IF2B9IyS0aA77WIrAUktFehXBw7Xfg4McGyt9Q==
X-Received: by 2002:aa7:8a46:0:b029:1ed:cefd:7f7 with SMTP id n6-20020aa78a460000b02901edcefd07f7mr6440108pfa.46.1614138329379;
        Tue, 23 Feb 2021 19:45:29 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o129sm449940pgo.27.2021.02.23.19.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 19:45:28 -0800 (PST)
Subject: Re: [PATCH] mips: smp-bmips: fix CPU mappings
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210223124817.26486-1-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f4b8718c-ee74-2609-40f6-cb8f62247d51@gmail.com>
Date:   Tue, 23 Feb 2021 19:45:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210223124817.26486-1-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2/23/2021 4:48 AM, Álvaro Fernández Rojas wrote:
> When booting bmips with SMP enabled on a BCM6358 running on CPU #1 instead of
> CPU #0, the current CPU mapping code produces the following:
> - smp_processor_id(): 0
> - cpu_logical_map(): 1
> - cpu_number_map(): 1
> 
> This is because SMP isn't supported on BCM6358 since it has a shared TLB, so
> it is disabled and max_cpus is decreased from 2 to 1.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  arch/mips/kernel/smp-bmips.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> index 359b176b665f..c4760cb48a67 100644
> --- a/arch/mips/kernel/smp-bmips.c
> +++ b/arch/mips/kernel/smp-bmips.c
> @@ -134,17 +134,24 @@ static void __init bmips_smp_setup(void)
>  	if (!board_ebase_setup)
>  		board_ebase_setup = &bmips_ebase_setup;
>  
> -	__cpu_number_map[boot_cpu] = 0;
> -	__cpu_logical_map[0] = boot_cpu;
> -
> -	for (i = 0; i < max_cpus; i++) {
> -		if (i != boot_cpu) {
> -			__cpu_number_map[i] = cpu;
> -			__cpu_logical_map[cpu] = i;
> -			cpu++;
> +	if (max_cpus > 1) {
> +		__cpu_number_map[boot_cpu] = 0;
> +		__cpu_logical_map[0] = boot_cpu;
> +
> +		for (i = 0; i < max_cpus; i++) {
> +			if (i != boot_cpu) {
> +				__cpu_number_map[i] = cpu;
> +				__cpu_logical_map[cpu] = i;
> +				cpu++;
> +			}
> +			set_cpu_possible(i, 1);
> +			set_cpu_present(i, 1);
>  		}
> -		set_cpu_possible(i, 1);
> -		set_cpu_present(i, 1);
> +	} else {
> +		__cpu_number_map[0] = boot_cpu;
> +		__cpu_logical_map[0] = 0;
> +		set_cpu_possible(0, 1);
> +		set_cpu_possible(0, 1);

Duplicate line, with that fixed:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
