Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E2C365A85
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 15:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbhDTNsO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 09:48:14 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:39494 "EHLO
        out28-149.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbhDTNsL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Apr 2021 09:48:11 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0839631-0.0011211-0.914916;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.K15QXLp_1618926456;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K15QXLp_1618926456)
          by smtp.aliyun-inc.com(10.147.42.198);
          Tue, 20 Apr 2021 21:47:37 +0800
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
 <13e37741-c1b4-2aae-471e-0790adc8db59@wanyeetech.com>
 <20210420024818.r6jf243oglb2ywbr@ambrosehua-HP-xw6600-Workstation>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <e8528334-75cb-e62e-64b6-f6d63acebd05@wanyeetech.com>
Date:   Tue, 20 Apr 2021 21:47:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210420024818.r6jf243oglb2ywbr@ambrosehua-HP-xw6600-Workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2021/4/20 上午10:48, Huang Pei wrote:
> Hi,
> On Mon, Apr 19, 2021 at 10:21:40PM +0800, Zhou Yanjie wrote:
>> Hi
>>
>> On 2021/4/19 下午12:56, Huang Pei wrote:
>>> On Sat, Apr 17, 2021 at 12:45:59AM +0800, Zhou Yanjie wrote:
>>>> On 2021/4/16 下午5:20, 黄沛 wrote:
>>>>> Is there any log about the panic?
>>>> Yes, below is the log:
>>>>
>>>>
>>>> [  195.436017] CPU 0 Unable to handle kernel paging request at virtual
>>>> address 77eb8000, epc == 80117868, ra == 80118208
>>>> [  195.446709] Oops[#1]:
>>>> [  195.448977] CPU: 0 PID: 1461 Comm: Xsession Not tainted
>>>> 5.12.0-rc6-00227-gc8fc6defbd2e-dirty #1
>>>> [  195.457661] $ 0   : 00000000 00000001 80117864 77eb9000
>>>> [  195.462888] $ 4   : 77eb8000 82419600 838ea000 82482ba0
>>>> [  195.468116] $ 8   : 826f8b18 8306f800 000072d5 8306f800
>>>> [  195.473343] $12   : 00000002 00000a03 00000001 00000402
>>>> [  195.478568] $16   : 77eb8000 809faf60 00000004 82482ba0
>>>> [  195.483794] $20   : 77eb8000 82419600 82482ba0 80860000
>>>> [  195.489021] $24   : 8086121c 80117864
>>>> [  195.494248] $28   : 838ea000 838ebd70 00000000 80118208
>>>> [  195.499475] Hi    : 00008c4e
>>>> [  195.502343] Lo    : 00004627
>>>> [  195.505212] epc   : 80117868 r4k_blast_dcache_page_dc32+0x4/0x9c
>>>> [  195.511217] ra    : 80118208 local_r4k_flush_cache_page+0x120/0x1b8
>>>> [  195.517476] Status: 10001403 KERNEL EXL IE
>>>> [  195.521657] Cause : 4080800c (ExcCode 03)
>>>> [  195.525654] BadVA : 77eb8000
>>>> [  195.528523] PrId  : 00d00100 (Ingenic XBurst)
>>>> [  195.532866] Modules linked in:
>>>> [  195.535911] Process Xsession (pid: 1461, threadinfo=00975a3e,
>>>> task=3724fd66, tls=77ebd690)
>>>> [  195.544162] Stack : 808a05ec f7edcbfd 8306f800 00000000 80860000 809faf60
>>>> 80990a3c 80117f90
>>>> [  195.552524]         809faf60 82419600 8306f800 801fd84c 00000000 801180b4
>>>> 838ebe80 80110b7c
>>>> [  195.560887]         80990a3c 82482ba0 82482ba0 77eb8000 00004627 f7edcbfd
>>>> 838ebe80 801cbc08
>>>> [  195.569249]         00000001 181b2000 00000000 801fa06c 00000000 83999ae0
>>>> 80860000 00000004
>>>> [  195.577610]         80990a3c f7edcbfd 80990a3c 838ebe80 00000004 80990a3c
>>>> 82482ba0 04627685
>>>> [  195.585973]         ...
>>>> [  195.588413] Call Trace:
>>>> [  195.590849] [<80117868>] r4k_blast_dcache_page_dc32+0x4/0x9c
>>>> [  195.596501] [<80118208>] local_r4k_flush_cache_page+0x120/0x1b8
>>>> [  195.602413] [<80117f90>] r4k_on_each_cpu.isra.8+0x24/0x58
>>>> [  195.607805] [<801180b4>] r4k_flush_cache_page+0x34/0x58
>>>> [  195.613023] [<801cbc08>] wp_page_copy+0x3a8/0x56c
>>>> [  195.617723] [<801ce944>] do_swap_page+0x4cc/0x558
>>>> [  195.622419] [<801cf3f8>] handle_mm_fault+0x790/0x93c
>>>> [  195.627374] [<8011025c>] do_page_fault+0x19c/0x540
>>>> [  195.632159] [<801142f0>] tlb_do_page_fault_1+0x10c/0x11c
>>>> [  195.637465]
>>>> [  195.638947] Code: 03e00008  00000000  24831000 <bc950000> bc950020
>>>> bc950040  bc950060  bc950080  bc9500a0
>>>> [  195.648706]
>>>> [  195.650243] ---[ end trace 7cc7d7f611932c42 ]---
>>>> [  195.654857] Kernel panic - not syncing: Fatal exception
>>>> [  195.660072] Rebooting in 10 seconds..
>>>>
>>>>
>>>> this problem can be triggered stably (by use Microsoft Remote Desktop client
>>>> to login to debian9 running on CU1830-Neo).
>>>>
>>> Could you print out the PTE value at 0x77eb8000 ?
>>
>> Here is the new log:
>>
>>
>> [   33.681712] CPU 0 Unable to handle kernel paging request at virtual
>> address 77ea4000, epc == 801178ac, ra == 80118250
>> [   33.692395] Oops[#1]:
>> [   33.694662] CPU: 0 PID: 1389 Comm: Xsession Not tainted 5.12.0-rc8-dirty
>> #2
>> [   33.701612] $ 0   : 00000000 00000001 801178a8 77ea5000
>> [   33.706839] $ 4   : 77ea4000 81bcd220 80118130 856712a0
>> [   33.712066] $ 8   : 833e4a80 8544b800 000070a8 8544b800
>> [   33.717293] $12   : 00000002 000005b7 00000001 00000000
>> [   33.722518] $16   : 81bcd220 77ea4000 80a11ad8 00000004
>> [   33.727745] $20   : 77ea4000 81bcd220 856712a0 80860000
>> [   33.732972] $24   : 0000001c 801178a8
>> [   33.738197] $28   : 82564000 82565d68 00000000 80118250
>> [   33.743424] Hi    : 0000f0cc
>> [   33.746293] Lo    : 00007866
>> [   33.749162] epc   : 801178ac r4k_blast_dcache_page_dc32+0x4/0x9c
>> [   33.755166] ra    : 80118250 local_r4k_flush_cache_page+0x120/0x2c8
>> [   33.761425] Status: 10001403 KERNEL EXL IE
>> [   33.765605] Cause : 4080800c (ExcCode 03)
>> [   33.769603] BadVA : 77ea4000
>> [   33.772472] PrId  : 00d00100 (Ingenic XBurst)
>> [   33.776816] Modules linked in:
>> [   33.779861] Process Xsession (pid: 1389, threadinfo=c8bdf64c,
>> task=2372d853, tls=77ea9690)
>> [   33.788111] Stack : 808a256c 00000000 808a256c bfa6939a 8544b800 80860000
>> 8094d308 80a11ad8
>> [   33.796474]         856712a0 80117fd8 8094d308 81bcd220 8544b800 801fdb10
>> 80945ce8 801180fc
>> [   33.804838]         82565e80 80110b8c 80a11ad8 856712a0 856712a0 77ea4000
>> 00007866 bfa6939a
>> [   33.813201]         82565e80 801cbe38 00000000 bfa6939a 80863494 801fa2c0
>> 856712a0 82562a90
>> [   33.821564]         80860000 00000000 80a11ad8 bfa6939a 80a11ad8 82565e80
>> 00000000 80a11ad8
>> [   33.829927]         ...
>> [   33.832367] Call Trace:
>> [   33.834803] [<801178ac>] r4k_blast_dcache_page_dc32+0x4/0x9c
>> [   33.840455] [<80118250>] local_r4k_flush_cache_page+0x120/0x2c8
>> [   33.846367] [<80117fd8>] r4k_on_each_cpu.isra.10+0x24/0x58
>> [   33.851845] [<801180fc>] r4k_flush_cache_page+0x34/0x58
>> [   33.857062] [<801cbe38>] wp_page_copy+0x3a8/0x56c
>> [   33.861763] [<801ceb74>] do_swap_page+0x4cc/0x558
>> [   33.866458] [<801cf628>] handle_mm_fault+0x790/0x93c
>> [   33.871414] [<8011026c>] do_page_fault+0x19c/0x540
>> [   33.876199] [<80114300>] tlb_do_page_fault_1+0x10c/0x11c
>> [   33.881506]
>> [   33.882987] Index:  5 pgmask=4kb va=77ea2000 asid=fd
>> [   33.882987]  [pa=02a99000 c=3 d=1 v=1 g=0] [pa=0690d000 c=3 d=0 v=0 g=0]
>> [   33.894635] Index:  6 pgmask=4kb va=77dc4000 asid=fd
>> [   33.894635]  [pa=01d30000 c=3 d=0 v=1 g=0] [pa=01d31000 c=3 d=0 v=1 g=0]
>> [   33.906281] Index:  7 pgmask=4kb va=77dc0000 asid=fd
>> [   33.906281]  [pa=01d2c000 c=3 d=0 v=1 g=0] [pa=01d2d000 c=3 d=0 v=1 g=0]
>> [   33.917928] Index:  8 pgmask=4kb va=77dc2000 asid=fd
>> [   33.917928]  [pa=01d2e000 c=3 d=0 v=1 g=0] [pa=01d2f000 c=3 d=0 v=1 g=0]
>> [   33.929574] Index:  9 pgmask=4kb va=77dc6000 asid=fd
>> [   33.929574]  [pa=01d32000 c=3 d=0 v=1 g=0] [pa=01d33000 c=3 d=0 v=1 g=0]
>> [   33.941220] Index: 10 pgmask=4kb va=77dc8000 asid=fd
>> [   33.941220]  [pa=01d34000 c=3 d=0 v=1 g=0] [pa=01d35000 c=3 d=0 v=1 g=0]
>> [   33.952866] Index: 11 pgmask=4kb va=77dca000 asid=fd
>> [   33.952866]  [pa=01d36000 c=3 d=0 v=1 g=0] [pa=01d37000 c=3 d=0 v=1 g=0]
>> [   33.964512] Index: 12 pgmask=4kb va=77dcc000 asid=fd
>> [   33.964512]  [pa=01d38000 c=3 d=0 v=1 g=0] [pa=01d39000 c=3 d=0 v=1 g=0]
>> [   33.976159] Index: 13 pgmask=4kb va=77dce000 asid=fd
>> [   33.976159]  [pa=01d3a000 c=3 d=0 v=1 g=0] [pa=01d3b000 c=3 d=0 v=1 g=0]
>> [   33.987805] Index: 14 pgmask=4kb va=77d82000 asid=fd
>> [   33.987805]  [pa=01dbd000 c=3 d=0 v=1 g=0] [pa=01dbe000 c=3 d=0 v=1 g=0]
>> [   33.999451] Index: 15 pgmask=4kb va=77d80000 asid=fd
>> [   33.999451]  [pa=01dbb000 c=3 d=0 v=1 g=0] [pa=01dbc000 c=3 d=0 v=1 g=0]
>> [   34.011097] Index: 16 pgmask=4kb va=77d84000 asid=fd
>> [   34.011097]  [pa=01dbf000 c=3 d=0 v=1 g=0] [pa=01dc0000 c=3 d=0 v=1 g=0]
>> [   34.022743] Index: 17 pgmask=4kb va=77d86000 asid=fd
>> [   34.022743]  [pa=01dc1000 c=3 d=0 v=1 g=0] [pa=01dc2000 c=3 d=0 v=1 g=0]
>> [   34.034389] Index: 18 pgmask=4kb va=77d88000 asid=fd
>> [   34.034389]  [pa=01dc3000 c=3 d=0 v=1 g=0] [pa=01dc4000 c=3 d=0 v=1 g=0]
>> [   34.046035] Index: 19 pgmask=4kb va=77d8a000 asid=fd
>> [   34.046035]  [pa=01dc5000 c=3 d=0 v=1 g=0] [pa=01dc6000 c=3 d=0 v=1 g=0]
>> [   34.057682] Index: 20 pgmask=4kb va=77d8c000 asid=fd
>> [   34.057682]  [pa=01dc7000 c=3 d=0 v=1 g=0] [pa=01dc8000 c=3 d=0 v=1 g=0]
>> [   34.069328] Index: 21 pgmask=4kb va=77d8e000 asid=fd
>> [   34.069328]  [pa=01dc9000 c=3 d=0 v=1 g=0] [pa=01dca000 c=3 d=0 v=1 g=0]
>> [   34.080975] Index: 22 pgmask=4kb va=7f7b0000 asid=fd
>> [   34.080975]  [pa=078ea000 c=3 d=0 v=1 g=0] [pa=07801000 c=3 d=0 v=0 g=0]
>> [   34.092621] Index: 23 pgmask=4kb va=77e5a000 asid=fd
>> [   34.092621]  [pa=07ece000 c=3 d=0 v=1 g=0] [pa=077fb000 c=3 d=0 v=1 g=0]
>> [   34.104267] Index: 24 pgmask=4kb va=77e5c000 asid=fd
>> [   34.104267]  [pa=0775f000 c=3 d=0 v=1 g=0] [pa=07314000 c=3 d=0 v=0 g=0]
>> [   34.115913] Index: 25 pgmask=4kb va=77ea4000 asid=fd
>> [   34.115913]  [pa=18122000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
> C = 0, pa = 18122000,  it is weird,
>
> +. pa is too high for 32bit SOC here;
>
> +. C=0 is not a valid cache attribute;
>
> I think this is "not" a PTE for memory, maybe a swap entry?
>
> Could you print the PTE value, not the value in TLB?


The following is the value of PTE.

There are 5 access operations from"pte = mk_pte(page, 
vma->vm_page_prot)" to "set_pte_at(vma->vm_mm, vmf->address, vmf->pte, 
pte)" in the "mm/memory.c" file.

They are named pte 1/pte 2/pte 3/pte 4/pte 5.


[   37.433993] --- pte 1 = 07b02685
[   37.437283] --- pte 3 = 07b02685
[   37.441005] --- pte 1 = 07c0c685
[   37.444241] --- pte 3 = 07c0c685
[   37.453561] --- pte 1 = 07b05685
[   37.456885] --- pte 3 = 07b05685
[   37.460915] --- pte 1 = 07b8c685
[   37.464157] --- pte 2 = 07b8c78f
[   37.467449] --- pte 3 = 07b8c78f
[   37.472461] --- pte 1 = 07aff685
[   37.475694] --- pte 3 = 07aff685
[   37.479970] --- pte 1 = 07b16685
[   37.483205] --- pte 3 = 07b16685
[   37.487443] --- pte 1 = 07c20685
[   37.490679] --- pte 3 = 07c20685
[   37.494043] --- pte 1 = 07bd9685
[   37.497337] --- pte 3 = 07bd9685
[   37.501678] --- pte 1 = 07c0e685
[   37.504913] --- pte 3 = 07c0e685
[   37.510009] --- pte 1 = 07c11685
[   37.513242] --- pte 3 = 07c11685
[   37.535431] --- pte 1 = 07afd685
[   37.538721] --- pte 3 = 07afd685
[   37.542363] --- pte 1 = 07c92685
[   37.545599] --- pte 3 = 07c92685
[   37.737458] --- pte 1 = 06853685
[   37.740698] --- pte 3 = 06853685
[   37.760229] --- pte 1 = 06853685
[   37.763504] --- pte 3 = 06853685
[   37.786619] --- pte 1 = 06853685
[   37.789895] --- pte 3 = 06853685
[   37.822622] --- pte 1 = 06853685
[   37.825928] --- pte 3 = 06853685
[   37.984660] --- pte 1 = 06853685
[   37.987995] --- pte 3 = 06853685
[   40.917495] --- pte 1 = 07b07685
[   40.920753] --- pte 3 = 07b07685
[   40.924017] --- pte 1 = 042c6685
[   40.927306] --- pte 3 = 042c6685
[   40.931823] --- pte 1 = 07c0d685
[   40.935073] --- pte 3 = 07c0d685
[   40.940130] --- pte 1 = 04976685
[   40.943364] --- pte 3 = 04976685
[   41.187955] --- pte 1 = 06cb7685
[   41.191204] --- pte 3 = 06cb7685
[   41.194841] --- pte 1 = 06d11685
[   41.198147] --- pte 3 = 06d11685
[   41.202959] --- pte 1 = 06c85685
[   41.206287] --- pte 3 = 06c85685
[   41.210331] --- pte 1 = 03965685
[   41.213675] --- pte 3 = 03965685
[   41.218629] --- pte 1 = 0396f685
[   41.221886] --- pte 3 = 0396f685
[   41.242299] --- pte 1 = 03fa9685
[   41.245561] --- pte 3 = 03fa9685
[   41.282717] --- pte 1 = 026fa685
[   41.286029] --- pte 2 = 026fa78f
[   41.289248] --- pte 3 = 026fa78f
[   41.308755] --- pte 1 = 0767f685
[   41.311993] --- pte 3 = 0767f685
[   41.329631] --- pte 1 = 069c4685
[   41.332925] --- pte 2 = 069c478f
[   41.336201] --- pte 3 = 069c478f
[   41.358331] --- pte 1 = 01e3f685
[   41.361593] --- pte 2 = 01e3f78f
[   41.364810] --- pte 3 = 01e3f78f
[   41.371673] --- pte 1 = 03855685
[   41.374952] --- pte 2 = 0385578f
[   41.378221] --- pte 3 = 0385578f
[   41.390334] --- pte 1 = 07781685
[   41.393596] --- pte 2 = 0778178f
[   41.396882] --- pte 3 = 0778178f
[   41.411191] --- pte 1 = 07a41685
[   41.414462] --- pte 3 = 07a41685
[   42.328309] --- pte 1 = 06f1a685
[   42.331544] --- pte 3 = 06f1a685
[   42.334857] --- pte 1 = 075dc685
[   42.338157] --- pte 3 = 075dc685
[   42.343129] --- pte 1 = 076ae685
[   42.346456] --- pte 3 = 076ae685
[   42.356107] --- pte 1 = 076bd685
[   42.359340] --- pte 3 = 076bd685
[   47.550904] --- pte 1 = 01f15685
[   47.554140] --- pte 3 = 01f15685
[   47.559395] --- pte 1 = 07190685
[   47.562631] --- pte 3 = 07190685
[   47.567481] --- pte 1 = 07192685
[   47.570717] --- pte 3 = 07192685
[   47.578143] --- pte 1 = 0208a685
[   47.581380] --- pte 3 = 0208a685
[   47.586849] --- pte 1 = 02aa3685
[   47.590085] --- pte 3 = 02aa3685
[   47.594058] --- pte 1 = 02bb4685
[   47.597358] --- pte 3 = 02bb4685
[   47.601741] --- pte 1 = 02088685
[   47.604993] --- pte 3 = 02088685
[   47.626492] --- pte 1 = 02bb5685
[   47.629749] --- pte 3 = 02bb5685
[   47.648313] --- pte 1 = 02aa2685
[   47.651551] --- pte 3 = 02aa2685
[   47.683155] --- pte 1 = 01c93685
[   47.686449] --- pte 3 = 01c93685
[   48.409395] --- pte 1 = 07f02685
[   48.412632] --- pte 3 = 07f02685
[   49.639047] --- pte 1 = 05cd0685
[   49.642283] --- pte 3 = 05cd0685
[   49.756173] --- pte 1 = 043e7685
[   49.759410] --- pte 3 = 043e7685
[   49.775899] --- pte 1 = 02a22685
[   49.779158] --- pte 3 = 02a22685
[   49.801083] --- pte 1 = 018bc685
[   49.804337] --- pte 3 = 018bc685
[   49.826453] --- pte 1 = 01db1685
[   49.829690] --- pte 3 = 01db1685
[   49.848209] --- pte 1 = 07cb7685
[   49.851446] --- pte 3 = 07cb7685
[   49.865907] --- pte 1 = 02592685
[   49.869172] --- pte 3 = 02592685
[   49.880463] --- pte 1 = 0256c685
[   49.883714] --- pte 3 = 0256c685
[   50.019617] --- pte 1 = 03e30685
[   50.022854] --- pte 3 = 03e30685
[   50.027982] --- pte 1 = 07184685
[   50.031218] --- pte 3 = 07184685
[   50.034461] --- pte 1 = 07787685
[   50.037732] --- pte 3 = 07787685
[   50.056424] --- pte 1 = 01bf4685
[   50.059660] --- pte 3 = 01bf4685
[   50.075875] --- pte 1 = 01bf5685
[   50.079111] --- pte 3 = 01bf5685
[   50.082879] --- pte 1 = 07e37685
[   50.086165] --- pte 3 = 07e37685
[   50.096771] --- pte 1 = 0644c685
[   50.100007] --- pte 3 = 0644c685
[   50.103231] --- pte 1 = 07fa3685
[   50.106523] --- pte 3 = 07fa3685
[   50.126426] --- pte 1 = 04ca0685
[   50.129672] --- pte 2 = 04ca078f
[   50.132889] --- pte 3 = 04ca078f
[   50.150463] --- pte 1 = 019cf685
[   50.153699] --- pte 3 = 019cf685
[   50.176439] --- pte 1 = 07a4e685
[   50.179675] --- pte 3 = 07a4e685
[   50.187700] --- pte 1 = 02b44685
[   50.190966] --- pte 3 = 02b44685
[   50.206031] --- pte 1 = 03620685
[   50.209267] --- pte 3 = 03620685
[   50.213061] --- pte 1 = 02275685
[   50.216356] --- pte 3 = 02275685
[   50.239359] --- pte 1 = 07765685
[   50.242596] --- pte 3 = 07765685
[   50.263367] --- pte 1 = 04221685
[   50.266648] --- pte 3 = 04221685
[   50.292287] irq/37-13450000: page allocation failure: order:0, 
mode:0x40800(GFP_NOWAIT|__GFP_COMP), nodemask=(null)
[   50.302738] CPU: 0 PID: 517 Comm: irq/37-13450000 Not tainted 
5.12.0-rc8-dirty #6
[   50.310207] Stack : 00040800 00000000 00000001 801565b8 00000000 
00000007 00000000 635e192b
[   50.318570]         80ea5bf4 80860000 807e9c80 80860000 80865923 
00000001 80ea5b98 635e192b
[   50.326933]         00000000 00000000 807e9c80 00000003 00000001 
80ea5a6c 00000000 00000bd3
[   50.335294]         bff4ffd7 120b6cde 80ea5a64 302e3231 80860000 
00000000 807e8508 00040800
[   50.343657]         00000000 00000850 00040800 00000000 00000000 
8042a10c 00000000 808e0000
[   50.352018]         ...
[   50.354459] Call Trace:
[   50.356895] [<80107db8>] show_stack+0x6c/0x12c
[   50.361341] [<801e2f4c>] warn_alloc+0xa8/0x148
[   50.365780] [<801e38e0>] __alloc_pages_nodemask+0x8d4/0x908
[   50.371346] [<801f24ac>] ____cache_alloc+0x2dc/0x6a4
[   50.376305] [<801f2a10>] kmem_cache_alloc+0x6c/0x104
[   50.381263] [<803feac0>] jz4780_dma_desc_alloc.isra.9+0x40/0xa0
[   50.387177] [<803fee90>] jz4780_dma_prep_slave_sg+0x54/0x184
[   50.392828] [<804f72a8>] jz_mmc_irq_worker+0x2a8/0x760
[   50.397958] [<80159e88>] irq_thread_fn+0x2c/0x6c
[   50.402567] [<8015a4a0>] irq_thread+0x128/0x200
[   50.407089] [<8013c0c8>] kthread+0x148/0x150
[   50.411351] [<8010224c>] ret_from_kernel_thread+0x14/0x1c
[   50.416742]
[   50.418225] Index:  0 pgmask=4kb va=7709a000 asid=1a
[   50.418225]  [pa=02155000 c=3 d=0 v=0 g=0] [pa=02156000 c=3 d=0 v=1 g=0]
[   50.429873] Index:  1 pgmask=4kb va=77072000 asid=1a
[   50.429873]  [pa=038d7000 c=3 d=0 v=0 g=0] [pa=07810000 c=3 d=0 v=1 g=0]
[   50.441520] Index:  2 pgmask=4kb va=76e1a000 asid=1a
[   50.441520]  [pa=01f53000 c=3 d=0 v=0 g=0] [pa=01f54000 c=3 d=0 v=1 g=0]
[   50.453167] Index:  3 pgmask=4kb va=770fe000 asid=1a
[   50.453167]  [pa=0208d000 c=3 d=0 v=0 g=0] [pa=0208e000 c=3 d=0 v=1 g=0]
[   50.464814] Index:  4 pgmask=4kb va=566f8000 asid=1a
[   50.464814]  [pa=03a52000 c=3 d=0 v=0 g=0] [pa=03a53000 c=3 d=0 v=1 g=0]
[   50.476461] Index:  5 pgmask=4kb va=7fece000 asid=1a
[   50.476461]  [pa=07ac3000 c=3 d=0 v=1 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[   50.488108] Index:  6 pgmask=4kb va=566fe000 asid=1a
[   50.488108]  [pa=01bcf000 c=3 d=1 v=1 g=0] [pa=05eb1000 c=3 d=1 v=1 g=0]
[   50.499755] Index:  7 pgmask=4kb va=77098000 asid=1a
[   50.499755]  [pa=05417000 c=3 d=0 v=1 g=0] [pa=02154000 c=3 d=0 v=1 g=0]
[   50.511402] Index:  8 pgmask=4kb va=77e64000 asid=1a
[   50.511402]  [pa=05333000 c=3 d=0 v=1 g=0] [pa=04c85000 c=3 d=0 v=0 g=0]
[   50.523049] Index:  9 pgmask=4kb va=76e6a000 asid=1a
[   50.523049]  [pa=021fe000 c=3 d=0 v=1 g=0] [pa=021ff000 c=3 d=0 v=1 g=0]
[   50.534696] Index: 10 pgmask=4kb va=76f76000 asid=1a
[   50.534696]  [pa=0698f000 c=3 d=1 v=1 g=0] [pa=0697a000 c=3 d=1 v=1 g=0]
[   50.546343] Index: 11 pgmask=4kb va=762d6000 asid=1a
[   50.546343]  [pa=06988000 c=3 d=1 v=1 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[   50.557989] Index: 12 pgmask=4kb va=76f74000 asid=1a
[   50.557989]  [pa=0103d000 c=3 d=1 v=1 g=0] [pa=02b40000 c=3 d=0 v=1 g=0]
[   50.569636] Index: 13 pgmask=4kb va=566e8000 asid=1a
[   50.569636]  [pa=05dd0000 c=3 d=1 v=1 g=0] [pa=053e6000 c=3 d=1 v=1 g=0]
[   50.581283] Index: 14 pgmask=4kb va=566ac000 asid=1a
[   50.581283]  [pa=00000000 c=0 d=0 v=0 g=0] [pa=04b26000 c=3 d=1 v=1 g=0]
[   50.592930] Index: 17 pgmask=4kb va=76eca000 asid=1a
[   50.592930]  [pa=02184000 c=3 d=0 v=1 g=0] [pa=02185000 c=3 d=0 v=0 g=0]
[   50.604577] Index: 18 pgmask=4kb va=76f8c000 asid=1a
[   50.604577]  [pa=01da3000 c=3 d=0 v=1 g=0] [pa=01da4000 c=3 d=0 v=1 g=0]
[   50.616224] Index: 19 pgmask=4kb va=76e9c000 asid=1a
[   50.616224]  [pa=02225000 c=3 d=0 v=0 g=0] [pa=02226000 c=3 d=0 v=1 g=0]
[   50.627871] Index: 20 pgmask=4kb va=7fecc000 asid=1a
[   50.627871]  [pa=05b01000 c=3 d=1 v=1 g=0] [pa=05abe000 c=3 d=1 v=1 g=0]
[   50.639518] Index: 21 pgmask=4kb va=76ef0000 asid=1a
[   50.639518]  [pa=021aa000 c=3 d=0 v=1 g=0] [pa=021ab000 c=3 d=0 v=1 g=0]
[   50.651165] Index: 22 pgmask=4kb va=76e62000 asid=1a
[   50.651165]  [pa=021f6000 c=3 d=0 v=1 g=0] [pa=021f7000 c=3 d=0 v=1 g=0]
[   50.662812] Index: 23 pgmask=4kb va=74a00000 asid=1a
[   50.662812]  [pa=03395000 c=3 d=1 v=1 g=0] [pa=028a0000 c=3 d=1 v=1 g=0]
[   50.674459] Index: 24 pgmask=4kb va=75400000 asid=1a
[   50.674459]  [pa=05ec6000 c=3 d=1 v=1 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[   50.686105] Index: 25 pgmask=4kb va=76ede000 asid=1a
[   50.686105]  [pa=02198000 c=3 d=0 v=0 g=0] [pa=02199000 c=3 d=0 v=1 g=0]
[   50.697753] Index: 26 pgmask=4kb va=c009a000 asid=1a
[   50.697753]  [pa=00000000 c=0 d=0 v=0 g=1] [pa=02f90000 c=3 d=1 v=1 g=1]
[   50.709399] Index: 27 pgmask=4kb va=c0086000 asid=1a
[   50.709399]  [pa=02f69000 c=3 d=1 v=1 g=1] [pa=02f6a000 c=3 d=1 v=1 g=1]
[   50.721046] Index: 28 pgmask=4kb va=770f2000 asid=1a
[   50.721046]  [pa=06915000 c=3 d=0 v=1 g=0] [pa=06916000 c=3 d=0 v=1 g=0]
[   50.732693] Index: 29 pgmask=4kb va=56700000 asid=1a
[   50.732693]  [pa=0357b000 c=3 d=1 v=1 g=0] [pa=07f9c000 c=3 d=1 v=1 g=0]
[   50.744340] Index: 30 pgmask=4kb va=76f88000 asid=1a
[   50.744340]  [pa=01d9f000 c=3 d=0 v=1 g=0] [pa=01da0000 c=3 d=0 v=1 g=0]
[   50.755987] Index: 31 pgmask=4kb va=76fa4000 asid=1a
[   50.755987]  [pa=03c3d000 c=3 d=0 v=1 g=0] [pa=00000000 c=0 d=0 v=0 g=0]


Thanks and best regards!


>
> tTLB value lost software PTE bits
>
>> [   34.127559] Index: 26 pgmask=4kb va=c0096000 asid=fd
>> [   34.127559]  [pa=0302f000 c=3 d=1 v=1 g=1] [pa=03008000 c=3 d=1 v=1 g=1]
>> [   34.139205]
>> [   34.140686] Code: 03e00008  00000000  24831000 <bc950000> bc950020
>> bc950040  bc950060  bc950080  bc9500a0
>> [   34.150445]
>> [   34.151987] ---[ end trace 30089d2c358ff363 ]---
>> [   34.156614] Kernel panic - not syncing: Fatal exception
>> [   34.161831] Rebooting in 10 seconds..
>>
>>> I really have no idea of how the page_prot setting affecting the swap
>>> handling.
>>>
>>>> Thanks and best regards!
>>>>
>>>>
>>>>>      Original Message
>>>>> From: 周琰杰 (Zhou Yanjie)
>>>>> Sent: 2021年4月16日星期五 16:48
>>>>> To: tsbogend@alpha.franken.de
>>>>> Cc: linux-mips@vger.kernel.org; linux-kernel@vger.kernel.org; akpm@linux-foundation.org; paul.burton@mips.com; paul@crapouillou.net; siyanteng@loongson.cn; huangpei@loongson.cn; ira.weiny@intel.com; yangtiezhu@loongson.cn; zhouyanjie@wanyeetech.com; jun.jiang@ingenic.com; dongsheng.qiu@ingenic.com; aric.pzqi@ingenic.com; rick.tyliu@ingenic.com; sernia.zhou@foxmail.com
>>>>> Subject: [PATCH] Revert "MIPS: make userspace mapping young by default".
>>>>>
>>>>> This reverts commit f685a533a7fab35c5d069dcd663f59c8e4171a75.
>>>>>
>>>>> It cause kernel panic on Ingenic X1830, so let's revert it.
>>>>>
>>>>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>>>> ---
>>>>> arch/mips/mm/cache.c | 31 ++++++++++++++-----------------
>>>>> 1 file changed, 14 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
>>>>> index 7719d63..9cfd432 100644
>>>>> --- a/arch/mips/mm/cache.c
>>>>> +++ b/arch/mips/mm/cache.c
>>>>> @@ -21,7 +21,6 @@
>>>>> #include <asm/cpu.h>
>>>>> #include <asm/cpu-features.h>
>>>>> #include <asm/setup.h>
>>>>> -#include <asm/pgtable.h>
>>>>>
>>>>> /* Cache operations. */
>>>>> void (*flush_cache_all)(void);
>>>>> @@ -157,31 +156,29 @@ unsigned long _page_cachable_default;
>>>>> EXPORT_SYMBOL(_page_cachable_default);
>>>>>
>>>>> #define PM(p)	__pgprot(_page_cachable_default | (p))
>>>>> -#define PVA(p)	PM(_PAGE_VALID | _PAGE_ACCESSED | (p))
>>>>>
>>>>> static inline void setup_protection_map(void)
>>>>> {
>>>>> protection_map[0] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
>>>>> -	protection_map[1] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>>>> -	protection_map[2] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
>>>>> -	protection_map[3] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>>>> -	protection_map[4] = PVA(_PAGE_PRESENT);
>>>>> -	protection_map[5] = PVA(_PAGE_PRESENT);
>>>>> -	protection_map[6] = PVA(_PAGE_PRESENT);
>>>>> -	protection_map[7] = PVA(_PAGE_PRESENT);
>>>>> +	protection_map[1] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>>>> +	protection_map[2] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
>>>>> +	protection_map[3] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>>>> +	protection_map[4] = PM(_PAGE_PRESENT);
>>>>> +	protection_map[5] = PM(_PAGE_PRESENT);
>>>>> +	protection_map[6] = PM(_PAGE_PRESENT);
>>>>> +	protection_map[7] = PM(_PAGE_PRESENT);
>>>>>
>>>>> protection_map[8] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
>>>>> -	protection_map[9] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>>>> -	protection_map[10] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
>>>>> +	protection_map[9] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
>>>>> +	protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
>>>>> _PAGE_NO_READ);
>>>>> -	protection_map[11] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
>>>>> -	protection_map[12] = PVA(_PAGE_PRESENT);
>>>>> -	protection_map[13] = PVA(_PAGE_PRESENT);
>>>>> -	protection_map[14] = PVA(_PAGE_PRESENT);
>>>>> -	protection_map[15] = PVA(_PAGE_PRESENT);
>>>>> +	protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
>>>>> +	protection_map[12] = PM(_PAGE_PRESENT);
>>>>> +	protection_map[13] = PM(_PAGE_PRESENT);
>>>>> +	protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
>>>>> +	protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
>>>>> }
>>>>>
>>>>> -#undef _PVA
>>>>> #undef PM
>>>>>
>>>>> void cpu_cache_init(void)
