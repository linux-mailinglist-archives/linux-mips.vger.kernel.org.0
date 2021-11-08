Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A82F449B13
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 18:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236102AbhKHRwo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 8 Nov 2021 12:52:44 -0500
Received: from aposti.net ([89.234.176.197]:46824 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235575AbhKHRwo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Nov 2021 12:52:44 -0500
Date:   Mon, 08 Nov 2021 17:49:39 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI
 output
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>
Message-Id: <RIL92R.MLAZ6CTO865E1@crapouillou.net>
In-Reply-To: <2F8A88BC-2696-491B-9C01-7D07A3B3670A@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
        <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
        <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
        <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
        <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
        <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
        <HQY82R.69JHJIC64HDO1@crapouillou.net>
        <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
        <ZA692R.GHQL6RBCLFB12@crapouillou.net>
        <D0809E59-DCB5-46CE-BE5E-D2A5D2ECA6F0@goldelico.com>
        <BVH92R.0VU3IKPQTLX9@crapouillou.net>
        <2F8A88BC-2696-491B-9C01-7D07A3B3670A@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le lun., nov. 8 2021 at 18:22:58 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> 
>>  Am 08.11.2021 um 17:30 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Hi,
>> 
>>  Le lun., nov. 8 2021 at 16:29:11 +0100, H. Nikolaus Schaller 
>> <hns@goldelico.com> a écrit :
>>>  Bnjour Paul,
>>>>  Am 08.11.2021 um 13:20 schrieb Paul Cercueil 
>>>> <paul@crapouillou.net>:
>>>>  Hi,
>>>>>  e.g. jz4770.dtsi:
>>>>>  	lcd: lcd-controller@13050000 {
>>>>>  		compatible = "ingenic,jz4770-lcd";
>>>>>  		reg = <0x13050000 0x300>;
>>>>>  or jz4725b.dtsi:
>>>>>  	lcd: lcd-controller@13050000 {
>>>>>  		compatible = "ingenic,jz4725b-lcd";
>>>>>  		reg = <0x13050000 0x1000>;
>>>>>  So max_register becomes 0x300 or 0x1000 but not
>>>>>  #define JZ_REG_LCD_SIZE1	0x12c
>>>>>  	.max_reg = JZ_REG_LCD_SIZE1,
>>>>>  And therefore wastes a lot of regmap memory.
>>>>  "regmap memory"? ...
>>>  regmap allocates memory for its cache. Usually the total amount 
>>> specified in the reg property.
>> 
>>  We are not using any register cache here.
>> 
>>>>>  Do you want this? DTS should not be reduced (DTS should be kept 
>>>>> as stable as possible), since the reg property describes address 
>>>>> mapping - not how many bytes are really used by registers or how 
>>>>> big a cache should be allocated (cache allocation size 
>>>>> requirements are not hardware description).
>>>>  The DTS should list the address and size of the register area. If 
>>>> your last register is at address 0x12c and there's nothing above, 
>>>> then the size in DTS should be 0x130.
>>>  If I look into some .dtsi it is sometimes that way but sometimes 
>>> not. There seems to be no consistent rule.
>>>  So does this mean you allow me to modify jz4740.dtsi, jz4770.dtsi 
>>> and jz4725b.dtsi as well (as mentioned above: this is beyond the 
>>> scope of my project)?
>> 
>>  You could update them if you wanted to, but there is no need to do 
>> it here.
> 
> Hm. Then we are changing the .max_register initialization to a much 
> bigger value.
> 
>> 
>>>>>  But here are good news:
>>>>>  I have a simpler and less invasive proposal. We keep the 
>>>>> devm_regmap_init_mmio code as is and just increase its 
>>>>> .max_register from JZ_REG_LCD_SIZE1 to JZ_REG_LCD_PCFG when 
>>>>> introducing the jz4780. This wastes a handful bytes for all 
>>>>> non-jz4780 chips but less than using the DTS memory region size. 
>>>>> And is less code (no entry in soc_info tables, no modifyable 
>>>>> copy) and faster code execution than all other proposals.
>>>>>  This is then just a single-line change when introducing the 
>>>>> jz4780. And no "preparation for adding jz4780" patch is needed at 
>>>>> all. No patch to split out for separate review.
>>>>>  Let's go this way to get it eventually finalized. Ok?
>>>>  No.
>>>  Look friend, if you explain your "no" and what is wrong with my 
>>> arguments, it helps to understand your decisions and learn 
>>> something from them. A plain "no" does not help anyone.
>> 
>>  I answered just "no" because I felt like I explained already what I 
>> wanted to see in the previous email.
>> 
>>  By using a huge number as the .max_register, we do *not* waste 
>> additional memory. Computing the value of the .max_register field 
>> does not add any overhead, either.
>> 
>>  The .max_register is only used for boundary checking. To make sure 
>> that you're not calling regmap_write() with an invalid register. 
>> That's all there is to it.
> 
> Ah, now I understand our disconnect. So far I have used regmaps 
> mainly for i2c devices and there is caching to avoid redundant i2c 
> traffic...
> 
> So I just assumed wrongly that the regmap driver also allocates some 
> buffer/cache here. Although it does not initialize .cache_type 
> (default: REGCACHE_NONE).
> 
>> 
>>>  So to summarize: if you prefer something which I consider worse, 
>>> it is ok for me... In the end you are right - you are the 
>>> maintainer, not me. So you have to live with your proposals.
>>>  Therefore, I have prepared new variants so you can choose which 
>>> one is easier to maintain for you.
>>>  Note that they are both preparing for full jz4780-lcdc/hdmi 
>>> support but in very different ways:
>>>  Variant 1 already adds some jz4780 stuff while Variant 2 just 
>>> prepares for it.
>>>  Variant 2 is not tested (except to compile). So it needs some 
>>> Tested-by: from someone with access to hardware. IMHO it is more 
>>> invasive.
>>>  And don't forget: DTB could be in ROM or be provided by a separate 
>>> bootloader... So we should not change it too often (I had such 
>>> discussions some years ago with maintainers when I thought it is 
>>> easier to change DTS instead of code).
>>>  Variant 3 would be to not separate this. As proposed in [PATCH v5 
>>> 2/7].
>>>  (Finally, a Variant 3b would be to combine the simple change from 
>>> Variant 1 with Variant 3).
>>>  So what is your choice?
>> 
>>  Variant 4: the variant #2 without the changes to the DTSI files.
> 
> Hm. If there is no cache and we can safely remove tight boundary 
> checking (by JZ_REG_LCD_SIZE1) for jz4725/40/70 (by not fixing DTSI) 
> why do we still need the max_register calculation from DTSI 
> specifically for jz4780 and at all?

It's better to have the .max_register actually set to the proper value. 
Then reading the registers from debugfs (/sys/kernel/debug/regmap/) 
will print the actual list of registers without bogus values. If 
.max_register is set too high, it will end up reading outside the 
registers area. On Ingenic SoCs such reads just return 0, but on some 
other SoCs it can lock up the system.

So the best way forward is to have .max_register computed from the 
register area's size, and fix the DTSI with the proper sizes. Since 
your JZ4780 code needs to update .max_register anyway it's a good 
moment to add this patch, and the DTSI files can be fixed later (by me 
or whoever is up to the task).

Fixing the DTS is not a problem in any way, btw. We just need to ensure 
that the drivers still work with old DTB files, which will be the case 
here.

-Paul

> So what about:
> 
> Variant 5: set .max_register = 0x1800, i.e. "big enough for everyone" 
> (includes z4780 gamma and vee registers) + no DTSI changes (+ no 
> jz4780 register constants like Variant 1)
> 
> + no DTSI changes
> + no calculation from DTSI needed
> + single separate patch to prepare for jz4780 but not included in 
> jz4780 patch
> 
> BR and thanks,
> Nikolaus
> 
> 


