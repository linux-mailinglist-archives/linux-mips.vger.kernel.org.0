Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67492915FE
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2019 11:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfHRJwA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Aug 2019 05:52:00 -0400
Received: from mout.gmx.net ([212.227.15.19]:52689 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbfHRJv7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 18 Aug 2019 05:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566121902;
        bh=+d+QZZzhuhOcRtIoReCFXziPDC2BMA4fwb+Y7lFEti0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Ei+Z9w+YmFJX/RpTltTEQIiF9JjV0yPjZRq1mlJFudqB3lcBiBMdnwWj4FvfIzk5m
         4S2GZjCQrMNoE++Tt8XDtuxCYZz71QWLmeC7/yVOIHfIU1fqEl0bNmUJPBCrwWl17p
         SMASEMl4PFNcNf88pf9NI6MQBtlzir4W2uOVJPM8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.28] ([95.90.191.58]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOKi-1iGWiO0k0M-00utd2; Sun, 18
 Aug 2019 11:51:42 +0200
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>,
        Paul Fertser <fercerpav@gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com> <20190813155143.GA19830@bogus>
 <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
 <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
 <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
 <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de>
 <CAJsYDVK9Yj02WxNFo7iEP3aJn+j5MqzCtLrmgsz=4zWnfQ4VOw@mail.gmail.com>
 <6426d4d2-9961-83f2-d3bc-5834ff36b40d@rempel-privat.de>
 <CAJsYDVKW9-7ityUn83NXcQYmqJi_t-VSV8F0c+BA14_w+poPkA@mail.gmail.com>
 <CAJsYDVJnQyOXHKWztoE72KKnMinJL+1AZGy_CvTT6oOs5m5U2w@mail.gmail.com>
From:   Oleksij Rempel <linux@rempel-privat.de>
Openpgp: preference=signencrypt
Autocrypt: addr=linux@rempel-privat.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c8551d99-7296-c621-1b56-017910f28400@rempel-privat.de>
Date:   Sun, 18 Aug 2019 11:51:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJsYDVJnQyOXHKWztoE72KKnMinJL+1AZGy_CvTT6oOs5m5U2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:33MQiOSNmhigUT8kdZUw0bEDwW52DWWCRB+bxlc3Vgx/X9s15ae
 l/5S+ezi3ywjmYHjQZRb2rsUjF+SqR7/7TUzccmNjuRwBE3EY6omyTdEnmNBsDcWuXMPPIL
 m34011ilDSzWydKQdOcJvyjvID3hrIaOIkF40j3MH91OdFe5VgJRhIDtmcDhM0dsLXf5rb0
 zIOe5H7iMe1lNqsI0+oWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q7SwvJFwAXY=:TCkHKBr5srtXrPstz4mE43
 1FtGwxbv0sNKSoMDP1PmSFnwbd9Eh9zegP97Tfag4kuOa2qgwwg8xVlNGV44wMwJoXUZXdhKS
 8Qe4Bssg+e07B5Krpo940FUfqBmi6S7juNWtiNA74+ZI3Ucf1aptO9PHbvTeqkBL7UBTICHEE
 xliQ+LcVpPXRRAs8CGYoSvDLIeNn+gsFvOEE+yhBkXCrbOqCGSqNF26kCsDVxdbBL0tAKbIpd
 x4YKXTzsjiANJfh9VMjusrhgdKFggl5+Wigz9aHrjXKgSaTDF/6vAkJcTuewLCu+dVuFJPO44
 36QG/jVjhQcATsvHoEACQUz3fB9UrF8kOyETE4NEMzBTe7IYBR3ufqSIqppTzx+15IGr92aY3
 gWcFkifCsBqZQkmsB6suPrE59iS2F5F2W2x5nfr76HvsqGFTK2xibnmYgFiO2P7q61JHl6EFa
 VSnjblGsMJLEiAY1reZf4xgm/r1R/jO4/5n7fKfY6+lXuxbEnTO1zUuFgSLPsKJZRnqET7UZq
 6+9lrZE9fY+Oo1/OpxAx51BX0sOWP10r8nHA22gaHsOsvYh+w5fJiDNZsf6evR2iMakoSZY9z
 FpU5fwO2h4cphe2n6+DVzye3cccZK2XuSP+JhIWz8mNeKT7mKwQGA4UJ2WumSGog2mO2iO+FC
 BHY+qMYm5T6K0KpBrSkHnLPRhE2PH1I2eneVTilG1sf0+xDRNN2r87tjLeqi1gwvs+vaDrhbM
 4N57aeIKCYlOiICbYLORPvXGdFev8LZdCKLCHG7P+6KDBxqiyFijIjh/5K+K6JIz6ZZanF4uM
 Wn5Y0ow8VkH/TzId25Z4gqYWwprryMQ3I247Q7iE1vyaOAokjsVvhG3VYaTtkg8D0XhIWx9gF
 AI4ebFba/hB/4UVDmrm14RZnzoDi0cwKCXsEsDDASLK+U6cpj3/Zbnpms0Qlcv27uX54P7N/j
 u51yqje8DG62DKJ2brKjD6MJKdDVbYfBAaIWqWAce4S3DKy2TtH3q2xjxecfkvxIoZ19Gvgs+
 49HoVN8Qhx4Fz8su7rGrTEGp7xMKRLOtBkj66WW0ORtH4elNk1xhByHGyEZhzVOH7aV5ks2qb
 jlu18m9h9mGcUW69lDR7lOtRe8RebFe5JxWeooC6vvYAP4Faq+u6xt093ocdkAKBbq9DsWBBY
 X0bTY=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am 18.08.19 um 10:44 schrieb Chuanhong Guo:
> On Sun, Aug 18, 2019 at 4:26 PM Chuanhong Guo <gch981213@gmail.com> wrot=
e:
>>
>> Hi!
>>
>> On Sun, Aug 18, 2019 at 3:59 PM Oleksij Rempel <linux@rempel-privat.de>=
 wrote:
>>>
>>> Am 18.08.19 um 09:19 schrieb Chuanhong Guo:
>>>> Hi!
>>>>
>>>> On Sun, Aug 18, 2019 at 2:10 PM Oleksij Rempel <linux@rempel-privat.d=
e> wrote:
>>>>>
>>>>>>> We have at least 2 know registers:
>>>>>>> SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostra=
pped
>>>>>>> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?=
).
>>>>>>> SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks =
for
>>>>>>> all or some ip cores.
>>>>>>> What is probably missing is a set of dividers for
>>>>>>> each ip core. From your words it is not document.
>>>>>>
>>>>>> The specific missing part I was referring to, is parent clocks for
>>>>>> every gates. I'm not going to assume this with current openwrt devi=
ce
>>>>>> tree because some peripherals doesn't have a clock binding at all o=
r
>>>>>> have a dummy one there.
>>>>>
>>>>> Ok, then I do not understand what is the motivation to upstream
>>>>> something what is not nearly ready for use.
>>>>
>>>> Why isn't it "ready for use" then?
>>>> A complete mt7621-pll driver will contain two parts:
>>>> 1. A clock provider which outputs several clocks
>>>> 2. A clock gate with parent clocks properly configured
>>>>
>>>> Two clocks provided here are just two clocks that can't be controlled
>>>> in kernel no matter where it goes (arch/mips/ralink or drivers/clk).
>>>> Having a working CPU clock provider is better than defining a fixed
>>>> clock in dts because CPU clock can be controlled by bootloader.
>>>> (BTW description for CPU PLL register is also missing in datasheet.)
>>>> Clock gate is an unrelated part and there is no information to
>>>> properly implement it unless MTK decided to release a clock plan
>>>> somehow.
>>>
>>> With other words, your complete system is running with unknown clock
>>> rates.
>>
>> And without this patchset the complete system is running with unknown
>> clock and, even worse, we make assumptions about what clock bootloader
>> uses, hardcoded it in dts and hope it is the correct value.
>>
>>> The source clock in the clock three can be configured differently
>>> by bootloader but you don't know how it is done how and it is not
>>> documented.
>>
>> Actually, I don't know about this and I didn't wrote the original
>> clock calculation code. I just ported it from downstream OpenWrt
>> kernel. Here's a piece of code from Mediatek's SDK kernel:
>>
>> case 0:
>>         reg =3D (*(volatile u32 *)(RALINK_SYSCTL_BASE + 0x44));
>>         cpu_fdiv =3D ((reg >> 8) & 0x1F);
>>         cpu_ffrac =3D (reg & 0x1F);
>> mips_cpu_feq =3D (500 * cpu_ffrac / cpu_fdiv) * 1000 * 1000;
>> break;
>> case 1: //CPU PLL
>>         reg =3D (*(volatile u32 *)(RALINK_MEMCTRL_BASE + 0x648));
>>         fbdiv =3D ((reg >> 4) & 0x7F) + 1;
>>         reg =3D (*(volatile u32 *)(RALINK_SYSCTL_BASE + 0x10));
>>         reg =3D (reg >> 6) & 0x7;
>>         if(reg >=3D 6) { //25Mhz Xtal
>>             mips_cpu_feq =3D 25 * fbdiv * 1000 * 1000;
>>         } else if(reg >=3D3) { //40Mhz Xtal
>>             mips_cpu_feq =3D 20 * fbdiv * 1000 * 1000;
>>         } else { // 20Mhz Xtal
>>             /* TODO */
>>         }
>>         break;
>>
>>
>>
>>>
>>>>> This code is currently on prototyping phase
>>>>
>>>> Code for clock calculation is done, not "prototyping".
>>>>
>>>>> It means, we cannot expect that this driver will be fixed any time s=
oon.
>>>>
>>>> I think clock gating is a separated feature instead of a broken part
>>>> that has to be fixed.
>>>
>>> Ok, i would agree with it. But from what you said, this feature will b=
e
>>> never implemented.
>>>
>>> So, I repeat my question. What is the point to upstream code for a
>>> system, which has not enough information to get proper clock rate even
>>> for uart? or is uart running with cpu or bus clock rate?
>>
>> uart runs of a fixed 50MHz clock according to another piece of code
>> from MTK SDK:
>> (a pastebin version here for better readability. This specific
>> question has nothing to do with patch reviewing and doesn't need to be
>> preserved in mail forever.)
>> https://paste.ubuntu.com/p/fYmtDFW9nh/

