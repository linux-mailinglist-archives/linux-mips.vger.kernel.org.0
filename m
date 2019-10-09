Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1801D0EE6
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 14:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbfJIMeX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 08:34:23 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35514 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730662AbfJIMeX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 08:34:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id v8so2771493wrt.2
        for <linux-mips@vger.kernel.org>; Wed, 09 Oct 2019 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=28CT6QazFQ8ut7QrKs23yRq/Tz85l6WBz3FE+Unwdc4=;
        b=L4CY4+Mja9QomscJFjLmYVRFCbCxGslE6Cw2VFcZFWpXAdogvcNjBtkBKZ6MQ9Y4GV
         hkqQRLgKYI5DACEf2cYHbipQdydD13rAD8btl73v14vZ8p7iuiftRBoM9+Alzwhbze8o
         l0njW0bMsPjzoi94TqKRae53xFc0Bw8MZFAmjWD9nrAgsjm1YL2tL2oXjXlE0mhMWeh3
         kx6v49jQkwB4UXTLBSAOEKcbEZclNkGWcVDu07zeHNALBxhyyGq2Ozv+AVWK1+mud5BK
         8VmQ4XyCjWwZM3KD+gR8THDqJsBm5bdFioL8IOvdGuecpc+9jlxXCTO50zfDPuZYl9b9
         dohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=28CT6QazFQ8ut7QrKs23yRq/Tz85l6WBz3FE+Unwdc4=;
        b=YFLIgFPD5I9qFlScgcGsUjd7e2YSGp9Mtf+MsSfhCeY8eDn9Gb11lgdbR0LKOtUSUQ
         +RgJP8LLJLacf3IR+IeuHhQ835Tg/DTXvSlgoTU9LN6OM+0ONGH8IFVlrFz6plUbVgUS
         Z+fhSAHm0Ltppf60twz0GrMBcqNKezvghMr5PtkCblX9jrk1oDA+g2X9kKagiIDsNQOZ
         0ZQd/gDOgcZilFDZInSEOExekENTggOBP6YH9hlrlDAYkYCcuVU5qge89VZ7JRJOsTP4
         huZQYj42sBqGri74mIXH9BYNOAu4Cn3XKmgSsnRW++pgBWWzC/HnqxJ4NL8Qmhopuz3G
         C/uw==
X-Gm-Message-State: APjAAAXOH5uMmxF3YuyQDKv9doP6dnMZG63mVmzVG8Ry5m+k/qu6uM0d
        L/Qx9R84C0WY7qtlv4YaAb4=
X-Google-Smtp-Source: APXvYqzC4cL84yWV7T09HXxEfzcuv0f4GDmdUaQ04LLJOL9ZoA+GJ87KHPAF+mObXb+qJxJxc9aJLg==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr2341760wru.366.1570624462287;
        Wed, 09 Oct 2019 05:34:22 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id r27sm5723915wrc.55.2019.10.09.05.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 05:34:21 -0700 (PDT)
Subject: Re: [PATCH 1/4] MIPS: cmdline: Remove
 CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>
References: <20191007221951.1889661-1-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26bf5830-596e-55ff-fda0-97f848c69966@amsat.org>
Date:   Wed, 9 Oct 2019 14:34:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191007221951.1889661-1-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/8/19 12:20 AM, Paul Burton wrote:
> CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND is not selected by any of our
> defconfigs, so remove it to simplify the messy command line logic in
> arch_mem_init() a little.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> ---
> 
>   arch/mips/Kconfig        | 4 ----
>   arch/mips/kernel/setup.c | 8 --------
>   2 files changed, 12 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index a0bd9bdb5f83..ec922e6ff40b 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3034,10 +3034,6 @@ choice
>   
>   	config MIPS_CMDLINE_FROM_BOOTLOADER
>   		bool "Bootloader kernel arguments if available"
> -
> -	config MIPS_CMDLINE_BUILTIN_EXTEND
> -		depends on CMDLINE_BOOL
> -		bool "Extend builtin kernel arguments with bootloader arguments"
>   endchoice
>   
>   endmenu
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 5eec13b8d222..c2a09f082d88 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -541,8 +541,6 @@ static void __init check_kernel_sections_mem(void)
>   #define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
>   #define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
>   #define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
> -#define BUILTIN_EXTEND_WITH_PROM	\
> -	IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND)
>   
>   /*
>    * arch_mem_init - initialize memory management subsystem
> @@ -602,12 +600,6 @@ static void __init arch_mem_init(char **cmdline_p)
>   			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
>   		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
>   	}
> -
> -	if (BUILTIN_EXTEND_WITH_PROM && arcs_cmdline[0]) {
> -		if (boot_command_line[0])
> -			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> -		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
> -	}
>   #endif
>   #endif
>   	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
