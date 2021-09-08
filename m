Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF7240331A
	for <lists+linux-mips@lfdr.de>; Wed,  8 Sep 2021 05:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347607AbhIHDxx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Sep 2021 23:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhIHDxu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Sep 2021 23:53:50 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E49EC061575;
        Tue,  7 Sep 2021 20:52:43 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id v123so872604pfb.11;
        Tue, 07 Sep 2021 20:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WSt+UMhq7R7h5hSLb95oV8jytbQKlUJH1lEwRLVcxwc=;
        b=GLJfR0NMco+oS1HHyphViWc/H8Wf/bLjCDcmbtta6hyb801Md0ubjqPMWp6WdPvWq/
         /NuGfVD1j9+XuSUMOGQz/eTCVbohXJ+Qkv9I2QMqTdEHfklDHNcvxpVFOWfbJPymvNFD
         btC1KFw4ADbCa7XAeGte2pPkaEU5kZ7GcfmYZBMz4nJuY9zvGtKXL5+PeF7cVlAHFI2G
         +TP44OHlZU2UYl/1A7zxdCsPyN+6gq/V8DFaKk1ZAfOPXKPdX2/k8aXmhsfoLio/obd/
         fRBEBNg4S22eyDDVR3hvYvwYI6y0QYJteRexx8hn81tf7J0GoryM+zimw3uyq3VlSa06
         cc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WSt+UMhq7R7h5hSLb95oV8jytbQKlUJH1lEwRLVcxwc=;
        b=i+oW9IX37D+6Xk755PRVI+GqYDyVCobXsZn77xRd3s1QbU4zfeKNEp4BHWs6IVjca8
         gL5fhNxplc3QGFaGCJBq95dsXqIaOQvczGpE8Xvn5Ti59BB7aOnhAZHYAta7M9siW0R0
         3WZeJsXpt5GWGQt8oQQEQM8DAlNFkw10jg9+JYZ05zevEq9nhTksVOJhgVfcDt9Q0udY
         kXQUgIZIYkTwYhKCpzUQKm6QvbvBRImuGvMwB72+elYbpSk/3n8ZdrqU3eBVuIT0uqv7
         KC8ocZFF/xL9o1T2rX9B1WzHFAl4ReSqH/ZxYiREdxnLhPbR1hj/GXr61OABZzesXERA
         HVcw==
X-Gm-Message-State: AOAM533z4DNdfmhxrZUsZs6pTlsM8sHrNQJDM3iC0pkrVt8nAk0IfX3a
        K7KIc8psogrrBJzpGfxhmRo=
X-Google-Smtp-Source: ABdhPJzsF7/ZmS0a3POWsiDv6cT4l+YoAuvMs8kxVeVkGFJVzJ1fBZkDxrQQPMspQMKZVPXO7C92+Q==
X-Received: by 2002:a63:30d:: with SMTP id 13mr1668901pgd.289.1631073162944;
        Tue, 07 Sep 2021 20:52:42 -0700 (PDT)
Received: from [192.168.30.11] ([173.248.225.217])
        by smtp.gmail.com with ESMTPSA id p4sm647725pgc.15.2021.09.07.20.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 20:52:42 -0700 (PDT)
Subject: Re: [PATCH v3] ftrace: Cleanup ftrace_dyn_arch_init()
To:     LEROY Christophe <christophe.leroy@csgroup.eu>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Rich Felker <dalias@libc.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Vincent Chen <deanbo422@gmail.com>,
        Will Deacon <will@kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Helge Deller <deller@gmx.de>,
        "x86@kernel.org" <x86@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Borislav Petkov <bp@alien8.de>,
        Greentime Hu <green.hu@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        Nick Hu <nickhu@andestech.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>
References: <20210907100524.1454928-1-o451686892@gmail.com>
 <MRZP264MB298824D80E6C0ADCB5EA1D9AEDD39@MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM>
From:   Weizhao Ouyang <o451686892@gmail.com>
Message-ID: <f33570e2-a67d-b0cf-f127-040ccd9e5da9@gmail.com>
Date:   Wed, 8 Sep 2021 11:52:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MRZP264MB298824D80E6C0ADCB5EA1D9AEDD39@MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thanks for reply.