ok.

lets see more code:
drivers/staging/mt7621-mmc/sd.c
/* clock source for host: global */
#if defined(CONFIG_SOC_MT7620)
static u32 hclks[] =3D {48000000}; /* +/- by chhung */
#elif defined(CONFIG_SOC_MT7621)
static u32 hclks[] =3D {50000000}; /* +/- by chhung */
#endif

hm.. 50Mhz again. Feels like APB clock.

./drivers/staging/mt7621-dts/mt7621.dtsi
        cpuclock: cpuclock@0 {
                #clock-cells =3D <0>;
                compatible =3D "fixed-clock";

                /* FIXME: there should be way to detect this */
                clock-frequency =3D <880000000>;
        };

Your driver is trying to cover cpuclock

        sysclock: sysclock@0 {
                #clock-cells =3D <0>;
                compatible =3D "fixed-clock";

                /* This is normally 1/4 of cpuclock */
                clock-frequency =3D <220000000>;
        };

and most probably system clock alias "bus clock", most probably AHB.

                i2c: i2c@900 {
                        compatible =3D "mediatek,mt7621-i2c";
                        clocks =3D <&sysclock>;

looks like i2c is using AHB clock.

                uartlite: uartlite@c00 {
                        compatible =3D "ns16550a";

                        clocks =3D <&sysclock>;
                        clock-frequency =3D <50000000>;

and uart is suing APB clock

                spi0: spi@b00 {
                        compatible =3D "ralink,mt7621-spi";
                        clocks =3D <&sysclock>;

SPI -> APB

        xhci: xhci@1E1C0000 {
                compatible =3D "mediatek,mt8173-xhci";
                clocks =3D <&sysclock>;
                clock-names =3D "sys_ck";
XHCI -> AHB


        ethernet: ethernet@1e100000 {
                compatible =3D "mediatek,mt7621-eth";
                clocks =3D <&sysclock>;
                clock-names =3D "ethif";

Ethernet -> AHB
So, all device are using two groups of clocks. System clock with seems
to depend on CPU clock.
Or 50MHz clock. Which is for some unknow reason always 50MHz.

Here we have already upstream code:
arch/mips/ralink/mt7620.c
        xtal_rate =3D mt7620_get_xtal_rate();

#define RFMT(label)     label ":%lu.%03luMHz "
#define RINT(x)         ((x) / 1000000)
#define RFRAC(x)        (((x) / 1000) % 1000)

        if (is_mt76x8()) {
                if (xtal_rate =3D=3D MHZ(40))
                        cpu_rate =3D MHZ(580);
                else
                        cpu_rate =3D MHZ(575);
                dram_rate =3D sys_rate =3D cpu_rate / 3;
                periph_rate =3D MHZ(40);
                pcmi2s_rate =3D MHZ(480);

                ralink_clk_add("10000d00.uartlite", periph_rate);
                ralink_clk_add("10000e00.uartlite", periph_rate);


which is doing same as I requested before. Well, preferred in
drivers/clk/ manner.

>> I could ask the same question:
>> What is the point of upstreaming an incomplete MT7621 support in the
>> first place? Current MT7621 support in upstream kernel works only for
>> mt7621a not mt7621s and it runs of unknown clocks. These kind of code
>> should stay in downstream projects like OpenWrt forever isn't it?

I need to admit. I really like the idea of pushing all downstream
OpenWrt code mainline. And respect every one who is doing it.

Other question, do this platfrom SoC really worth it? Vendor seems do
not care about it. This product belong to

> And in fact you've upstreamed a broken ag71xx driver anyway.

I don't think this example is nearly comparable. We have enough
documentation to provide working driver. For mainlining was removed
everything what do not belong there:
- direct reading and writing to system wide clock registers. This should
be done over clk framework.
- switch support. It should be done in dsa framework, not inside of
ethernet driver.
- ethertool support was removed to reduce review overhead and can be add
later if need.
- debugfs support was removed removed to reduce review overhead and can
be add later if need.
- phy or board specific quirks was removed as well. This has nothing
todo with ethernet driver and belong to other frameworks or drivers.


> This debate goes nowhere. I've clarified the situation and made my
> point. Of course I can't read through the ancient and heavily hacked
> vendor kernel to figure out a clock plan myself.

Ok, I provided you some productive technical hints how it should be
done. I don't think mt7620 has better documentation then mt7621 and even
in this case it was possible to make more or less good driver.

=2D-
Regards,
Oleksij
