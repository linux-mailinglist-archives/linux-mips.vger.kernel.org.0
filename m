Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48FF9D0EEF
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 14:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbfJIMfV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 08:35:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51278 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbfJIMfV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 08:35:21 -0400
Received: by mail-wm1-f66.google.com with SMTP id 7so2405164wme.1
        for <linux-mips@vger.kernel.org>; Wed, 09 Oct 2019 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jp4WGJoCxtUdwSf6t18Ca1oWK5HBTBatFi+wAVGb1Ps=;
        b=lwajU2s3mFnOWL2vvhYHuaHwB+uJ36WiOsb9fSx7i58fl41ce7gUq+6ykOkNb3Y9fM
         lesdKCvW2lRuq51XTFqgShDxYFsDUxKfmzFFZrcldVyErAmZ8QKGf/sIEhmhD/sCH2e6
         KiKyXvLXPuSdtcPRa0tiX/xbVMZtl+SjljtV3vfgYAsNWhNJl4nDZIr3lCfSkxSz8Bi2
         LplzRmSHqGSXjX60xY2QH583w3f8zYT1QG6SN934yXgQ7agGty9dDnBIdiZhVvm6wmpL
         W+d6FAS13GzGuFwhxnmkXVFV6UCR4C85E9l/Yz1GJpFIQyMNG1nvyQtKc1lZBiQI0G5p
         hHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jp4WGJoCxtUdwSf6t18Ca1oWK5HBTBatFi+wAVGb1Ps=;
        b=QUJVieNzooXzUmYmTPO0m5RG5QFFMBo0ZAfzdGAfqAIqhwC2Tp3jL3Kwq8320EONFM
         Yh9sJmWhiJcRODIjKrs4LjR33LOfTZIlvwanDZf2BLEWxnFq2s+AmgmOf9GznbpEY9+j
         GBzTX5y7ACMU0taEfuVk/49sdziYFBGL5op5GsxL/vUp55/hbRBKSNN9qMMzxQPYeADn
         K/oTxqOkUO4sqbbm1gfEfaFqJeBgL3yu0bClsE9ECKh/41F8J9LmAxa7qiy/yMrXRFGY
         BUKNWbzll530e+2dWyCGExvJHArTwUGFLqDP4mrrh3xvZTwwe0K886zJ0Zph7E6siVf3
         u5rg==
X-Gm-Message-State: APjAAAVJEkBj9f7FNaTuyCo8gPtYU/pN++Ospr/w6LaQ0hiYYP+vR4M1
        TalLwip9M5NTGIkpS4DAMBQ=
X-Google-Smtp-Source: APXvYqyBmO0/R1MqRmn24sZY0BqO3MNbGdQ3g58ghkO176ZQ4+2/HmXO8R5t+UJILqv+oH43twLKWA==
X-Received: by 2002:a1c:658a:: with SMTP id z132mr2403141wmb.174.1570624519437;
        Wed, 09 Oct 2019 05:35:19 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id o22sm5865299wra.96.2019.10.09.05.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 05:35:18 -0700 (PDT)
Subject: Re: [PATCH 2/4] MIPS: cmdline: Remove CONFIG_MIPS_CMDLINE_DTB_EXTEND
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>
References: <20191007221951.1889661-1-paul.burton@mips.com>
 <20191007221951.1889661-2-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b6e394c4-8f02-7623-23ef-3a4aee90eb64@amsat.org>
Date:   Wed, 9 Oct 2019 14:35:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191007221951.1889661-2-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/8/19 12:20 AM, Paul Burton wrote:
> CONFIG_MIPS_CMDLINE_DTB_EXTEND is not selected by any of our defconfigs,
> so remove it to simplify the messy command line logic in arch_mem_init()
> a little.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> ---
> 
>   arch/mips/Kconfig        | 4 ----
>   arch/mips/kernel/setup.c | 7 -------
>   2 files changed, 11 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ec922e6ff40b..736b691e7e5e 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3028,10 +3028,6 @@ choice
>   		depends on USE_OF
>   		bool "Dtb kernel arguments if available"
>   
> -	config MIPS_CMDLINE_DTB_EXTEND
> -		depends on USE_OF
> -		bool "Extend dtb kernel arguments with bootloader arguments"
> -
>   	config MIPS_CMDLINE_FROM_BOOTLOADER
>   		bool "Bootloader kernel arguments if available"
>   endchoice
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index c2a09f082d88..273b26a81935 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -540,7 +540,6 @@ static void __init check_kernel_sections_mem(void)
>   
>   #define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
>   #define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
> -#define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
>   
>   /*
>    * arch_mem_init - initialize memory management subsystem
> @@ -588,12 +587,6 @@ static void __init arch_mem_init(char **cmdline_p)
>   	    (USE_DTB_CMDLINE && !boot_command_line[0]))
>   		strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
>   
> -	if (EXTEND_WITH_PROM && arcs_cmdline[0]) {
> -		if (boot_command_line[0])
> -			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> -		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
> -	}
> -
>   #if defined(CONFIG_CMDLINE_BOOL)
>   	if (builtin_cmdline[0]) {
>   		if (boot_command_line[0])
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
