Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595F8365AB6
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 16:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbhDTODh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 10:03:37 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:49466 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbhDTODh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Apr 2021 10:03:37 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0839631-0.0011211-0.914916;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047201;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.K15f5SI_1618927381;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K15f5SI_1618927381)
          by smtp.aliyun-inc.com(10.147.42.241);
          Tue, 20 Apr 2021 22:03:02 +0800
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
To:     Huang Pei <huangpei@loongson.cn>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        paul.burton@mips.com, paul@crapouillou.net, siyanteng@loongson.cn,
        ira.weiny@intel.com, yangtiezhu@loongson.cn, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        sihui.liu@ingenic.com
References: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
 <20210416092003.5754967.19768.9603@loongson.cn>
 <ae06522f-eda8-96d1-6f58-072905afa65c@wanyeetech.com>
 <20210419045610.frhzxskec47s5rmq@ambrosehua-HP-xw6600-Workstation>
 <13e37741-c1b4-2aae-471e-0790adc8db59@wanyeetech.com>
 <20210420024818.r6jf243oglb2ywbr@ambrosehua-HP-xw6600-Workstation>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <fd1e02ff-0165-7e7e-8bc6-55fb278fc50f@wanyeetech.com>
Date:   Tue, 20 Apr 2021 22:03:01 +0800
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


Sorry for my carelessness, the log in the previous email was wrong, 
please check the log in this email.


