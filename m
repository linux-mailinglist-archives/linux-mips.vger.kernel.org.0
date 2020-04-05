Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0F819E826
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 03:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgDEBAj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Apr 2020 21:00:39 -0400
Received: from mga07.intel.com ([134.134.136.100]:19274 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgDEBAj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 4 Apr 2020 21:00:39 -0400
IronPort-SDR: w2TNcq8ppV/Ws832tN1u9kyphEmsqq4/+lyOrRNr4jgxsoYgXmDpe+GpBNVZWab5OYlmPqQqQu
 IF0/upNGX17A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2020 18:00:38 -0700
IronPort-SDR: KTdevKEGBgLUFVjLvH6eBiaL7Ro9iATH9nQ7Lr7gzr7z7F9rmo4wcPY/VJWYBKtqOm8TqlT0+E
 GUqdwWK+blyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,345,1580803200"; 
   d="scan'208";a="239252078"
Received: from unknown (HELO intel.com) ([10.239.159.39])
  by orsmga007.jf.intel.com with ESMTP; 04 Apr 2020 18:00:35 -0700
Date:   Sun, 5 Apr 2020 09:00:05 +0800
From:   Philip Li <philip.li@intel.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
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
Message-ID: <20200405010005.GA18493@intel.com>
References: <202004032329.oBqXCsfi%lkp@intel.com>
 <CAKwvOd=H71Q=r=S6Zr=N1zgkXTb9HyEwF78ZbuKkoigWZxiBDA@mail.gmail.com>
 <20200403192058.GA41585@ubuntu-m2-xlarge-x86>
 <20200404010210.GA13010@intel.com>
 <20200404013204.p53fteofnppvf7pe@google.com>
 <20200404211252.3540251a@flygoat-x1e>
 <20200404215916.GA929@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200404215916.GA929@ubuntu-m2-xlarge-x86>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 04, 2020 at 02:59:16PM -0700, Nathan Chancellor wrote:
> On Sat, Apr 04, 2020 at 09:15:31PM +0800, Jiaxun Yang wrote:
> > On Fri, 3 Apr 2020 18:32:04 -0700
> > Fangrui Song <maskray@google.com> wrote:
> > 
> > > 
> > > Reproduce for a clang/lld developer:
> > > 
> > > make -j$(nproc) ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu-
> > > LD=ld.lld O=/tmp/out/mipsel distclean malta_defconfig vmlinux
> > > (Requires mipsel-linux-gnu-as and clang in PATH)
> > > 
> > > I have noticed multiple problems.
> > > 
> > > % file .tmp_vmlinux.kallsyms1
> > > .tmp_vmlinux.kallsyms1: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
> > > version 1 (SYSV), statically linked,
> > > BuildID[sha1]=ff348ad92c80e525b3f14149e57e8987de66e041, not stripped
> > > 
> > > In arch/mips/kernel/vmlinux.lds.S, VMLINUX_LOAD_ADDRESS (from load-y)
> > > is 0xffffffff8010000. GNU ld seems to allow 64-bit addresses when
> > > linking an ELFCLASS32 file. The addresses will be truncated to
> > > 32-bit. This behavior seems error-prone to me.
> > > 
> > > lld does the right thing by erroring out. I do notice a display
> > > problem of lld -Map and I have a patch to address that:
> > > https://reviews.llvm.org/D77445
> > > 
> > > For 32-bit linux-mips, the right approach seems to be make
> > > VMLINUX_LOAD_ADDRESS fit into 32-bit. However, my Linux-fu and
> > > MIPS-fu is not strong enough to do this :/
> > 
> > Hi MaskRay,
> > 
> > Could you please try this?
> > 
> > --- a/arch/mips/mti-malta/Platform
> > +++ b/arch/mips/mti-malta/Platform
> > @@ -6,6 +6,10 @@ cflags-$(CONFIG_MIPS_MALTA)    +=
> > -I$(srctree)/arch/mips/include/asm/mach-malta ifdef CONFIG_KVM_GUEST
> >      load-$(CONFIG_MIPS_MALTA)  += 0x0000000040100000
> >  else
> > +ifdef CONFIG_64BIT
> >      load-$(CONFIG_MIPS_MALTA)  += 0xffffffff80100000
> > +else
> > +    load-$(CONFIG_MIPS_MALTA)  += 0x80100000
> > +endif
> >  endif
> >  all-$(CONFIG_MIPS_MALTA)       := $(COMPRESSION_FNAME).bin
> > 
> > Thanks.
> > 
> > --
> > Jiaxun Yang
> 
> Thank you, that fixes the error and I see no new ones. I tested
> malta_defconfig, which boots in QEMU:
> 
> Linux version 5.6.0-next-20200404-dirty (nathan@ubuntu-m2-xlarge-x86) (ClangBuiltLinux clang version 11.0.0 (git://github.com/llvm/llvm-project 1ce0bc39eebe95a350174eb0ed4e2508e7cb6ed8), LLD 11.0.0 (git://github.com/llvm/llvm-project 1ce0bc39eebe95a350174eb0ed4e2508e7cb6ed8)) #1 SMP Sat Apr 4 14:54:45 MST 2020
> 
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Hi all, want to consult, does it mean 0-day ci doesn't need blacklist
this ld.lld error anymore? This is a kernel problem and the error itself
is valid.
