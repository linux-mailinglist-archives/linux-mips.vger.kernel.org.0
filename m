Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD9439EFDE
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 09:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhFHHsL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 03:48:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37590 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229507AbhFHHsK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Jun 2021 03:48:10 -0400
Received: from [10.130.0.193] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX0E_IL9g8fAMAA--.14895S3;
        Tue, 08 Jun 2021 15:46:08 +0800 (CST)
Subject: Re: [PATCH] mips: kdump: Crash kernel should be able to see old
 memories
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <1618829807-12522-1-git-send-email-tangyouling@loongson.cn>
 <bd5b70cf-cfdf-0a4a-dfb5-08e030864138@flygoat.com>
 <a04a736e-4f64-0491-165c-2544bb178d73@loongson.cn>
 <alpine.DEB.2.21.2106080215490.1601@angie.orcam.me.uk>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>
From:   Youling Tang <tangyouling@loongson.cn>
Message-ID: <bd05cb85-2c9a-d152-98d3-4c7573b6e9d5@loongson.cn>
Date:   Tue, 8 Jun 2021 15:46:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2106080215490.1601@angie.orcam.me.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxX0E_IL9g8fAMAA--.14895S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtw1rGw43Gw4rXw47uF1xZrb_yoWxur1kpr
        1UJrWUCr48Gr1UAw1xGr1rXry3tw18Ca4UJFy7Gr15ZF1UWr1kJr18J3yj9r1DJr15JF97
        Jr1DXw4Utw4DGw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
        6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv
        67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
        9x07botxDUUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Maciej

