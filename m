Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FBE19E84F
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 03:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgDEBjt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Apr 2020 21:39:49 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33140 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDEBjs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Apr 2020 21:39:48 -0400
Received: by mail-ot1-f65.google.com with SMTP id 22so11699422otf.0
        for <linux-mips@vger.kernel.org>; Sat, 04 Apr 2020 18:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hKxSGX1KbNM2Zqe0YCiRfZZm/gAaCb+nxjYpt03wYi8=;
        b=MadAo0uGEskzODEaBCVClChcpz44OIU047jmv2PEwyuQd6YXHKCXCSDqKxqvCKJt+C
         EE5PTkQVgfkDzFI1nO9YbbrAzGqEmEHNZpKSrVNBMBOWAbO9IvdzkcdSF2SIC+lppo8M
         OtC/1N4fTir/M0YGgfGeHMXoKIV55VzawoiuNLqPcEfHIe2Vs+HeDmRL1y9UOpmmbBr2
         uXjCXW7pUyo+TiGCHKxEKU/ZtGUQ2XIs6EuOksl6oKeTIcBfdDbrE5dzJcHtHZaX54co
         dsGNtc7gsdGUxKTwWsnarYa21dd42WSPuOCzQHQVBEeF9FchcSCZinY64KI/G//tZrig
         mvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hKxSGX1KbNM2Zqe0YCiRfZZm/gAaCb+nxjYpt03wYi8=;
        b=FrJ9M/FMY4qBC8T41SnLXM3PMa1cyCikwHH+luJ+P/2zIZCOG/5NtwLZxKu3B4CRoo
         v1Ct5nzkP99Z+m9YdKa+vP8D96ZhmERbXtek5tBuIcJdaUAzZTOgKCqwckg4d62C+YaC
         uKFFl08xMXdVc5mSaTP5AwKGqvAoUX50Z0v32+csIXXNcdp3bVdK7ymPzIVDdLEU1vG9
         tDEH6WNxwP4Ht68Xt7xszg+YLhWZIozHkz/jFwigYMW8L95Q0Jr1adTE9RJLbOKFGh7v
         7Df3DGGLTzuWU+OEmHlSjl7c0+lNFiscio7AtYfe0fNjZarbZmR3ySppUSbaOHCkVBTj
         Bh5A==
X-Gm-Message-State: AGi0PubhgrQuvGoCPmXZDFccZ3LLe/KruUMC4yKzKOfsxtLjHOBrVK+c
        Kb1fsPvZzKhr1WhCNFk8Ol8=
X-Google-Smtp-Source: APiQypLj6MzuoO/g3FnUbf8Pcx8L0tvbqI8pnV1kWBPEGjWRO9XvES4+SD1CC9nAzmqNsBqlwZPpuA==
X-Received: by 2002:a9d:128:: with SMTP id 37mr12039220otu.270.1586050787975;
        Sat, 04 Apr 2020 18:39:47 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 90sm3347057otc.29.2020.04.04.18.39.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Apr 2020 18:39:47 -0700 (PDT)
Date:   Sat, 4 Apr 2020 18:39:45 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Philip Li <philip.li@intel.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Fangrui Song <maskray@google.com>, linux-mips@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rui Ueyama <ruiu@google.com>,
        George Rimar <grimar@accesssoftek.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        kbuild-all@lists.01.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Peter Zijlstra <peterz@infradead.org>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [peterz-queue:sched/urgent 4/5] ld.lld: error: section .text at
 0xFFFFFFFF80200000 of size 0x1E8915C exceeds available address space
Message-ID: <20200405013945.GA16484@ubuntu-m2-xlarge-x86>
References: <202004032329.oBqXCsfi%lkp@intel.com>
 <CAKwvOd=H71Q=r=S6Zr=N1zgkXTb9HyEwF78ZbuKkoigWZxiBDA@mail.gmail.com>
 <20200403192058.GA41585@ubuntu-m2-xlarge-x86>
 <20200404010210.GA13010@intel.com>
 <20200404013204.p53fteofnppvf7pe@google.com>
 <20200404211252.3540251a@flygoat-x1e>
 <20200404215916.GA929@ubuntu-m2-xlarge-x86>
 <20200405010005.GA18493@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200405010005.GA18493@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 05, 2020 at 09:00:05AM +0800, Philip Li wrote:
