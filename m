Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE6E19E66D
	for <lists+linux-mips@lfdr.de>; Sat,  4 Apr 2020 18:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgDDQT2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Apr 2020 12:19:28 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40756 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgDDQT2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Apr 2020 12:19:28 -0400
Received: by mail-pj1-f67.google.com with SMTP id kx8so4475541pjb.5
        for <linux-mips@vger.kernel.org>; Sat, 04 Apr 2020 09:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5c2TKc3/Skvb2aNLG5b+DKVIZTcJ6UWaKHap6ye56Uo=;
        b=wHgM4Pc1jDZkafvIf4ipLnCyF5aHqaOv0Cnwav8nURH+e2qssRHM023shQD3irJHqY
         6vMrHCyatNyGVmhxnBZmjUzLJePnltTdZ6Yai2T8wchlBZroMqvfLA4hINy7Jc7JrAR0
         bMvAcrqmwmmBonFyHtFzVweSD5Yx6TT9dTebTFunSs9tRchO4ug2U/8BNpZFq3LYRb+E
         5LEegHLhlpbkvTVUOvbOqn4RSACl/5lQ4OC0zoCwUGDuPdsVzg+bJLIaCKDKHeWe2Leu
         NYwX4OgqgEivZT4GKjUL8jFd0QjzTzZfjdNkrxYTm7F+KctSGI7qJLrySE7RtVZuOZ6a
         lk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5c2TKc3/Skvb2aNLG5b+DKVIZTcJ6UWaKHap6ye56Uo=;
        b=XBugwtn7LZmbpe1XPhiXHWXFln/J7WWOuIlHlzaBShvuQO73AVnMFBHz7WsRpLGVCR
         SK0LT9eRPFHrhiQlKPubZiQexx0t/1JAU9H9oLO33cfGKNkMbtjhV/vcV/Vu0wos6neh
         HyHYXPs3FU961D5ZXf/ed0bbYqterEySFbmdmMpOch8Hyxzx7oo9+cV8J93/se01hMwp
         /u7ImsgFStPGH5C166J7GQ3vEkKrAV24GpsbW9XASn++9/nscLzlhr8cTRb9+okbu4I3
         YT33SxUuLwQ9gO1VnEda/z+DLPmwtsopJtijqohxdn9nlwNrPcMYaIxxmUYaxXfdvV4M
         szGw==
X-Gm-Message-State: AGi0PuaWLdNIgxgZ9VWhn87B+n/tSurg3OTFzsw6AdyefUQKQgZkmOAG
        wxJ5CyZfKMjLU5f1fhwQEIlIzg==
X-Google-Smtp-Source: APiQypK0SAh3WvGC1ZE4WfIqHL8obhMxnuGybqqlPqQwhQgzk3P6PH8eKjFfFMdlXniLZVxGx5bupg==
X-Received: by 2002:a17:90a:714b:: with SMTP id g11mr15791044pjs.17.1586017167213;
        Sat, 04 Apr 2020 09:19:27 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id f8sm7957200pfq.178.2020.04.04.09.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 09:19:26 -0700 (PDT)
Date:   Sat, 4 Apr 2020 09:19:23 -0700
From:   Fangrui Song <maskray@google.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
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
Message-ID: <20200404161923.iprsqjhvv5n2ggbl@google.com>
References: <202004032329.oBqXCsfi%lkp@intel.com>
 <CAKwvOd=H71Q=r=S6Zr=N1zgkXTb9HyEwF78ZbuKkoigWZxiBDA@mail.gmail.com>
 <20200403192058.GA41585@ubuntu-m2-xlarge-x86>
 <20200404010210.GA13010@intel.com>
 <20200404013204.p53fteofnppvf7pe@google.com>
 <20200404211252.3540251a@flygoat-x1e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200404211252.3540251a@flygoat-x1e>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-04-04, Jiaxun Yang wrote:
>On Fri, 3 Apr 2020 18:32:04 -0700
>Fangrui Song <maskray@google.com> wrote:
>
>>
>> Reproduce for a clang/lld developer:
>>
>> make -j$(nproc) ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu-
>> LD=ld.lld O=/tmp/out/mipsel distclean malta_defconfig vmlinux
>> (Requires mipsel-linux-gnu-as and clang in PATH)
>>
>> I have noticed multiple problems.
>>
>> % file .tmp_vmlinux.kallsyms1
>> .tmp_vmlinux.kallsyms1: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
>> version 1 (SYSV), statically linked,
>> BuildID[sha1]=ff348ad92c80e525b3f14149e57e8987de66e041, not stripped
>>
>> In arch/mips/kernel/vmlinux.lds.S, VMLINUX_LOAD_ADDRESS (from load-y)
>> is 0xffffffff8010000. GNU ld seems to allow 64-bit addresses when
>> linking an ELFCLASS32 file. The addresses will be truncated to
>> 32-bit. This behavior seems error-prone to me.
>>
>> lld does the right thing by erroring out. I do notice a display
>> problem of lld -Map and I have a patch to address that:
>> https://reviews.llvm.org/D77445
>>
>> For 32-bit linux-mips, the right approach seems to be make
>> VMLINUX_LOAD_ADDRESS fit into 32-bit. However, my Linux-fu and
>> MIPS-fu is not strong enough to do this :/
>
>Hi MaskRay,
>
>Could you please try this?
>
>--- a/arch/mips/mti-malta/Platform
>+++ b/arch/mips/mti-malta/Platform
>@@ -6,6 +6,10 @@ cflags-$(CONFIG_MIPS_MALTA)    +=
>-I$(srctree)/arch/mips/include/asm/mach-malta ifdef CONFIG_KVM_GUEST
>     load-$(CONFIG_MIPS_MALTA)  += 0x0000000040100000
> else
>+ifdef CONFIG_64BIT
>     load-$(CONFIG_MIPS_MALTA)  += 0xffffffff80100000
>+else
>+    load-$(CONFIG_MIPS_MALTA)  += 0x80100000
>+endif
> endif
> all-$(CONFIG_MIPS_MALTA)       := $(COMPRESSION_FNAME).bin
>
>Thanks.
>
>--
>Jiaxun Yang

Thanks! The patch fixes the problem linking with LLD.

If you are going to send a patch,

Reviewed-by: Fangrui Song <maskray@google.com>
