Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2878D2AABEA
	for <lists+linux-mips@lfdr.de>; Sun,  8 Nov 2020 16:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgKHPbX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Nov 2020 10:31:23 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:35805 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgKHPbW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Nov 2020 10:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604849476;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=mgQXaNhQj2H8lvzWWm+TZos/WkipVpXgXnfQ+by1kDc=;
        b=psrRe3NU4V0LvBNyn5PGPrNpVt7t/NC5BgcUtXlh6qRlrKo1HRJ6kn44DvDjxFdM8J
        2+mDyV6mePRL1xDX06ZObV4DimecnUi/2toct7e57Gkn4nx6hETpvAtlAcbP5xhVFuSo
        npfsdalP58oK54jAWowUYmmAPOPBeSLlbZSK4fPH3DxN5OjuJfF6m5rN2C1tSRrdWM1t
        yNHMKsiaDToozWQqGC6L+Z/IxEytvNWesMcC5mHlFigx0FxLXSxhIDDUSpKRUZVsxCZR
        90VujtDIb0MevGLXWY5hT/H37p2ASR2K9wHLASLygDNKETYJ9NcBCTqbk6dwj5Ky4rLg
        yg6A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaeXA4Ec+I="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id d04888wA8FSS8Wx
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 8 Nov 2020 16:28:28 +0100 (CET)
Subject: Re: [PATCH 1/2] MIPS: Ingenic: Add missing nodes for Ingenic SoCs and boards. [and discussion about jz4780 SMP/MMC/Ethernet]
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ce4ac776-1d52-7744-605c-7e0e9c2ceeaa@wanyeetech.com>
Date:   Sun, 8 Nov 2020 16:28:27 +0100
Cc:     tsbogend@alpha.franken.de, paul@crapouillou.net,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        nixiaoming@huawei.com, paulburton@kernel.org, krzk@kernel.org,
        ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC962041-BBFA-4917-8FFC-EC9470593D13@goldelico.com>
References: <20201107115251.86182-1-zhouyanjie@wanyeetech.com> <20201107115251.86182-2-zhouyanjie@wanyeetech.com> <A9536791-F713-4CD8-80B9-4BDA6A136E50@goldelico.com> <030f234c-d889-9065-eade-7cf5a2b7417d@wanyeetech.com> <A118B719-F022-4275-B0B6-A122B28B75CF@goldelico.com> <ce4ac776-1d52-7744-605c-7e0e9c2ceeaa@wanyeetech.com>
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 08.11.2020 um 16:13 schrieb Zhou Yanjie =
<zhouyanjie@wanyeetech.com>:
>=20
>=20
> On 2020/11/8 =E4=B8=8B=E5=8D=8810:35, H. Nikolaus Schaller wrote:
>>> Am 08.11.2020 um 13:46 schrieb Zhou Yanjie =
<zhouyanjie@wanyeetech.com>:
>>>=20
>>> Hello Nikolaus,
>>>=20
>>> On 2020/11/8 =E4=B8=8A=E5=8D=883:03, H. Nikolaus Schaller wrote:
>>>>> Am 07.11.2020 um 12:52 schrieb =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou =
Yanjie) <zhouyanjie@wanyeetech.com>:
>>>>>=20
>>>>> 1.Add OTG/OTG PHY/RNG nodes for JZ4780, CGU/OTG nodes for CI20.
>>>>> 2.Add OTG/OTG PHY/RNG/OST nodes for X1000, =
SSI/CGU/OST/OTG/SC16IS752
>>>>>  nodes for CU1000-Neo.
>>>>> 3.Add OTG/OTG PHY/DTRNG/OST nodes for X1830, =
SSI/CGU/OST/OTG/SC16IS752
>>>>>  nodes for CU1830-Neo.
>>>>>=20
>>>>> Tested-by: =E5=91=A8=E6=AD=A3 (Zhou Zheng) =
<sernia.zhou@foxmail.com>
>>>> Comments below for CI20 / jz4780 only.
>>>>=20
>>>> I tried to test on top of my v5.10 working tree but the CI20 does =
not boot any more.
>>>> Maybe the SMP hacks are in the way and I have to remove them first =
or try on top
>>>> of v5.9.y
>>>=20
>>> SMP is not available on the mainline now, so the previous SMP patch =
needs to be removed.
>> I have tried with CONFIG_SMP disabled and now I can boot my v5.10-rc2 =
(plus local patches).
>> And can confirm that the OTG port works.
>=20
>=20
> Nice to hear it.
>=20
>=20
>> (BTW: dm9000 defers probing forever but that is an unrelated issue).
>=20
>=20
> On my side , it will work normally after selecting =
CONFIG_JZ4780_EFUSE.

