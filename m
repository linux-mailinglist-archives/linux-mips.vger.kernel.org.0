Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CC42ACF1C
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 06:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731889AbgKJFZ6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 00:25:58 -0500
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:32795 "EHLO
        out28-145.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731072AbgKJFZt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 00:25:49 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.359983-0.00160471-0.638412;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047204;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=18;RT=18;SR=0;TI=SMTPD_---.IunD3mL_1604985933;
Received: from 192.168.1.115(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IunD3mL_1604985933)
          by smtp.aliyun-inc.com(10.147.40.200);
          Tue, 10 Nov 2020 13:25:34 +0800
Subject: Re: [PATCH 1/2] MIPS: Ingenic: Add missing nodes for Ingenic SoCs and
 boards. [and discussion about jz4780 SMP/MMC/Ethernet]
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     tsbogend@alpha.franken.de, paul@crapouillou.net,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        nixiaoming@huawei.com, paulburton@kernel.org, krzk@kernel.org,
        ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
References: <20201107115251.86182-1-zhouyanjie@wanyeetech.com>
 <20201107115251.86182-2-zhouyanjie@wanyeetech.com>
 <A9536791-F713-4CD8-80B9-4BDA6A136E50@goldelico.com>
 <030f234c-d889-9065-eade-7cf5a2b7417d@wanyeetech.com>
 <A118B719-F022-4275-B0B6-A122B28B75CF@goldelico.com>
 <ce4ac776-1d52-7744-605c-7e0e9c2ceeaa@wanyeetech.com>
 <DC962041-BBFA-4917-8FFC-EC9470593D13@goldelico.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <2878cfd4-60da-9f70-d4f3-af026d833656@wanyeetech.com>
Date:   Tue, 10 Nov 2020 13:25:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DC962041-BBFA-4917-8FFC-EC9470593D13@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2020/11/8 下午11:28, H. Nikolaus Schaller wrote:
>> Am 08.11.2020 um 16:13 schrieb Zhou Yanjie <zhouyanjie@wanyeetech.com>:
>>
>>
>> On 2020/11/8 下午10:35, H. Nikolaus Schaller wrote:
>>>> Am 08.11.2020 um 13:46 schrieb Zhou Yanjie <zhouyanjie@wanyeetech.com>:
>>>>
>>>> Hello Nikolaus,
>>>>
>>>> On 2020/11/8 上午3:03, H. Nikolaus Schaller wrote:
>>>>>> Am 07.11.2020 um 12:52 schrieb 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>:
>>>>>>
>>>>>> 1.Add OTG/OTG PHY/RNG nodes for JZ4780, CGU/OTG nodes for CI20.
>>>>>> 2.Add OTG/OTG PHY/RNG/OST nodes for X1000, SSI/CGU/OST/OTG/SC16IS752
>>>>>>   nodes for CU1000-Neo.
>>>>>> 3.Add OTG/OTG PHY/DTRNG/OST nodes for X1830, SSI/CGU/OST/OTG/SC16IS752
>>>>>>   nodes for CU1830-Neo.
>>>>>>
>>>>>> Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
>>>>> Comments below for CI20 / jz4780 only.
>>>>>
>>>>> I tried to test on top of my v5.10 working tree but the CI20 does not boot any more.
>>>>> Maybe the SMP hacks are in the way and I have to remove them first or try on top
>>>>> of v5.9.y
>>>> SMP is not available on the mainline now, so the previous SMP patch needs to be removed.
>>> I have tried with CONFIG_SMP disabled and now I can boot my v5.10-rc2 (plus local patches).
>>> And can confirm that the OTG port works.
>>
>> Nice to hear it.
>>
>>
>>> (BTW: dm9000 defers probing forever but that is an unrelated issue).
>>
>> On my side , it will work normally after selecting CONFIG_JZ4780_EFUSE.
> Seems to be related to some vcc-supply:
>
> [   14.383309] dm9000 16000000.dm9000: Looking up vcc-supply from device tree
> [   14.442598] ------------[ cut here ]------------
> [   14.442626] WARNING: CPU: 0 PID: 19 at drivers/regulator/core.c:2125 _regulator_put+0x4c/0x104
> [   14.442631] Modules linked in: ohci_platform ingenic_drm(+) gpio_keys gpio_ir_recv ohci_hcd ehci_platform dw_hdmi dwc2 roles ehci_hcd drm_kms_helper dm9000 mii rtc_pcf8563 syscopyarea sysfillrect sysimgblt fb_sys_fops drm drm_panel_orientation_quirks ipv6 autofs4
> [   14.442723] CPU: 0 PID: 19 Comm: kworker/0:1 Tainted: G        W         5.10.0-rc2-letux-mips+ #3790
> [   14.442738] Workqueue: events deferred_probe_work_func
> [   14.442745] Stack : 83941bd4 80165d58 00000000 80b70000 80b70000 80aaf3dc 80adad20 00000009
> [   14.442775]         0000084d 80165da4 80b6ff37 83936978 80b70000 00000001 83941b98 f6d2dfd3
> [   14.442805]         00000000 00000000 80aaf3dc 0000000c 00000114 00000002 00000001 746e6576
> [   14.442833]         65642073 00005c11 0000000f 72726566 80b70000 00000000 80590ad0 80adad20
> [   14.442862]         00000009 0000084d 00000001 80cb0000 00000000 805f6a28 0012829f 001282df
> [   14.442891]         ...
> [   14.442901] Call Trace:
> [   14.442918] [<8010912c>] show_stack+0x6c/0x12c
> [   14.442933] [<801229e4>] __warn+0xd4/0x108
> [   14.442943] [<80122aa0>] warn_slowpath_fmt+0x88/0xc8
> [   14.442953] [<80590ad0>] _regulator_put+0x4c/0x104
> [   14.442961] [<80590bb0>] regulator_put+0x28/0x40
> [   14.442998] [<805dac8c>] release_nodes+0x220/0x280
> [   14.443013] [<808b1488>] really_probe+0x344/0x464
> [   14.443022] [<805d612c>] driver_probe_device+0x1d8/0x224
> [   14.443038] [<805d3efc>] bus_for_each_drv+0x90/0xc8
> [   14.443047] [<805d5e5c>] __device_attach+0xc8/0x174
> [   14.443057] [<805d4e3c>] bus_probe_device+0x3c/0xb4
> [   14.443066] [<805d53d4>] deferred_probe_work_func+0x7c/0xb4
> [   14.443078] [<8013d574>] process_one_work+0x204/0x348
> [   14.443087] [<8013e028>] worker_thread+0x28c/0x3c0
> [   14.443101] [<80143ac8>] kthread+0x14c/0x154
> [   14.443111] [<80102c0c>] ret_from_kernel_thread+0x14/0x1c
> [   14.443119]
> [   14.443126] ---[ end trace 76225a8e653eb480 ]---
> [   14.443379] platform 16000000.dm9000: Driver dm9000 requests probe deferral
>