On 06/08/2021 08:16 AM, Maciej W. Rozycki wrote:
> On Tue, 20 Apr 2021, Youling Tang wrote:
>
>>> Why depend on a config instead of a runtime variable?
>>>
>> If not depend on config, we can determine whether the command line contains
>> the "elfcorehdr=" parameter, because the "mem=" and "elfcorhdr=" parameters
>> are automatically added in kexec-tools. So if there is an "elfcorehdr="
>> parameter in the command line, it means that the currently running kernel
>> is a capture kernel, and the memblock_remove() operation is not called.
>>
>> The revised patch is as follows:
>>          if (usermem == 0) {
>>                  usermem = 1;
>> -               memblock_remove(memblock_start_of_DRAM(),
>> -                       memblock_end_of_DRAM() - memblock_start_of_DRAM());
>> +               if (!strstr(boot_command_line, "elfcorehdr")) {
>> +                       memblock_remove(memblock_start_of_DRAM(),
>> +                               memblock_end_of_DRAM() -
>> memblock_start_of_DRAM());
>> +               }
>>
>> Do you think it is feasible?
>   This looks like a hack to me.  How do other platforms solve it, e.g. x86?
In the x86 architecture, when parsing "mem=" or "memmap=", there is no
requirement to process visible operations on old memory.

In the MIPS architecture, there should be no need to make the old memory
visible. The reason for adding the patch at the time is that without the
patch, the following panic will occur during the kdump operation.

[    0.229919] CPU 0 Unable to handle kernel paging request at virtual 
address 0000000001004c80, epc == fffff4
[    0.245191] Oops[#1]:
[    0.247365] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 
5.12.0-rc2kdump+ #48
[    0.254211] Hardware name: THTF CX TL630 
Series/THTF-LS3A4000-7A1000-ML4A, BIOS V2.1.1 06/29/2020
[    0.263055] $ 0   : 0000000000000000 ffffffff8432ede4 
ffffffffffffffe0 0000000001004c80
[    0.271030] $ 4   : 0000000000040132 9800000006400000 
0000000000004000 0000000000000000
[    0.279006] $ 8   : 0000000000000000 0000000000000000 
980000000aafa000 980000000aaf6100
[    0.286982] $12   : 98000000061c7bc8 ffffffffffffffff 
fffffffffffffffc 0000000000000000
[    0.294958] $16   : 0000000000004000 9800000006400000 
0000000000000000 98000000061c7c40
[    0.302934] $20   : 0000000000000000 0000000000000000 
ffffffff85070000 0000000000040132
[    0.310912] $24   : 0000000000000000 ffffffff845bb520
[    0.318887] $28   : 98000000061c4000 98000000061c7bc0 
0000000000004024 ffffffff8432ede4
[    0.326863] Hi    : 000000000000000e
[    0.330418] Lo    : ffffffffcfd21432
[    0.333973] epc   : ffffffff84020808 copy_oldmem_page+0x58/0x1a0
[    0.339956] ra    : ffffffff8432ede4 read_from_oldmem.part.8+0xdc/0x120
[    0.346544] Status: 5400cce3 KX SX UX KERNEL EXL IE
[    0.351486] Cause : 10000008 (ExcCode 02)
[    0.355473] BadVA : 0000000001004c80
[    0.359029] PrId  : 0014c004 (ICT Loongson-3)
[    0.363364] Modules linked in:
[    0.366398] Process swapper/0 (pid: 1, threadinfo=(____ptrval____), 
task=(____ptrval____), tls=00000000000)
[    0.376543] Stack : 0000000000004000 ffffffff8432ede4 
9800000006400000 0000000000000000
[    0.384518]         00000000000001f4 98000000063fc000 
98000000063fc120 98000000063fc040
[    0.392494]         ffffffff84da0000 0000000000004024 
ffffffff84c7f010 0000000000000004
[    0.400469]         9800000006400000 ffffffff84f60208 
980000025fffe500 ffffffff84c7efb8
[    0.408445]         00000001004c8000 0000000100000000 
0000000000000000 a8fc2d8167e1bd00
[    0.416420]         0000000000000270 ffffffff8432ede4 
ffffffff84c60000 a8fc2d8167e1bd00
[    0.424396]         0000000000000270 ffffffff85070000 
0000000000000000 ffffffff84e60000
[    0.432371]         ffffffff85070000 ffffffff84da0000 
0000000000000005 0000000000000006
[    0.440348]         ffffffff84f7c568 ffffffff84f6093c 
0000000000000000 98000000061c7d48
[    0.448324]         ffffffff84e90000 98000000061c7d38 
ffffffff84daa968 ffffffff84da0000
[    0.456300]         ...
[    0.458728] Call Trace:
[    0.461154] [<ffffffff84020808>] copy_oldmem_page+0x58/0x1a0
[    0.466792] [<ffffffff8432ede4>] read_from_oldmem.part.8+0xdc/0x120
[    0.473033] [<ffffffff84f60208>] 
merge_note_headers_elf64.constprop.14+0xa8/0x308
[    0.480489] [<ffffffff84f6093c>] vmcore_init+0x1d8/0x5fc
[    0.485776] [<ffffffff84000c9c>] do_one_initcall+0x54/0x2b8
[    0.491325] [<ffffffff84f451e8>] kernel_init_freeable+0x1e4/0x234
[    0.497394] [<ffffffff84aba374>] kernel_init+0x1c/0x128
[    0.502597] [<ffffffff84005d0c>] ret_from_kernel_thread+0x14/0x1c
[    0.508669]
[    0.510139] Code: 2402ffe0  01224824  0123182d <dc640000> 00044dbe  
000948f8  d94a4803  1140003b  7c844b02
[    0.519848]
[    0.521331] ---[ end trace 0f67ff1443cfce3c ]---
[    0.525927] Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b
[    0.533554] ---[ end Kernel panic - not syncing: Attempted to kill 
init! exitcode=0x0000000b ]---


The reason is that kmap_local_pfn() will call kmap_atomic(pfn_to_page(pfn)),
and when pfn_to_page(), the page does not exist, so a panic occurs when the
page is accessed.
With this patch, the old memory is made visible, and the page is available
to the old memory, so the page can be accessed normally without panic.

So the root of the problem is that there is a problem with the 
implementation
of copy_oldmem_page(). The panic can be solved in the following two ways.


Method One:
This function can refer to the implementation of arm64, and use memremap()
to map an available range instead of getting addr directly through 
pfn_to_page().
The patch is as follows:
diff --git a/arch/mips/kernel/crash_dump.c b/arch/mips/kernel/crash_dump.c
index 2e50f551..e122477 100644
--- a/arch/mips/kernel/crash_dump.c
+++ b/arch/mips/kernel/crash_dump.c
@@ -23,16 +23,21 @@ ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
         if (!csize)
                 return 0;

-       vaddr = kmap_local_pfn(pfn);
+       vaddr = memremap(__pfn_to_phys(pfn), PAGE_SIZE, MEMREMAP_WB);

         if (!userbuf) {
                 memcpy(buf, vaddr + offset, csize);
         } else {
-               if (copy_to_user(buf, vaddr + offset, csize))
+               if (copy_to_user(buf, vaddr + offset, csize)) {
+                       memunmap(vaddr);
                         csize = -EFAULT;
+               }
         }

-       kunmap_local(vaddr);
+       memunmap(vaddr);

         return csize;
  }


Method Two:
This function can also refer to the implementation of ia64 to obtain the
virtual address corresponding to pfn through __va().
The patch is as follows:

diff --git a/arch/mips/kernel/crash_dump.c b/arch/mips/kernel/crash_dump.c
index 2e50f551..e122477 100644
--- a/arch/mips/kernel/crash_dump.c
+++ b/arch/mips/kernel/crash_dump.c
@@ -23,16 +23,21 @@ ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
         if (!csize)
                 return 0;

-       vaddr = kmap_local_pfn(pfn);
+       vaddr = __va(pfn << PAGE_SHIFT);

         if (!userbuf) {
                 memcpy(buf, vaddr + offset, csize);
         } else {
                 if (copy_to_user(buf, vaddr + offset, csize))
                         csize = -EFAULT;
         }

-       kunmap_local(vaddr);

         return csize;
  }
>
>    Maciej
Thanks,
Youling

