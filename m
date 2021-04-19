Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B22E3645E8
	for <lists+linux-mips@lfdr.de>; Mon, 19 Apr 2021 16:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239050AbhDSOWP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Apr 2021 10:22:15 -0400
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:45066 "EHLO
        out28-73.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239188AbhDSOWO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Apr 2021 10:22:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436283|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0822474-0.000990601-0.916762;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.K0TRCz4_1618842100;
Received: from 192.168.88.133(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K0TRCz4_1618842100)
          by smtp.aliyun-inc.com(10.147.41.121);
          Mon, 19 Apr 2021 22:21:41 +0800
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
To:     Huang Pei <huangpei@loongson.cn>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        paul.burton@mips.com, paul@crapouillou.net, siyanteng@loongson.cn,
        ira.weiny@intel.com, yangtiezhu@loongson.cn, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com
References: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
 <20210416092003.5754967.19768.9603@loongson.cn>
 <ae06522f-eda8-96d1-6f58-072905afa65c@wanyeetech.com>
 <20210419045610.frhzxskec47s5rmq@ambrosehua-HP-xw6600-Workstation>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <13e37741-c1b4-2aae-471e-0790adc8db59@wanyeetech.com>
Date:   Mon, 19 Apr 2021 22:21:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210419045610.frhzxskec47s5rmq@ambrosehua-HP-xw6600-Workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi

