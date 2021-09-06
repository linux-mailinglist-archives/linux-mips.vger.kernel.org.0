Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715BA401D56
	for <lists+linux-mips@lfdr.de>; Mon,  6 Sep 2021 16:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243689AbhIFO7Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Sep 2021 10:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243684AbhIFO7H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Sep 2021 10:59:07 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04246C061575;
        Mon,  6 Sep 2021 07:58:03 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so4447409pjr.1;
        Mon, 06 Sep 2021 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=e7Lxz1rTUMVMiOxDU3ihYWK5WPfaNeZ9K8ew2EFVN6M=;
        b=LXgp52W5k+6e+E1lD/+fnmwROVu0im0ZTbRaTGFRUHoee98niPkmedBSPuoaU+C901
         xA0zVCRtm3ZstMaY0r+bfrLwX0h4lJRwjHZSrSd7VMiiQmuNR4VJb4KIkfYgNr45+6R/
         Ytm3SgdnIw+8vdyNM7Qrbyc2ZfHYtokHyF9mvUbjZBpqaG9aV9hVDtVpCH7AesyMXvxe
         UqoY/NFf7dqJ+B2r0NE5QZJnHLwexfdT+iciJQG7/AjInHtDs1ZoecQ7oAJRB4rOv/f9
         sTenECUfv5Z+O8xZpmI3XfSxkSvYjZ+DMUZOgmuBqGpnmkHpr4lFbj1WgmAnvQDDLG1o
         HBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=e7Lxz1rTUMVMiOxDU3ihYWK5WPfaNeZ9K8ew2EFVN6M=;
        b=iA89nih+C3XC4TBfbpSu9gKv5NHVSmzdRFP0BLVNNkz18vfDPvVjyCvnlH6h6vQu3H
         pqU0PohkolvcapHtnjs0kfhmVt3sUOy09O4pnxENd4wiWxG4xVoeCsaDb+uLiWVDoD/l
         CNR53Hsj2+5Bae5qe88JoLQYQSeyQJuEbk+lxwkCcna86ghSeZSzgkPrHxGenWzkAPRs
         OkCrMpzNxhII0AhaubXod+KvY/jPgX59+lqI0rQ048f0DtxruFjwOFRa0d1Ph2F6z4sc
         KpXXnnsiwqkFLmjw3kb44Vtpp+lBtZ3//JBVvAwioSrchw+eja5mTkHeWloNxWu1IGLN
         6AYw==
X-Gm-Message-State: AOAM530K/Gc3aHBcoueBxmIbajNs5c4hKAsVX2uBCno5/ZZdfALz3LFd
        /4NzsXPIRq1DmVC/CvHBQNbphEXQ9ZcAySCJqUM=
X-Google-Smtp-Source: ABdhPJx4U2UXdqmjv3wFeCTa6pX3ETSedWET7Gxlb8aTpJkm1WYcBE+shFcj4K1cKKYWsG7A6RIebw==
X-Received: by 2002:a17:902:8648:b029:129:dda4:ddc2 with SMTP id y8-20020a1709028648b0290129dda4ddc2mr11168934plt.4.1630940282178;
        Mon, 06 Sep 2021 07:58:02 -0700 (PDT)
Received: from owniadeMacBook-Pro.local ([8.21.11.90])
        by smtp.gmail.com with ESMTPSA id p3sm7607183pfw.71.2021.09.06.07.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 07:58:01 -0700 (PDT)
Subject: Re: [PATCH v2] ftrace: Cleanup ftrace_dyn_arch_init()
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org
References: <20210906111626.1259867-1-o451686892@gmail.com>
 <87v93dn5qh.fsf@mpe.ellerman.id.au>
From:   Weizhao Ouyang <o451686892@gmail.com>
Message-ID: <87b80cd6-f20f-a673-f438-faff5d7d4334@gmail.com>
Date:   Mon, 6 Sep 2021 22:57:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87v93dn5qh.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/9/6 22:22, Michael Ellerman wrote:
> Weizhao Ouyang <o451686892@gmail.com> writes:
>> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
>> ftrace_dyn_arch_init() to cleanup them.
>>
>> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
>> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
>>
>> ---
>>
>> Changes in v2:
>> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
>> -- add Acked-by tag
>> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
>> index debe8c4f7062..d59f67c0225f 100644
>> --- a/arch/powerpc/include/asm/ftrace.h
>> +++ b/arch/powerpc/include/asm/ftrace.h
>> @@ -61,6 +61,10 @@ struct dyn_arch_ftrace {
>>  };
>>  #endif /* __ASSEMBLY__ */
>>  
>> +#ifdef CONFIG_DYNAMIC_FTRACE
>> +int __init ftrace_dyn_arch_init(void);
>> +#endif /* CONFIG_DYNAMIC_FTRACE */
>> +
>>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>>  #endif
> That breaks the build for powerpc:
>
>   /linux/arch/powerpc/include/asm/ftrace.h: Assembler messages:
>   /linux/arch/powerpc/include/asm/ftrace.h:65: Error: unrecognized opcode: `int'
>   make[4]: *** [/linux/scripts/Makefile.build:352: arch/powerpc/kernel/trace/ftrace_64.o] Error 1
>   make[3]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel/trace] Error 2
>   make[2]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel] Error 2
>   make[1]: *** [/linux/Makefile:1861: arch/powerpc] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>
> It needs to be inside an #ifndef __ASSEMBLY__ section.
>
> cheers

Thanks for reply, I'll fix it up.
