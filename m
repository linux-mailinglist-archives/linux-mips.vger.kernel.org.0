Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5124F401CF3
	for <lists+linux-mips@lfdr.de>; Mon,  6 Sep 2021 16:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243304AbhIFOYN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Sep 2021 10:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243298AbhIFOYI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Sep 2021 10:24:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86ADDC061575;
        Mon,  6 Sep 2021 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1630938178;
        bh=a1ig8YTFMn8o0S8xZRd6vor5m3Cp6vgqt+R8f3Aaqr8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gPDFVvcgFKVCtnnFcqifi3/U7sQu2oKLjlWmQLo9QKNWq1U2MACHRnqyFWKrnad56
         uL+i5BVZJzimDdNdOdWWL97qyY3vQEru4eOyRsCgGll1qxWgWbklqZekpDGcAGKuCf
         7DC9/fmleSs/J6PLf3UKelktEfEUDK/VqMn/+w368Z5+i7rKCZizeZ9JNKFm1pNAA5
         h4LY2z9lptO/oPnnmWr1502XTFsZvG+pEmckwN3k0Ifrq04O0itioFFI4oF6PBSbWI
         occtjlLIAW9X8Cbc98/3bwK1W8QWf6J3uswp0ONhi5bpMTYeu0fzaFaimB7DadN/5M
         jHul5fcpFPOCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H39bX6gcYz9sW4;
        Tue,  7 Sep 2021 00:22:48 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Weizhao Ouyang <o451686892@gmail.com>,
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
        sparclinux@vger.kernel.org, Weizhao Ouyang <o451686892@gmail.com>
Subject: Re: [PATCH v2] ftrace: Cleanup ftrace_dyn_arch_init()
In-Reply-To: <20210906111626.1259867-1-o451686892@gmail.com>
References: <20210906111626.1259867-1-o451686892@gmail.com>
Date:   Tue, 07 Sep 2021 00:22:46 +1000
Message-ID: <87v93dn5qh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Weizhao Ouyang <o451686892@gmail.com> writes:
> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.
>
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
>
> ---
>
> Changes in v2:
> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
> -- add Acked-by tag

> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index debe8c4f7062..d59f67c0225f 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -61,6 +61,10 @@ struct dyn_arch_ftrace {
>  };
>  #endif /* __ASSEMBLY__ */
>  
> +#ifdef CONFIG_DYNAMIC_FTRACE
> +int __init ftrace_dyn_arch_init(void);
> +#endif /* CONFIG_DYNAMIC_FTRACE */
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>  #endif

That breaks the build for powerpc:

  /linux/arch/powerpc/include/asm/ftrace.h: Assembler messages:
  /linux/arch/powerpc/include/asm/ftrace.h:65: Error: unrecognized opcode: `int'
  make[4]: *** [/linux/scripts/Makefile.build:352: arch/powerpc/kernel/trace/ftrace_64.o] Error 1
  make[3]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel/trace] Error 2
  make[2]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel] Error 2
  make[1]: *** [/linux/Makefile:1861: arch/powerpc] Error 2
  make[1]: *** Waiting for unfinished jobs....

It needs to be inside an #ifndef __ASSEMBLY__ section.

cheers