I also reproduce this phenomenon here, but no idea yet.


>>
>>>> The new SMP patch will take some time because it needs to ensure support for the new X2000 processor.
>>> Ok, I see. It is a little sad since it works find until 5.9 but now is broken and means we
>>> have to test v5.10ff with only one processor. Any hints what should be hacked to make it
>>> work until a final solution becomes available in upstream?
>>
>> I can try to make a version that supports JZ4780 first, and I will send it to you when it is completed.
> Would be nice!
>

I have completed a version and will send it to you later.


>>
>>>> Thanks and best regards!
>>> If you like you can add my
>>>
>>> Tested by: H. Nikolaus Schaller <hns@goldelico.com> # CI20/jz4780
>>>
>>> to this patch.
>>
>> Sure, I will add it to the next version.
>>
>>
>> BTW, have you noticed the problem with the MMC of JZ4780? This was first discovered by Paul. After he told me, I also tested it. When MMC has a relatively heavy load, there will indeed be many error messages related to mmcblk, and it is often accompanied by file system damage.
> Yes, I have seen spurious mmcblk warnings and sometimes the CI20 did hang with heavy debootstrap load. No file system corruption so far. I thought it may be my µSD card but did not try another one. Or thought that the SMP code is not stable and I have to wait for a mainline solution...
>

It seems to be related to the working frequency, and it seems to be 
related to the cache and mmc drivers, I am studying this issue.


