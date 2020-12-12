Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0942D8930
	for <lists+linux-mips@lfdr.de>; Sat, 12 Dec 2020 19:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407709AbgLLSUS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Dec 2020 13:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgLLSUH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Dec 2020 13:20:07 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C64C061794;
        Sat, 12 Dec 2020 10:19:26 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id q18so4792657wrn.1;
        Sat, 12 Dec 2020 10:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8XuSZWyg0uMtUzXE2YH5qeHChdkix/Llk/GJWnOCg1w=;
        b=ndPXYE8q6gZ7VBW0OyGYsAFI/taVUKyhCPOBG3x336NFrXcta57QJWzEMiubWlJrGZ
         nGgd0YxwMiZDPrzxfHhyag0PL5LVekMrm17fAVWkUM578cF0coHWMv0jxFJKWTelh7Yq
         h9FOKQRYx7Y+om2DRiCnE2JbLTuHfBbQWDz3EDQ5M/uthct9I0+Qg8v0oownDKVJguiv
         pnym1W7WtRKe8IdxBS77adv9FA+Q92cutfiCnEdvnHtMa7D5spiMWy4TjUxxtAyGRlvX
         6AKtVsKSVqf/JEDkmNQ6MPK3MTwgdeFIoDJzF5O9HfIq26IRLCMi4rfrUkrt5JhD08Gc
         AJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8XuSZWyg0uMtUzXE2YH5qeHChdkix/Llk/GJWnOCg1w=;
        b=UvHiPfNlD6InELmTGW7rsa7bKAPlAZMRIvTXyX1jQkaLSCouon/ef61rGYcDEijdI+
         tvX2relsaazWWynZ9n61vXB8O9Jy/ga4c7xYDKQVW7onSvTT0pZiJgjd/SIzloJm3F+q
         JGcv9aJMbkXYNxp8rcBXaFopeL/UlIaHbVBuQa35C6Ollpo4wAasj3Le5EhvSBPwXAbT
         AAoW/7AR51hNn8XA9EqPR55q9GJ8oyUh7zqEOEjfu1k1JnCqMtw4ivfHJAq4S7zGdrec
         rDoSQhCw2Os5c+hPUaRYVRZpjg9IdkSJPdpIjHAo553OEfc1dVa7+y8R8vKYaQVt7I5W
         w4EA==
X-Gm-Message-State: AOAM532kDVvh1ceZLPzsrnmgWjVoi8V+Lt5Cgxr/qX1/tb+5p+1guU/p
        wv3zouf+T8I5ifCwxkC7GNk=
X-Google-Smtp-Source: ABdhPJx+KJDQiyXc0PNDTzEPFX+MNbcM09DvihhpkyzrpnG1t/ZITmj93N0yBXsLBk5bT20QvllLrQ==
X-Received: by 2002:a5d:6443:: with SMTP id d3mr19836610wrw.422.1607797165626;
        Sat, 12 Dec 2020 10:19:25 -0800 (PST)
Received: from [192.168.0.160] ([170.253.49.0])
        by smtp.gmail.com with ESMTPSA id f199sm21586672wme.15.2020.12.12.10.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Dec 2020 10:19:25 -0800 (PST)
Subject: Re: [RFC] cacheflush.2: Document different prototypes for different
 architectures
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>,
        "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-man <linux-man@vger.kernel.org>
Cc:     Dave Martin <Dave.Martin@arm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org
References: <c284e55d-98e9-ae53-b6ca-f331b73841c7@gmail.com>
 <20a8ebd5-ce04-1404-6113-02910cb21982@gmx.de>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <6c1ae2e4-25d9-4364-0637-048c3b78c0fa@gmail.com>
Date:   Sat, 12 Dec 2020 19:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20a8ebd5-ce04-1404-6113-02910cb21982@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Heinrich,

Good.
BTW, it looks like internally LLVM uses 'void *'[1],
but Clang exposes 'char *'[2] in the prototype.  Weird...
I reported the bug yesterday: https://bugs.llvm.org/show_bug.cgi?id=48489

Thanks,

Alex

[1]:
https://github.com/llvm/llvm-project/blob/414d3dc62c706f41226b0d552210c79f5080df43/compiler-rt/lib/builtins/clear_cache.c#L59
[2]:
https://github.com/llvm/llvm-project/blob/7faf62a80bfc3a9dfe34133681fcc31f8e8d658b/clang/include/clang/Basic/Builtins.def#L583

On 12/12/20 12:52 AM, Heinrich Schuchardt wrote:
> On 12/11/20 10:09 PM, Alejandro Colomar (man-pages) wrote:
>> Hi Michael,
>>
>> Continuing with the changes in this thread:
>> https://lore.kernel.org/linux-man/747d56e0-c102-ab40-add4-530a48a43a4d@gmx.de/T/#t
>>
>>
>> I researched the architectures that have this syscall.  I found some
>> that clearly provide the syscall, and some that seem to have something,
>> but I didn't find a definition in the kernel (i.e., ARM, MicroBlaze
>> (glibc only)?)
> 
> arch/arm/include/uapi/asm/unistd.h:35:
> #define __ARM_NR_cacheflush               (__ARM_NR_BASE+2)
> 
> arch/arm64/include/asm/unistd.h:37:
> #define __ARM_NR_compat_cacheflush   (__ARM_NR_COMPAT_BASE + 2)
> 
> These syscalls are marked as private. So you should not use them from
> user space.
> 
> The compilers seem not to care about these syscalls being private:
> 
> https://github.com/gcc-mirror/gcc/blob/master/libgcc/config/arm/lib1funcs.S#L1512
> 
> https://github.com/llvm-mirror/compiler-rt/blob/master/lib/builtins/clear_cache.c
> 
> 
> Best regards
> 
> Heinrich
[...]
>> Rendered page (NOTES only):
>>
>> [
>> NOTES
>>     Architecture-specific variants
>>         Glibc  provides a wrapper for this system call, with the pro‐
>>         totype shown in SYNOPSIS, for  the  following  architectures:
>>         ARC, CSKY, MIPS, and NIOS2. // lowercase?
>>
>>         On  some other architectures, Linux provides this system call
>>         with different arguments:
>>
>>         M68K:
>>
>>             int cacheflush(unsigned long addr, int scope, int cache,
>>                            unsigned long len);
>>
>>         SH:
>>
>>             int cacheflush(unsigned long addr, unsigned long len, int
>> op);
>>
>>         NDS32:
>>
>>             int cacheflush(unsigned int start, unsigned int end, int
>> cache);
>>
>>     GCC alternative
>>         Unless you need the finer grained control  that  this  system
>>         call  provides,  you  probably  want  to use the GCC built-in
>>         function __builtin___clear_cache(), which provides a portable
>>         interface  across  platforms  supported by GCC and compatible
>>         compilers:
>>
>>             void __builtin___clear_cache(void *begin, void *end);
>>
>>         On platforms that don't require  instruction  cache  flushes,
>>         __builtin___clear_cache() has no effect.
>>
>>         Note:  On  some  GCC-compatible compilers, such as clang, the
>>         prototype for this function uses char * instead of void * for
>>         the parameters.
>>
>> ]
>>
>> 'GCC alternative' is the name I gave to the NOTES from the other thread,
>> which aren't yet merged (I'll send the patches after the weekend,
>> probably).
>>
>> Subsections based on:
>> fadvise64(2)
>>
>> Can you review this?
>>
>> Thanks,
>>
>> Alex
>>
> 
