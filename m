Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B06719E243
	for <lists+linux-mips@lfdr.de>; Sat,  4 Apr 2020 03:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgDDBcL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 21:32:11 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55788 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgDDBcL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 Apr 2020 21:32:11 -0400
Received: by mail-pj1-f66.google.com with SMTP id fh8so3856455pjb.5
        for <linux-mips@vger.kernel.org>; Fri, 03 Apr 2020 18:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9xhp+//28oDzNfxNQ8aWCT3GL1ZGz7mGwimDQvekNlA=;
        b=Ja47CkiTjPdfA4ZhHyzmo0WJa0TYR/q67d7mdtdrvDctmAkccrnO35dF2vjOdgcm92
         h66QJ5PwY/w2z1mrefYMeqeUA4KVVzEpyp74Z6b8nGiIlyE7s/ED1vHxHo9t0ua8rPlw
         a3DvdEHPkie9Fdim6XlDpFCTaymFN3r39D2OQjkm4zC2ua1adg4e1LDJ5pk8Vgf7EFoh
         wykJOkhYx8bzLQ3ZJmnqz5309xVh/NIATB2zRPrcUwiuRqJz6GG5JfQioZJuRIG9Onj4
         S2//Qorn+wIhrF572gy2ofwBtvIFkz5G50sdrKLNGqtcoNiC2b9BAwRz+8nwfeDFu2pj
         ljyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9xhp+//28oDzNfxNQ8aWCT3GL1ZGz7mGwimDQvekNlA=;
        b=poro7JfaDaKrvx513N3XcqcOxlYSPW5fuGsD3wiXp/cf7sm1rfJfyL73LGVUAUpEsP
         Xckz/6KcqfHB2Ar6/tDmKldykuCY2gS8DAeTDSy8y8cqL9zRk+86svflzpnNaqQxIPFp
         nCm8dUZ0+0wuwwF93dT2JsOxVcjOLgzzyUimBuSyZi94CFrZ8/TQCr9Og0P4EdHIEH5r
         /F8y/EA3KPUwl7MsEdLbvQkqjHvb3VEIjx7jV4mEk+6usxisbXMPkwVxLbQmdTarwglT
         21wZ07noqnCUXF7r3WF/lKGAA8CQ5OEFMyd0m0ffPe7jj+LuWNYaVzBFe3ytF3KxeIkB
         L9BA==
X-Gm-Message-State: AGi0PubOyqEWFHHHlUMRGr0AsfUWjaMWTUIwlJx4IxUm0PyLsym+RfLk
        PeWxvAfnCibGP7MwBSriv29xaR9+9v1l96ne
X-Google-Smtp-Source: APiQypI8uvRVwJSLo8DgMc4ZweAIyETriKFJRQVBH/7/VJ3swcPFgH0nTtXda9Z/IYHn0gl1fkFuLw==
X-Received: by 2002:a17:90a:8909:: with SMTP id u9mr13182748pjn.149.1585963928162;
        Fri, 03 Apr 2020 18:32:08 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id b2sm6535943pjc.6.2020.04.03.18.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 18:32:07 -0700 (PDT)
Date:   Fri, 3 Apr 2020 18:32:04 -0700
From:   Fangrui Song <maskray@google.com>
To:     linux-mips@vger.kernel.org
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
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
Message-ID: <20200404013204.p53fteofnppvf7pe@google.com>
References: <202004032329.oBqXCsfi%lkp@intel.com>
 <CAKwvOd=H71Q=r=S6Zr=N1zgkXTb9HyEwF78ZbuKkoigWZxiBDA@mail.gmail.com>
 <20200403192058.GA41585@ubuntu-m2-xlarge-x86>
 <20200404010210.GA13010@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200404010210.GA13010@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2020-04-04, Philip Li wrote:
