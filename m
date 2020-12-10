Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5172D6BB1
	for <lists+linux-mips@lfdr.de>; Fri, 11 Dec 2020 00:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391973AbgLJXN2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Dec 2020 18:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391915AbgLJXNR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Dec 2020 18:13:17 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C656C0611CA
        for <linux-mips@vger.kernel.org>; Thu, 10 Dec 2020 14:36:56 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id n7so5645589pgg.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Dec 2020 14:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5GBGxfLDmoveGpJ9L5HVmKW/Nrr5Gil4FnQfI25Evx8=;
        b=TmuEpAOZ33fl36J4hLO2oipR/LPALK+ZrWvm1zxKBBUVmqCyHUQBmqCMYHpA9TOGkQ
         NxRmXeB2vPVedR4uaJGg3z/I53svmnoQ0u/hi8YVs2LKOQE1ZnnNFMVMvUpXrmM/0C5D
         adKRflwcnfLACGmrEUqWTYaBAq4MxnG6uizjoEDgIDlcDKzRJhvIDYaIAUIu2FXXkXHy
         gbslCBnusfa63aqcaRMKWTa8ZN+E3u5vYOKHP4BeL4bnRriAT9P0bzIUplIuN490pY7B
         OUP3q6UgKS1vWPb1/mBH3dPmqkvUAblzCZLnaeEpSLkhGogMja8PN/wr7monSh8JCVRE
         ldtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5GBGxfLDmoveGpJ9L5HVmKW/Nrr5Gil4FnQfI25Evx8=;
        b=AYVhjYETTOULnFD+xEJ8gQPz9qrOhLXtxsGNyZ2vnRTFyJnfNhT0UzJ+/TlF6hONkj
         VPMvgJbBzEbYubGVcE51y+Po7WU5o0gcZ9bRmaQCjaSOPy9CNqxbZtrlj4DV8LW8bizJ
         81KWypK7Dk+klMQmXXnoTcaWzgSzlDIaZPKNjQEBhi29Ka3R5BMxms65QHbiv/kp+oeb
         4PIFG0Tqp5JUvlGCg8sKkv4ipmX9E3KYWirUua4rn1mmydfQBeYmhpKHMzP1hu1jQSxV
         ReXjC/BFihueojdqvFd/eQLT8PrQcuCjm9L0CCTssjKx0zFVwSo+EH/pR7G4hWyBt52v
         WnbA==
X-Gm-Message-State: AOAM531ezfEmb9CyX4PwsDHGuhIAyzD3Iawao3vVvm3e7KxACuLB/KGd
        DTUuVA24xMQRueUoLXq8GT/s1auMB6Mf7LTa3Zdy3nEhGcbkKw==
X-Google-Smtp-Source: ABdhPJwbW2fMzvD12MhzuAZRF/4urKE3RHRtlIy2tjdmtLts9J9ZHedkBgJOtFXveyGdxWpUM6oP9ORDxjPVfGfy3sI=
X-Received: by 2002:a17:902:8541:b029:da:fcd1:7bf with SMTP id
 d1-20020a1709028541b02900dafcd107bfmr8250628plo.56.1607637854163; Thu, 10 Dec
 2020 14:04:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYuRHoZsW9KyRJVGrXznB8dbt5+ZZTMCpK+3mqcuwHcSMw@mail.gmail.com>
In-Reply-To: <CA+G9fYuRHoZsW9KyRJVGrXznB8dbt5+ZZTMCpK+3mqcuwHcSMw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 10 Dec 2020 14:04:02 -0800
Message-ID: <CAKwvOdn2wjqR6aSRNP1Ztz3rnKg7rcdjYboacBdWJ9TO7u_kmA@mail.gmail.com>
Subject: Re: MIPS + clang-11 + allnoconfig / tinyconfig builds failed
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        xie.he.0141@gmail.com,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Dan Rue <dan.rue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 10, 2020 at 9:18 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Recently we have setup clang build and found that,
> MIPS + clang-11 + allnoconfig  build failed
> MIPS + clang-11 + tinyconfig  build failed
>
> MIPS + clang-10 + allnoconfig  build failed
> MIPS + clang-10 + tinyconfig  build failed
>
> We have noticed these build failures on
>  - stable-4.19
>  - stable-5.4
>  - stable-5.9
>  - mainline
>  - next-master
>
> FYI, The defconfig builds are successful.
> BTW, May I know what are the configs you build often ?

