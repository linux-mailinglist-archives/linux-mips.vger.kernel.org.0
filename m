Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7592E4499DF
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 17:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239999AbhKHQdt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 8 Nov 2021 11:33:49 -0500
Received: from aposti.net ([89.234.176.197]:57300 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232506AbhKHQds (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Nov 2021 11:33:48 -0500
Date:   Mon, 08 Nov 2021 16:30:47 +0000
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
Message-Id: <BVH92R.0VU3IKPQTLX9@crapouillou.net>
In-Reply-To: <D0809E59-DCB5-46CE-BE5E-D2A5D2ECA6F0@goldelico.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le lun., nov. 8 2021 at 16:29:11 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Bnjour Paul,
> 
> 
>>  Am 08.11.2021 um 13:20 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Hi,
>> 
>>  Le lun., nov. 8 2021 at 11:52:20 +0100, H. Nikolaus Schaller 
>> <hns@goldelico.com> a écrit :
>>>  Hi Paul,
>>>>>  Am 08.11.2021 um 10:37 schrieb Paul Cercueil 
>>>>> <paul@crapouillou.net>:
>>>>>  Well, it was atomic: "add jz4780+hdmi functionality" or not. Now 
>>>>> we separate into "preparation for adding jz4780" and "really 
>>>>> adding". Yes, you can split atoms into quarks...
>>>>  And that's how it should be done. Lots of small atomic patches 
>>>> are much easier to review than a few big patches.
>>>  I doubt that in this case especially as it has nothing to do with 
>>> jz4780...
>> 
>>  It has nothing to do with JZ4780 and that's exactly why it should 
>> be a separate patch.
> 
> Question is why *I* should then make this patch and not someone 
> else...
> 
> I am not necessarily a volunteer to contribute to non-jz4780 code 
> just because I want to upstream jz4780 code.

The JZ4780 patch lies on top of the other one, so they are still 
related. They just shouldn't be the same patch.

>> 
>>>  But I have a proposal for a better solution at the end of this 
>>> mail.
>>>>>>  Note that you can do even better, set the .max_register field 
>>>>>> according to the memory resource you get from DTS. Have a look 
>>>>>> at the pinctrl driver which does exactly this.
>>>>>  That is an interesting idea. Although I don't see where
>>>>>  
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/pinctrl-ingenic.c#L4171
>>>>>  does make use of the memory resource from DTS. It just reads two 
>>>>> values from the ingenic_chip_info instead of one I do read from 
>>>>> soc_info.
>>>>  It overrides the .max_register from a static regmap_config 
>>>> instance.
>>>  To be precise: it overrides .max_register of a copy of a static 
>>> regmap_config instance (which has .max_register = 0).
>>>>  You can do the same,
>>>  We already do the same...
>>>>  calculating the .max_register from the memory resource you get 
>>>> from DT.
>>>  I can't see any code in pinctrl-ingenic.c getting the memory 
>>> resource that from DT. It calculates it from the ingenic_chip_info 
>>> tables inside the driver code but not DT.
>>>>  I'm sure you guys can figure it out.
>>>  Ah, we have to figure out. You are not sure yourself how to do it? 
>>> And it is *not* exactly like the pinctrl driver (already) does? 
>>> Please give precise directions in reviews and not vague research 
>>> homework. Our time is also valuable. Sorry if I review your 
>>> reviews...
>>>  Anyways I think you roughly intend (untested):
>>>  	struct resource *r;
>>>  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>  	regmap_config.max_register = r.end - r.start;
>> 
>>  Replace the "devm_platform_ioremap_resource" with 
>> "devm_platform_get_and_ioremap_resource" to get a pointer to the 
>> resource.
>> 
>>  Then the .max_register should be (r.end - r.start - 4) I think.
>> 
>>  And lose the aggressivity. It's not going to get you anywhere, 
>> especially since I'm the one who decides whether or not I should 
>> merge your patches. You want your code upstream, that's great, but 
>> it's your responsability to get it to shape so that it's eventually 
>> accepted.
> 
> Well on the other side of the fence it is maintainers responsibility 
> to give clear and understandable rules and guidance about what will 
> be accepted and to enable us to bring it into the shape he/she has in 
> mind.
> 
> But a fundamental problem is: "good shape" is very subjective. What 
> would you recommend me to do, if I feel that my proposed code is in 
> better shape than what the maintainer thinks or recommends?
> 
>> 
>>>  But I wonder how that could work at all (despite adding code 
>>> execution time) with:
>> 
>>  Code execution time? ...
> 
> I reasoned about doing an additional platform_get_resource() call and 
> doing a subtraction. This is additional execution time. Maybe not 
> worth thinking about because it is in the probe function. And using 
> devm_platform_get_and_ioremap_resource() is of course potentially 
> better.
> 
>> 
>>>  e.g. jz4770.dtsi:
>>>  	lcd: lcd-controller@13050000 {
>>>  		compatible = "ingenic,jz4770-lcd";
>>>  		reg = <0x13050000 0x300>;
>>>  or jz4725b.dtsi:
>>>  	lcd: lcd-controller@13050000 {
>>>  		compatible = "ingenic,jz4725b-lcd";
>>>  		reg = <0x13050000 0x1000>;
>>>  So max_register becomes 0x300 or 0x1000 but not
>>>  #define JZ_REG_LCD_SIZE1	0x12c
>>>  	.max_reg = JZ_REG_LCD_SIZE1,
>>>  And therefore wastes a lot of regmap memory.
>> 
>>  "regmap memory"? ...
> 
> regmap allocates memory for its cache. Usually the total amount 
> specified in the reg property.

We are not using any register cache here.

>> 
>>>  Do you want this? DTS should not be reduced (DTS should be kept as 
>>> stable as possible), since the reg property describes address 
>>> mapping - not how many bytes are really used by registers or how 
>>> big a cache should be allocated (cache allocation size requirements 
>>> are not hardware description).
>> 
>>  The DTS should list the address and size of the register area. If 
>> your last register is at address 0x12c and there's nothing above, 
>> then the size in DTS should be 0x130.
> 
> If I look into some .dtsi it is sometimes that way but sometimes not. 
> There seems to be no consistent rule.
> 
> So does this mean you allow me to modify jz4740.dtsi, jz4770.dtsi and 
> jz4725b.dtsi as well (as mentioned above: this is beyond the scope of 
> my project)?

You could update them if you wanted to, but there is no need to do it 
here.

>> 
>>>  But here are good news:
>>>  I have a simpler and less invasive proposal. We keep the 
>>> devm_regmap_init_mmio code as is and just increase its 
>>> .max_register from JZ_REG_LCD_SIZE1 to JZ_REG_LCD_PCFG when 
>>> introducing the jz4780. This wastes a handful bytes for all 
>>> non-jz4780 chips but less than using the DTS memory region size. 
>>> And is less code (no entry in soc_info tables, no modifyable copy) 
>>> and faster code execution than all other proposals.
>>>  This is then just a single-line change when introducing the 
>>> jz4780. And no "preparation for adding jz4780" patch is needed at 
>>> all. No patch to split out for separate review.
>>>  Let's go this way to get it eventually finalized. Ok?
>> 
>>  No.
> 
> Look friend, if you explain your "no" and what is wrong with my 
> arguments, it helps to understand your decisions and learn something 
> from them. A plain "no" does not help anyone.

I answered just "no" because I felt like I explained already what I 
wanted to see in the previous email.

By using a huge number as the .max_register, we do *not* waste 
additional memory. Computing the value of the .max_register field does 
not add any overhead, either.

The .max_register is only used for boundary checking. To make sure that 
you're not calling regmap_write() with an invalid register. That's all 
there is to it.

> So to summarize: if you prefer something which I consider worse, it 
> is ok for me... In the end you are right - you are the maintainer, 
> not me. So you have to live with your proposals.
> 
> Therefore, I have prepared new variants so you can choose which one 
> is easier to maintain for you.
> 
> Note that they are both preparing for full jz4780-lcdc/hdmi support 
> but in very different ways:
> 
> Variant 1 already adds some jz4780 stuff while Variant 2 just 
> prepares for it.
> 
> Variant 2 is not tested (except to compile). So it needs some 
> Tested-by: from someone with access to hardware. IMHO it is more 
> invasive.
> 
> And don't forget: DTB could be in ROM or be provided by a separate 
> bootloader... So we should not change it too often (I had such 
> discussions some years ago with maintainers when I thought it is 
> easier to change DTS instead of code).
> 
> Variant 3 would be to not separate this. As proposed in [PATCH v5 
> 2/7].
> (Finally, a Variant 3b would be to combine the simple change from 
> Variant 1 with Variant 3).
> 
> So what is your choice?

Variant 4: the variant #2 without the changes to the DTSI files.

Cheers,
-Paul


> BR and thanks,
> Nikolaus
> 
> 
> #### VARIANT 0001 ####
> 
> From c7afa925f6b53bb6cafa080b7dd582788c8eb2eb Mon Sep 17 00:00:00 2001
> From: "H. Nikolaus Schaller" <hns@goldelico.com>
> Date: Mon, 8 Nov 2021 15:38:21 +0100
> Subject: [PATCH] RFC: drm/ingenic: Add register definitions for 
> JZ4780 lcdc
> 
> JZ4780 has additional registers compared to the other
> SoC of the JZ47xx series. So we add the constants for
> registers and bits we make use of (there are even more
> which can be added later).
> 
> And we increase the regmap max_register accordingly.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm.h     | 39 
> +++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index a5df1c8d34cde..1903e897d2299 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -122,7 +122,7 @@ static const struct regmap_config 
> ingenic_drm_regmap_config = {
>  	.val_bits = 32,
>  	.reg_stride = 4,
> 
> -	.max_register = JZ_REG_LCD_SIZE1,
> +	.max_register = JZ_REG_LCD_PCFG,
>  	.writeable_reg = ingenic_drm_writeable_reg,
>  };
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h 
> b/drivers/gpu/drm/ingenic/ingenic-drm.h
> index 22654ac1dde1c..e7430c4af41f6 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.h
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
> @@ -44,8 +44,11 @@
>  #define JZ_REG_LCD_XYP1				0x124
>  #define JZ_REG_LCD_SIZE0			0x128
>  #define JZ_REG_LCD_SIZE1			0x12c
> +#define JZ_REG_LCD_PCFG				0x2c0
> 
>  #define JZ_LCD_CFG_SLCD				BIT(31)
> +#define JZ_LCD_CFG_DESCRIPTOR_8			BIT(28)
> +#define JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN	BIT(25)
>  #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
>  #define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
>  #define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
> @@ -63,6 +66,7 @@
>  #define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
>  #define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
>  #define JZ_LCD_CFG_18_BIT			BIT(7)
> +#define JZ_LCD_CFG_24_BIT			BIT(6)
>  #define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
> 
>  #define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
> @@ -132,6 +136,7 @@
>  #define JZ_LCD_CMD_SOF_IRQ			BIT(31)
>  #define JZ_LCD_CMD_EOF_IRQ			BIT(30)
>  #define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
> +#define JZ_LCD_CMD_FRM_ENABLE			BIT(26)
> 
>  #define JZ_LCD_SYNC_MASK			0x3ff
> 
> @@ -153,6 +158,7 @@
>  #define JZ_LCD_RGBC_EVEN_BGR			(0x5 << 0)
> 
>  #define JZ_LCD_OSDC_OSDEN			BIT(0)
> +#define JZ_LCD_OSDC_ALPHAEN			BIT(2)
>  #define JZ_LCD_OSDC_F0EN			BIT(3)
>  #define JZ_LCD_OSDC_F1EN			BIT(4)
> 
> @@ -176,6 +182,39 @@
>  #define JZ_LCD_SIZE01_WIDTH_LSB			0
>  #define JZ_LCD_SIZE01_HEIGHT_LSB		16
> 
> +#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
> +#define JZ_LCD_DESSIZE_HEIGHT_MASK		GENMASK(23, 12)
> +#define JZ_LCD_DESSIZE_WIDTH_MASK		GENMASK(11, 0)
> +
> +/* TODO: 4,5 and 7 match the above BPP */
> +#define JZ_LCD_CPOS_BPP_15_16			(4 << 27)
> +#define JZ_LCD_CPOS_BPP_18_24			(5 << 27)
> +#define JZ_LCD_CPOS_BPP_30			(7 << 27)
> +#define JZ_LCD_CPOS_RGB555			BIT(30)
> +#define JZ_LCD_CPOS_PREMULTIPLY_LCD		BIT(26)
> +#define JZ_LCD_CPOS_COEFFICIENT_OFFSET		24
> +#define JZ_LCD_CPOS_COEFFICIENT_0		0
> +#define JZ_LCD_CPOS_COEFFICIENT_1		1
> +#define JZ_LCD_CPOS_COEFFICIENT_ALPHA1		2
> +#define JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1	3
> +
> +#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
> +#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
> +#define JZ_LCD_RGBC_422				BIT(8)
> +#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
> +
> +#define JZ_LCD_PCFG_PRI_MODE			BIT(31)
> +#define JZ_LCD_PCFG_HP_BST_4			(0 << 28)
> +#define JZ_LCD_PCFG_HP_BST_8			(1 << 28)
> +#define JZ_LCD_PCFG_HP_BST_16			(2 << 28)
> +#define JZ_LCD_PCFG_HP_BST_32			(3 << 28)
> +#define JZ_LCD_PCFG_HP_BST_64			(4 << 28)
> +#define JZ_LCD_PCFG_HP_BST_16_CONT		(5 << 28)
> +#define JZ_LCD_PCFG_HP_BST_DISABLE		(7 << 28)
> +#define JZ_LCD_PCFG_THRESHOLD2_OFFSET		18
> +#define JZ_LCD_PCFG_THRESHOLD1_OFFSET		9
> +#define JZ_LCD_PCFG_THRESHOLD0_OFFSET		0
> +
>  struct device;
>  struct drm_plane;
>  struct drm_plane_state;
> --
> 2.33.0
> 
> 
> #### VARIANT 0002 ####
> 
> From c4b5cfa2789493f02da91e385719bc97aefb6c6c Mon Sep 17 00:00:00 2001
> From: "H. Nikolaus Schaller" <hns@goldelico.com>
> Date: Mon, 8 Nov 2021 14:40:58 +0100
> Subject: [PATCH] RFC: drm/ingenic: prepare ingenic drm for later 
> addition of
>  JZ4780
> 
> This changes the way the regmap is allocated to prepare for the
> later addition of the JZ4780 which has more registers and bits
> than the others.
> 
> To make this work we have to change the device tree records of
> all devices so that the reg property is limited to the physically
> available registers.
> 
> The magic value 0x130 in the device tree is JZ_REG_LCD_SIZE1 + 4.
> 
> Note that it is not tested since I have no access to the hardware.
> 
> Suggested-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4725b.dtsi   | 2 +-
>  arch/mips/boot/dts/ingenic/jz4740.dtsi    | 2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi    | 2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 9 ++++++---
>  4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi 
> b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> index a1f0b71c92237..c017b087c0e52 100644
> --- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> @@ -321,7 +321,7 @@ udc: usb@13040000 {
> 
>  	lcd: lcd-controller@13050000 {
>  		compatible = "ingenic,jz4725b-lcd";
> -		reg = <0x13050000 0x1000>;
> +		reg = <0x13050000 0x130>;
> 
>  		interrupt-parent = <&intc>;
>  		interrupts = <31>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi 
> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index c1afdfdaa8a38..ce3689e5015b5 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -323,7 +323,7 @@ udc: usb@13040000 {
> 
>  	lcd: lcd-controller@13050000 {
>  		compatible = "ingenic,jz4740-lcd";
> -		reg = <0x13050000 0x1000>;
> +		reg = <0x13050000 0x130>;
> 
>  		interrupt-parent = <&intc>;
>  		interrupts = <30>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi 
> b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index 05c00b93088e9..0d1ee58d6c40b 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -399,7 +399,7 @@ gpu: gpu@13040000 {
> 
>  	lcd: lcd-controller@13050000 {
>  		compatible = "ingenic,jz4770-lcd";
> -		reg = <0x13050000 0x300>;
> +		reg = <0x13050000 0x130>;
> 
>  		interrupt-parent = <&intc>;
>  		interrupts = <31>;
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index a5df1c8d34cde..3c8e3c5a447bb 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -122,7 +122,6 @@ static const struct regmap_config 
> ingenic_drm_regmap_config = {
>  	.val_bits = 32,
>  	.reg_stride = 4,
> 
> -	.max_register = JZ_REG_LCD_SIZE1,
>  	.writeable_reg = ingenic_drm_writeable_reg,
>  };
> 
> @@ -858,6 +857,8 @@ static int ingenic_drm_bind(struct device *dev, 
> bool has_components)
>  	struct drm_encoder *encoder;
>  	struct drm_device *drm;
>  	void __iomem *base;
> +	struct resource *res;
> +	struct regmap_config regmap_config;
>  	long parent_rate;
>  	unsigned int i, clone_mask = 0;
>  	dma_addr_t dma_hwdesc_phys_f0, dma_hwdesc_phys_f1;
> @@ -904,14 +905,16 @@ static int ingenic_drm_bind(struct device *dev, 
> bool has_components)
>  	drm->mode_config.funcs = &ingenic_drm_mode_config_funcs;
>  	drm->mode_config.helper_private = &ingenic_drm_mode_config_helpers;
> 
> -	base = devm_platform_ioremap_resource(pdev, 0);
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(base)) {
>  		dev_err(dev, "Failed to get memory resource\n");
>  		return PTR_ERR(base);
>  	}
> 
> +	regmap_config = ingenic_drm_regmap_config;
> +	regmap_config.max_register = res->end - res->start - 4;
>  	priv->map = devm_regmap_init_mmio(dev, base,
> -					  &ingenic_drm_regmap_config);
> +					  &regmap_config);
>  	if (IS_ERR(priv->map)) {
>  		dev_err(dev, "Failed to create regmap\n");
>  		return PTR_ERR(priv->map);
> --
> 2.33.0
> 
> 