On 2021/9/7 23:55, LEROY Christophe wrote:
>
>> -----Message d'origine-----
>> De : Linuxppc-dev <linuxppc-dev-
>> bounces+christophe.leroy=csgroup.eu@lists.ozlabs.org> De la part de Weizhao
>> Ouyang
>>
>> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
>> ftrace_dyn_arch_init() to cleanup them.
>>
>> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
>> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
>> Acked-by: Helge Deller <deller@gmx.de> (parisc)
>>
>> ---
>> Changes in v3:
>> -- fix unrecognized opcode on PowerPC
>>
>> Changes in v2:
>> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
>> -- add Acked-by tag
>>
>> ---
>>  arch/arm/kernel/ftrace.c          | 5 -----
>>  arch/arm64/kernel/ftrace.c        | 5 -----
>>  arch/csky/kernel/ftrace.c         | 5 -----
>>  arch/ia64/kernel/ftrace.c         | 6 ------
>>  arch/microblaze/kernel/ftrace.c   | 5 -----
>>  arch/mips/include/asm/ftrace.h    | 2 ++
>>  arch/nds32/kernel/ftrace.c        | 5 -----
>>  arch/parisc/kernel/ftrace.c       | 5 -----
>>  arch/powerpc/include/asm/ftrace.h | 4 ++++
>>  arch/riscv/kernel/ftrace.c        | 5 -----
>>  arch/s390/kernel/ftrace.c         | 5 -----
>>  arch/sh/kernel/ftrace.c           | 5 -----
>>  arch/sparc/kernel/ftrace.c        | 5 -----
>>  arch/x86/kernel/ftrace.c          | 5 -----
>>  include/linux/ftrace.h            | 1 -
>>  kernel/trace/ftrace.c             | 5 +++++
>>  16 files changed, 11 insertions(+), 62 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
>> index b463f2aa5a61..ed013e767390 100644
>> --- a/arch/mips/include/asm/ftrace.h
>> +++ b/arch/mips/include/asm/ftrace.h
>> @@ -76,6 +76,8 @@ do {                                                \
>>
>>
>>  #ifdef CONFIG_DYNAMIC_FTRACE
>> +int __init ftrace_dyn_arch_init(void);
>> +
> Why ?
>
>
>>  static inline unsigned long ftrace_call_adjust(unsigned long addr)
>>  {
>>       return addr;
>> diff --git a/arch/powerpc/include/asm/ftrace.h
>> b/arch/powerpc/include/asm/ftrace.h
>> index debe8c4f7062..b05c43f13a4d 100644
>> --- a/arch/powerpc/include/asm/ftrace.h
>> +++ b/arch/powerpc/include/asm/ftrace.h
>> @@ -126,6 +126,10 @@ static inline void this_cpu_enable_ftrace(void) { }
>>  static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
>>  static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
>>  #endif /* CONFIG_PPC64 */
>> +
>> +#ifdef CONFIG_DYNAMIC_FTRACE
>> +int __init ftrace_dyn_arch_init(void);
>> +#endif /* CONFIG_DYNAMIC_FTRACE */
> Why ?
>
>>  #endif /* !__ASSEMBLY__ */
>>
>>  #endif /* _ASM_POWERPC_FTRACE */
>> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
>> index 832e65f06754..f1eca123d89d 100644
>> --- a/include/linux/ftrace.h
>> +++ b/include/linux/ftrace.h
>> @@ -573,7 +573,6 @@ ftrace_set_early_filter(struct ftrace_ops *ops, char
>> *buf, int enable);
>>
>>  /* defined in arch */
>>  extern int ftrace_ip_converted(unsigned long ip);
>> -extern int ftrace_dyn_arch_init(void);
> Why removing that ?
>
> Have you tried to build kernel/trace/ftrace.o with C=2 ? It will likely tell you that the function is not declared and that it should be static

Yes I missed this check. Under the situation, the function should be static.

> We could eventually consider that in the past, this generic declaration was unrelevant because the definitions where in the arch specific sections.
> Now that you are implementing a generic weak version of this function, it would make sense to have a generic declaration as well.
>
> I really don't see the point in duplicating the declaration of the function in the arch specific headers.

I use declaration in arch specific headers in tend to clarify the arch has implement ftrace_dyn_arch_init().
Anyway, it maybe pointless, a generic declaration is enough. Will update it later.

>>  extern void ftrace_replace_code(int enable);
>>  extern int ftrace_update_ftrace_func(ftrace_func_t func);
>>  extern void ftrace_caller(void);
> Christophe
>
> CS Group - Document Interne