[   53.684067] --- pte 1 = 07698685
[   53.687376] --- pte 3 = 07698685
[   53.737175] --- pte 1 = 07699685
[   53.740412] --- pte 3 = 07699685
[   53.744064] --- pte 1 = 076c3685
[   53.747358] --- pte 3 = 076c3685
[   53.899679] --- pte 1 = 076c3685
[   53.902916] --- pte 3 = 076c3685
[   53.986275] --- pte 1 = 07825685
[   53.989511] --- pte 3 = 07825685
[   53.992739] --- pte 1 = 07800685
[   53.996031] --- pte 3 = 07800685
[   54.021555] --- pte 1 = 076d0685
[   54.024797] --- pte 3 = 076d0685
[   54.047399] --- pte 1 = 0768f685
[   54.050635] --- pte 3 = 0768f685
[   55.087662] --- pte 1 = 07971685
[   55.090934] --- pte 2 = 0797178f
[   55.094152] --- pte 3 = 0797178f
[   55.101275] --- pte 1 = 07976685
[   55.104511] --- pte 3 = 07976685
[   55.108895] --- pte 1 = 0797e685
[   55.112131] --- pte 3 = 0797e685
[   55.115357] --- pte 1 = 07a34685
[   55.118684] --- pte 3 = 07a34685
[   55.123019] --- pte 1 = 0625b685
[   55.126324] --- pte 3 = 0625b685
[   55.131577] --- pte 1 = 07a0c685
[   55.134820] --- pte 2 = 07a0c78f
[   55.138101] --- pte 3 = 07a0c78f
[   55.142280] --- pte 1 = 07b8e685
[   55.145587] --- pte 3 = 07b8e685
[   55.150378] --- pte 1 = 0797b685
[   55.153611] --- pte 3 = 0797b685
[   55.157897] --- pte 1 = 079af685
[   55.161134] --- pte 3 = 079af685
[   55.164361] --- pte 1 = 0797a685
[   55.167655] --- pte 3 = 0797a685
[   55.172019] --- pte 1 = 07b5f685
[   55.175255] --- pte 3 = 07b5f685
[   55.180359] --- pte 1 = 07b8b685
[   55.183592] --- pte 3 = 07b8b685
[   55.187921] --- pte 1 = 07a69685
[   55.191157] --- pte 3 = 07a69685
[   55.194392] --- pte 1 = 07a33685
[   55.197689] --- pte 3 = 07a33685
[   55.202073] --- pte 1 = 07aa6685
[   55.205307] --- pte 3 = 07aa6685
[   55.220744] --- pte 1 = 07974685
[   55.223981] --- pte 3 = 07974685
[   55.228617] --- pte 1 = 07b20685
[   55.231857] --- pte 3 = 07b20685
[   55.235091] CPU 0 Unable to handle kernel paging request at virtual 
address 77e9c000, epc == 801178ac, ra == 80118250
[   55.245763] Oops[#1]:
[   55.248033] CPU: 0 PID: 1392 Comm: Xsession Not tainted 
5.12.0-rc8-dirty #6
[   55.254983] $ 0   : 00000000 00000001 801178a8 77e9d000
[   55.260211] $ 4   : 77e9c000 824139c0 80118130 858ed800
[   55.265439] $ 8   : 83394a80 8596e800 00007017 8596e800
[   55.270667] $12   : 00000002 00000575 00000001 00000000
[   55.275893] $16   : 824139c0 77e9c000 80a17d00 00000004
[   55.281120] $20   : 77e9c000 824139c0 858ed800 80860000
[   55.286347] $24   : 00000000 801178a8
[   55.291573] $28   : 825c2000 825c3d68 00000000 80118250
[   55.296799] Hi    : 0000f640
[   55.299668] Lo    : 00007b20
[   55.302537] epc   : 801178ac r4k_blast_dcache_page_dc32+0x4/0x9c
[   55.308541] ra    : 80118250 local_r4k_flush_cache_page+0x120/0x2c8
[   55.314800] Status: 10001403 KERNEL EXL IE
[   55.318981] Cause : 4080800c (ExcCode 03)
[   55.322978] BadVA : 77e9c000
[   55.325847] PrId  : 00d00100 (Ingenic XBurst)
[   55.330191] Modules linked in:
[   55.333235] Process Xsession (pid: 1392, threadinfo=a50f3c17, 
task=72017642, tls=77ea1690)
[   55.341487] Stack : 808a256c 00000000 808a256c 2dfe3c82 8596e800 
80860000 80929d70 80a17d00
[   55.349850]         858ed800 80117fd8 80929d70 824139c0 8596e800 
801fdb50 00000000 801180fc
[   55.358213]         825c3e80 80110b8c 80a17d00 858ed800 858ed800 
77e9c000 00007b20 2dfe3c82
[   55.366575]         825c3e80 801cbe38 00000000 80a17d00 858ed800 
801fa300 858ed800 840dea70
[   55.374938]         80860000 825c3e80 80a17d00 2dfe3c82 80a17d00 
07b20685 825c3e80 00000000
[   55.383301]         ...
[   55.385741] Call Trace:
[   55.388177] [<801178ac>] r4k_blast_dcache_page_dc32+0x4/0x9c
[   55.393829] [<80118250>] local_r4k_flush_cache_page+0x120/0x2c8
[   55.399741] [<80117fd8>] r4k_on_each_cpu.isra.10+0x24/0x58
[   55.405219] [<801180fc>] r4k_flush_cache_page+0x34/0x58
[   55.410438] [<801cbe38>] wp_page_copy+0x3a8/0x56c
[   55.415138] [<801ceba8>] do_swap_page+0x500/0x58c
[   55.419833] [<801cf65c>] handle_mm_fault+0x790/0x93c
[   55.424789] [<8011026c>] do_page_fault+0x19c/0x540
[   55.429574] [<80114300>] tlb_do_page_fault_1+0x10c/0x11c
[   55.434881]
[   55.436363] Index:  0 pgmask=4kb va=77d70000 asid=ea
[   55.436363]  [pa=0209d000 c=3 d=0 v=1 g=0] [pa=0209e000 c=3 d=0 v=1 g=0]
[   55.448010] Index:  1 pgmask=4kb va=77d72000 asid=ea
[   55.448010]  [pa=0209f000 c=3 d=0 v=1 g=0] [pa=020a0000 c=3 d=0 v=1 g=0]
[   55.459657] Index:  2 pgmask=4kb va=77d74000 asid=ea
[   55.459657]  [pa=020a1000 c=3 d=0 v=1 g=0] [pa=020a2000 c=3 d=0 v=1 g=0]
[   55.471303] Index:  3 pgmask=4kb va=77d76000 asid=ea
[   55.471303]  [pa=020a3000 c=3 d=0 v=1 g=0] [pa=020a4000 c=3 d=0 v=1 g=0]
[   55.482949] Index:  4 pgmask=4kb va=77d78000 asid=ea
[   55.482949]  [pa=020a5000 c=3 d=0 v=1 g=0] [pa=020a6000 c=3 d=0 v=1 g=0]
[   55.494596] Index:  5 pgmask=4kb va=77d7c000 asid=ea
[   55.494596]  [pa=020a9000 c=3 d=0 v=1 g=0] [pa=020aa000 c=3 d=0 v=1 g=0]
[   55.506243] Index:  6 pgmask=4kb va=77d7e000 asid=ea
[   55.506243]  [pa=020ab000 c=3 d=0 v=1 g=0] [pa=020ac000 c=3 d=0 v=1 g=0]
[   55.517889] Index:  7 pgmask=4kb va=7f890000 asid=ea
[   55.517889]  [pa=03bd6000 c=3 d=0 v=1 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[   55.529535] Index:  8 pgmask=4kb va=77e52000 asid=ea
[   55.529535]  [pa=061d9000 c=3 d=0 v=1 g=0] [pa=07a34000 c=3 d=0 v=1 g=0]
[   55.541181] Index:  9 pgmask=4kb va=77e54000 asid=ea
[   55.541181]  [pa=0625b000 c=3 d=0 v=1 g=0] [pa=07974000 c=3 d=0 v=0 g=0]
[   55.552828] Index: 10 pgmask=4kb va=77e9c000 asid=ea
[   55.552828]  [pa=18166000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[   55.564474] Index: 11 pgmask=4kb va=c008e000 asid=ea
[   55.564474]  [pa=027bb000 c=3 d=1 v=1 g=1] [pa=027bc000 c=3 d=1 v=1 g=1]
[   55.576121] Index: 22 pgmask=4kb va=77e9a000 asid=ea
[   55.576121]  [pa=0115b000 c=3 d=1 v=1 g=0] [pa=0797e000 c=3 d=0 v=0 g=0]
[   55.587767] Index: 23 pgmask=4kb va=77dbc000 asid=ea
[   55.587767]  [pa=0201a000 c=3 d=0 v=1 g=0] [pa=0201b000 c=3 d=0 v=1 g=0]
[   55.599413] Index: 24 pgmask=4kb va=77db0000 asid=ea
[   55.599413]  [pa=0200e000 c=3 d=0 v=1 g=0] [pa=0200f000 c=3 d=0 v=1 g=0]
[   55.611060] Index: 25 pgmask=4kb va=77db2000 asid=ea
[   55.611060]  [pa=02010000 c=3 d=0 v=1 g=0] [pa=02011000 c=3 d=0 v=1 g=0]
[   55.622707] Index: 26 pgmask=4kb va=77db4000 asid=ea
[   55.622707]  [pa=02012000 c=3 d=0 v=1 g=0] [pa=02013000 c=3 d=0 v=1 g=0]
[   55.634354] Index: 27 pgmask=4kb va=77db6000 asid=ea
[   55.634354]  [pa=02014000 c=3 d=0 v=1 g=0] [pa=02015000 c=3 d=0 v=1 g=0]
[   55.646000] Index: 28 pgmask=4kb va=77db8000 asid=ea
[   55.646000]  [pa=02016000 c=3 d=0 v=1 g=0] [pa=02017000 c=3 d=0 v=1 g=0]
[   55.657647] Index: 29 pgmask=4kb va=77dba000 asid=ea
[   55.657647]  [pa=02018000 c=3 d=0 v=1 g=0] [pa=02019000 c=3 d=0 v=1 g=0]
[   55.669294] Index: 30 pgmask=4kb va=77dbe000 asid=ea
[   55.669294]  [pa=0201c000 c=3 d=0 v=1 g=0] [pa=0201d000 c=3 d=0 v=1 g=0]
[   55.680941] Index: 31 pgmask=4kb va=77d7a000 asid=ea
[   55.680941]  [pa=020a7000 c=3 d=0 v=1 g=0] [pa=020a8000 c=3 d=0 v=1 g=0]
[   55.692588]
[   55.694068] Code: 03e00008  00000000  24831000 <bc950000> bc950020  
bc950040  bc950060  bc950080  bc9500a0
[   55.703829]
[   55.705356] ---[ end trace 61b1a20b38fed08e ]---
[   55.709981] Kernel panic - not syncing: Fatal exception
[   55.715199] Rebooting in 10 seconds..


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