Seems to be related to some vcc-supply:

[   14.383309] dm9000 16000000.dm9000: Looking up vcc-supply from device =
tree
[   14.442598] ------------[ cut here ]------------
[   14.442626] WARNING: CPU: 0 PID: 19 at drivers/regulator/core.c:2125 =
_regulator_put+0x4c/0x104
[   14.442631] Modules linked in: ohci_platform ingenic_drm(+) gpio_keys =
gpio_ir_recv ohci_hcd ehci_platform dw_hdmi dwc2 roles ehci_hcd =
drm_kms_helper dm9000 mii rtc_pcf8563 syscopyarea sysfillrect sysimgblt =
fb_sys_fops drm drm_panel_orientation_quirks ipv6 autofs4
[   14.442723] CPU: 0 PID: 19 Comm: kworker/0:1 Tainted: G        W      =
   5.10.0-rc2-letux-mips+ #3790
[   14.442738] Workqueue: events deferred_probe_work_func
[   14.442745] Stack : 83941bd4 80165d58 00000000 80b70000 80b70000 =
80aaf3dc 80adad20 00000009
[   14.442775]         0000084d 80165da4 80b6ff37 83936978 80b70000 =
00000001 83941b98 f6d2dfd3
[   14.442805]         00000000 00000000 80aaf3dc 0000000c 00000114 =
00000002 00000001 746e6576
[   14.442833]         65642073 00005c11 0000000f 72726566 80b70000 =
00000000 80590ad0 80adad20
[   14.442862]         00000009 0000084d 00000001 80cb0000 00000000 =
805f6a28 0012829f 001282df
[   14.442891]         ...
[   14.442901] Call Trace:
[   14.442918] [<8010912c>] show_stack+0x6c/0x12c
[   14.442933] [<801229e4>] __warn+0xd4/0x108
[   14.442943] [<80122aa0>] warn_slowpath_fmt+0x88/0xc8
[   14.442953] [<80590ad0>] _regulator_put+0x4c/0x104
[   14.442961] [<80590bb0>] regulator_put+0x28/0x40
[   14.442998] [<805dac8c>] release_nodes+0x220/0x280
[   14.443013] [<808b1488>] really_probe+0x344/0x464
[   14.443022] [<805d612c>] driver_probe_device+0x1d8/0x224
[   14.443038] [<805d3efc>] bus_for_each_drv+0x90/0xc8
[   14.443047] [<805d5e5c>] __device_attach+0xc8/0x174
[   14.443057] [<805d4e3c>] bus_probe_device+0x3c/0xb4
[   14.443066] [<805d53d4>] deferred_probe_work_func+0x7c/0xb4
[   14.443078] [<8013d574>] process_one_work+0x204/0x348
[   14.443087] [<8013e028>] worker_thread+0x28c/0x3c0
[   14.443101] [<80143ac8>] kthread+0x14c/0x154
[   14.443111] [<80102c0c>] ret_from_kernel_thread+0x14/0x1c
[   14.443119]=20
[   14.443126] ---[ end trace 76225a8e653eb480 ]---
[   14.443379] platform 16000000.dm9000: Driver dm9000 requests probe =
deferral

>=20
>=20
>>> The new SMP patch will take some time because it needs to ensure =
support for the new X2000 processor.
>> Ok, I see. It is a little sad since it works find until 5.9 but now =
is broken and means we
>> have to test v5.10ff with only one processor. Any hints what should =
be hacked to make it
>> work until a final solution becomes available in upstream?
>=20
>=20
> I can try to make a version that supports JZ4780 first, and I will =
send it to you when it is completed.

Would be nice!

>=20
>=20
>>>=20
>>> Thanks and best regards!
>> If you like you can add my
>>=20
>> Tested by: H. Nikolaus Schaller <hns@goldelico.com> # CI20/jz4780
>>=20
>> to this patch.
>=20
>=20
> Sure, I will add it to the next version.
>=20
>=20
> BTW, have you noticed the problem with the MMC of JZ4780? This was =
first discovered by Paul. After he told me, I also tested it. When MMC =
has a relatively heavy load, there will indeed be many error messages =
related to mmcblk, and it is often accompanied by file system damage.

Yes, I have seen spurious mmcblk warnings and sometimes the CI20 did =
hang with heavy debootstrap load. No file system corruption so far. I =
thought it may be my =C2=B5SD card but did not try another one. Or =
thought that the SMP code is not stable and I have to wait for a =
mainline solution...