Hi Naresh, thank you again for these reports; they are invaluable.  We
were testing malta_kvm_guest_defconfig for ARCH=mips and ARCH=mipsel.
We should work to get those configs building/tested as well.

"were testing" past tense, because TravisCI just nuked our builds!
https://blog.travis-ci.com/oss-announcement

So we're running with one CI system down at the moment.  I'm working
with Dan on leveraging tuxbuild and github actions.

>
> Steps to reproduce build failure:
> -----------------------------------------
> # sudo pip3 install -U tuxmake
> # tuxmake --runtime docker --target-arch mips --toolchain clang-11
> --kconfig allnoconfig
> # tuxmake --runtime docker --target-arch mips --toolchain clang-11
> --kconfig tinyconfig
>
> Build failed log:
> ake --silent --keep-going --jobs=16
> O=/home/tuxbuild/.cache/tuxmake/builds/2/tmp ARCH=mips
> CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
> clang' allnoconfig
> make --silent --keep-going --jobs=16
> O=/home/tuxbuild/.cache/tuxmake/builds/2/tmp ARCH=mips
> CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
> clang'
> /builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/vdso/elf.S:14:1:
> warning: DWARF2 only supports one section per compilation unit
> .pushsection .note.Linux, "a",@note ; .balign 4 ; .long 2f - 1f ;
> .long 4484f - 3f ; .long 0 ; 1:.asciz "Linux" ; 2:.balign 4 ; 3:
> ^
> /builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/vdso/elf.S:34:2:
> warning: DWARF2 only supports one section per compilation unit
>  .section .mips_abiflags, "a"
>  ^

So this is likely the vdso resetting KBUILD_CFLAGS (common issue)
which is dropping -no-integrated-as, but setting -Wa,-gdwarf-2, which
we disabled in the top level Makefile.

> /builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/lib/uncached.c:45:6:
> warning: variable 'sp' is uninitialized when used here
> [-Wuninitialized]
>         if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
>             ^~
> /builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/lib/uncached.c:40:18:
> note: initialize the variable 'sp' to silence this warning
>         register long sp __asm__("$sp");
>                         ^
>                          = 0

I think we recently discussed this upstream.
https://lore.kernel.org/linux-mips/alpine.LFD.2.21.2012061431190.656242@eddie.linux-mips.org/T/#mcaabe339aaee81ed8f6dfe761f699c82e938b4c5

> 1 warning generated.
> WARNING: modpost: vmlinux.o(.text+0x1a124): Section mismatch in
> reference from the function r4k_cache_init() to the function
> .init.text:loongson3_sc_init()
> The function r4k_cache_init() references
> the function __init loongson3_sc_init().
> This is often because r4k_cache_init lacks a __init
> annotation or the annotation of loongson3_sc_init is wrong.
> WARNING: modpost: vmlinux.o(.text+0x1f1c8): Section mismatch in
> reference from the function mips_sc_init() to the function
> .init.text:mips_sc_probe()
> The function mips_sc_init() references
> the function __init mips_sc_probe().
> This is often because mips_sc_init lacks a __init
> annotation or the annotation of mips_sc_probe is wrong.
> FATAL: modpost: Section mismatches detected.
> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> make[2]: *** [/builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/scripts/Makefile.modpost:59:
> vmlinux.symvers] Error 1

Anders sent a patch for this, too, IIRC.  Once the above fixes land
upstream, we probably need to follow up on ensuring they get picked up
into the affected branches of stable.

-- 
Thanks,
~Nick Desaulniers
