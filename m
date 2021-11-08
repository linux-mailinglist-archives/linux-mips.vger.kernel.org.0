Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3F7447F6F
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 13:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238166AbhKHMYE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 8 Nov 2021 07:24:04 -0500
Received: from aposti.net ([89.234.176.197]:51830 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237354AbhKHMYE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Nov 2021 07:24:04 -0500
Date:   Mon, 08 Nov 2021 12:20:59 +0000
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
Message-Id: <ZA692R.GHQL6RBCLFB12@crapouillou.net>
In-Reply-To: <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
        <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
        <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
        <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
        <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
        <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
        <HQY82R.69JHJIC64HDO1@crapouillou.net>
        <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le lun., nov. 8 2021 at 11:52:20 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> 
>>>  Am 08.11.2021 um 10:37 schrieb Paul Cercueil 
>>> <paul@crapouillou.net>:
>>> 
>>>  Well, it was atomic: "add jz4780+hdmi functionality" or not. Now 
>>> we separate into "preparation for adding jz4780" and "really 
>>> adding". Yes, you can split atoms into quarks...
>> 
>>  And that's how it should be done. Lots of small atomic patches are 
>> much easier to review than a few big patches.
> 
> I doubt that in this case especially as it has nothing to do with 
> jz4780...

It has nothing to do with JZ4780 and that's exactly why it should be a 
separate patch.

> But I have a proposal for a better solution at the end of this mail.
> 
>>>>  Note that you can do even better, set the .max_register field 
>>>> according to the memory resource you get from DTS. Have a look at 
>>>> the pinctrl driver which does exactly this.
>>>  That is an interesting idea. Although I don't see where
>>>  
>>> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/pinctrl-ingenic.c#L4171
>>>  does make use of the memory resource from DTS. It just reads two 
>>> values from the ingenic_chip_info instead of one I do read from 
>>> soc_info.
>> 
>>  It overrides the .max_register from a static regmap_config instance.
> 
> To be precise: it overrides .max_register of a copy of a static 
> regmap_config instance (which has .max_register = 0).
> 
>>  You can do the same,
> 
> We already do the same...
> 
>>  calculating the .max_register from the memory resource you get from 
>> DT.
> 
> I can't see any code in pinctrl-ingenic.c getting the memory resource 
> that from DT. It calculates it from the ingenic_chip_info tables 
> inside the driver code but not DT.
> 
>>  I'm sure you guys can figure it out.
> 
> Ah, we have to figure out. You are not sure yourself how to do it? 
> And it is *not* exactly like the pinctrl driver (already) does? 
> Please give precise directions in reviews and not vague research 
> homework. Our time is also valuable. Sorry if I review your reviews...
> 
> Anyways I think you roughly intend (untested):
> 
> 	struct resource *r;
> 
> 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 	regmap_config.max_register = r.end - r.start;

Replace the "devm_platform_ioremap_resource" with 
"devm_platform_get_and_ioremap_resource" to get a pointer to the 
resource.

Then the .max_register should be (r.end - r.start - 4) I think.

And lose the aggressivity. It's not going to get you anywhere, 
especially since I'm the one who decides whether or not I should merge 
your patches. You want your code upstream, that's great, but it's your 
responsability to get it to shape so that it's eventually accepted.

> 
> But I wonder how that could work at all (despite adding code 
> execution time) with:

Code execution time? ...

> e.g. jz4770.dtsi:
> 
> 	lcd: lcd-controller@13050000 {
> 		compatible = "ingenic,jz4770-lcd";
> 		reg = <0x13050000 0x300>;
> 
> or jz4725b.dtsi:
> 
> 	lcd: lcd-controller@13050000 {
> 		compatible = "ingenic,jz4725b-lcd";
> 		reg = <0x13050000 0x1000>;
> 
> So max_register becomes 0x300 or 0x1000 but not
> 
> #define JZ_REG_LCD_SIZE1	0x12c
> 	.max_reg = JZ_REG_LCD_SIZE1,
> 
> And therefore wastes a lot of regmap memory.

"regmap memory"? ...

> Do you want this? DTS should not be reduced (DTS should be kept as 
> stable as possible), since the reg property describes address mapping 
> - not how many bytes are really used by registers or how big a cache 
> should be allocated (cache allocation size requirements are not 
> hardware description).

The DTS should list the address and size of the register area. If your 
last register is at address 0x12c and there's nothing above, then the 
size in DTS should be 0x130.

> But here are good news:
> 
> I have a simpler and less invasive proposal. We keep the 
> devm_regmap_init_mmio code as is and just increase its .max_register 
> from JZ_REG_LCD_SIZE1 to JZ_REG_LCD_PCFG when introducing the jz4780. 
> This wastes a handful bytes for all non-jz4780 chips but less than 
> using the DTS memory region size. And is less code (no entry in 
> soc_info tables, no modifyable copy) and faster code execution than 
> all other proposals.
> 
> This is then just a single-line change when introducing the jz4780. 
> And no "preparation for adding jz4780" patch is needed at all. No 
> patch to split out for separate review.
> 
> Let's go this way to get it eventually finalized. Ok?

No.

Cheers,
-Paul


