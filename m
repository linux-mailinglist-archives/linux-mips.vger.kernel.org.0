Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5475F32767A
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 04:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhCADvb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Feb 2021 22:51:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbhCADv3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Feb 2021 22:51:29 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60833C061756;
        Sun, 28 Feb 2021 19:50:49 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id d2so10808803pjs.4;
        Sun, 28 Feb 2021 19:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5aaLop9hU5+oYtu9Q7RLp/zuZszUBEU6Tu8qsHjf3rY=;
        b=EkRYrAECsmk4/0MhADesXh6a26M0evbtiHnZNLdc5QY5+4mOb+uYSG+LyAyZweTtgX
         ieQn/WVxSpz+wJlM6mwJapdoMhTHxs+kRFw94LTnv/yDClV8aXT9W7L3wdZln4nNJObw
         62b5tl+VQLPfFfe0wYntIJ8CwkVp97KRZpbcW13RRY+PDDs7doAokiV18r9fehqTG7d/
         izQ6GbqehDNMGGdNwrIaoC38mGYMbGUd2gBYQRbVUI/TbFTldeQBI7uT8dmYiv5ZlRD5
         uBNosu1NkNTd1hNHet4rMVkeCXVtIPJ+wLiDEd3JYb0ei43VLvMyGIfYFt6gGoLUUFYq
         gV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5aaLop9hU5+oYtu9Q7RLp/zuZszUBEU6Tu8qsHjf3rY=;
        b=qKDUvpt1CPNQZD8Bmidnr+arKkxPmxww8rO5zOIA/Zy9hwCsoMWHMtYbvYEMulw1Ww
         xMbch3iqp/0Jui33EPuVCqvOSLVDH47D/A4bnSPtsSxa8uNvE5PwBmbB/3ZFtw6pFBl/
         /3kcdtLcZ0iujKdi5w6oaO10CyVcZ7p1Bfdpm3bnZlHQK8GR1KC+p27tvrEpgRf6m9Ni
         m+juWThREWFSmIyom+rqbrh3EGHWf+xnSnsWS8EXALEdWt7PA0IMRPLGIRGq15m0qAGp
         isFaskXf/j87grPLiHRuwn3Ty7nZuDsS0H0Z/qvd9K5wb015VLUgMKgCF7UL6AGJBz3A
         ey4w==
X-Gm-Message-State: AOAM533jMD+Xv+hTMoUyhpltyRSsnc4cjTjfXOYsAXjHFy23Ci3YhA3N
        lkDE+zGbfH0cSwOKKEnJ9qjt1b3tQ9c=
X-Google-Smtp-Source: ABdhPJzkT/92BSoKqOFVCe69PAX+4jj7tiiXYmssQNsry93HTpd4gwLBItzmvNKp17bBFZ9x+eghWA==
X-Received: by 2002:a17:902:a710:b029:e3:b18:7e5b with SMTP id w16-20020a170902a710b02900e30b187e5bmr13480845plq.17.1614570648142;
        Sun, 28 Feb 2021 19:50:48 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j26sm15151265pfa.35.2021.02.28.19.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 19:50:47 -0800 (PST)
Subject: Re: [PATCH v2 2/2] memblock: do not start bottom-up allocations with
 kernel_end
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Roman Gushchin <guro@fb.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, iamjoonsoo.kim@lge.com,
        riel@surriel.com, Michal Hocko <mhocko@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-team@fb.com,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>
References: <20201217201214.3414100-1-guro@fb.com>
 <20201217201214.3414100-2-guro@fb.com>
 <23fc1ef9-7342-8bc2-d184-d898107c52b2@gmail.com>
 <20210228090041.GO1447004@kernel.org>
 <8cbafe95-0f8c-a9b7-2dc9-cded846622fd@gmail.com>
 <20210228230811.wdae7oaaf3mbpgwl@mobilestation>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2e973fa8-5f2b-6840-0874-9c15fa0ebea0@gmail.com>
Date:   Sun, 28 Feb 2021 19:50:45 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228230811.wdae7oaaf3mbpgwl@mobilestation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Serge,