>> In addition, when doing some heavy work (such as compiling docker locally),
>> the following warning message will be accompanied (this problem also exists on X1830):
>>
>> [ 4361.724410] warn_alloc: 1 callbacks suppressed
>> [ 4361.724427] go: page allocation failure: order:5, mode:0x40cc0(GFP_KERNEL|__GFP_COMP), nodemask=(null)
>> [ 4361.740945] CPU: 0 PID: 6792 Comm: go Tainted: G W         5.10.0-rc1+ #3
>> [ 4361.748407] Stack : 80960000 801686ec 00000000 80879d2c 00000000 00000001 00000400 801688f8
>> [ 4361.756845]         00000000 00000000 00000000 810891ca 84405c54 00000001 84405be8 810891ca
>> [ 4361.765281]         00000000 00000000 8086054c 00000003 00000001 84405abc 00000000 00001cf1
>> [ 4361.773717]         bff4ffd7 2c29ee2f 84405ab4 2e352020 808f0000 80000000 00000000 80860000
>> [ 4361.782153]         00000000 00000840 00000027 00000001 00000000 80441e34 017f02df 017f031f
>> [ 4361.790588]         ...
>> [ 4361.793064] Call Trace:
>> [ 4361.795547] [<80108bd4>] show_stack+0x6c/0x12c
>> [ 4361.800023] [<80677974>] dump_stack+0xa0/0xd0
>> [ 4361.804406] [<801f9e30>] warn_alloc+0xa8/0x130
>> [ 4361.808875] [<801fa7ac>] __alloc_pages_nodemask+0x8d4/0x908
>> [ 4361.814476] [<802076bc>] ____cache_alloc+0x2b4/0x600
>> [ 4361.819467] [<80207de8>] __kmalloc+0x90/0x120
>> [ 4361.823854] [<80296c8c>] proc_sys_call_handler+0xe4/0x230
>> [ 4361.829280] [<8021901c>] vfs_read+0x12c/0x19c
>> [ 4361.833662] [<802192c0>] ksys_read+0x80/0xe0
>> [ 4361.837960] [<80110fb8>] syscall_common+0x34/0x58
>> [ 4361.842687]
>> [ 4361.854888] Mem-Info:
>> [ 4361.858734] active_anon:240 inactive_anon:11673 isolated_anon:0
>> [ 4361.858734]  active_file:104199 inactive_file:53064 isolated_file:0
>> [ 4361.858734]  unevictable:0 dirty:366 writeback:0
>> [ 4361.858734]  slab_reclaimable:15980 slab_unreclaimable:2599
>> [ 4361.858734]  mapped:9755 shmem:3251 pagetables:229 bounce:0
>> [ 4361.858734]  free:67531 free_pcp:71 free_cma:3073
>> [ 4361.915078] Node 0 active_anon:960kB inactive_anon:46708kB active_file:416796kB inactive_file:212268kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:39024kB dirty:1476kB writeback:0kB shmem:13004kB writeback_tmp:0kB kernel_stack:600kB all_unreclaimable? no
>> [ 4361.940604] Normal free:33244kB min:1956kB low:2444kB high:2932kB reserved_highatomic:0KB active_anon:0kB inactive_anon:156kB active_file:82176kB inactive_file:47128kB unevictable:0kB writepending:1228kB present:262144kB managed:239444kB mlocked:0kB pagetables:908kB bounce:0kB free_pcp:120kB local_pcp:120kB free_cma:12300kB
>> [ 4361.940612] lowmem_reserve[]: 0 6144 0
>> [ 4361.974937] HighMem free:236820kB min:512kB low:2116kB high:3720kB reserved_highatomic:0KB active_anon:960kB inactive_anon:46552kB active_file:334620kB inactive_file:165140kB unevictable:0kB writepending:248kB present:786432kB managed:786432kB mlocked:0kB pagetables:0kB bounce:0kB free_pcp:240kB local_pcp:240kB free_cma:0kB
>> [ 4361.974944] lowmem_reserve[]: 0 0 0
>> [ 4362.008189] Normal: 2127*4kB (UMEC) 1508*8kB (UMEC) 472*16kB (UMEC) 96*32kB (UMC) 12*64kB (C) 4*128kB (C) 1*256kB (C) 1*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33244kB
>> [ 4362.024364] HighMem: 1441*4kB (UM) 5376*8kB (UM) 3637*16kB (UM) 1210*32kB (UM) 498*64kB (UM) 225*128kB (UM) 69*256kB (UM) 23*512kB (UM) 1*1024kB (M) 0*2048kB 0*4096kB = 236820kB
>> [ 4362.041152] 160520 total pagecache pages
>> [ 4362.045838] 0 pages in swap cache
>> [ 4362.049187] Swap cache stats: add 0, delete 0, find 0/0
>> [ 4362.055501] Free swap  = 0kB
>> [ 4362.058413] Total swap = 0kB
>> [ 4362.061315] 262144 pages RAM
>> [ 4362.065588] 196608 pages HighMem/MovableOnly
>> [ 4362.069889] 5675 pages reserved
>> [ 4362.074159] 8192 pages cma reserved
>>
>> Do you have any idea?
> Unfortunately no... Just some vague thoughts: maybe a lock is missing? Or cache corruption?
>
> But we should maybe open another discussion because it is beyond the scope of this patch.


