Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 212B1F56D2
	for <lists+linux-mips@lfdr.de>; Fri,  8 Nov 2019 21:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388024AbfKHTLZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Nov 2019 14:11:25 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35364 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732893AbfKHTLZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Nov 2019 14:11:25 -0500
Received: by mail-pl1-f193.google.com with SMTP id s10so4520501plp.2
        for <linux-mips@vger.kernel.org>; Fri, 08 Nov 2019 11:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aOqUrVbuA7ABPJdhLgxaOcNWuOmu1y8oyYhif0Y3qgU=;
        b=GmoxQhPE2EnDWNMQIfO850tsORYgw6rE5mqzr4C6ZnWhJIT5lfPRxia4tm7eHjTry6
         6RLW70koIHkZJ/P01qRxmjZE+JVpIrJQT0CIXW62ZPqGINmfofQ9w8pPyQ7UwTPKOCyr
         hAr7/SU/ehC1UQKW7fyEdYKNMqFkPixQS0ewqCIu4zNmypRG2mNUi2U8hPmb9GoqwHBp
         Rk/YXOcCNohvQ+rTAHpPNbH4303dV+QdEpO6/RNln5fOGpifbDtCQ5d9oPG+9HQ0VA8+
         bXbE+rtXu5y9w5g8pznRbxtRPj6iTjoQQx3XdQQIdnt65uMGDyE00QnED1+8RGhagumS
         AW1g==
X-Gm-Message-State: APjAAAUOHU/KIBhmhUA3lCY0F9GhFktriVX8ZY7ZGcchTEMOg3xaAEhT
        mpwuj6b+iH7rn4fuRcytcUw=
X-Google-Smtp-Source: APXvYqziaVg4BCFdVo1aVsaeXz6Pcq8ky9ZWBOO8NSidrmhgdVrlQ3viH2gjTkLMZ7HV7mY8hsR3hA==
X-Received: by 2002:a17:902:5a41:: with SMTP id f1mr12525980plm.168.1573240283781;
        Fri, 08 Nov 2019 11:11:23 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id i2sm6701211pgt.34.2019.11.08.11.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 11:11:22 -0800 (PST)
Date:   Fri, 8 Nov 2019 11:11:49 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH V2] MIPS: Loongson: Add board_ebase_setup() support
Message-ID: <20191108191149.bbq3h4xp4famsh2n@lantea.localdomain>
References: <1572847781-21652-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1572847781-21652-1-git-send-email-chenhc@lemote.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Huacai,

On Mon, Nov 04, 2019 at 02:09:41PM +0800, Huacai Chen wrote:
> Old processors before Loongson-3A2000 have a 32bit ebase register and
> have no WG bit, new processors since Loongson-3A2000 have a 64bit ebase
> register and do have the WG bit. Unfortunately, Loongson processors
> which have the WG bit are slightly different from MIPS R2. This makes
> the generic ebase setup not suitable for every scenarios.

Can you describe how the Loongson WG bit differs from the WG bit as
architecturally defined? This patch may make things work for you but it
doesn't give us any record of what the hardware errata is or what we
actually need to do to work with the broken WG bit.

For example - right now Loongson kernels don't use the WG bit at all, so
what's the problem? It doesn't matter if WG has different behavior if we
don't use it.

So one option here might be to just continue to not indicate support for
the WG bit. It does look like the kernel ought to be ensuring the
exception vector it allocates is at a suitable address in this case, and
currently isn't. Something like the (untested) patch below ought to
address that. In practice though memblock is configured to allocate
bottom-up until after this point so it should be unlikely we'll get an
unsuitable address, and there's a WARN_ON() in trap_init() that would
already tell you if that happened.

> To make Loongson's kernel be more robust, we add a board_ebase_setup()
> hook to ensure that CKSEG0 is always used for ebase. This is also useful
> on platforms where BIOS doesn't initialise an appropriate ebase.

Can you also elaborate on that? I'm not sure why this would help on
systems that don't initialize EBase - the kernel unconditionally sets
EBase for >= MIPSr2 systems in configure_exception_vector() anyway, and
since v5.2 it doesn't even try to inherit whatever the bootloader used.

Thanks,
    Paul

---
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 342e41de9d64..a25ee41eff48 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2271,7 +2271,7 @@ void __init trap_init(void)
 	extern char except_vec4;
 	extern char except_vec3_r4000;
 	unsigned long i, vec_size;
-	phys_addr_t ebase_pa;
+	phys_addr_t ebase_pa, ebase_limit;
 
 	check_wait();
 
@@ -2287,7 +2287,21 @@ void __init trap_init(void)
 		else
 			vec_size = PAGE_SIZE;
 
-		ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
+		/*
+		 * If we have support for the EBase.WG bit then allow the
+		 * exception vector to be located anywhere. When EBase.WG is
+		 * not supported EBase is limited to a (c)kseg[01] address, so
+		 * we must ensure the allocated vector is in memory accessible
+		 * via those unmapped regions.
+		 */
+		if (cpu_has_ebase_wg)
+			ebase_limit = MEMBLOCK_ALLOC_ACCESSIBLE;
+		else
+			ebase_limit = CKSEG1 - CKSEG0;
+
+		ebase_pa = memblock_phys_alloc_range(vec_size,
+						     1 << fls(vec_size),
+						     0, ebase_limit);
 		if (!ebase_pa)
 			panic("%s: Failed to allocate %lu bytes align=0x%x\n",
 			      __func__, vec_size, 1 << fls(vec_size));
