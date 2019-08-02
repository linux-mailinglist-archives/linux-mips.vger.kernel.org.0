Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCF57FE98
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2019 18:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391226AbfHBQ3T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Aug 2019 12:29:19 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46279 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391044AbfHBQ3S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Aug 2019 12:29:18 -0400
Received: by mail-ed1-f68.google.com with SMTP id d4so72960121edr.13
        for <linux-mips@vger.kernel.org>; Fri, 02 Aug 2019 09:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pKoz4k0YNhIGSOgfBfhihxL4VUYRyug454y/eKA21c8=;
        b=fnUs8A/7ejFBAEhfzTkFev7HPSblUCMcsE3iKpQVjniV029DWh8hESImHhhlc5sw7V
         KcjPCfnZQvI2NLShvgYrLMAvLMdRd4S14E4BE2RbIHaxRyq6lzhqh1bf3Bwjf0ah648l
         hHpk3L4a+Xpoz2bo5mJkhybIvsNQK2at6iKzNIJjnpLgbTtuSycg0mjMkUPt2zQwClvJ
         mUhtHtpZ4qHN1yO89mvaWQmK3x78OxnZ1o2zCU2hDxcT/RRfVjyw+9EUb8hZ3ykcxX9Q
         UVhW8efGLwPp9sJovwnEojl61wIOKL6yicbaPnp0MHAxqDb32gsz1Gkejvo7W1B/7MNt
         +l5Q==
X-Gm-Message-State: APjAAAX1veSMVBdQbUk19S6AiLFEg91VDhr9fzkVfRw/ED8jI1kSDgiJ
        zY6h/iS4kv5QeBySJYKoBhVxVw==
X-Google-Smtp-Source: APXvYqyFb0d0Or1x0PZCLdGq074NaMHTmsN460Rivxtaahl8JBpJPTjpdaPmW3HMFrN1ikB/ruOVSQ==
X-Received: by 2002:a50:b122:: with SMTP id k31mr121526548edd.204.1564763356476;
        Fri, 02 Aug 2019 09:29:16 -0700 (PDT)
Received: from [10.0.0.124] ([185.102.219.36])
        by smtp.gmail.com with ESMTPSA id x12sm17776994edr.60.2019.08.02.09.29.14
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 09:29:15 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 0/3] target/mips: Convert to
 do_transaction_failed hook
To:     Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc:     Aleksandar Rikalo <arikalo@wavecomp.com>,
        =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
References: <20190802160458.25681-1-peter.maydell@linaro.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <565ed74a-5c6b-c1eb-035e-3eb981487de5@redhat.com>
Date:   Fri, 2 Aug 2019 18:29:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190802160458.25681-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Cc'ing broader MIPS audience.

On 8/2/19 6:04 PM, Peter Maydell wrote:
> This patchset converts the MIPS target away from the
> old broken do_unassigned_access hook to the new (added in
> 2017...) do_transaction_failed hook.
> 
> The motivation here is:
>  * do_unassigned_access is broken because:
>     + it will be called for any kind of access to physical addresses
>       where there is no assigned device, whether that access is by the
>       CPU or by something else (like a DMA controller!), so it can
>       result in spurious guest CPU exceptions.
>     + It will also get called even when using KVM, when there's nothing
>       useful it can do.
>     + It isn't passed in the return-address within the TCG generated
>       code, so it isn't able to correctly restore the CPU state
>       before generating the exception, and so the exception will
>       often be generated with the wrong faulting guest PC value
>  * there are now only a few targets still using the old hook,
>    so if we can convert them we can delete all the old code
>    and complete this API transation. (Patches for SPARC are on
>    the list; the other user is RISCV, which accidentally
>    implemented the old hook rather than the new one recently.)
> 
> The general approach to the conversion is to check the target for
> load/store-by-physical-address operations which were previously
> implicitly causing exceptions, to see if they now need to explicitly
> check for and handle memory access failures. (The 'git grep' regexes
> in docs/devel/loads-stores.rst are useful here: the API families to
> look for are ld*_phys/st*_phys, address_space_ld/st*, and
> cpu_physical_memory*.)
> 
> For MIPS, there are none of these (the usual place where targets do
> this is hardware page table walks where the page table entries are
> loaded by physical address, and MIPS doesn't seem to have those).
> 
> Code audit out of the way, the actual hook changeover is pretty
> simple.
> 
> The complication here is the MIPS Jazz board, which has some rather
> dubious code that intercepts the do_unassigned_access hook to suppress
> generation of exceptions for invalid accesses due to data accesses,
> while leaving exceptions for invalid instruction fetches in place. I'm
> a bit dubious about whether the behaviour we have implemented here is
> really what the hardware does -- it seems pretty odd to me to not
> generate exceptions for d-side accesses but to generate them for
> i-side accesses, and looking back through git and mailing list history
> this code is here mainly as "put back the behaviour we had before a
> previous commit broke it", and that older behaviour in turn I think is
> more historical-accident than because anybody deliberately checked the
> hardware behaviour and made QEMU work that way. However, I don't have
> any real hardware to do comparative tests on, so this series retains
> the same behaviour we had before on this board, by making it intercept
> the new hook in the same way it did the old one. I've beefed up the
> comment somewhat to indicate what we're doing, why, and why it might
> not be right.
> 
> The patch series is structured in three parts:
>  * make the Jazz board code support CPUs regardless of which
>    of the two hooks they implement
>  * switch the MIPS CPUs over to implementing the new hook
>  * remove the no-longer-needed Jazz board code for the old
>    hook
> (This seemed cleaner to me than squashing the whole thing into
> a single patch that touched core mips code and the jazz board
> at the same time.)
> 
> I have tested this with:
>  * the ARC Multiboot BIOS linked to from the bug
>    https://bugs.launchpad.net/qemu/+bug/1245924 (and which
>    was the test case for needing the hook intercept)
>  * a Linux kernel for the 'mips' mips r4k machine
>  * 'make check'
> Obviously more extensive testing would be useful, but I
> don't have any other test images. I also don't have
> a KVM MIPS host, which would be worth testing to confirm
> that it also still works.
> 
> If anybody happens by some chance to still have a working
> real-hardware Magnum or PICA61 board, we could perhaps test
> how it handles accesses to invalid memory, but I suspect that
> nobody does any more :-)
> 
> thanks
> -- PMM
> 
> 
> Peter Maydell (3):
>   hw/mips/mips_jazz: Override do_transaction_failed hook
>   target/mips: Switch to do_transaction_failed() hook
>   hw/mips/mips_jazz: Remove no-longer-necessary override of
>     do_unassigned_access
> 
>  target/mips/internal.h  |  8 ++++---
>  hw/mips/mips_jazz.c     | 47 +++++++++++++++++++++++++++++------------
>  target/mips/cpu.c       |  2 +-
>  target/mips/op_helper.c | 24 +++++++--------------
>  4 files changed, 47 insertions(+), 34 deletions(-)
> 
