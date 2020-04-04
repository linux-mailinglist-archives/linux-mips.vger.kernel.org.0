Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 451C319E7D3
	for <lists+linux-mips@lfdr.de>; Sat,  4 Apr 2020 23:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgDDV7U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Apr 2020 17:59:20 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33416 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgDDV7U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Apr 2020 17:59:20 -0400
Received: by mail-ot1-f67.google.com with SMTP id 22so11390933otf.0
        for <linux-mips@vger.kernel.org>; Sat, 04 Apr 2020 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pVp3qksQb2vdqHq/6WfrBiZ707DIbhDx+1bFys5wWR0=;
        b=UWJaKC8VQz5NCT4CtcKj3R87eyTNaxoSvSEQmcR84R8Nf2KaLfEXx7FXC4tBvnw9tb
         hGDvKw8p92sFvHDlwJ3Y3GR1Kkwj3KXe/lhIgrSdrI7BvK4xQQlYVOaCjgH1fiMUclXL
         ShDPjmOcazCuOcMZFhy2GINAweYd9jM9tnEKSCwXcE8mSi6LE2syDyBt2dWSVHNzdj22
         My0nYhJwmQI21fG0XypfyyTYk8rDVknuw2m6EHsPmvB/hp68G0Hj56XEC80eUIXuRGWs
         DC23lurRSXfUE1ibWW/3IucqKIsc+090iPPDmwrVJ+cBCfGz2CLLZfQMQE/f8+hAYOOY
         5I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pVp3qksQb2vdqHq/6WfrBiZ707DIbhDx+1bFys5wWR0=;
        b=BYGaJpPumzP0TEam9VPMln9t3XRnJE+tbtfud6aKsjkfx4pe2EGK/ArABMu88nr3Yz
         OQJ7NKGuMP0WUjR0wrphrcwkH2jpr2p+1l3x7bpWRssX5I0qx6/d3PghIBuHaifYE+Ag
         5iGBRVxOJ7YL2I7TXcOlylDxhSV+JnHof1CvxESKchI126i7X3TGrmH28pP6cBgcJsXv
         6XvozVIZFze5s/eprnbAAeyo77CqMFCHdttaGl9CGJV16EThXogYyC95Y43GpsTe8H5Z
         +VXIYRNaQw+BReIyAcDEESXyJfP1ZzUWXE1R9lWv1O9EWF3QTct3dPcSvgJ/ooAWzb9p
         X/Bw==
X-Gm-Message-State: AGi0PubRbSKXlr6G4pXZZR80r1naEuqlUQM+ddldQSzBYyjIkZXzOtet
        maNYGm/FY8Ouk3dVkfK9+iU=
X-Google-Smtp-Source: APiQypKSPf+kGTRdSBP2S/QvXSBeJxYkdvB7Scfd1CynVz8K0WsXE+ic4wk7gGdfE8rfDwkw+af1pg==
X-Received: by 2002:a9d:5e0d:: with SMTP id d13mr12164436oti.162.1586037559205;
        Sat, 04 Apr 2020 14:59:19 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 81sm3213961otu.51.2020.04.04.14.59.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Apr 2020 14:59:18 -0700 (PDT)
Date:   Sat, 4 Apr 2020 14:59:16 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Fangrui Song <maskray@google.com>, linux-mips@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rui Ueyama <ruiu@google.com>,
        George Rimar <grimar@accesssoftek.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        kbuild-all@lists.01.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Peter Zijlstra <peterz@infradead.org>,
        kbuild test robot <lkp@intel.com>,
        Philip Li <philip.li@intel.com>
Subject: Re: [peterz-queue:sched/urgent 4/5] ld.lld: error: section .text at
 0xFFFFFFFF80200000 of size 0x1E8915C exceeds available address space
Message-ID: <20200404215916.GA929@ubuntu-m2-xlarge-x86>
References: <202004032329.oBqXCsfi%lkp@intel.com>
 <CAKwvOd=H71Q=r=S6Zr=N1zgkXTb9HyEwF78ZbuKkoigWZxiBDA@mail.gmail.com>
 <20200403192058.GA41585@ubuntu-m2-xlarge-x86>
 <20200404010210.GA13010@intel.com>
 <20200404013204.p53fteofnppvf7pe@google.com>
 <20200404211252.3540251a@flygoat-x1e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200404211252.3540251a@flygoat-x1e>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 04, 2020 at 09:15:31PM +0800, Jiaxun Yang wrote:
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

Thank you, that fixes the error and I see no new ones. I tested
malta_defconfig, which boots in QEMU:

Linux version 5.6.0-next-20200404-dirty (nathan@ubuntu-m2-xlarge-x86) (ClangBuiltLinux clang version 11.0.0 (git://github.com/llvm/llvm-project 1ce0bc39eebe95a350174eb0ed4e2508e7cb6ed8), LLD 11.0.0 (git://github.com/llvm/llvm-project 1ce0bc39eebe95a350174eb0ed4e2508e7cb6ed8)) #1 SMP Sat Apr 4 14:54:45 MST 2020

Tested-by: Nathan Chancellor <natechancellor@gmail.com>