>On Fri, Apr 03, 2020 at 12:20:58PM -0700, Nathan Chancellor wrote:
>> On Fri, Apr 03, 2020 at 09:37:57AM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
>> > + Fangrui, Rui, George
>> > The below errors from LLD look new to me, thoughts?
>> >
>> > On Fri, Apr 3, 2020 at 8:42 AM kbuild test robot <lkp@intel.com> wrote:
>> > >
>> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/urgent
>> > > head:   59d4dade8ccbaa299f5f5dcd775f7a9b7277fb5a
>> > > commit: ae1177617ed17157f29959b0fe4d60f532a5b36e [4/5] workqueue: Remove the warning in wq_worker_sleeping()
>> > > config: mips-randconfig-a001-20200403 (attached as .config)
>> > > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project f68cc2a7ed766965028b8b0f0d9300a0460c3cf1)
>> > > reproduce:
>> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>> > >         chmod +x ~/bin/make.cross
>> > >         git checkout ae1177617ed17157f29959b0fe4d60f532a5b36e
>> > >         # save the attached .config to linux build tree
>> > >         COMPILER=clang make.cross ARCH=mips
>> > >
>> > > If you fix the issue, kindly add following tag
>> > > Reported-by: kbuild test robot <lkp@intel.com>
>> > >
>> > > All errors (new ones prefixed by >>):
>> > >
>> > > >> ld.lld: error: section .text at 0xFFFFFFFF80200000 of size 0x1E8915C exceeds available address space
>> > > >> ld.lld: error: section __ex_table at 0xFFFFFFFF82089160 of size 0x27B0 exceeds available address space
>> > > >> ld.lld: error: section __dbe_table at 0xFFFFFFFF8208B910 of size 0x0 exceeds available address space
>> > >    ld.lld: error: section .rodata at 0xFFFFFFFF8208C000 of size 0x480F81 exceeds available address space
>> > >    ld.lld: error: section .data..page_aligned at 0xFFFFFFFF8250D000 of size 0x2000 exceeds available address space
>> > >    ld.lld: error: section .got at 0xFFFFFFFF8250F000 of size 0x8 exceeds available address space
>> > >    ld.lld: error: section .rodata1 at 0xFFFFFFFF8250F008 of size 0x0 exceeds available address space
>> > >    ld.lld: error: section .pci_fixup at 0xFFFFFFFF8250F008 of size 0x0 exceeds available address space
>> > >    ld.lld: error: section .builtin_fw at 0xFFFFFFFF8250F008 of size 0x0 exceeds available address space
>> > >    ld.lld: error: section __ksymtab at 0xFFFFFFFF8250F008 of size 0x145EC exceeds available address space
>> > >    ld.lld: error: section __ksymtab_gpl at 0xFFFFFFFF825235F4 of size 0x12378 exceeds available address space
>> > >    ld.lld: error: section __ksymtab_unused at 0xFFFFFFFF8253596C of size 0x0 exceeds available address space
>> > >    ld.lld: error: section __ksymtab_unused_gpl at 0xFFFFFFFF8253596C of size 0x0 exceeds available address space
>> > >    ld.lld: error: section __ksymtab_gpl_future at 0xFFFFFFFF8253596C of size 0x0 exceeds available address space
>> > >    ld.lld: error: section __kcrctab at 0xFFFFFFFF8253596C of size 0x0 exceeds available address space
>> > >    ld.lld: error: section __kcrctab_gpl at 0xFFFFFFFF8253596C of size 0x0 exceeds available address space
>> > >    ld.lld: error: section __kcrctab_unused at 0xFFFFFFFF8253596C of size 0x0 exceeds available address space
>> > >    ld.lld: error: section __kcrctab_unused_gpl at 0xFFFFFFFF8253596C of size 0x0 exceeds available address space
>> > >    ld.lld: error: section __kcrctab_gpl_future at 0xFFFFFFFF8253596C of size 0x0 exceeds available address space
>> > >    ld.lld: error: section __ksymtab_strings at 0xFFFFFFFF8253596C of size 0x40CB3 exceeds available address space
>> > >    ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
>> > >
>> > > ---
>> > > 0-DAY CI Kernel Test Service, Intel Corporation
>> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>> > >
>> >
>> >
>> >
>> > --
>> > Thanks,
>> > ~Nick Desaulniers
>> >
>>
>> This is an open issue on our issue tracker:
>>
>> https://github.com/ClangBuiltLinux/linux/issues/786
>>
>> Note that this is a mips-randconfig.
>Thanks, we will temporarily blacklist this error.

Reproduce for a clang/lld developer:

make -j$(nproc) ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu- LD=ld.lld O=/tmp/out/mipsel distclean malta_defconfig vmlinux
(Requires mipsel-linux-gnu-as and clang in PATH)

I have noticed multiple problems.

% file .tmp_vmlinux.kallsyms1
.tmp_vmlinux.kallsyms1: ELF 32-bit LSB executable, MIPS, MIPS32 rel2 version 1 (SYSV), statically linked, BuildID[sha1]=ff348ad92c80e525b3f14149e57e8987de66e041, not stripped

In arch/mips/kernel/vmlinux.lds.S, VMLINUX_LOAD_ADDRESS (from load-y) is 0xffffffff8010000.
GNU ld seems to allow 64-bit addresses when linking an ELFCLASS32 file.
The addresses will be truncated to 32-bit. This behavior seems error-prone to me.

lld does the right thing by erroring out. I do notice a display problem
of lld -Map and I have a patch to address that: https://reviews.llvm.org/D77445

For 32-bit linux-mips, the right approach seems to be make VMLINUX_LOAD_ADDRESS fit into 32-bit.
However, my Linux-fu and MIPS-fu is not strong enough to do this :/
