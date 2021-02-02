Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E192330B77D
	for <lists+linux-mips@lfdr.de>; Tue,  2 Feb 2021 06:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhBBF4U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Feb 2021 00:56:20 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53328 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231683AbhBBF4U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Feb 2021 00:56:20 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmdRN6RhgBbkBAA--.1938S3;
        Tue, 02 Feb 2021 13:55:26 +0800 (CST)
Subject: Re: [PATCH] MIPS: relocatable: Provide kaslr_offset() to get the
 kernel offset
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1611720745-8256-1-git-send-email-hejinyang@loongson.cn>
 <20210201125028.GA8621@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <e813890a-a091-b831-98f1-725e28d81742@loongson.cn>
Date:   Tue, 2 Feb 2021 13:55:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210201125028.GA8621@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxmdRN6RhgBbkBAA--.1938S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZF45tF43ZFy5GFyxWw1rZwb_yoWrGryxpa
        nrA3WkGrZ0gryUAFZ5ZFykur13Gws8Wr4a9FsrK3y8Z3ZFqF1UJ3Z7Wrs8urWjqFy0gF1I
        va4YqF12vw4vv3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
        6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU5tku3UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/01/2021 08:50 PM, Thomas Bogendoerfer wrote:

> On Wed, Jan 27, 2021 at 12:12:25PM +0800, Jinyang He wrote:
>> Use kimage_vaddr to indicate kernel start address. Provide kaslr_offset()
>> to get the kernel offset when KASLR is enabled. Error may occur before
>> update_kimage_vaddr(), so put it at the end of the offset branch.
>>
>> Fixes: a307a4ce9ecd ("MIPS: Loongson64: Add KASLR support")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> ---
>>   arch/mips/include/asm/page.h |  6 ++++++
>>   arch/mips/kernel/relocate.c  | 12 ++++++++++++
>>   arch/mips/kernel/setup.c     |  3 +++
>>   3 files changed, 21 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
>> index 6a77bc4..9429520 100644
>> --- a/arch/mips/include/asm/page.h
>> +++ b/arch/mips/include/asm/page.h
>> @@ -255,6 +255,12 @@ extern bool __virt_addr_valid(const volatile void *kaddr);
>>   
>>   #define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
>>   
>> +extern unsigned long kimage_vaddr;
>> +static inline unsigned long kaslr_offset(void)
>> +{
>> +	return kimage_vaddr - VMLINUX_LOAD_ADDRESS;
>> +}
> this breaks for 32bit kernels:
>
> <command-line>:0:22: error: large integer implicitly truncated to unsigned type [-Werror=overflow]
> /local/tbogendoerfer/korg/linux/arch/mips/kernel/setup.c:87:41: note: in expansion of macro ‘VMLINUX_LOAD_ADDRESS’
>   unsigned long kimage_vaddr __initdata = VMLINUX_LOAD_ADDRESS;
>                                           ^~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>

Sorry for not considering the 32bits kernel. Maybe a variable is enough.

Like this,

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 6a77bc4a6eec..74082e35d57c 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -255,6 +255,12 @@ extern bool __virt_addr_valid(const volatile void 
*kaddr);

  #define VM_DATA_DEFAULT_FLAGS    VM_DATA_FLAGS_TSK_EXEC

+extern unsigned long __kaslr_offset;
+static inline unsigned long kaslr_offset(void)
+{
+    return __kaslr_offset;
+}
+
  #include <asm-generic/memory_model.h>
  #include <asm-generic/getorder.h>

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index c643c816cbe0..95abb9c82f00 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -300,6 +300,13 @@ static inline int __init relocation_addr_valid(void 
*loc_new)
      return 1;
  }

+static inline void __init update_kaslr_offset(unsigned long *addr, long 
offset)
+{
+    unsigned long *new_addr = (unsigned long *)RELOCATED(addr);
+
+    *new_addr = (unsigned long)offset;
+}
+
  #if defined(CONFIG_USE_OF)
  void __weak *plat_get_fdt(void)
  {
@@ -410,6 +417,9 @@ void *__init relocate_kernel(void)

          /* Return the new kernel's entry point */
          kernel_entry = RELOCATED(start_kernel);
+
+        /* Error may occur before, so keep it at last */
+        update_kaslr_offset(&__kaslr_offset, offset);
      }
  out:
      return kernel_entry;
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7e1f8e277437..cde234326738 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -84,6 +84,9 @@ static struct resource code_resource = { .name = 
"Kernel code", };
  static struct resource data_resource = { .name = "Kernel data", };
  static struct resource bss_resource = { .name = "Kernel bss", };

+unsigned long __kaslr_offset __initdata = 0;
+EXPORT_SYMBOL(__kaslr_offset);
+
  static void *detect_magic __initdata = detect_memory_region;

  #ifdef CONFIG_MIPS_AUTO_PFN_OFFSET

I'll send v2 later if no other comment.

Thanks,
Jinyang

