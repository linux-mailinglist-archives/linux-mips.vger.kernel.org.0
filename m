Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEB119FBA7
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2020 19:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbgDFReT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Apr 2020 13:34:19 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41891 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729452AbgDFReT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Apr 2020 13:34:19 -0400
Received: by mail-pl1-f193.google.com with SMTP id d24so71415pll.8
        for <linux-mips@vger.kernel.org>; Mon, 06 Apr 2020 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iTnt6rhYcfPaF8VxFCcDjmb8zA/fEtWzdbsn94r3j0Q=;
        b=MQCGMhsl3dwiSIjU6h4PN/T92rtkbBhx34/Z41X3W0geicFN53bfNoPfxQtJ/pFRf5
         vpXbGe93sEk/Ugf6U80S2HR8m2aYOKSpXPKn4q32raZiTRepiQaoj20jfGG2bB+QwL8b
         +LxPisBD2+aWLqlF1AOzIxF9qC9taRi+Fep4q3Rn/gxKL9aonCp8hCCq62w8MZsuqPVe
         hnPwWs2lbCBSY7I8QBfMl+iOECe42bubYJGQb1DIi2bUqixQwtpnVgh6W/qcFidl+eFZ
         e1FG1GySSb0OXSv+7uJAEnKYXfmalfMnBO6McNr52FxchDBlJhqB1eXcbzA0MTIkfo/Y
         Lf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iTnt6rhYcfPaF8VxFCcDjmb8zA/fEtWzdbsn94r3j0Q=;
        b=BEEYumHSplqXnsYkDj2SxE4oLF624somltPmpuPQ/QWJaGAG1aTgq4SEBwM6csVWdB
         J/cZ7slvFxXUJoC/ZerkBBjAUzNwNrNS2QFDlTz103f82OrqTWX9ZmSiMZmLxBPWKt7C
         aO6cvQlmqKKx69E7hg5IXT3exP2SF9AMWsOz/94HY0jZOHBCSwku7NWCniX110uZz2ia
         cjWXBkoqvWlat65MRP6MLsVztVqucKU15civWLJPAcZJNN1d2YYvjEU7NDJTaF+LxQfP
         k8Z69wdnW9b+X/rEpHjbhf2G+Jiv0ROqlGDne4spIbiaJfaRdkSa9KrZOG9fqz7COAO3
         6Qbg==
X-Gm-Message-State: AGi0PuYsnJ8N9nksyrgGHfDuaQwW6TdNukPH0GjaDjbDxSKEJ5rAGUV+
        U1g44uxVUIt7wnnr0T4Dqd9Z9ZLdPcoOfzcPnFN+GQ==
X-Google-Smtp-Source: APiQypI6E0407sKfbsNG31VUnX4s1/lfeInDvss/VddCpI3Chm7RJCyzHTm3ROGPHFyV3k07BeU1QcN7icP/3xqtsuU=
X-Received: by 2002:a17:90b:3783:: with SMTP id mz3mr300858pjb.27.1586194458092;
 Mon, 06 Apr 2020 10:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <202004032329.oBqXCsfi%lkp@intel.com> <CAKwvOd=H71Q=r=S6Zr=N1zgkXTb9HyEwF78ZbuKkoigWZxiBDA@mail.gmail.com>
 <20200403192058.GA41585@ubuntu-m2-xlarge-x86> <20200404010210.GA13010@intel.com>
 <20200404013204.p53fteofnppvf7pe@google.com> <20200404211252.3540251a@flygoat-x1e>
In-Reply-To: <20200404211252.3540251a@flygoat-x1e>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 6 Apr 2020 10:34:06 -0700
Message-ID: <CAKwvOdnS8MvEp7aqqswTjP_Mo5=+=+SziPoZ4knuuyQ6rWottg@mail.gmail.com>
Subject: Re: [peterz-queue:sched/urgent 4/5] ld.lld: error: section .text at
 0xFFFFFFFF80200000 of size 0x1E8915C exceeds available address space
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Fangrui Song <maskray@google.com>, linux-mips@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Rui Ueyama <ruiu@google.com>,
        George Rimar <grimar@accesssoftek.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        kbuild-all@lists.01.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Peter Zijlstra <peterz@infradead.org>,
        kbuild test robot <lkp@intel.com>,
        Philip Li <philip.li@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 4, 2020 at 6:16 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> On Fri, 3 Apr 2020 18:32:04 -0700
> Fangrui Song <maskray@google.com> wrote:
>
> >
> > Reproduce for a clang/lld developer:
> >
> > make -j$(nproc) ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu-
> > LD=ld.lld O=/tmp/out/mipsel distclean malta_defconfig vmlinux
> > (Requires mipsel-linux-gnu-as and clang in PATH)
> >
> > I have noticed multiple problems.
> >
> > % file .tmp_vmlinux.kallsyms1
> > .tmp_vmlinux.kallsyms1: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
> > version 1 (SYSV), statically linked,
> > BuildID[sha1]=ff348ad92c80e525b3f14149e57e8987de66e041, not stripped
> >
> > In arch/mips/kernel/vmlinux.lds.S, VMLINUX_LOAD_ADDRESS (from load-y)
> > is 0xffffffff8010000. GNU ld seems to allow 64-bit addresses when
> > linking an ELFCLASS32 file. The addresses will be truncated to
> > 32-bit. This behavior seems error-prone to me.
> >
> > lld does the right thing by erroring out. I do notice a display
> > problem of lld -Map and I have a patch to address that:
> > https://reviews.llvm.org/D77445
> >
> > For 32-bit linux-mips, the right approach seems to be make
> > VMLINUX_LOAD_ADDRESS fit into 32-bit. However, my Linux-fu and
> > MIPS-fu is not strong enough to do this :/
>
> Hi MaskRay,
>
> Could you please try this?

Hi Jiaxun, can you please send this patch?

>
> --- a/arch/mips/mti-malta/Platform
> +++ b/arch/mips/mti-malta/Platform
> @@ -6,6 +6,10 @@ cflags-$(CONFIG_MIPS_MALTA)    +=
> -I$(srctree)/arch/mips/include/asm/mach-malta ifdef CONFIG_KVM_GUEST
>      load-$(CONFIG_MIPS_MALTA)  += 0x0000000040100000
>  else
> +ifdef CONFIG_64BIT
>      load-$(CONFIG_MIPS_MALTA)  += 0xffffffff80100000
> +else
> +    load-$(CONFIG_MIPS_MALTA)  += 0x80100000
> +endif
>  endif
>  all-$(CONFIG_MIPS_MALTA)       := $(COMPRESSION_FNAME).bin
>
> Thanks.
>
> --
> Jiaxun Yang



-- 
Thanks,
~Nick Desaulniers
