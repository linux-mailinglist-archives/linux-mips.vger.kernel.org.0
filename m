Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E696D2F9536
	for <lists+linux-mips@lfdr.de>; Sun, 17 Jan 2021 21:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729719AbhAQUoh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Jan 2021 15:44:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbhAQUof (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 Jan 2021 15:44:35 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55510C061573;
        Sun, 17 Jan 2021 12:43:55 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id r4so12132710wmh.5;
        Sun, 17 Jan 2021 12:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E/X7lg9bgvpQ028ryM47dCcslls7yvCj3gHeWlbVtOw=;
        b=UNV1huD5W9nQKz+mgcv1aQEez/rCBIiDn2kHqfpWnTKEt5aX+Sq8L4o0nDr2HsktS4
         htSH8LxVAQGxr4LL2MnwepdKUQqFMdWnbsEHo360rSR9ehqdmeOoKNI3JKsfQ7yALjT5
         qcNgjT+5VLl6TrfjYUz97iPRXi/xdLwN5eah85+tKZsC4KXHhaGYwYK8kmwLGhN8Rvuh
         d3wFKs2qNotfip3I0+MmpNgn8OGKXNj9R4oGG8dcatuOHAucuwNaII4tuZMs1N53J7K8
         bwr+DENPzvwJffPNKiDIdz/ixjmM4mePn+y9jOx+fqmknM7hWvZ3BH+2jtDh2wvE6fOo
         P7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E/X7lg9bgvpQ028ryM47dCcslls7yvCj3gHeWlbVtOw=;
        b=rWmBFYAwpndNMuBXb35cu6sDKxPmmDkOrzo32V7rhmG3IRoiwl03P3XKqo3ApNGR0q
         dA7ltJgiT63xadwdjpZXXt7+M/fgYs3GGUVoN/1GeFtYBwwh8dQxIq3lWgy7GKiXCc5+
         nVuQrv7mN6lGQRL5czH94Wxal7qEnq7gj7we/r46Df9IgzIg6RbIDLizLZuyXjIhBiVR
         IorB08tIN23DAVH7pbHUydayywqloRgidU1z6czRDcxXdnbHWBCIIauRT9+WwKCmyN/b
         fUdAT+q1RcrE0Nd0ecjs77pFURgn73WDq0AtJZ9Mcvn73WJqBF7BNmTKeodyXC/cdJdB
         Ge3w==
X-Gm-Message-State: AOAM532QD3AybTD8LZNlBgpa3p4BdUt8p4DRbUfzipPrv99AhxDyzJVT
        zc43CiAhugcl8qIKRIomo2s=
X-Google-Smtp-Source: ABdhPJzatrj3jstdkojeEph7YiYtD2iWo8+D8xTmhAqyEhjZNzjdPGUNasD0J/91Nyk3wGQt6IXfFw==
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr897626wmc.158.1610916234106;
        Sun, 17 Jan 2021 12:43:54 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
        by smtp.gmail.com with UTF8SMTPSA id d7sm13994916wmb.47.2021.01.17.12.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jan 2021 12:43:53 -0800 (PST)
Subject: Re: [PATCH] cacheflush.2: Update SYNOPSIS for glibc wrapper
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org,
        Dave Martin <Dave.Martin@arm.com>,
        Martin Sebor <msebor@redhat.com>
References: <20210116145632.7636-1-alx.manpages@gmail.com>
 <a2418a0e-9b21-4a02-dc0b-98936c0887fa@gmail.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <1c234bd5-306a-7496-fd3d-268f46450168@gmail.com>
Date:   Sun, 17 Jan 2021 21:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <a2418a0e-9b21-4a02-dc0b-98936c0887fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Michael,

On 1/17/21 9:34 PM, Michael Kerrisk (man-pages) wrote:
> Hi Alex,
> 
> On 1/16/21 3:56 PM, Alejandro Colomar wrote:
>> Glibc uses 'void *' instead of 'char *'.
>> And the prototype is declared in <sys/cacheflush.h>.

D'oh!

>>
>> ......
>>
>> $ syscall='cacheflush';
>> $ ret='int';
>> $ find glibc/ -type f -name '*.h' \
>>   |xargs pcregrep -Mn "(?s)^[\w\s]*${ret}\s*${syscall}\s*\(.*?;";
>> glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:

It is defined in <sys/cachectl.h>

Please fix that.

Thanks,

Alex

>> extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
>> glibc/sysdeps/unix/sysv/linux/mips/sys/cachectl.h:35:
>> extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
>> glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:30:
>> extern int cacheflush (void *__addr, int __nbytes, int __op) __THROW;
>> glibc/sysdeps/unix/sysv/linux/csky/sys/cachectl.h:30:
>> extern int cacheflush (void *__addr, const int __nbytes,
>> 		       const int __op) __THROW;
>>
>> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> 
> Thanks. Patch applied.
> 
> Cheers,
> 
> Michael
> 
>> ---
>>  man2/cacheflush.2 | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
>> index 2cf624f3a..0496879ca 100644
>> --- a/man2/cacheflush.2
>> +++ b/man2/cacheflush.2
>> @@ -27,9 +27,9 @@
>>  cacheflush \- flush contents of instruction and/or data cache
>>  .SH SYNOPSIS
>>  .nf
>> -.B #include <asm/cachectl.h>
>> +.B #inlcude <sys/cacheflush.h>

s/cacheflush.h/cachectl.h/

>>  .PP
>> -.BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
>> +.BI "int cacheflush(void *" addr ", int "nbytes ", int "cache );
>>  .fi
>>  .PP
>>  .IR Note :
>>
> 
> 


-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