>=20
> In addition, when doing some heavy work (such as compiling docker =
locally),
> the following warning message will be accompanied (this problem also =
exists on X1830):
>=20
> [ 4361.724410] warn_alloc: 1 callbacks suppressed
> [ 4361.724427] go: page allocation failure: order:5, =
mode:0x40cc0(GFP_KERNEL|__GFP_COMP), nodemask=3D(null)
> [ 4361.740945] CPU: 0 PID: 6792 Comm: go Tainted: G W         =
5.10.0-rc1+ #3
> [ 4361.748407] Stack : 80960000 801686ec 00000000 80879d2c 00000000 =
00000001 00000400 801688f8
> [ 4361.756845]         00000000 00000000 00000000 810891ca 84405c54 =
00000001 84405be8 810891ca
> [ 4361.765281]         00000000 00000000 8086054c 00000003 00000001 =
84405abc 00000000 00001cf1
> [ 4361.773717]         bff4ffd7 2c29ee2f 84405ab4 2e352020 808f0000 =
80000000 00000000 80860000
> [ 4361.782153]         00000000 00000840 00000027 00000001 00000000 =
80441e34 017f02df 017f031f
> [ 4361.790588]         ...
> [ 4361.793064] Call Trace:
> [ 4361.795547] [<80108bd4>] show_stack+0x6c/0x12c
> [ 4361.800023] [<80677974>] dump_stack+0xa0/0xd0
> [ 4361.804406] [<801f9e30>] warn_alloc+0xa8/0x130
> [ 4361.808875] [<801fa7ac>] __alloc_pages_nodemask+0x8d4/0x908
> [ 4361.814476] [<802076bc>] ____cache_alloc+0x2b4/0x600
> [ 4361.819467] [<80207de8>] __kmalloc+0x90/0x120
> [ 4361.823854] [<80296c8c>] proc_sys_call_handler+0xe4/0x230
> [ 4361.829280] [<8021901c>] vfs_read+0x12c/0x19c
> [ 4361.833662] [<802192c0>] ksys_read+0x80/0xe0
> [ 4361.837960] [<80110fb8>] syscall_common+0x34/0x58
> [ 4361.842687]
> [ 4361.854888] Mem-Info:
> [ 4361.858734] active_anon:240 inactive_anon:11673 isolated_anon:0
> [ 4361.858734]  active_file:104199 inactive_file:53064 isolated_file:0
> [ 4361.858734]  unevictable:0 dirty:366 writeback:0
> [ 4361.858734]  slab_reclaimable:15980 slab_unreclaimable:2599
> [ 4361.858734]  mapped:9755 shmem:3251 pagetables:229 bounce:0
> [ 4361.858734]  free:67531 free_pcp:71 free_cma:3073
> [ 4361.915078] Node 0 active_anon:960kB inactive_anon:46708kB =
active_file:416796kB inactive_file:212268kB unevictable:0kB =
isolated(anon):0kB isolated(file):0kB mapped:39024kB dirty:1476kB =
writeback:0kB shmem:13004kB writeback_tmp:0kB kernel_stack:600kB =
all_unreclaimable? no
> [ 4361.940604] Normal free:33244kB min:1956kB low:2444kB high:2932kB =
reserved_highatomic:0KB active_anon:0kB inactive_anon:156kB =
active_file:82176kB inactive_file:47128kB unevictable:0kB =
writepending:1228kB present:262144kB managed:239444kB mlocked:0kB =
pagetables:908kB bounce:0kB free_pcp:120kB local_pcp:120kB =
free_cma:12300kB
> [ 4361.940612] lowmem_reserve[]: 0 6144 0
> [ 4361.974937] HighMem free:236820kB min:512kB low:2116kB high:3720kB =
reserved_highatomic:0KB active_anon:960kB inactive_anon:46552kB =
active_file:334620kB inactive_file:165140kB unevictable:0kB =
writepending:248kB present:786432kB managed:786432kB mlocked:0kB =
pagetables:0kB bounce:0kB free_pcp:240kB local_pcp:240kB free_cma:0kB
> [ 4361.974944] lowmem_reserve[]: 0 0 0
> [ 4362.008189] Normal: 2127*4kB (UMEC) 1508*8kB (UMEC) 472*16kB (UMEC) =
96*32kB (UMC) 12*64kB (C) 4*128kB (C) 1*256kB (C) 1*512kB (C) 0*1024kB =
0*2048kB 0*4096kB =3D 33244kB
> [ 4362.024364] HighMem: 1441*4kB (UM) 5376*8kB (UM) 3637*16kB (UM) =
1210*32kB (UM) 498*64kB (UM) 225*128kB (UM) 69*256kB (UM) 23*512kB (UM) =
1*1024kB (M) 0*2048kB 0*4096kB =3D 236820kB
> [ 4362.041152] 160520 total pagecache pages
> [ 4362.045838] 0 pages in swap cache
> [ 4362.049187] Swap cache stats: add 0, delete 0, find 0/0
> [ 4362.055501] Free swap  =3D 0kB
> [ 4362.058413] Total swap =3D 0kB
> [ 4362.061315] 262144 pages RAM
> [ 4362.065588] 196608 pages HighMem/MovableOnly
> [ 4362.069889] 5675 pages reserved
> [ 4362.074159] 8192 pages cma reserved
>=20
> Do you have any idea?

