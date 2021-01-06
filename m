Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74FB2EC6D9
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 00:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbhAFX1B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 18:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbhAFX1B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jan 2021 18:27:01 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A01C061799
        for <linux-mips@vger.kernel.org>; Wed,  6 Jan 2021 15:26:20 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id b8so2359550plx.0
        for <linux-mips@vger.kernel.org>; Wed, 06 Jan 2021 15:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PCAsqtwy69+o8i02BTFhqMq2pnNK2pwjyZKbY8yJvCg=;
        b=TQzI3ZZAIZR7N5/XA6IW5c05vDDv6qHDLHvkMipjpKzLDsmB1UER8y27JaUViP+8UY
         z8SN3vF53VgXbVlMR32A/ek3vNHxL6CTCi4SOyls9Dy0R/Fkbx0xGeB2L5qy4fshF205
         1HkUwMcY3Awy3CPPvmJmwZjJMYUrPRb5TKUZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PCAsqtwy69+o8i02BTFhqMq2pnNK2pwjyZKbY8yJvCg=;
        b=mIC04tkOajf3STZkYgq2nwoTk59Przsn7xdEqkvyRZzstBH3D7p0FZnxzY+/J+HK1C
         HuVbfKcZdfHbSF/MvRxvASnEL9IFUHEx4wx/TIAAWj7iN6aPaM8lV9Lcz8JF5w3vF5d0
         IPcr0z+rjOTpkvyLOGcAjYGgTR4KZh2fxLjB9/4I+dy1aIdu1vgRlwPKJaaBPxUi4UTu
         ixENdm89M92N8S2uyZBWJN2nTit15PzIoDhokCwszeclkWxlmtd9dXm3r2XN1qXWJapk
         m5BkDbU0Jo5NdjcimgF0r/AjunWEmvL8e0xVgDSle85KmCSbYQMPEn9QQpREPHKNd1iN
         6VOQ==
X-Gm-Message-State: AOAM530jRtyxR96pDX4x7OIeHRUYZ4SJDgTLVD5q3bp8KkpEQjzUu3w5
        WPv40LmvvRhLpPV7jufKvCgJbQ==
X-Google-Smtp-Source: ABdhPJxlCEoVyDChdbp+K02eEdMoCWVH74XLnX3ZUD3/gycSf+y/iuNbV/qxUDjZjbRl9rpBp1sgoA==
X-Received: by 2002:a17:90a:7085:: with SMTP id g5mr6430887pjk.132.1609975580280;
        Wed, 06 Jan 2021 15:26:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g16sm3489366pfh.187.2021.01.06.15.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 15:26:19 -0800 (PST)
Date:   Wed, 6 Jan 2021 15:26:18 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alex Smith <alex.smith@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Markos Chandras <markos.chandras@imgtec.com>,
        linux-mips@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 mips-next 2/4] MIPS: vmlinux.lds.S: add
 ".gnu.attributes" to DISCARDS
Message-ID: <202101061518.67B9E0205@keescook>
References: <20210106200713.31840-1-alobakin@pm.me>
 <20210106200801.31993-1-alobakin@pm.me>
 <20210106200801.31993-2-alobakin@pm.me>
 <202101061400.8F83981AE@keescook>
 <20210106223606.267756-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106223606.267756-1-alobakin@pm.me>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 06, 2021 at 10:36:38PM +0000, Alexander Lobakin wrote:
> From: Kees Cook <keescook@chromium.org>
> Date: Wed, 6 Jan 2021 14:07:07 -0800
> 
> > On Wed, Jan 06, 2021 at 08:08:19PM +0000, Alexander Lobakin wrote:
> >> Discard GNU attributes at link time as kernel doesn't use it at all.
> >> Solves a dozen of the following ld warnings (one per every file):
> >>
> >> mips-alpine-linux-musl-ld: warning: orphan section `.gnu.attributes'
> >> from `arch/mips/kernel/head.o' being placed in section
> >> `.gnu.attributes'
> >> mips-alpine-linux-musl-ld: warning: orphan section `.gnu.attributes'
> >> from `init/main.o' being placed in section `.gnu.attributes'
> >>
> >> Misc: sort DISCARDS section entries alphabetically.
> >
> > Hmm, I wonder what is causing the appearance of .eh_frame? With help I
> > tracked down all the causes of this on x86, arm, and arm64, so that's
> > why it's not in the asm-generic DISCARDS section. I suspect this could
> > be cleaned up for mips too?
> 
> I could take a look and hunt it down. Could you please give some refs on
> what were the causes and solutions for the mentioned architectures?

Sure! Here are the ones I could find again:

34b4a5c54c42 ("arm64/kernel: Remove needless Call Frame Information annotations")
6e0a66d10c5b ("arm64/build: Remove .eh_frame* sections due to unwind tables")
d1c0272bc1c0 ("x86/boot/compressed: Remove, discard, or assert for unwanted sections")

> > Similarly for .gnu.attributes. What is generating that? (Or, more
> > specifically, why is it both being generated AND discarded?)
> 
> On my setup, GNU Attributes consist of MIPS FP type (soft) and
> (if I'm correct) MIPS GNU Hash tables.

Ah, right, the soft-float markings sound correct to discard, IIUC.

> By the way. I've built the kernel with LLVM stack (and found several
> subjects for more patches) and, besides '.got', also got a fistful
> of '.data..compoundliteral*' symbols (drivers/mtd/nand/spi/,
> net/ipv6/ etc). Where should they be placed (rodata, rwdata, ...)
> or they are anomalies of some kind and should be fixed somehow?

Ah yeah, I've seen this before:
https://lore.kernel.org/lkml/202010051345.2Q0cvqdM-lkp@intel.com/
https://lore.kernel.org/lkml/CAKwvOd=s53vUELe311VSjxt2_eQd+RGNCf__n+cV+R=PQ_CdXQ@mail.gmail.com/

And it looks like LTO trips over it too:
https://lore.kernel.org/lkml/20201211184633.3213045-3-samitolvanen@google.com/

So I think the correct solution is to follow Sami's patch and add it to
vmlinux.lds.h:

-#define DATA_MAIN .data .data.[0-9a-zA-Z_]* .data..LPBX*
+#define DATA_MAIN .data .data.[0-9a-zA-Z_]* .data..L* .data..compoundliteral*
...
-#define RODATA_MAIN .rodata .rodata.[0-9a-zA-Z_]*
-#define BSS_MAIN .bss .bss.[0-9a-zA-Z_]*
+#define RODATA_MAIN .rodata .rodata.[0-9a-zA-Z_]* .rodata..L*
+#define BSS_MAIN .bss .bss.[0-9a-zA-Z_]* .bss..compoundliteral*

Can you include a patch for this in your series?

Thanks!

-- 
Kees Cook