On 2021/4/19 下午12:56, Huang Pei wrote:
> On Sat, Apr 17, 2021 at 12:45:59AM +0800, Zhou Yanjie wrote:
>> On 2021/4/16 下午5:20, 黄沛 wrote:
>>> Is there any log about the panic?
>>
>> Yes, below is the log:
>>
>>
>> [  195.436017] CPU 0 Unable to handle kernel paging request at virtual
>> address 77eb8000, epc == 80117868, ra == 80118208
>> [  195.446709] Oops[#1]:
>> [  195.448977] CPU: 0 PID: 1461 Comm: Xsession Not tainted
>> 5.12.0-rc6-00227-gc8fc6defbd2e-dirty #1
>> [  195.457661] $ 0   : 00000000 00000001 80117864 77eb9000
>> [  195.462888] $ 4   : 77eb8000 82419600 838ea000 82482ba0
>> [  195.468116] $ 8   : 826f8b18 8306f800 000072d5 8306f800
>> [  195.473343] $12   : 00000002 00000a03 00000001 00000402
>> [  195.478568] $16   : 77eb8000 809faf60 00000004 82482ba0
>> [  195.483794] $20   : 77eb8000 82419600 82482ba0 80860000
>> [  195.489021] $24   : 8086121c 80117864
>> [  195.494248] $28   : 838ea000 838ebd70 00000000 80118208
>> [  195.499475] Hi    : 00008c4e
>> [  195.502343] Lo    : 00004627
>> [  195.505212] epc   : 80117868 r4k_blast_dcache_page_dc32+0x4/0x9c
>> [  195.511217] ra    : 80118208 local_r4k_flush_cache_page+0x120/0x1b8
>> [  195.517476] Status: 10001403 KERNEL EXL IE
>> [  195.521657] Cause : 4080800c (ExcCode 03)
>> [  195.525654] BadVA : 77eb8000
>> [  195.528523] PrId  : 00d00100 (Ingenic XBurst)
>> [  195.532866] Modules linked in:
>> [  195.535911] Process Xsession (pid: 1461, threadinfo=00975a3e,
>> task=3724fd66, tls=77ebd690)
>> [  195.544162] Stack : 808a05ec f7edcbfd 8306f800 00000000 80860000 809faf60
>> 80990a3c 80117f90
>> [  195.552524]         809faf60 82419600 8306f800 801fd84c 00000000 801180b4
>> 838ebe80 80110b7c
>> [  195.560887]         80990a3c 82482ba0 82482ba0 77eb8000 00004627 f7edcbfd
>> 838ebe80 801cbc08
>> [  195.569249]         00000001 181b2000 00000000 801fa06c 00000000 83999ae0
>> 80860000 00000004
>> [  195.577610]         80990a3c f7edcbfd 80990a3c 838ebe80 00000004 80990a3c
>> 82482ba0 04627685
>> [  195.585973]         ...
>> [  195.588413] Call Trace:
>> [  195.590849] [<80117868>] r4k_blast_dcache_page_dc32+0x4/0x9c
>> [  195.596501] [<80118208>] local_r4k_flush_cache_page+0x120/0x1b8
>> [  195.602413] [<80117f90>] r4k_on_each_cpu.isra.8+0x24/0x58
>> [  195.607805] [<801180b4>] r4k_flush_cache_page+0x34/0x58
>> [  195.613023] [<801cbc08>] wp_page_copy+0x3a8/0x56c
>> [  195.617723] [<801ce944>] do_swap_page+0x4cc/0x558
>> [  195.622419] [<801cf3f8>] handle_mm_fault+0x790/0x93c
>> [  195.627374] [<8011025c>] do_page_fault+0x19c/0x540
>> [  195.632159] [<801142f0>] tlb_do_page_fault_1+0x10c/0x11c
>> [  195.637465]
>> [  195.638947] Code: 03e00008  00000000  24831000 <bc950000> bc950020
>> bc950040  bc950060  bc950080  bc9500a0
>> [  195.648706]
>> [  195.650243] ---[ end trace 7cc7d7f611932c42 ]---
>> [  195.654857] Kernel panic - not syncing: Fatal exception
>> [  195.660072] Rebooting in 10 seconds..
>>
>>
>> this problem can be triggered stably (by use Microsoft Remote Desktop client
>> to login to debian9 running on CU1830-Neo).
>>
> Could you print out the PTE value at 0x77eb8000 ?


Here is the new log:


[   33.681712] CPU 0 Unable to handle kernel paging request at virtual 
address 77ea4000, epc == 801178ac, ra == 80118250
[   33.692395] Oops[#1]:
[   33.694662] CPU: 0 PID: 1389 Comm: Xsession Not tainted 
5.12.0-rc8-dirty #2
[   33.701612] $ 0   : 00000000 00000001 801178a8 77ea5000
[   33.706839] $ 4   : 77ea4000 81bcd220 80118130 856712a0
[   33.712066] $ 8   : 833e4a80 8544b800 000070a8 8544b800
[   33.717293] $12   : 00000002 000005b7 00000001 00000000
[   33.722518] $16   : 81bcd220 77ea4000 80a11ad8 00000004
[   33.727745] $20   : 77ea4000 81bcd220 856712a0 80860000
[   33.732972] $24   : 0000001c 801178a8
[   33.738197] $28   : 82564000 82565d68 00000000 80118250
[   33.743424] Hi    : 0000f0cc
[   33.746293] Lo    : 00007866
[   33.749162] epc   : 801178ac r4k_blast_dcache_page_dc32+0x4/0x9c
[   33.755166] ra    : 80118250 local_r4k_flush_cache_page+0x120/0x2c8
[   33.761425] Status: 10001403 KERNEL EXL IE
[   33.765605] Cause : 4080800c (ExcCode 03)
[   33.769603] BadVA : 77ea4000
[   33.772472] PrId  : 00d00100 (Ingenic XBurst)
[   33.776816] Modules linked in:
[   33.779861] Process Xsession (pid: 1389, threadinfo=c8bdf64c, 
task=2372d853, tls=77ea9690)
[   33.788111] Stack : 808a256c 00000000 808a256c bfa6939a 8544b800 
80860000 8094d308 80a11ad8
[   33.796474]         856712a0 80117fd8 8094d308 81bcd220 8544b800 
801fdb10 80945ce8 801180fc
[   33.804838]         82565e80 80110b8c 80a11ad8 856712a0 856712a0 
77ea4000 00007866 bfa6939a
[   33.813201]         82565e80 801cbe38 00000000 bfa6939a 80863494 
801fa2c0 856712a0 82562a90
[   33.821564]         80860000 00000000 80a11ad8 bfa6939a 80a11ad8 
82565e80 00000000 80a11ad8
[   33.829927]         ...
[   33.832367] Call Trace:
[   33.834803] [<801178ac>] r4k_blast_dcache_page_dc32+0x4/0x9c
[   33.840455] [<80118250>] local_r4k_flush_cache_page+0x120/0x2c8
[   33.846367] [<80117fd8>] r4k_on_each_cpu.isra.10+0x24/0x58
[   33.851845] [<801180fc>] r4k_flush_cache_page+0x34/0x58
[   33.857062] [<801cbe38>] wp_page_copy+0x3a8/0x56c
[   33.861763] [<801ceb74>] do_swap_page+0x4cc/0x558
[   33.866458] [<801cf628>] handle_mm_fault+0x790/0x93c
[   33.871414] [<8011026c>] do_page_fault+0x19c/0x540
[   33.876199] [<80114300>] tlb_do_page_fault_1+0x10c/0x11c
[   33.881506]
[   33.882987] Index:  5 pgmask=4kb va=77ea2000 asid=fd
[   33.882987]  [pa=02a99000 c=3 d=1 v=1 g=0] [pa=0690d000 c=3 d=0 v=0 g=0]
[   33.894635] Index:  6 pgmask=4kb va=77dc4000 asid=fd
[   33.894635]  [pa=01d30000 c=3 d=0 v=1 g=0] [pa=01d31000 c=3 d=0 v=1 g=0]
[   33.906281] Index:  7 pgmask=4kb va=77dc0000 asid=fd
[   33.906281]  [pa=01d2c000 c=3 d=0 v=1 g=0] [pa=01d2d000 c=3 d=0 v=1 g=0]
[   33.917928] Index:  8 pgmask=4kb va=77dc2000 asid=fd
[   33.917928]  [pa=01d2e000 c=3 d=0 v=1 g=0] [pa=01d2f000 c=3 d=0 v=1 g=0]
[   33.929574] Index:  9 pgmask=4kb va=77dc6000 asid=fd
[   33.929574]  [pa=01d32000 c=3 d=0 v=1 g=0] [pa=01d33000 c=3 d=0 v=1 g=0]
[   33.941220] Index: 10 pgmask=4kb va=77dc8000 asid=fd
[   33.941220]  [pa=01d34000 c=3 d=0 v=1 g=0] [pa=01d35000 c=3 d=0 v=1 g=0]
[   33.952866] Index: 11 pgmask=4kb va=77dca000 asid=fd
[   33.952866]  [pa=01d36000 c=3 d=0 v=1 g=0] [pa=01d37000 c=3 d=0 v=1 g=0]
[   33.964512] Index: 12 pgmask=4kb va=77dcc000 asid=fd
[   33.964512]  [pa=01d38000 c=3 d=0 v=1 g=0] [pa=01d39000 c=3 d=0 v=1 g=0]
[   33.976159] Index: 13 pgmask=4kb va=77dce000 asid=fd
[   33.976159]  [pa=01d3a000 c=3 d=0 v=1 g=0] [pa=01d3b000 c=3 d=0 v=1 g=0]
[   33.987805] Index: 14 pgmask=4kb va=77d82000 asid=fd
[   33.987805]  [pa=01dbd000 c=3 d=0 v=1 g=0] [pa=01dbe000 c=3 d=0 v=1 g=0]
[   33.999451] Index: 15 pgmask=4kb va=77d80000 asid=fd
[   33.999451]  [pa=01dbb000 c=3 d=0 v=1 g=0] [pa=01dbc000 c=3 d=0 v=1 g=0]
[   34.011097] Index: 16 pgmask=4kb va=77d84000 asid=fd
[   34.011097]  [pa=01dbf000 c=3 d=0 v=1 g=0] [pa=01dc0000 c=3 d=0 v=1 g=0]
[   34.022743] Index: 17 pgmask=4kb va=77d86000 asid=fd
[   34.022743]  [pa=01dc1000 c=3 d=0 v=1 g=0] [pa=01dc2000 c=3 d=0 v=1 g=0]
[   34.034389] Index: 18 pgmask=4kb va=77d88000 asid=fd
[   34.034389]  [pa=01dc3000 c=3 d=0 v=1 g=0] [pa=01dc4000 c=3 d=0 v=1 g=0]
[   34.046035] Index: 19 pgmask=4kb va=77d8a000 asid=fd
[   34.046035]  [pa=01dc5000 c=3 d=0 v=1 g=0] [pa=01dc6000 c=3 d=0 v=1 g=0]
[   34.057682] Index: 20 pgmask=4kb va=77d8c000 asid=fd
[   34.057682]  [pa=01dc7000 c=3 d=0 v=1 g=0] [pa=01dc8000 c=3 d=0 v=1 g=0]
[   34.069328] Index: 21 pgmask=4kb va=77d8e000 asid=fd
[   34.069328]  [pa=01dc9000 c=3 d=0 v=1 g=0] [pa=01dca000 c=3 d=0 v=1 g=0]
[   34.080975] Index: 22 pgmask=4kb va=7f7b0000 asid=fd
[   34.080975]  [pa=078ea000 c=3 d=0 v=1 g=0] [pa=07801000 c=3 d=0 v=0 g=0]
[   34.092621] Index: 23 pgmask=4kb va=77e5a000 asid=fd
[   34.092621]  [pa=07ece000 c=3 d=0 v=1 g=0] [pa=077fb000 c=3 d=0 v=1 g=0]
[   34.104267] Index: 24 pgmask=4kb va=77e5c000 asid=fd
[   34.104267]  [pa=0775f000 c=3 d=0 v=1 g=0] [pa=07314000 c=3 d=0 v=0 g=0]
[   34.115913] Index: 25 pgmask=4kb va=77ea4000 asid=fd
[   34.115913]  [pa=18122000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[   34.127559] Index: 26 pgmask=4kb va=c0096000 asid=fd
[   34.127559]  [pa=0302f000 c=3 d=1 v=1 g=1] [pa=03008000 c=3 d=1 v=1 g=1]
[   34.139205]
[   34.140686] Code: 03e00008  00000000  24831000 <bc950000> bc950020  
bc950040  bc950060  bc950080  bc9500a0
[   34.150445]
[   34.151987] ---[ end trace 30089d2c358ff363 ]---
[   34.156614] Kernel panic - not syncing: Fatal exception
[   34.161831] Rebooting in 10 seconds..

>
> I really have no idea of how the page_prot setting affecting the swap
> handling.
>
>> Thanks and best regards!
>>
>>
>>>     Original Message
>>> From: 周琰杰 (Zhou Yanjie)
>>> Sent: 2021年4月16日星期五 16:48
>>> To: tsbogend@alpha.franken.de
>>> Cc: linux-mips@vger.kernel.org; linux-kernel@vger.kernel.org; akpm@linux-foundation.org; paul.burton@mips.com; paul@crapouillou.net; siyanteng@loongson.cn; huangpei@loongson.cn; ira.weiny@intel.com; yangtiezhu@loongson.cn; zhouyanjie@wanyeetech.com; jun.jiang@ingenic.com; dongsheng.qiu@ingenic.com; aric.pzqi@ingenic.com; rick.tyliu@ingenic.com; sernia.zhou@foxmail.com
>>> Subject: [PATCH] Revert "MIPS: make userspace mapping young by default".
>>>
>>> This reverts commit f685a533a7fab35c5d069dcd663f59c8e4171a75.
>>>
>>> It cause kernel panic on Ingenic X1830, so let's revert it.
>>>
>>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>> ---
>>> arch/mips/mm/cache.c | 31 ++++++++++++++-----------------
>>> 1 file changed, 14 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
>>> index 7719d63..9cfd432 100644
>>> --- a/arch/mips/mm/cache.c
>>> +++ b/arch/mips/mm/cache.c
>>> @@ -21,7 +21,6 @@
>>> #include <asm/cpu.h>
>>> #include <asm/cpu-features.h>
>>> #include <asm/setup.h>
>>> -#include <asm/pgtable.h>
>>>
>>> /* Cache operations. */
>>> void (*flush_cache_all)(void);
>>> @@ -157,31 +156,29 @@ unsigned long _page_cachable_default;
>>> EXPORT_SYMBOL(_page_cachable_default);
>>>
>>> #define PM(p)	__pgprot(_page_cachable_default | (p))
>>> -#define PVA(p)	PM(_PAGE_VALID | _PAGE_ACCESSED | (p))
>>>
>>> static inline void setup_protection_map(void)
>>> {
>>> protection_map[0] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
>>> -	protection_map[1] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>> -	protection_map[2] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
>>> -	protection_map[3] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>> -	protection_map[4] = PVA(_PAGE_PRESENT);
>>> -	protection_map[5] = PVA(_PAGE_PRESENT);
>>> -	protection_map[6] = PVA(_PAGE_PRESENT);
>>> -	protection_map[7] = PVA(_PAGE_PRESENT);
>>> +	protection_map[1] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>> +	protection_map[2] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
>>> +	protection_map[3] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>> +	protection_map[4] = PM(_PAGE_PRESENT);
>>> +	protection_map[5] = PM(_PAGE_PRESENT);
>>> +	protection_map[6] = PM(_PAGE_PRESENT);
>>> +	protection_map[7] = PM(_PAGE_PRESENT);
>>>
>>> protection_map[8] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
>>> -	protection_map[9] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>> -	protection_map[10] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
>>> +	protection_map[9] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>> +	protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
>>> _PAGE_NO_READ);
>>> -	protection_map[11] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
>>> -	protection_map[12] = PVA(_PAGE_PRESENT);
>>> -	protection_map[13] = PVA(_PAGE_PRESENT);
>>> -	protection_map[14] = PVA(_PAGE_PRESENT);
>>> -	protection_map[15] = PVA(_PAGE_PRESENT);
>>> +	protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
>>> +	protection_map[12] = PM(_PAGE_PRESENT);
>>> +	protection_map[13] = PM(_PAGE_PRESENT);
>>> +	protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
>>> +	protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
>>> }
>>>
>>> -#undef _PVA
>>> #undef PM
>>>
>>> void cpu_cache_init(void)