On 2/28/2021 3:08 PM, Serge Semin wrote:
> Hi folks,
> What you've got here seems a more complicated problem than it
> could originally look like. Please, see my comments below.
> 
> (Note I've discarded some of the email logs, which of no interest
> to the discovered problem. Please also note that I haven't got any
> Broadcom hardware to test out a solution suggested below.)
> 
> On Sun, Feb 28, 2021 at 10:19:51AM -0800, Florian Fainelli wrote:
>> Hi Mike,
>>
>> On 2/28/2021 1:00 AM, Mike Rapoport wrote:
>>> Hi Florian,
>>>
>>> On Sat, Feb 27, 2021 at 08:18:47PM -0800, Florian Fainelli wrote:
>>>>
> 
>>>> [...]
> 
>>>>
>>>> Hi Roman, Thomas and other linux-mips folks,
>>>>
>>>> Kamal and myself have been unable to boot v5.11 on MIPS since this
>>>> commit, reverting it makes our MIPS platforms boot successfully. We do
>>>> not see a warning like this one in the commit message, instead what
>>>> happens appear to be a corrupted Device Tree which prevents the parsing
>>>> of the "rdb" node and leading to the interrupt controllers not being
>>>> registered, and the system eventually not booting.
>>>>
>>>> The Device Tree is built-into the kernel image and resides at
>>>> arch/mips/boot/dts/brcm/bcm97435svmb.dts.
>>>>
>>>> Do you have any idea what could be wrong with MIPS specifically here?
> 
> Most likely the problem you've discovered has been there for quite
> some time. The patch you are referring to just caused it to be
> triggered by extending the early allocation range. See before that
> patch was accepted the early memory allocations had been performed
> in the range:
> [kernel_end, RAM_END].
> The patch changed that, so the early allocations are done within
> [RAM_START + PAGE_SIZE, RAM_END].
> 
> In normal situations it's safe to do that as long as all the critical
> memory regions (including the memory residing a space below the
> kernel) have been reserved. But as soon as a memory with some critical
> structures haven't been reserved, the kernel may allocate it to be used
> for instance for early initializations with obviously unpredictable but
> most of the times unpleasant consequences.
> 
>>>
>>> Apparently there is a memblock allocation in one of the functions called
>>> from arch_mem_init() between plat_mem_setup() and
>>> early_init_fdt_reserve_self().
> 
> Mike, alas according to the log provided by Florian that's not the reason
> of the problem. Please, see my considerations below.
> 
>> [...]
>>
>> [    0.000000] Linux version 5.11.0-g5695e5161974 (florian@localhost)
>> (mipsel-linux-gcc (GCC) 8.3.0, GNU ld (GNU Binutils) 2.32) #84 SMP Sun
>> Feb 28 10:01:50 PST 2021
>> [    0.000000] CPU0 revision is: 00025b00 (Broadcom BMIPS5200)
>> [    0.000000] FPU revision is: 00130001
> 
>> [    0.000000] memblock_add: [0x00000000-0x0fffffff]
>> early_init_dt_scan_memory+0x160/0x1e0
>> [    0.000000] memblock_add: [0x20000000-0x4fffffff]
>> early_init_dt_scan_memory+0x160/0x1e0
>> [    0.000000] memblock_add: [0x90000000-0xcfffffff]
>> early_init_dt_scan_memory+0x160/0x1e0
> 
> Here the memory has been added to the memblock allocator.
> 
>> [    0.000000] MIPS: machine is Broadcom BCM97435SVMB
>> [    0.000000] earlycon: ns16550a0 at MMIO32 0x10406b00 (options '')
>> [    0.000000] printk: bootconsole [ns16550a0] enabled
> 
>> [    0.000000] memblock_reserve: [0x00aa7600-0x00aaa0a0]
>> setup_arch+0x128/0x69c
> 
> Here the fdt memory has been reserved. (Note it's built into the
> kernel.)
> 
>> [    0.000000] memblock_reserve: [0x00010000-0x018313cf]
>> setup_arch+0x1f8/0x69c
> 
> Here the kernel itself together with built-in dtb have been reserved.
> So far so good.
> 
>> [    0.000000] Initrd not found or empty - disabling initrd
> 
>> [    0.000000] memblock_alloc_try_nid: 10913 bytes align=0x40 nid=-1
>> from=0x00000000 max_addr=0x00000000
>> early_init_dt_alloc_memory_arch+0x40/0x84
>> [    0.000000] memblock_reserve: [0x00001000-0x00003aa0]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 32680 bytes align=0x4 nid=-1
>> from=0x00000000 max_addr=0x00000000
>> early_init_dt_alloc_memory_arch+0x40/0x84
>> [    0.000000] memblock_reserve: [0x00003aa4-0x0000ba4b]
>> memblock_alloc_range_nid+0xf8/0x198
> 
> The log above most likely belongs to the call-chain:
> setup_arch()
> +-> arch_mem_init()
>     +-> device_tree_init() - BMIPS specific method
>         +-> unflatten_and_copy_device_tree()
> 
> So to speak here we've copied the fdt from the original space
> [0x00aa7600-0x00aaa0a0] into [0x00001000-0x00003aa0] and unflattened
> it to [0x00003aa4-0x0000ba4b].
> 
> The problem is that a bit later the next call-chain is performed:
> setup_arch()
> +-> plat_smp_setup()
>     +-> mp_ops->smp_setup(); - registered by prom_init()->register_bmips_smp_ops();
>         +-> if (!board_ebase_setup)
>                  board_ebase_setup = &bmips_ebase_setup;
> 
> So at the moment of the CPU traps initialization the bmips_ebase_setup()
> method is called. What trap_init() does isn't compatible with the
> allocation performed by the unflatten_and_copy_device_tree() method.
> See the next comment.
> 
>> [    0.000000] memblock_alloc_try_nid: 25 bytes align=0x4 nid=-1
>> from=0x00000000 max_addr=0x00000000
>> early_init_dt_alloc_memory_arch+0x40/0x84
>> [    0.000000] memblock_reserve: [0x0000ba4c-0x0000ba64]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_reserve: [0x0096a000-0x00969fff]
>> setup_arch+0x3fc/0x69c
>> [    0.000000] memblock_alloc_try_nid: 32 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 setup_arch+0x4e0/0x69c
>> [    0.000000] memblock_reserve: [0x0000ba80-0x0000ba9f]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 32 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 setup_arch+0x4e0/0x69c
>> [    0.000000] memblock_reserve: [0x0000bb00-0x0000bb1f]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 32 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 setup_arch+0x4e0/0x69c
>> [    0.000000] memblock_reserve: [0x0000bb80-0x0000bb9f]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] Primary instruction cache 32kB, VIPT, 4-way, linesize 64
>> bytes.
>> [    0.000000] Primary data cache 32kB, 4-way, VIPT, no aliases,
>> linesize 32 bytes
>> [    0.000000] MIPS secondary cache 512kB, 8-way, linesize 128 bytes.
>> [    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1
>> from=0x00000000 max_addr=0xffffffff fixrange_init+0x90/0xf4
>> [    0.000000] memblock_reserve: [0x0000c000-0x0000cfff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1
>> from=0x00000000 max_addr=0xffffffff fixrange_init+0x90/0xf4
>> [    0.000000] memblock_reserve: [0x0000d000-0x0000dfff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1
>> from=0x00000000 max_addr=0xffffffff fixrange_init+0x90/0xf4
>> [    0.000000] memblock_reserve: [0x0000e000-0x0000efff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] Zone ranges:
>> [    0.000000]   Normal   [mem 0x0000000000000000-0x000000000fffffff]
>> [    0.000000]   HighMem  [mem 0x0000000010000000-0x00000000cfffffff]
>> [    0.000000] Movable zone start for each node
>> [    0.000000] Early memory node ranges
>> [    0.000000]   node   0: [mem 0x0000000000000000-0x000000000fffffff]
>> [    0.000000]   node   0: [mem 0x0000000020000000-0x000000004fffffff]
>> [    0.000000]   node   0: [mem 0x0000000090000000-0x00000000cfffffff]
>> [    0.000000] Initmem setup node 0 [mem
>> 0x0000000000000000-0x00000000cfffffff]
>> [    0.000000] memblock_alloc_try_nid: 27262976 bytes align=0x80 nid=0
>> from=0x00000000 max_addr=0x00000000
>> alloc_node_mem_map.constprop.135+0x6c/0xc8
>> [    0.000000] memblock_reserve: [0x01831400-0x032313ff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 32 bytes align=0x80 nid=0
>> from=0x00000000 max_addr=0x00000000 setup_usemap+0x64/0x98
>> [    0.000000] memblock_reserve: [0x0000bc00-0x0000bc1f]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 384 bytes align=0x80 nid=0
>> from=0x00000000 max_addr=0x00000000 setup_usemap+0x64/0x98
>> [    0.000000] memblock_reserve: [0x0000bc80-0x0000bdff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] MEMBLOCK configuration:
>> [    0.000000]  memory size = 0x80000000 reserved size = 0x0322f032
>> [    0.000000]  memory.cnt  = 0x3
>> [    0.000000]  memory[0x0]     [0x00000000-0x0fffffff], 0x10000000
>> bytes flags: 0x0
>> [    0.000000]  memory[0x1]     [0x20000000-0x4fffffff], 0x30000000
>> bytes flags: 0x0
>> [    0.000000]  memory[0x2]     [0x90000000-0xcfffffff], 0x40000000
>> bytes flags: 0x0
>> [    0.000000]  reserved.cnt  = 0xa
>> [    0.000000]  reserved[0x0]   [0x00001000-0x00003aa0], 0x00002aa1
>> bytes flags: 0x0
>> [    0.000000]  reserved[0x1]   [0x00003aa4-0x0000ba64], 0x00007fc1
>> bytes flags: 0x0
>> [    0.000000]  reserved[0x2]   [0x0000ba80-0x0000ba9f], 0x00000020
>> bytes flags: 0x0
>> [    0.000000]  reserved[0x3]   [0x0000bb00-0x0000bb1f], 0x00000020
>> bytes flags: 0x0
>> [    0.000000]  reserved[0x4]   [0x0000bb80-0x0000bb9f], 0x00000020
>> bytes flags: 0x0
>> [    0.000000]  reserved[0x5]   [0x0000bc00-0x0000bc1f], 0x00000020
>> bytes flags: 0x0
>> [    0.000000]  reserved[0x6]   [0x0000bc80-0x0000bdff], 0x00000180
>> bytes flags: 0x0
>> [    0.000000]  reserved[0x7]   [0x0000c000-0x0000efff], 0x00003000
>> bytes flags: 0x0
>> [    0.000000]  reserved[0x8]   [0x00010000-0x018313cf], 0x018213d0
>> bytes flags: 0x0
>> [    0.000000]  reserved[0x9]   [0x01831400-0x032313ff], 0x01a00000
>> bytes flags: 0x0
>> [    0.000000] memblock_alloc_try_nid: 30 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 start_kernel+0x12c/0x654
>> [    0.000000] memblock_reserve: [0x0000be00-0x0000be1d]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 30 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 start_kernel+0x150/0x654
>> [    0.000000] memblock_reserve: [0x0000be80-0x0000be9d]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_embed_first_chunk+0x3b0/0x884
>> [    0.000000] memblock_reserve: [0x0000f000-0x0000ffff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_embed_first_chunk+0x5a4/0x884
>> [    0.000000] memblock_reserve: [0x03231400-0x032323ff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 294912 bytes align=0x1000 nid=-1
>> from=0x01000000 max_addr=0x00000000 pcpu_dfl_fc_alloc+0x24/0x30
>> [    0.000000] memblock_reserve: [0x03233000-0x0327afff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_free: [0x03245000-0x03244fff]
>> pcpu_embed_first_chunk+0x7a0/0x884
>> [    0.000000] memblock_free: [0x03257000-0x03256fff]
>> pcpu_embed_first_chunk+0x7a0/0x884
>> [    0.000000] memblock_free: [0x03269000-0x03268fff]
>> pcpu_embed_first_chunk+0x7a0/0x884
>> [    0.000000] memblock_free: [0x0327b000-0x0327afff]
>> pcpu_embed_first_chunk+0x7a0/0x884
>> [    0.000000] percpu: Embedded 18 pages/cpu s50704 r0 d23024 u73728
>> [    0.000000] memblock_alloc_try_nid: 4 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x178/0x6ec
>> [    0.000000] memblock_reserve: [0x0000bf00-0x0000bf03]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 4 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x1a8/0x6ec
>> [    0.000000] memblock_reserve: [0x0000bf80-0x0000bf83]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 16 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x1dc/0x6ec
>> [    0.000000] memblock_reserve: [0x03232400-0x0323240f]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 16 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x20c/0x6ec
>> [    0.000000] memblock_reserve: [0x03232480-0x0323248f]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 128 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x558/0x6ec
>> [    0.000000] memblock_reserve: [0x03232500-0x0323257f]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 92 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x8c/0x294
>> [    0.000000] memblock_reserve: [0x03232580-0x032325db]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 768 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xe0/0x294
>> [    0.000000] memblock_reserve: [0x03232600-0x032328ff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 772 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x124/0x294
>> [    0.000000] memblock_reserve: [0x03232900-0x03232c03]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_alloc_try_nid: 192 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x158/0x294
>> [    0.000000] memblock_reserve: [0x03232c80-0x03232d3f]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] memblock_free: [0x0000f000-0x0000ffff]
>> pcpu_embed_first_chunk+0x838/0x884
>> [    0.000000] memblock_free: [0x03231400-0x032323ff]
>> pcpu_embed_first_chunk+0x850/0x884
>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 523776
>> [    0.000000] Kernel command line: console=ttyS0,115200 earlycon
>> [    0.000000] memblock_alloc_try_nid: 131072 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 alloc_large_system_hash+0x1f8/0x33c
>> [    0.000000] memblock_reserve: [0x0327b000-0x0329afff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072
>> bytes, linear)
>> [    0.000000] memblock_alloc_try_nid: 65536 bytes align=0x80 nid=-1
>> from=0x00000000 max_addr=0x00000000 alloc_large_system_hash+0x1f8/0x33c
>> [    0.000000] memblock_reserve: [0x0329b000-0x032aafff]
>> memblock_alloc_range_nid+0xf8/0x198
>> [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536
>> bytes, linear)
> 
>> [    0.000000] memblock_reserve: [0x00000000-0x000003ff]
>> trap_init+0x70/0x4e8
> 
> Most likely someplace here the corruption has happened. The log above
> has just reserved a memory for NMI/reset vectors:
> arch/mips/kernel/traps.c: trap_init(void): Line 2373.
> 
> But then the board_ebase_setup() pointer is dereferenced and called,
> which has been initialized with bmips_ebase_setup() earlier and which
> overwrites the ebase variable with: 0x80001000 as this is
> CPU_BMIPS5000 CPU. So any further calls of the functions like
> set_handler()/set_except_vector()/set_vi_srs_handler()/etc may cause a
> corruption of the memory above 0x80001000, which as we have discovered
> belongs to fdt and unflattened device tree.
> 
>> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
>> [    0.000000] Memory: 2045268K/2097152K available (8226K kernel code,
>> 1070K rwdata, 1336K rodata, 13808K init, 260K bss, 51884K reserved, 0K
>> cma-reserved, 1835008K highmem)
>> [    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
>> [    0.000000] rcu: Hierarchical RCU implementation.
>> [    0.000000] rcu:     RCU event tracing is enabled.
>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
>> is 25 jiffies.
>> [    0.000000] NR_IRQS: 256
> 
>> [    0.000000] OF: Bad cell count for /rdb
>> [    0.000000] irq_bcm7038_l1: failed to remap intc L1 registers
>> [    0.000000] OF: of_irq_init: children remain, but no parents
> 
> So here is the first time we have got the consequence of the corruption
> popped up. Luckily it's just the "Bad cells count" error. We could have
> got much less obvious log here up to getting a crash at some place
> further...
> 
>> [    0.000000] random: get_random_bytes called from
>> start_kernel+0x444/0x654 with crng_init=0
>> [    0.000000] sched_clock: 32 bits at 250 Hz, resolution 4000000ns,
>> wraps every 8589934590000000ns
> 
>>
>> and with your patch applied which unfortunately did not work we have the
>> following:
>>
>> [...]
> 
> So a patch like this shall workaround the corruption:
> 
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -174,6 +174,8 @@ void __init plat_mem_setup(void)
>  
>  	__dt_setup_arch(dtb);
>  
> +	memblock_reserve(0x0, 0x1000 + 0x100*64);
> +
>  	for (q = bmips_quirk_list; q->quirk_fn; q++) {
>  		if (of_flat_dt_is_compatible(of_get_flat_dt_root(),
>  					     q->compatible)) {

This patch works, thanks a lot for the troubleshooting and analysis! How
about the following which would be more generic and works as well and
should be more universal since it does not require each architecture to
provide an appropriate call to memblock_reserve():

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index e0352958e2f7..b0a173b500e8 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2367,10 +2367,7 @@ void __init trap_init(void)

        if (!cpu_has_mips_r2_r6) {
                ebase = CAC_BASE;
-               ebase_pa = virt_to_phys((void *)ebase);
                vec_size = 0x400;
-
-               memblock_reserve(ebase_pa, vec_size);
        } else {
                if (cpu_has_veic || cpu_has_vint)
                        vec_size = 0x200 + VECTORSPACING*64;
@@ -2410,6 +2407,14 @@ void __init trap_init(void)

        if (board_ebase_setup)
                board_ebase_setup();
+
+       /* board_ebase_setup() can change the exception base address
+        * reserve it now after changes were made.
+        */
+       if (!cpu_has_mips_r2_r6) {
+               ebase_pa = virt_to_phys((void *)ebase);
+               memblock_reserve(ebase_pa, vec_size);
+       }
        per_cpu_trap_init(true);
        memblock_set_bottom_up(false);
-- 
Florian
