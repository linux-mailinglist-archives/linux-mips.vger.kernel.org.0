Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFDE819E528
	for <lists+linux-mips@lfdr.de>; Sat,  4 Apr 2020 15:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgDDNR6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Apr 2020 09:17:58 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17826 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725870AbgDDNR5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Apr 2020 09:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586006142;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=M5XBaodP3z4O/JdISCaQsd6Zd50hxPiItNQG8SxouHA=;
        b=Ty/YGshpEZFUrCSE/hSAb5rbH4t+3uLaDLQTR+ZPkrrx4zUb64PlPyXnU4EZ3zJx
        m29aMau2OirdZmIo0zNZsQhYkKh8Z+gP0awZu4EdCY4QCiq5QhMyJlaKQkIVSL1wjL5
        NUEvNfvc9nGvQlbBp1Qk5bPOYaXR3L61l29JZy9k=
Received: from flygoat-x1e (115.193.87.168 [115.193.87.168]) by mx.zoho.com.cn
        with SMTPS id 1586006137577447.17997068119337; Sat, 4 Apr 2020 21:15:37 +0800 (CST)
Date:   Sat, 4 Apr 2020 21:15:31 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Fangrui Song <maskray@google.com>
Cc:     linux-mips@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
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
Message-ID: <20200404211252.3540251a@flygoat-x1e>
In-Reply-To: <20200404013204.p53fteofnppvf7pe@google.com>
References: <202004032329.oBqXCsfi%lkp@intel.com>
 <CAKwvOd=H71Q=r=S6Zr=N1zgkXTb9HyEwF78ZbuKkoigWZxiBDA@mail.gmail.com>
 <20200403192058.GA41585@ubuntu-m2-xlarge-x86>
 <20200404010210.GA13010@intel.com>
 <20200404013204.p53fteofnppvf7pe@google.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 3 Apr 2020 18:32:04 -0700
Fangrui Song <maskray@google.com> wrote:

> 
> Reproduce for a clang/lld developer:
> 
> make -j$(nproc) ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu-
> LD=ld.lld O=/tmp/out/mipsel distclean malta_defconfig vmlinux
> (Requires mipsel-linux-gnu-as and clang in PATH)
> 
> I have noticed multiple problems.
> 
> % file .tmp_vmlinux.kallsyms1
> .tmp_vmlinux.kallsyms1: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
> version 1 (SYSV), statically linked,
> BuildID[sha1]=ff348ad92c80e525b3f14149e57e8987de66e041, not stripped
> 
> In arch/mips/kernel/vmlinux.lds.S, VMLINUX_LOAD_ADDRESS (from load-y)
> is 0xffffffff8010000. GNU ld seems to allow 64-bit addresses when
> linking an ELFCLASS32 file. The addresses will be truncated to
> 32-bit. This behavior seems error-prone to me.
> 
> lld does the right thing by erroring out. I do notice a display
> problem of lld -Map and I have a patch to address that:
> https://reviews.llvm.org/D77445
> 
> For 32-bit linux-mips, the right approach seems to be make
> VMLINUX_LOAD_ADDRESS fit into 32-bit. However, my Linux-fu and
> MIPS-fu is not strong enough to do this :/

Hi MaskRay,

Could you please try this?

--- a/arch/mips/mti-malta/Platform
+++ b/arch/mips/mti-malta/Platform
@@ -6,6 +6,10 @@ cflags-$(CONFIG_MIPS_MALTA)    +=
-I$(srctree)/arch/mips/include/asm/mach-malta ifdef CONFIG_KVM_GUEST
     load-$(CONFIG_MIPS_MALTA)  += 0x0000000040100000
 else
+ifdef CONFIG_64BIT
     load-$(CONFIG_MIPS_MALTA)  += 0xffffffff80100000
+else
+    load-$(CONFIG_MIPS_MALTA)  += 0x80100000
+endif
 endif
 all-$(CONFIG_MIPS_MALTA)       := $(COMPRESSION_FNAME).bin

Thanks.

--
Jiaxun Yang