Unfortunately no... Just some vague thoughts: maybe a lock is missing? =
Or cache corruption?

But we should maybe open another discussion because it is beyond the =
scope of this patch.

BR and thanks,
Nikolaus

>=20
>=20
> Thanks and best regards!
>=20
>=20
>>>=20
>>>>> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) =
<zhouyanjie@wanyeetech.com>
>>>>> ---
>>>>> arch/mips/boot/dts/ingenic/ci20.dts       | 16 +++++++++
>>>>> arch/mips/boot/dts/ingenic/cu1000-neo.dts | 60 =
+++++++++++++++++++++++++++----
>>>>> arch/mips/boot/dts/ingenic/cu1830-neo.dts | 60 =
+++++++++++++++++++++++++++----
>>>>> arch/mips/boot/dts/ingenic/jz4780.dtsi    | 41 =
+++++++++++++++++++--
>>>>> arch/mips/boot/dts/ingenic/x1000.dtsi     | 52 =
++++++++++++++++++++++++++-
>>>>> arch/mips/boot/dts/ingenic/x1830.dtsi     | 54 =
+++++++++++++++++++++++++++-
>>>>> 6 files changed, 267 insertions(+), 16 deletions(-)
>>>>>=20
>>>>> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts =
b/arch/mips/boot/dts/ingenic/ci20.dts
>>>>> index 75f5bfbf2c37..b31054a41754 100644
>>>>> --- a/arch/mips/boot/dts/ingenic/ci20.dts
>>>>> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>>>>> @@ -93,6 +93,15 @@
>>>>> 	clock-frequency =3D <48000000>;
>>>>> };
>>>>>=20
>>>>> +&cgu {
>>>>> +	/*
>>>>> +	 * Use the 32.768 kHz oscillator as the parent of the RTC for a =
higher
>>>>> +	 * precision.
>>>>> +	 */
>>>>> +	assigned-clocks =3D <&cgu JZ4780_CLK_RTC>;
>>>>> +	assigned-clock-parents =3D <&cgu JZ4780_CLK_RTCLK>;
>>>>> +};
>>>>> +
>>>> ok
>>>>=20
>>>>> &mmc0 {
>>>>> 	status =3D "okay";
>>>>>=20
>>>>> @@ -396,6 +405,13 @@
>>>>> 	status =3D "okay";
>>>>> };
>>>>>=20
>>>>> +&otg {
>>>>> +	status =3D "okay";
>>>>> +
>>>>> +	assigned-clocks =3D <&cgu JZ4780_CLK_OTGPHY>;
>>>>> +	assigned-clock-rates =3D <48000000>;
>>>>> +};
>>>>> +
>>>> ok
>>>>=20
>>>>> &pinctrl {
>>>>> 	pins_uart0: uart0 {
>>>>> 		function =3D "uart0";
>>>>> diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts =
b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
>>>>> index 22a1066d637b..44d47d12db12 100644
>>>>> --- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
>>>>> +++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
>>>>> @@ -3,7 +3,7 @@
>>>>>=20
>>>>> #include "x1000.dtsi"
>>>>> #include <dt-bindings/gpio/gpio.h>
>>>>> -#include <dt-bindings/clock/ingenic,tcu.h>
>>>>> +#include <dt-bindings/clock/ingenic,sysost.h>
>>>>> #include <dt-bindings/interrupt-controller/irq.h>
>>>>>=20
>>>>> / {
>>>>> @@ -31,6 +31,18 @@
>>>>> 		};
>>>>> 	};
>>>>>=20
>>>>> +	ssi: spi-gpio {
>>>>> +		compatible =3D "spi-gpio";
>>>>> +		#address-cells =3D <1>;
>>>>> +		#size-cells =3D <0>;
>>>>> +		num-chipselects =3D <1>;
>>>>> +
>>>>> +		mosi-gpios =3D <&gpd 2 GPIO_ACTIVE_HIGH>;
>>>>> +		miso-gpios =3D <&gpd 3 GPIO_ACTIVE_HIGH>;
>>>>> +		sck-gpios =3D <&gpd 0 GPIO_ACTIVE_HIGH>;
>>>>> +		cs-gpios =3D <&gpd 1 GPIO_ACTIVE_HIGH>;
>>>>> +	};
>>>>> +
>>>>> 	wlan_pwrseq: msc1-pwrseq {
>>>>> 		compatible =3D "mmc-pwrseq-simple";
>>>>>=20
>>>>> @@ -43,13 +55,19 @@
>>>>> 	clock-frequency =3D <24000000>;
>>>>> };
>>>>>=20
>>>>> -&tcu {
>>>>> +&cgu {
>>>>> +	/*
>>>>> +	 * Use the 32.768 kHz oscillator as the parent of the RTC for a =
higher
>>>>> +	 * precision.
>>>>> +	 */
>>>>> +	assigned-clocks =3D <&cgu X1000_CLK_RTC>;
>>>>> +	assigned-clock-parents =3D <&cgu X1000_CLK_RTCLK>;
>>>>> +};
>>>>> +
>>>>> +&ost {
>>>>> 	/* 1500 kHz for the system timer and clocksource */
>>>>> -	assigned-clocks =3D <&tcu TCU_CLK_TIMER0>, <&tcu =
TCU_CLK_TIMER2>;
>>>>> +	assigned-clocks =3D <&ost OST_CLK_PERCPU_TIMER>, <&ost =
OST_CLK_GLOBAL_TIMER>;
>>>>> 	assigned-clock-rates =3D <1500000>, <1500000>;
>>>>> -
>>>>> -	/* Use channel #0 for the system timer channel #2 for the =
clocksource */
>>>>> -	ingenic,pwm-channels-mask =3D <0xfa>;
>>>>> };
>>>>>=20
>>>>> &uart2 {
>>>>> @@ -59,6 +77,32 @@
>>>>> 	pinctrl-0 =3D <&pins_uart2>;
>>>>> };
>>>>>=20
>>>>> +&ssi {
>>>>> +	status =3D "okay";
>>>>> +
>>>>> +	spi-max-frequency =3D <50000000>;
>>>>> +
>>>>> +	sc16is752: expander@0 {
>>>>> +		compatible =3D "nxp,sc16is752";
>>>>> +		reg =3D <0>; /* CE0 */
>>>>> +		spi-max-frequency =3D <4000000>;
>>>>> +
>>>>> +		clocks =3D <&exclk_sc16is752>;
>>>>> +
>>>>> +		interrupt-parent =3D <&gpc>;
>>>>> +		interrupts =3D <6 IRQ_TYPE_EDGE_FALLING>;
>>>>> +
>>>>> +		gpio-controller;
>>>>> +		#gpio-cells =3D <2>;
>>>>> +
>>>>> +		exclk_sc16is752: sc16is752 {
>>>>> +			compatible =3D "fixed-clock";
>>>>> +			#clock-cells =3D <0>;
>>>>> +			clock-frequency =3D <48000000>;
>>>>> +		};
>>>>> +	};
>>>>> +};
>>>>> +
>>>>> &i2c0 {
>>>>> 	status =3D "okay";
>>>>>=20
>>>>> @@ -135,6 +179,10 @@
>>>>> 	};
>>>>> };
>>>>>=20
>>>>> +&otg {
>>>>> +	status =3D "okay";
>>>>> +};
>>>>> +
>>>>> &pinctrl {
>>>>> 	pins_uart2: uart2 {
>>>>> 		function =3D "uart2";
>>>>> diff --git a/arch/mips/boot/dts/ingenic/cu1830-neo.dts =
b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
>>>>> index 640f96c00d63..7a56e344e429 100644
>>>>> --- a/arch/mips/boot/dts/ingenic/cu1830-neo.dts
>>>>> +++ b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
>>>>> @@ -3,7 +3,7 @@
>>>>>=20
>>>>> #include "x1830.dtsi"
>>>>> #include <dt-bindings/gpio/gpio.h>
>>>>> -#include <dt-bindings/clock/ingenic,tcu.h>
>>>>> +#include <dt-bindings/clock/ingenic,sysost.h>
>>>>> #include <dt-bindings/interrupt-controller/irq.h>
>>>>>=20
>>>>> / {
>>>>> @@ -31,6 +31,18 @@
>>>>> 		};
>>>>> 	};
>>>>>=20
>>>>> +	ssi0: spi-gpio {
>>>>> +		compatible =3D "spi-gpio";
>>>>> +		#address-cells =3D <1>;
>>>>> +		#size-cells =3D <0>;
>>>>> +		num-chipselects =3D <1>;
>>>>> +
>>>>> +		mosi-gpios =3D <&gpc 12 GPIO_ACTIVE_HIGH>;
>>>>> +		miso-gpios =3D <&gpc 11 GPIO_ACTIVE_HIGH>;
>>>>> +		sck-gpios =3D <&gpc 15 GPIO_ACTIVE_HIGH>;
>>>>> +		cs-gpios =3D <&gpc 16 GPIO_ACTIVE_HIGH>;
>>>>> +	};
>>>>> +
>>>>> 	wlan_pwrseq: msc1-pwrseq {
>>>>> 		compatible =3D "mmc-pwrseq-simple";
>>>>>=20
>>>>> @@ -43,13 +55,19 @@
>>>>> 	clock-frequency =3D <24000000>;
>>>>> };
>>>>>=20
>>>>> -&tcu {
>>>>> +&cgu {
>>>>> +	/*
>>>>> +	 * Use the 32.768 kHz oscillator as the parent of the RTC for a =
higher
>>>>> +	 * precision.
>>>>> +	 */
>>>>> +	assigned-clocks =3D <&cgu X1830_CLK_RTC>;
>>>>> +	assigned-clock-parents =3D <&cgu X1830_CLK_RTCLK>;
>>>>> +};
>>>>> +
>>>>> +&ost {
>>>>> 	/* 1500 kHz for the system timer and clocksource */
>>>>> -	assigned-clocks =3D <&tcu TCU_CLK_TIMER0>, <&tcu =
TCU_CLK_TIMER2>;
>>>>> +	assigned-clocks =3D <&ost OST_CLK_PERCPU_TIMER>, <&ost =
OST_CLK_GLOBAL_TIMER>;
>>>>> 	assigned-clock-rates =3D <1500000>, <1500000>;
>>>>> -
>>>>> -	/* Use channel #0 for the system timer channel #2 for the =
clocksource */
>>>>> -	ingenic,pwm-channels-mask =3D <0xfa>;
>>>>> };
>>>>>=20
>>>>> &uart1 {
>>>>> @@ -59,6 +77,32 @@
>>>>> 	pinctrl-0 =3D <&pins_uart1>;
>>>>> };
>>>>>=20
>>>>> +&ssi0 {
>>>>> +	status =3D "okay";
>>>>> +
>>>>> +	spi-max-frequency =3D <50000000>;
>>>>> +
>>>>> +	sc16is752: expander@0 {
>>>>> +		compatible =3D "nxp,sc16is752";
>>>>> +		reg =3D <0>; /* CE0 */
>>>>> +		spi-max-frequency =3D <4000000>;
>>>>> +
>>>>> +		clocks =3D <&exclk_sc16is752>;
>>>>> +
>>>>> +		interrupt-parent =3D <&gpb>;
>>>>> +		interrupts =3D <18 IRQ_TYPE_EDGE_FALLING>;
>>>>> +
>>>>> +		gpio-controller;
>>>>> +		#gpio-cells =3D <2>;
>>>>> +
>>>>> +		exclk_sc16is752: sc16is752 {
>>>>> +			compatible =3D "fixed-clock";
>>>>> +			#clock-cells =3D <0>;
>>>>> +			clock-frequency =3D <48000000>;
>>>>> +		};
>>>>> +	};
>>>>> +};
>>>>> +
>>>>> &i2c0 {
>>>>> 	status =3D "okay";
>>>>>=20
>>>>> @@ -135,6 +179,10 @@
>>>>> 	};
>>>>> };
>>>>>=20
>>>>> +&otg {
>>>>> +	status =3D "okay";
>>>>> +};
>>>>> +
>>>>> &pinctrl {
>>>>> 	pins_uart1: uart1 {
>>>>> 		function =3D "uart1";
>>>>> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi =
b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>> index dfb5a7e1bb21..8837147e5a84 100644
>>>>> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>> @@ -61,13 +61,30 @@
>>>>> 	};
>>>>>=20
>>>>> 	cgu: jz4780-cgu@10000000 {
>>>>> -		compatible =3D "ingenic,jz4780-cgu";
>>>>> +		compatible =3D "ingenic,jz4780-cgu", "simple-mfd";
>>>>> 		reg =3D <0x10000000 0x100>;
>>>>> +		#address-cells =3D <1>;
>>>>> +		#size-cells =3D <1>;
>>>>> +		ranges =3D <0x0 0x10000000 0x100>;
>>>>> +
>>>>> +		#clock-cells =3D <1>;
>>>>>=20
>>>>> 		clocks =3D <&ext>, <&rtc>;
>>>>> 		clock-names =3D "ext", "rtc";
>>>>>=20
>>>>> -		#clock-cells =3D <1>;
>>>>> +		otg_phy: usb-phy@3c {
>>>>> +			compatible =3D "ingenic,jz4780-phy";
>>>>> +			reg =3D <0x3c 0x10>;
>>>>> +
>>>>> +			clocks =3D <&cgu JZ4780_CLK_OTG1>;
>>>>> +
>>>>> +			#phy-cells =3D <0>;
>>>>> +		};
>>>>> +
>>>>> +		rng: rng@d8 {
>>>>> +			compatible =3D "ingenic,jz4780-rng";
>>>>> +			reg =3D <0xd8 0x8>;
>>>>> +		};
>>>>> 	};
>>>>>=20
>>>>> 	tcu: timer@10002000 {
>>>>> @@ -494,4 +511,24 @@
>>>>>=20
>>>>> 		status =3D "disabled";
>>>>> 	};
>>>>> +
>>>>> +	otg: usb@13500000 {
>>>>> +		compatible =3D "ingenic,jz4780-otg", "snps,dwc2";
>>>>> +		reg =3D <0x13500000 0x40000>;
>>>>> +
>>>>> +		interrupt-parent =3D <&intc>;
>>>>> +		interrupts =3D <21>;
>>>>> +
>>>>> +		clocks =3D <&cgu JZ4780_CLK_UHC>;
>>>>> +		clock-names =3D "otg";
>>>>> +
>>>>> +		phys =3D <&otg_phy>;
>>>>> +		phy-names =3D "usb2-phy";
>>>>> +
>>>>> +		g-rx-fifo-size =3D <768>;
>>>> I had tested with 256 before and do not see a reason why 768 should =
not work as well.
>>>>=20
>>>>> +		g-np-tx-fifo-size =3D <256>;
>>>>> +		g-tx-fifo-size =3D <256 256 256 256 256 256 256 512>;
>>>>> +
>>>>> +		status =3D "disabled";
>>>>> +	};
>>>>> };
>>>>> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi =
b/arch/mips/boot/dts/ingenic/x1000.dtsi
>>>>> index 1f1f896dd1f7..854fac58f45e 100644
>>>>> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
>>>>> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
>>>>> @@ -52,13 +52,43 @@
>>>>> 	};
>>>>>=20
>>>>> 	cgu: x1000-cgu@10000000 {
>>>>> -		compatible =3D "ingenic,x1000-cgu";
>>>>> +		compatible =3D "ingenic,x1000-cgu", "simple-mfd";
>>>>> 		reg =3D <0x10000000 0x100>;
>>>>> +		#address-cells =3D <1>;
>>>>> +		#size-cells =3D <1>;
>>>>> +		ranges =3D <0x0 0x10000000 0x100>;
>>>>>=20
>>>>> 		#clock-cells =3D <1>;
>>>>>=20
>>>>> 		clocks =3D <&exclk>, <&rtclk>;
>>>>> 		clock-names =3D "ext", "rtc";
>>>>> +
>>>>> +		otg_phy: usb-phy@3c {
>>>>> +			compatible =3D "ingenic,x1000-phy";
>>>>> +			reg =3D <0x3c 0x10>;
>>>>> +
>>>>> +			clocks =3D <&cgu X1000_CLK_OTGPHY>;
>>>>> +
>>>>> +			#phy-cells =3D <0>;
>>>>> +		};
>>>>> +
>>>>> +		rng: rng@d8 {
>>>>> +			compatible =3D "ingenic,x1000-rng";
>>>>> +			reg =3D <0xd8 0x8>;
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>> +	ost: timer@12000000 {
>>>>> +		compatible =3D "ingenic,x1000-ost";
>>>>> +		reg =3D <0x12000000 0x3c>;
>>>>> +
>>>>> +		#clock-cells =3D <1>;
>>>>> +
>>>>> +		clocks =3D <&cgu X1000_CLK_OST>;
>>>>> +		clock-names =3D "ost";
>>>>> +
>>>>> +		interrupt-parent =3D <&cpuintc>;
>>>>> +		interrupts =3D <3>;
>>>>> 	};
>>>>>=20
>>>>> 	tcu: timer@10002000 {
>>>>> @@ -323,4 +353,24 @@
>>>>> 			status =3D "disabled";
>>>>> 		};
>>>>> 	};
>>>>> +
>>>>> +	otg: usb@13500000 {
>>>>> +		compatible =3D "ingenic,x1000-otg", "snps,dwc2";
>>>>> +		reg =3D <0x13500000 0x40000>;
>>>>> +
>>>>> +		interrupt-parent =3D <&intc>;
>>>>> +		interrupts =3D <21>;
>>>>> +
>>>>> +		clocks =3D <&cgu X1000_CLK_OTG>;
>>>>> +		clock-names =3D "otg";
>>>>> +
>>>>> +		phys =3D <&otg_phy>;
>>>>> +		phy-names =3D "usb2-phy";
>>>>> +
>>>>> +		g-rx-fifo-size =3D <768>;
>>>>> +		g-np-tx-fifo-size =3D <256>;
>>>>> +		g-tx-fifo-size =3D <256 256 256 256 256 256 256 512>;
>>>>> +
>>>>> +		status =3D "disabled";
>>>>> +	};
>>>>> };
>>>>> diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi =
b/arch/mips/boot/dts/ingenic/x1830.dtsi
>>>>> index b05dac3ae308..4831350efdf2 100644
>>>>> --- a/arch/mips/boot/dts/ingenic/x1830.dtsi
>>>>> +++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
>>>>> @@ -52,13 +52,38 @@
>>>>> 	};
>>>>>=20
>>>>> 	cgu: x1830-cgu@10000000 {
>>>>> -		compatible =3D "ingenic,x1830-cgu";
>>>>> +		compatible =3D "ingenic,x1830-cgu", "simple-mfd";
>>>>> 		reg =3D <0x10000000 0x100>;
>>>>> +		#address-cells =3D <1>;
>>>>> +		#size-cells =3D <1>;
>>>>> +		ranges =3D <0x0 0x10000000 0x100>;
>>>>>=20
>>>>> 		#clock-cells =3D <1>;
>>>>>=20
>>>>> 		clocks =3D <&exclk>, <&rtclk>;
>>>>> 		clock-names =3D "ext", "rtc";
>>>>> +
>>>>> +		otg_phy: usb-phy@3c {
>>>>> +			compatible =3D "ingenic,x1830-phy";
>>>>> +			reg =3D <0x3c 0x10>;
>>>>> +
>>>>> +			clocks =3D <&cgu X1830_CLK_OTGPHY>;
>>>>> +
>>>>> +			#phy-cells =3D <0>;
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>> +	ost: timer@12000000 {
>>>>> +		compatible =3D "ingenic,x1830-ost", "ingenic,x1000-ost";
>>>>> +		reg =3D <0x12000000 0x3c>;
>>>>> +
>>>>> +		#clock-cells =3D <1>;
>>>>> +
>>>>> +		clocks =3D <&cgu X1830_CLK_OST>;
>>>>> +		clock-names =3D "ost";
>>>>> +
>>>>> +		interrupt-parent =3D <&cpuintc>;
>>>>> +		interrupts =3D <4>;
>>>>> 	};
>>>>>=20
>>>>> 	tcu: timer@10002000 {
>>>>> @@ -236,6 +261,13 @@
>>>>> 		status =3D "disabled";
>>>>> 	};
>>>>>=20
>>>>> +	dtrng: trng@10072000 {
>>>>> +		compatible =3D "ingenic,x1830-dtrng";
>>>>> +		reg =3D <0x10072000 0xc>;
>>>>> +
>>>>> +		clocks =3D <&cgu X1830_CLK_DTRNG>;
>>>>> +	};
>>>>> +
>>>>> 	pdma: dma-controller@13420000 {
>>>>> 		compatible =3D "ingenic,x1830-dma";
>>>>> 		reg =3D <0x13420000 0x400
>>>>> @@ -311,4 +343,24 @@
>>>>> 			status =3D "disabled";
>>>>> 		};
>>>>> 	};
>>>>> +
>>>>> +	otg: usb@13500000 {
>>>>> +		compatible =3D "ingenic,x1830-otg", "snps,dwc2";
>>>>> +		reg =3D <0x13500000 0x40000>;
>>>>> +
>>>>> +		interrupt-parent =3D <&intc>;
>>>>> +		interrupts =3D <21>;
>>>>> +
>>>>> +		clocks =3D <&cgu X1830_CLK_OTG>;
>>>>> +		clock-names =3D "otg";
>>>>> +
>>>>> +		phys =3D <&otg_phy>;
>>>>> +		phy-names =3D "usb2-phy";
>>>>> +
>>>>> +		g-rx-fifo-size =3D <768>;
>>>>> +		g-np-tx-fifo-size =3D <256>;
>>>>> +		g-tx-fifo-size =3D <256 256 256 256 256 256 256 512>;
>>>>> +
>>>>> +		status =3D "disabled";
>>>>> +	};
>>>>> };
>>>>> --=20
>>>>> 2.11.0
>>>>>=20

