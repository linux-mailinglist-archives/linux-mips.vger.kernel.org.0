Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1426D0E94
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 14:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfJIMU7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 08:20:59 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32929 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfJIMU6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 08:20:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id r17so4649786wme.0
        for <linux-mips@vger.kernel.org>; Wed, 09 Oct 2019 05:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qXCqBYPqV8kVHUxWuXAEkISLORWbnRzr+7PSMvDt4aI=;
        b=aYKBEQFwDCXxujDKrJgGAhmBCYQ5T8sYzBdiaz9xylsz5tstpm9HdSi6Ih/luEO9qq
         dwkfkVvSpO0/k5YoCoxwWsQAATA/U5YjGU4LxA7qd2t3Qw1E9CG3QuEV+MDlCvStvnW0
         1GVbC/HWwyzJyREfEioCz8z2fzB0UUqoSsWFd/D/OSUeHrVfypRey1mu7IaDoVzpz/MP
         3rvjiFNpOv2UrHJfqUA/FO1hRSFzlrxOobcrVi7rCStZJzweh1bu9uW4mLvo65vATYpk
         dtDNYeSdgQRoswSsS6TpJPchbb8aayD8lsPoUCptytEYBnZ/Ayn06UGU4+GcMr4LoZyJ
         4P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qXCqBYPqV8kVHUxWuXAEkISLORWbnRzr+7PSMvDt4aI=;
        b=r5OS3r7BNcROPDlfeyr0TReROPCs40dqMOXd0BtvOEwNhj9N2H4hKZMG5MQqIxHQYM
         bFIWz0LSfCFOvJSb8EBUbV+aVM+sKC/1tdtewqlZpj/um0qXhcjrMfivbF8J1HfeHZHX
         5HRvqHT3YoiSTZjgG29PXdWQPCbSKaJHTyCpYECWFM470XJJqaWlh1JaUeh7M+vZDPON
         oPGM3NeXCKuyWd8Vj4V5qHsRVltmdUiEtoVkMbi4MohpMmDU0Xme9JGnerzK2HAQy4+P
         yMBR2Qsf9ogftETvFUIcZ8S3mEGLQlovWsbi1XNhk+FI4YsP3cDR4hqalk0CmafLPY8a
         bP7w==
X-Gm-Message-State: APjAAAUCTZ9+aOan0hYYUJ6FR0kJcV6lDFvVsVX3Wsbl5EaRGCGZYbl4
        JvR8h2AHswsCRRnwfwcdmqib69/a6rQ=
X-Google-Smtp-Source: APXvYqyIMS2OnxulX7mYdcWpIRpNAE5kGJL+cDrGmdJ8U3Gn5Lwu2dVogYye7r1vrEUQzS19TIXSpw==
X-Received: by 2002:a1c:2407:: with SMTP id k7mr2274957wmk.99.1570623656840;
        Wed, 09 Oct 2019 05:20:56 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id p85sm3054696wme.23.2019.10.09.05.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 05:20:55 -0700 (PDT)
Subject: Re: [PATCH 3/4] MIPS: cmdline: Remove redundant Kconfig defaults
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>
References: <20191007221951.1889661-1-paul.burton@mips.com>
 <20191007221951.1889661-3-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <09be04a4-490d-75d9-2141-a7385f45f862@amsat.org>
Date:   Wed, 9 Oct 2019 14:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191007221951.1889661-3-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/8/19 12:20 AM, Paul Burton wrote:
> CMDLINE, CMDLINE_BOOL & CMDLINE_FORCE all explicitly specify default
> values that are the same as the default value for their respective types
> anyway (ie. n for booleans, and the empty string for strings).
> 
> Remove the redundant defaults.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> ---
> 
>   arch/mips/Kconfig.debug | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
> index 0c86b2a2adfc..93a2974d2ab7 100644
> --- a/arch/mips/Kconfig.debug
> +++ b/arch/mips/Kconfig.debug
> @@ -32,7 +32,6 @@ config USE_GENERIC_EARLY_PRINTK_8250
>   
>   config CMDLINE_BOOL
>   	bool "Built-in kernel command line"
> -	default n
>   	help
>   	  For most systems, it is firmware or second stage bootloader that
>   	  by default specifies the kernel command line options.  However,
> @@ -53,7 +52,6 @@ config CMDLINE_BOOL
>   config CMDLINE
>   	string "Default kernel command string"
>   	depends on CMDLINE_BOOL
> -	default ""
>   	help
>   	  On some platforms, there is currently no way for the boot loader to
>   	  pass arguments to the kernel.  For these platforms, and for the cases
> @@ -68,7 +66,6 @@ config CMDLINE
>   
>   config CMDLINE_OVERRIDE
>   	bool "Built-in command line overrides firmware arguments"
> -	default n
>   	depends on CMDLINE_BOOL
>   	help
>   	  By setting this option to 'Y' you will have your kernel ignore
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
