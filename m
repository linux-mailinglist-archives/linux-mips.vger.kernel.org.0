Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD4B2F9527
	for <lists+linux-mips@lfdr.de>; Sun, 17 Jan 2021 21:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbhAQUfD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Jan 2021 15:35:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729349AbhAQUfC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 Jan 2021 15:35:02 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B82C061573;
        Sun, 17 Jan 2021 12:34:22 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a10so4221985ejg.10;
        Sun, 17 Jan 2021 12:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KiYGOnuh3oxYzt0UIK72MDtuuNQAPRMD/wk8kArmgSg=;
        b=AXOi5xZqzfxoEglDl8jLsrTW0XeKLSrcvq2nqOEljc/ykG8Bersbu+hmLkmvnjM9cc
         rMzvYb6I6grdacA1op6kFT3PQCszkmyQ3Cz8XIX5KxMf69elOjTTI/nac+gYwafNPRmE
         NIN4tIkqRT5FTacyyTYOOtdELoNs3Ou/vrnk+VRv5b8y0cjEYNwznFwxXF4gVPzlCE1q
         whZTlYZ7BNn3ObX1sS6syuWUvRaKHAci6/jT5XqQ9Ph3WXzWNIY3gEKvWfiSICSUMk6C
         6QzEaIol4yjH4iFN0bVmPCfJ9SE7veoAcQQSQZi33uoEDW6vfXz8oWpHpv24d25U57YQ
         /1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KiYGOnuh3oxYzt0UIK72MDtuuNQAPRMD/wk8kArmgSg=;
        b=W9X4CoWRUWN7SPPmfB5HJaIEZd0HY9IMAnJvVeQ4kNQlt468i0LI/V/3BRdKt0TowD
         /JNGE5eddsTst7UpILnNTeRFnOkVFQUmocKmHmZ+3VvGn91AynZzXA+U0IL5XJbgaIml
         L2pzixND0OdY+1dnIW/tqy+PlLnz8T+lkGB5OnnqokmvCY3m2CfDuf9/zmGLhy/Coy1A
         AQ1kFmr5gxgiPSQhcwYQHkiZC1sRQ+Z7l88MXFLWN8/S0SBpDCj7Y5BP00oSKnfkypjI
         sukHkYY5//ai3JnaDH084UvrtH4IogccslHhv2mHBUQipP/c77Edl/luIw6mc+Mz/keS
         1GXw==
X-Gm-Message-State: AOAM5329TebEpqxtUzHpyxYsH/EaG/82kTDZWfzvETZngvDUrOdIFH2W
        1juUFUGMrcELjqjNp89cL6I=
X-Google-Smtp-Source: ABdhPJwbTPx3/TdAb4F/XCyD1EyeCnzd03vRuDnwHTiarwdwWyLCIst8C1LDDSjJDR8aNbxCWbTSQA==
X-Received: by 2002:a17:906:b215:: with SMTP id p21mr2124582ejz.407.1610915660809;
        Sun, 17 Jan 2021 12:34:20 -0800 (PST)
Received: from ?IPv6:2001:a61:244d:fe01:9fb1:d962:461a:45e8? ([2001:a61:244d:fe01:9fb1:d962:461a:45e8])
        by smtp.gmail.com with ESMTPSA id w13sm9499190edx.20.2021.01.17.12.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jan 2021 12:34:19 -0800 (PST)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org,
        Dave Martin <Dave.Martin@arm.com>,
        Martin Sebor <msebor@redhat.com>
Subject: Re: [PATCH] cacheflush.2: Update SYNOPSIS for glibc wrapper
To:     Alejandro Colomar <alx.manpages@gmail.com>
References: <20210116145632.7636-1-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <a2418a0e-9b21-4a02-dc0b-98936c0887fa@gmail.com>
Date:   Sun, 17 Jan 2021 21:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210116145632.7636-1-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alex,

On 1/16/21 3:56 PM, Alejandro Colomar wrote:
> Glibc uses 'void *' instead of 'char *'.
> And the prototype is declared in <sys/cacheflush.h>.
> 
> ......
> 
> $ syscall='cacheflush';
> $ ret='int';
> $ find glibc/ -type f -name '*.h' \
>   |xargs pcregrep -Mn "(?s)^[\w\s]*${ret}\s*${syscall}\s*\(.*?;";
> glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:
> extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
> glibc/sysdeps/unix/sysv/linux/mips/sys/cachectl.h:35:
> extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
> glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:30:
> extern int cacheflush (void *__addr, int __nbytes, int __op) __THROW;
> glibc/sysdeps/unix/sysv/linux/csky/sys/cachectl.h:30:
> extern int cacheflush (void *__addr, const int __nbytes,
> 		       const int __op) __THROW;
> 
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>

Thanks. Patch applied.

Cheers,

Michael

> ---
>  man2/cacheflush.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
> index 2cf624f3a..0496879ca 100644
> --- a/man2/cacheflush.2
> +++ b/man2/cacheflush.2
> @@ -27,9 +27,9 @@
>  cacheflush \- flush contents of instruction and/or data cache
>  .SH SYNOPSIS
>  .nf
> -.B #include <asm/cachectl.h>
> +.B #inlcude <sys/cacheflush.h>
>  .PP
> -.BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
> +.BI "int cacheflush(void *" addr ", int "nbytes ", int "cache );
>  .fi
>  .PP
>  .IR Note :
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
