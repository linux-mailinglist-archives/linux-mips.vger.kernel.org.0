Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D76262987
	for <lists+linux-mips@lfdr.de>; Wed,  9 Sep 2020 10:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgIIIGJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Sep 2020 04:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729953AbgIIIFj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Sep 2020 04:05:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D67C061786
        for <linux-mips@vger.kernel.org>; Wed,  9 Sep 2020 01:05:37 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w3so2314920ljo.5
        for <linux-mips@vger.kernel.org>; Wed, 09 Sep 2020 01:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kUDQ/A/7r3wofWX/QHUVuIaj16Nu82UFDPBg8MWBoQA=;
        b=Tpu4mnshmxAN7nMDw+IpfuGThaPlG0xC7g9iDAkxeyoqbq6LVoIwm9iiSs8Fh5O1Kn
         1zvW4JvuizULWV03JPreJCiSI6lXjHgC4lZCZNpw7Z7xwiTMfTUgWT6QJ/L+7hJWsze8
         G2WTTzOpWz8hPlLdw9yIVvAlhgfHun09Hvb5hVQq618VCW2Nb5rTgxxFthtFLpKw13QK
         pHG9TxUOkkogIfSkJ5FJHApUWiEqR1cjCmfTxahEc/2IShC0tRtqrdHSsqyV6vLJY/PI
         7oKUf9ow9gt8OHVT+JNFn0ZtKGPa/jkyFrEAMnjegSLXST4TZaleNPqmSMo0OoVPq0kt
         71Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kUDQ/A/7r3wofWX/QHUVuIaj16Nu82UFDPBg8MWBoQA=;
        b=d41eTh16HRMtb/YanAZHtDGP+TOf5HkPzJewf2yAD2xSVkq/RpvPFbGK3Dk1XZbwko
         y/3AIbbm1Bh9YD1MvrRzN+tc3oB5ZmR7CIGuaZuvB5QjFiKar6PuVdXHZzKK9yLdWAhY
         w+hQ5EWMEthmmWMZQH/IHeGnD65LquOcdKv/ypehVCU37XtK5sc3PCJnRrV0geJSBh50
         oAoCmNTFu3wZ05XdvHAsnA3lI9xgkhJBo22hEZcHuGuWzKm609G8skq/oN0Lrv+qwVA4
         u/wuxkeNvRNy+HheNoWrslAvhuzvq2UA0n2FICUdf+AX2nTFAMTJhl4D8Y0qZQbHC2Vs
         IWCQ==
X-Gm-Message-State: AOAM5307FQroJFL2ZMgQadHJIsLKNXybwza9OOG2Nikc/EURXq9f/q82
        JSxBvGjhKynlNk//7RC5fp8=
X-Google-Smtp-Source: ABdhPJxUhaPzRapwN2B+yCIPkrI00V1rJ6vIEC9P3gCKVXumx/L+eklVdYLaN9dWNHsVws4WrnXmRQ==
X-Received: by 2002:a2e:2c0e:: with SMTP id s14mr1251353ljs.174.1599638736217;
        Wed, 09 Sep 2020 01:05:36 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:290:64e3:f5dd:84ac:70b0:5629? ([2a00:1fa0:290:64e3:f5dd:84ac:70b0:5629])
        by smtp.gmail.com with ESMTPSA id b21sm404583lfb.52.2020.09.09.01.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 01:05:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/radeon: Don't use WC for VRAM if
 !RADEON_GEM_GTT_WC
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1599625320-17637-1-git-send-email-chenhc@lemote.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <2f27413d-9b01-b865-4e47-79a0cf12ec84@gmail.com>
Date:   Wed, 9 Sep 2020 11:05:28 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599625320-17637-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 09.09.2020 7:21, Huacai Chen wrote:

> Though RADEON_GEM_GTT_WC is initially used for GTT, but this flag is
> bound to drm_arch_can_wc_memory(), and if arch doesn't support WC, then
> VRAM should not use WC.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>   drivers/gpu/drm/radeon/radeon_object.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index f3dee01..07b82d9 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -117,10 +117,16 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
>   						     TTM_PL_FLAG_VRAM;
>   		}
>   
> -		rbo->placements[c].fpfn = 0;
> -		rbo->placements[c++].flags = TTM_PL_FLAG_WC |
> -					     TTM_PL_FLAG_UNCACHED |
> -					     TTM_PL_FLAG_VRAM;
> +		if (rbo->flags & RADEON_GEM_GTT_WC) {
> +			rbo->placements[c].fpfn = 0;

    Shouldn't this statement be placed outside *if* as before?

> +			rbo->placements[c++].flags = TTM_PL_FLAG_WC |
> +						     TTM_PL_FLAG_UNCACHED |
> +						     TTM_PL_FLAG_VRAM;
> +		} else {
> +			rbo->placements[c].fpfn = 0;
> +			rbo->placements[c++].flags = TTM_PL_FLAG_UNCACHED |
> +						     TTM_PL_FLAG_VRAM;
> +		}
>   	}
>   
>   	if (domain & RADEON_GEM_DOMAIN_GTT) {

MBR, Sergei