Sure.


Thanks and best regards!


> BR and thanks,
> Nikolaus
>
>>
>> Thanks and best regards!
>>
>>
>>>>>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>>>>> ---
>>>>>> arch/mips/boot/dts/ingenic/ci20.dts       | 16 +++++++++
>>>>>> arch/mips/boot/dts/ingenic/cu1000-neo.dts | 60 +++++++++++++++++++++++++++----
>>>>>> arch/mips/boot/dts/ingenic/cu1830-neo.dts | 60 +++++++++++++++++++++++++++----
>>>>>> arch/mips/boot/dts/ingenic/jz4780.dtsi    | 41 +++++++++++++++++++--
>>>>>> arch/mips/boot/dts/ingenic/x1000.dtsi     | 52 ++++++++++++++++++++++++++-
>>>>>> arch/mips/boot/dts/ingenic/x1830.dtsi     | 54 +++++++++++++++++++++++++++-
>>>>>> 6 files changed, 267 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
>>>>>> index 75f5bfbf2c37..b31054a41754 100644
>>>>>> --- a/arch/mips/boot/dts/ingenic/ci20.dts
>>>>>> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>>>>>> @@ -93,6 +93,15 @@
>>>>>> 	clock-frequency = <48000000>;
>>>>>> };
>>>>>>
>>>>>> +&cgu {
>>>>>> +	/*
>>>>>> +	 * Use the 32.768 kHz oscillator as the parent of the RTC for a higher
>>>>>> +	 * precision.
>>>>>> +	 */
>>>>>> +	assigned-clocks = <&cgu JZ4780_CLK_RTC>;
>>>>>> +	assigned-clock-parents = <&cgu JZ4780_CLK_RTCLK>;
>>>>>> +};
>>>>>> +
>>>>> ok
>>>>>
>>>>>> &mmc0 {
>>>>>> 	status = "okay";
>>>>>>
>>>>>> @@ -396,6 +405,13 @@
>>>>>> 	status = "okay";
>>>>>> };
>>>>>>
>>>>>> +&otg {
>>>>>> +	status = "okay";
>>>>>> +
>>>>>> +	assigned-clocks = <&cgu JZ4780_CLK_OTGPHY>;
>>>>>> +	assigned-clock-rates = <48000000>;
>>>>>> +};
>>>>>> +
>>>>> ok
>>>>>
>>>>>> &pinctrl {
>>>>>> 	pins_uart0: uart0 {
>>>>>> 		function = "uart0";
>>>>>> diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
>>>>>> index 22a1066d637b..44d47d12db12 100644
>>>>>> --- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
>>>>>> +++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
>>>>>> @@ -3,7 +3,7 @@
>>>>>>
>>>>>> #include "x1000.dtsi"
>>>>>> #include <dt-bindings/gpio/gpio.h>
>>>>>> -#include <dt-bindings/clock/ingenic,tcu.h>
>>>>>> +#include <dt-bindings/clock/ingenic,sysost.h>
>>>>>> #include <dt-bindings/interrupt-controller/irq.h>
>>>>>>
>>>>>> / {
>>>>>> @@ -31,6 +31,18 @@
>>>>>> 		};
>>>>>> 	};
>>>>>>
>>>>>> +	ssi: spi-gpio {
>>>>>> +		compatible = "spi-gpio";
>>>>>> +		#address-cells = <1>;
>>>>>> +		#size-cells = <0>;
>>>>>> +		num-chipselects = <1>;
>>>>>> +
>>>>>> +		mosi-gpios = <&gpd 2 GPIO_ACTIVE_HIGH>;
>>>>>> +		miso-gpios = <&gpd 3 GPIO_ACTIVE_HIGH>;
>>>>>> +		sck-gpios = <&gpd 0 GPIO_ACTIVE_HIGH>;
>>>>>> +		cs-gpios = <&gpd 1 GPIO_ACTIVE_HIGH>;
>>>>>> +	};
>>>>>> +
>>>>>> 	wlan_pwrseq: msc1-pwrseq {
>>>>>> 		compatible = "mmc-pwrseq-simple";
>>>>>>
>>>>>> @@ -43,13 +55,19 @@
>>>>>> 	clock-frequency = <24000000>;
>>>>>> };
>>>>>>
>>>>>> -&tcu {
>>>>>> +&cgu {
>>>>>> +	/*
>>>>>> +	 * Use the 32.768 kHz oscillator as the parent of the RTC for a higher
>>>>>> +	 * precision.
>>>>>> +	 */
>>>>>> +	assigned-clocks = <&cgu X1000_CLK_RTC>;
>>>>>> +	assigned-clock-parents = <&cgu X1000_CLK_RTCLK>;
>>>>>> +};
>>>>>> +
>>>>>> +&ost {
>>>>>> 	/* 1500 kHz for the system timer and clocksource */
>>>>>> -	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
>>>>>> +	assigned-clocks = <&ost OST_CLK_PERCPU_TIMER>, <&ost OST_CLK_GLOBAL_TIMER>;
>>>>>> 	assigned-clock-rates = <1500000>, <1500000>;
>>>>>> -
>>>>>> -	/* Use channel #0 for the system timer channel #2 for the clocksource */
>>>>>> -	ingenic,pwm-channels-mask = <0xfa>;
>>>>>> };
>>>>>>
>>>>>> &uart2 {
>>>>>> @@ -59,6 +77,32 @@
>>>>>> 	pinctrl-0 = <&pins_uart2>;
>>>>>> };
>>>>>>
>>>>>> +&ssi {
>>>>>> +	status = "okay";
>>>>>> +
>>>>>> +	spi-max-frequency = <50000000>;
>>>>>> +
>>>>>> +	sc16is752: expander@0 {
>>>>>> +		compatible = "nxp,sc16is752";
>>>>>> +		reg = <0>; /* CE0 */
>>>>>> +		spi-max-frequency = <4000000>;
>>>>>> +
>>>>>> +		clocks = <&exclk_sc16is752>;
>>>>>> +
>>>>>> +		interrupt-parent = <&gpc>;
>>>>>> +		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
>>>>>> +
>>>>>> +		gpio-controller;
>>>>>> +		#gpio-cells = <2>;
>>>>>> +
>>>>>> +		exclk_sc16is752: sc16is752 {
>>>>>> +			compatible = "fixed-clock";
>>>>>> +			#clock-cells = <0>;
>>>>>> +			clock-frequency = <48000000>;
>>>>>> +		};
>>>>>> +	};
>>>>>> +};
>>>>>> +
>>>>>> &i2c0 {
>>>>>> 	status = "okay";
>>>>>>
>>>>>> @@ -135,6 +179,10 @@
>>>>>> 	};
>>>>>> };
>>>>>>
>>>>>> +&otg {
>>>>>> +	status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> &pinctrl {
>>>>>> 	pins_uart2: uart2 {
>>>>>> 		function = "uart2";
>>>>>> diff --git a/arch/mips/boot/dts/ingenic/cu1830-neo.dts b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
>>>>>> index 640f96c00d63..7a56e344e429 100644
>>>>>> --- a/arch/mips/boot/dts/ingenic/cu1830-neo.dts
>>>>>> +++ b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
>>>>>> @@ -3,7 +3,7 @@
>>>>>>
>>>>>> #include "x1830.dtsi"
>>>>>> #include <dt-bindings/gpio/gpio.h>
>>>>>> -#include <dt-bindings/clock/ingenic,tcu.h>
>>>>>> +#include <dt-bindings/clock/ingenic,sysost.h>
>>>>>> #include <dt-bindings/interrupt-controller/irq.h>
>>>>>>
>>>>>> / {
>>>>>> @@ -31,6 +31,18 @@
>>>>>> 		};
>>>>>> 	};
>>>>>>
>>>>>> +	ssi0: spi-gpio {
>>>>>> +		compatible = "spi-gpio";
>>>>>> +		#address-cells = <1>;
>>>>>> +		#size-cells = <0>;
>>>>>> +		num-chipselects = <1>;
>>>>>> +
>>>>>> +		mosi-gpios = <&gpc 12 GPIO_ACTIVE_HIGH>;
>>>>>> +		miso-gpios = <&gpc 11 GPIO_ACTIVE_HIGH>;
>>>>>> +		sck-gpios = <&gpc 15 GPIO_ACTIVE_HIGH>;
>>>>>> +		cs-gpios = <&gpc 16 GPIO_ACTIVE_HIGH>;
>>>>>> +	};
>>>>>> +
>>>>>> 	wlan_pwrseq: msc1-pwrseq {
>>>>>> 		compatible = "mmc-pwrseq-simple";
>>>>>>
>>>>>> @@ -43,13 +55,19 @@
>>>>>> 	clock-frequency = <24000000>;
>>>>>> };
>>>>>>
>>>>>> -&tcu {
>>>>>> +&cgu {
>>>>>> +	/*
>>>>>> +	 * Use the 32.768 kHz oscillator as the parent of the RTC for a higher
>>>>>> +	 * precision.
>>>>>> +	 */
>>>>>> +	assigned-clocks = <&cgu X1830_CLK_RTC>;
>>>>>> +	assigned-clock-parents = <&cgu X1830_CLK_RTCLK>;
>>>>>> +};
>>>>>> +
>>>>>> +&ost {
>>>>>> 	/* 1500 kHz for the system timer and clocksource */
>>>>>> -	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
>>>>>> +	assigned-clocks = <&ost OST_CLK_PERCPU_TIMER>, <&ost OST_CLK_GLOBAL_TIMER>;
>>>>>> 	assigned-clock-rates = <1500000>, <1500000>;
>>>>>> -
>>>>>> -	/* Use channel #0 for the system timer channel #2 for the clocksource */
>>>>>> -	ingenic,pwm-channels-mask = <0xfa>;
>>>>>> };
>>>>>>
>>>>>> &uart1 {
>>>>>> @@ -59,6 +77,32 @@
>>>>>> 	pinctrl-0 = <&pins_uart1>;
>>>>>> };
>>>>>>
>>>>>> +&ssi0 {
>>>>>> +	status = "okay";
>>>>>> +
>>>>>> +	spi-max-frequency = <50000000>;
>>>>>> +
>>>>>> +	sc16is752: expander@0 {
>>>>>> +		compatible = "nxp,sc16is752";
>>>>>> +		reg = <0>; /* CE0 */
>>>>>> +		spi-max-frequency = <4000000>;
>>>>>> +
>>>>>> +		clocks = <&exclk_sc16is752>;
>>>>>> +
>>>>>> +		interrupt-parent = <&gpb>;
>>>>>> +		interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
>>>>>> +
>>>>>> +		gpio-controller;
>>>>>> +		#gpio-cells = <2>;
>>>>>> +
>>>>>> +		exclk_sc16is752: sc16is752 {
>>>>>> +			compatible = "fixed-clock";
>>>>>> +			#clock-cells = <0>;
>>>>>> +			clock-frequency = <48000000>;
>>>>>> +		};
>>>>>> +	};
>>>>>> +};
>>>>>> +
>>>>>> &i2c0 {
>>>>>> 	status = "okay";
>>>>>>
>>>>>> @@ -135,6 +179,10 @@
>>>>>> 	};
>>>>>> };
>>>>>>
>>>>>> +&otg {
>>>>>> +	status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> &pinctrl {
>>>>>> 	pins_uart1: uart1 {
>>>>>> 		function = "uart1";
>>>>>> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>>> index dfb5a7e1bb21..8837147e5a84 100644
>>>>>> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>>> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>>> @@ -61,13 +61,30 @@
>>>>>> 	};
>>>>>>
>>>>>> 	cgu: jz4780-cgu@10000000 {
>>>>>> -		compatible = "ingenic,jz4780-cgu";
>>>>>> +		compatible = "ingenic,jz4780-cgu", "simple-mfd";
>>>>>> 		reg = <0x10000000 0x100>;
>>>>>> +		#address-cells = <1>;
>>>>>> +		#size-cells = <1>;
>>>>>> +		ranges = <0x0 0x10000000 0x100>;
>>>>>> +
>>>>>> +		#clock-cells = <1>;
>>>>>>
>>>>>> 		clocks = <&ext>, <&rtc>;
>>>>>> 		clock-names = "ext", "rtc";
>>>>>>
>>>>>> -		#clock-cells = <1>;
>>>>>> +		otg_phy: usb-phy@3c {
>>>>>> +			compatible = "ingenic,jz4780-phy";
>>>>>> +			reg = <0x3c 0x10>;
>>>>>> +
>>>>>> +			clocks = <&cgu JZ4780_CLK_OTG1>;
>>>>>> +
>>>>>> +			#phy-cells = <0>;
>>>>>> +		};
>>>>>> +
>>>>>> +		rng: rng@d8 {
>>>>>> +			compatible = "ingenic,jz4780-rng";
>>>>>> +			reg = <0xd8 0x8>;
>>>>>> +		};
>>>>>> 	};
>>>>>>
>>>>>> 	tcu: timer@10002000 {
>>>>>> @@ -494,4 +511,24 @@
>>>>>>
>>>>>> 		status = "disabled";
>>>>>> 	};
>>>>>> +
>>>>>> +	otg: usb@13500000 {
>>>>>> +		compatible = "ingenic,jz4780-otg", "snps,dwc2";
>>>>>> +		reg = <0x13500000 0x40000>;
>>>>>> +
>>>>>> +		interrupt-parent = <&intc>;
>>>>>> +		interrupts = <21>;
>>>>>> +
>>>>>> +		clocks = <&cgu JZ4780_CLK_UHC>;
>>>>>> +		clock-names = "otg";
>>>>>> +
>>>>>> +		phys = <&otg_phy>;
>>>>>> +		phy-names = "usb2-phy";
>>>>>> +
>>>>>> +		g-rx-fifo-size = <768>;
>>>>> I had tested with 256 before and do not see a reason why 768 should not work as well.
>>>>>
>>>>>> +		g-np-tx-fifo-size = <256>;
>>>>>> +		g-tx-fifo-size = <256 256 256 256 256 256 256 512>;
>>>>>> +
>>>>>> +		status = "disabled";
>>>>>> +	};
>>>>>> };
>>>>>> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
>>>>>> index 1f1f896dd1f7..854fac58f45e 100644
>>>>>> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
>>>>>> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
>>>>>> @@ -52,13 +52,43 @@
>>>>>> 	};
>>>>>>
>>>>>> 	cgu: x1000-cgu@10000000 {
>>>>>> -		compatible = "ingenic,x1000-cgu";
>>>>>> +		compatible = "ingenic,x1000-cgu", "simple-mfd";
>>>>>> 		reg = <0x10000000 0x100>;
>>>>>> +		#address-cells = <1>;
>>>>>> +		#size-cells = <1>;
>>>>>> +		ranges = <0x0 0x10000000 0x100>;
>>>>>>
>>>>>> 		#clock-cells = <1>;
>>>>>>
>>>>>> 		clocks = <&exclk>, <&rtclk>;
>>>>>> 		clock-names = "ext", "rtc";
>>>>>> +
>>>>>> +		otg_phy: usb-phy@3c {
>>>>>> +			compatible = "ingenic,x1000-phy";
>>>>>> +			reg = <0x3c 0x10>;
>>>>>> +
>>>>>> +			clocks = <&cgu X1000_CLK_OTGPHY>;
>>>>>> +
>>>>>> +			#phy-cells = <0>;
>>>>>> +		};
>>>>>> +
>>>>>> +		rng: rng@d8 {
>>>>>> +			compatible = "ingenic,x1000-rng";
>>>>>> +			reg = <0xd8 0x8>;
>>>>>> +		};
>>>>>> +	};
>>>>>> +
>>>>>> +	ost: timer@12000000 {
>>>>>> +		compatible = "ingenic,x1000-ost";
>>>>>> +		reg = <0x12000000 0x3c>;
>>>>>> +
>>>>>> +		#clock-cells = <1>;
>>>>>> +
>>>>>> +		clocks = <&cgu X1000_CLK_OST>;
>>>>>> +		clock-names = "ost";
>>>>>> +
>>>>>> +		interrupt-parent = <&cpuintc>;
>>>>>> +		interrupts = <3>;
>>>>>> 	};
>>>>>>
>>>>>> 	tcu: timer@10002000 {
>>>>>> @@ -323,4 +353,24 @@
>>>>>> 			status = "disabled";
>>>>>> 		};
>>>>>> 	};
>>>>>> +
>>>>>> +	otg: usb@13500000 {
>>>>>> +		compatible = "ingenic,x1000-otg", "snps,dwc2";
>>>>>> +		reg = <0x13500000 0x40000>;
>>>>>> +
>>>>>> +		interrupt-parent = <&intc>;
>>>>>> +		interrupts = <21>;
>>>>>> +
>>>>>> +		clocks = <&cgu X1000_CLK_OTG>;
>>>>>> +		clock-names = "otg";
>>>>>> +
>>>>>> +		phys = <&otg_phy>;
>>>>>> +		phy-names = "usb2-phy";
>>>>>> +
>>>>>> +		g-rx-fifo-size = <768>;
>>>>>> +		g-np-tx-fifo-size = <256>;
>>>>>> +		g-tx-fifo-size = <256 256 256 256 256 256 256 512>;
>>>>>> +
>>>>>> +		status = "disabled";
>>>>>> +	};
>>>>>> };
>>>>>> diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi b/arch/mips/boot/dts/ingenic/x1830.dtsi
>>>>>> index b05dac3ae308..4831350efdf2 100644
>>>>>> --- a/arch/mips/boot/dts/ingenic/x1830.dtsi
>>>>>> +++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
>>>>>> @@ -52,13 +52,38 @@
>>>>>> 	};
>>>>>>
>>>>>> 	cgu: x1830-cgu@10000000 {
>>>>>> -		compatible = "ingenic,x1830-cgu";
>>>>>> +		compatible = "ingenic,x1830-cgu", "simple-mfd";
>>>>>> 		reg = <0x10000000 0x100>;
>>>>>> +		#address-cells = <1>;
>>>>>> +		#size-cells = <1>;
>>>>>> +		ranges = <0x0 0x10000000 0x100>;
>>>>>>
>>>>>> 		#clock-cells = <1>;
>>>>>>
>>>>>> 		clocks = <&exclk>, <&rtclk>;
>>>>>> 		clock-names = "ext", "rtc";
>>>>>> +
>>>>>> +		otg_phy: usb-phy@3c {
>>>>>> +			compatible = "ingenic,x1830-phy";
>>>>>> +			reg = <0x3c 0x10>;
>>>>>> +
>>>>>> +			clocks = <&cgu X1830_CLK_OTGPHY>;
>>>>>> +
>>>>>> +			#phy-cells = <0>;
>>>>>> +		};
>>>>>> +	};
>>>>>> +
>>>>>> +	ost: timer@12000000 {
>>>>>> +		compatible = "ingenic,x1830-ost", "ingenic,x1000-ost";
>>>>>> +		reg = <0x12000000 0x3c>;
>>>>>> +
>>>>>> +		#clock-cells = <1>;
>>>>>> +
>>>>>> +		clocks = <&cgu X1830_CLK_OST>;
>>>>>> +		clock-names = "ost";
>>>>>> +
>>>>>> +		interrupt-parent = <&cpuintc>;
>>>>>> +		interrupts = <4>;
>>>>>> 	};
>>>>>>
>>>>>> 	tcu: timer@10002000 {
>>>>>> @@ -236,6 +261,13 @@
>>>>>> 		status = "disabled";
>>>>>> 	};
>>>>>>
>>>>>> +	dtrng: trng@10072000 {
>>>>>> +		compatible = "ingenic,x1830-dtrng";
>>>>>> +		reg = <0x10072000 0xc>;
>>>>>> +
>>>>>> +		clocks = <&cgu X1830_CLK_DTRNG>;
>>>>>> +	};
>>>>>> +
>>>>>> 	pdma: dma-controller@13420000 {
>>>>>> 		compatible = "ingenic,x1830-dma";
>>>>>> 		reg = <0x13420000 0x400
>>>>>> @@ -311,4 +343,24 @@
>>>>>> 			status = "disabled";
>>>>>> 		};
>>>>>> 	};
>>>>>> +
>>>>>> +	otg: usb@13500000 {
>>>>>> +		compatible = "ingenic,x1830-otg", "snps,dwc2";
>>>>>> +		reg = <0x13500000 0x40000>;
>>>>>> +
>>>>>> +		interrupt-parent = <&intc>;
>>>>>> +		interrupts = <21>;
>>>>>> +
>>>>>> +		clocks = <&cgu X1830_CLK_OTG>;
>>>>>> +		clock-names = "otg";
>>>>>> +
>>>>>> +		phys = <&otg_phy>;
>>>>>> +		phy-names = "usb2-phy";
>>>>>> +
>>>>>> +		g-rx-fifo-size = <768>;
>>>>>> +		g-np-tx-fifo-size = <256>;
>>>>>> +		g-tx-fifo-size = <256 256 256 256 256 256 256 512>;
>>>>>> +
>>>>>> +		status = "disabled";
>>>>>> +	};
>>>>>> };
>>>>>> -- 
>>>>>> 2.11.0
>>>>>>