> On Sat, Apr 04, 2020 at 02:59:16PM -0700, Nathan Chancellor wrote:
> > On Sat, Apr 04, 2020 at 09:15:31PM +0800, Jiaxun Yang wrote:
> > > On Fri, 3 Apr 2020 18:32:04 -0700
> > > Fangrui Song <maskray@google.com> wrote:
> > > 
> > > > 
> > > > Reproduce for a clang/lld developer:
> > > > 
> > > > make -j$(nproc) ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu-
> > > > LD=ld.lld O=/tmp/out/mipsel distclean malta_defconfig vmlinux
> > > > (Requires mipsel-linux-gnu-as and clang in PATH)
> > > > 
> > > > I have noticed multiple problems.
> > > > 
> > > > % file .tmp_vmlinux.kallsyms1
> > > > .tmp_vmlinux.kallsyms1: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
> > > > version 1 (SYSV), statically linked,
> > > > BuildID[sha1]=ff348ad92c80e525b3f14149e57e8987de66e041, not stripped
> > > > 
> > > > In arch/mips/kernel/vmlinux.lds.S, VMLINUX_LOAD_ADDRESS (from load-y)
> > > > is 0xffffffff8010000. GNU ld seems to allow 64-bit addresses when
> > > > linking an ELFCLASS32 file. The addresses will be truncated to
> > > > 32-bit. This behavior seems error-prone to me.
> > > > 
> > > > lld does the right thing by erroring out. I do notice a display
> > > > problem of lld -Map and I have a patch to address that:
> > > > https://reviews.llvm.org/D77445
> > > > 
> > > > For 32-bit linux-mips, the right approach seems to be make
> > > > VMLINUX_LOAD_ADDRESS fit into 32-bit. However, my Linux-fu and
> > > > MIPS-fu is not strong enough to do this :/
> > > 
> > > Hi MaskRay,
> > > 
> > > Could you please try this?
> > > 
> > > --- a/arch/mips/mti-malta/Platform
> > > +++ b/arch/mips/mti-malta/Platform
> > > @@ -6,6 +6,10 @@ cflags-$(CONFIG_MIPS_MALTA)    +=
> > > -I$(srctree)/arch/mips/include/asm/mach-malta ifdef CONFIG_KVM_GUEST
> > >      load-$(CONFIG_MIPS_MALTA)  += 0x0000000040100000
> > >  else
> > > +ifdef CONFIG_64BIT
> > >      load-$(CONFIG_MIPS_MALTA)  += 0xffffffff80100000
> > > +else
> > > +    load-$(CONFIG_MIPS_MALTA)  += 0x80100000
> > > +endif
> > >  endif
> > >  all-$(CONFIG_MIPS_MALTA)       := $(COMPRESSION_FNAME).bin
> > > 
> > > Thanks.
> > > 
> > > --
> > > Jiaxun Yang
> > 
> > Thank you, that fixes the error and I see no new ones. I tested
> > malta_defconfig, which boots in QEMU:
> > 
> > Linux version 5.6.0-next-20200404-dirty (nathan@ubuntu-m2-xlarge-x86) (ClangBuiltLinux clang version 11.0.0 (git://github.com/llvm/llvm-project 1ce0bc39eebe95a350174eb0ed4e2508e7cb6ed8), LLD 11.0.0 (git://github.com/llvm/llvm-project 1ce0bc39eebe95a350174eb0ed4e2508e7cb6ed8)) #1 SMP Sat Apr 4 14:54:45 MST 2020
> > 
> > Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Hi all, want to consult, does it mean 0-day ci doesn't need blacklist
> this ld.lld error anymore? This is a kernel problem and the error itself
> is valid.

The error is valid it seems but no commit should be blamed for causing
that error. In other words, it should be fine to un-blacklist it but
emails should not be sent to patch authors if that error is the only
error in the log.

Cheers,
Nathan
