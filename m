Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCAD76A867
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 07:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbjHAFjC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Aug 2023 01:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbjHAFi7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Aug 2023 01:38:59 -0400
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D67268D
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 22:38:06 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id Qi4fq9CPRv5uIQi4hqF4AB; Tue, 01 Aug 2023 07:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690868260; bh=iujVlxm/IrZlWPJc0HtVaxrKxQuaUsBouaX/p49s9QE=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=IDghlKbdm6VXSjqYUwecHH6swodjVviBI0dZmxOr47NwNcSGd6Vg63xl6E334QqOr
         gREYtwsq6A4WFMkTxOlJOYGkdSynp3yBFkW/wD4PRUw1XbyTStDBctOtMzwj6d4Bmg
         Yw5cuV7bw3YeO/XA1Y1F5S+y6wFPnm7PbdUpZDnweUzU5iG/k9aXKCNzs5fVq70X20
         TJSOmR3dOMiS1FIU948OeFbxchuLELaz+g20m414pz5CpdJ0Y5soGQt3uYXaS7+VAw
         1+KKXW1iU694/TV0/uvK4zNYBdEU15hRKQwxoLBgm8hlpet6DH7pGTJoQOAMg8uLlU
         I9BGyuyYVvrKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690868260; bh=iujVlxm/IrZlWPJc0HtVaxrKxQuaUsBouaX/p49s9QE=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=IDghlKbdm6VXSjqYUwecHH6swodjVviBI0dZmxOr47NwNcSGd6Vg63xl6E334QqOr
         gREYtwsq6A4WFMkTxOlJOYGkdSynp3yBFkW/wD4PRUw1XbyTStDBctOtMzwj6d4Bmg
         Yw5cuV7bw3YeO/XA1Y1F5S+y6wFPnm7PbdUpZDnweUzU5iG/k9aXKCNzs5fVq70X20
         TJSOmR3dOMiS1FIU948OeFbxchuLELaz+g20m414pz5CpdJ0Y5soGQt3uYXaS7+VAw
         1+KKXW1iU694/TV0/uvK4zNYBdEU15hRKQwxoLBgm8hlpet6DH7pGTJoQOAMg8uLlU
         I9BGyuyYVvrKw==
Date:   Tue, 1 Aug 2023 07:37:37 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 4/7] usb: dwc3: dwc3-octeon: Avoid half-initialized
 controller state
Message-ID: <ZMiaIUy6d5gVl7mA@lenoch>
References: <ZMd/HzISn0mPsNWt@lenoch>
 <ZMd/oMRx8ze22/kK@lenoch>
 <20230801003838.ifbydrbwq34df3n3@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801003838.ifbydrbwq34df3n3@synopsys.com>
X-CMAE-Envelope: MS4wfNSHklKXjkZP8eU+6tWiynGKJ5+rzw1I4xZP/eMdMSIs54HDpgJ/gsrWEusZQdaYj91Tppx4Uzlc5Vnefwbz3aN6682OZU82rVsQQQQSg7u9yRgxViOT
 xOFytjTC3NTJwWQcYvncUlddi2YerpmLkupVoljbjsqYgjvT/0SSdz5TXhadtjs2Kolxov6QVLryRmHqdcJM0csj0gYTiEmv38PaZSpqowNhWwszK3JLsxXY
 zFLSpJgIfYQB1uVQKffGAEeD5AwJS8knbvzc/DrWcKH10NpbhXawhhonEh6Ze3U3PZm7TBOKKVy1fvHFgL+BPjYThNhkfUwqS2QsMaFkihpYezOoQg0ZiFqG
 SEIQdOvC
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 01, 2023 at 12:38:43AM +0000, Thinh Nguyen wrote:
> On Mon, Jul 31, 2023, Ladislav Michl wrote:
> > From: Ladislav Michl <ladis@linux-mips.org>
> > 
> > Power gpio configuration is done from the middle of
> > dwc3_octeon_clocks_start leaving hardware in half-initialized
> > state if it fails. As that indicates dwc3_octeon_clocks_start
> > does more than just initialize the clocks rename it appropriately
> > and verify power gpio configuration in advance at the beginning
> > of device probe.
> > 
> > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> > ---
> >  CHANGES:
> >  - v4: new patch
> >  - v5: use uintptr_t instead of u64 to retype base address to make 32bit
> >        compilers happy.
> > 
> >  drivers/usb/dwc3/dwc3-octeon.c | 90 ++++++++++++++++------------------
> >  1 file changed, 43 insertions(+), 47 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
> > index 24e75881b5cf..0dc45dda134c 100644
> > --- a/drivers/usb/dwc3/dwc3-octeon.c
> > +++ b/drivers/usb/dwc3/dwc3-octeon.c
> > @@ -192,6 +192,8 @@ struct dwc3_octeon {
> >  	void __iomem *base;
> >  };
> >  
> > +#define DWC3_GPIO_POWER_NONE	(-1)
> > +
> >  #ifdef CONFIG_CAVIUM_OCTEON_SOC
> >  #include <asm/octeon/octeon.h>
> >  static inline uint64_t dwc3_octeon_readq(void __iomem *addr)
> > @@ -258,55 +260,15 @@ static int dwc3_octeon_get_divider(void)
> >  	return div;
> >  }
> >  
> > -static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
> > -{
> > -	uint32_t gpio_pwr[3];
> > -	int gpio, len, power_active_low;
> > -	struct device_node *node = dev->of_node;
> > -	u64 val;
> > -	void __iomem *uctl_host_cfg_reg = base + USBDRD_UCTL_HOST_CFG;
> > -
> > -	if (of_find_property(node, "power", &len) != NULL) {
> > -		if (len == 12) {
> > -			of_property_read_u32_array(node, "power", gpio_pwr, 3);
> > -			power_active_low = gpio_pwr[2] & 0x01;
> > -			gpio = gpio_pwr[1];
> > -		} else if (len == 8) {
> > -			of_property_read_u32_array(node, "power", gpio_pwr, 2);
> > -			power_active_low = 0;
> > -			gpio = gpio_pwr[1];
> > -		} else {
> > -			dev_err(dev, "invalid power configuration\n");
> > -			return -EINVAL;
> > -		}
> > -		dwc3_octeon_config_gpio(((u64)base >> 24) & 1, gpio);
> > -
> > -		/* Enable XHCI power control and set if active high or low. */
> > -		val = dwc3_octeon_readq(uctl_host_cfg_reg);
> > -		val |= USBDRD_UCTL_HOST_PPC_EN;
> > -		if (power_active_low)
> > -			val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
> > -		else
> > -			val |= USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
> > -		dwc3_octeon_writeq(uctl_host_cfg_reg, val);
> > -	} else {
> > -		/* Disable XHCI power control and set if active high. */
> > -		val = dwc3_octeon_readq(uctl_host_cfg_reg);
> > -		val &= ~USBDRD_UCTL_HOST_PPC_EN;
> > -		val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
> > -		dwc3_octeon_writeq(uctl_host_cfg_reg, val);
> > -		dev_info(dev, "power control disabled\n");
> > -	}
> > -	return 0;
> > -}
> > -
> > -static int dwc3_octeon_clocks_start(struct dwc3_octeon *octeon)
> > +static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
> > +			     int power_gpio, int power_active_low)
> >  {
> >  	int i, div, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
> >  	u32 clock_rate;
> >  	u64 val;
> >  	struct device *dev = octeon->dev;
> >  	void __iomem *uctl_ctl_reg = octeon->base + USBDRD_UCTL_CTL;
> > +	void __iomem *uctl_host_cfg_reg = octeon->base + USBDRD_UCTL_HOST_CFG;
> >  
> >  	if (dev->of_node) {
> >  		const char *ss_clock_type;
> > @@ -454,8 +416,21 @@ static int dwc3_octeon_clocks_start(struct dwc3_octeon *octeon)
> >  	udelay(10);
> >  
> >  	/* Step 8c: Setup power control. */
> > -	if (dwc3_octeon_config_power(dev, octeon->base))
> > -		return -EINVAL;
> > +	val = dwc3_octeon_readq(uctl_host_cfg_reg);
> > +	val |= USBDRD_UCTL_HOST_PPC_EN;
> > +	if (power_gpio == DWC3_GPIO_POWER_NONE) {
> > +		val &= ~USBDRD_UCTL_HOST_PPC_EN;
> > +	} else {
> > +		val |= USBDRD_UCTL_HOST_PPC_EN;
> > +		dwc3_octeon_config_gpio(((__force uintptr_t)octeon->base >> 24) & 1,
> > +					power_gpio);
> 
> Let's not cast it like this. It's not readable. Make the logic
> intentional and clear:
> e.g.: int index = !!(octeon->base & BIT(24));
> dwc3_octeon_config_gpio(index, power_gpio);

I'd prefer to stick with original code.

> It's odd that the "index" is being used as boolean here.
>
> Regardless, I don't know what this magic offset BIT(24) means. If
> there's some context, then you can refactor the
> dwc3_octeon_config_gpio() as below:

Context is a bit scary and perhaps could be documented as described later.

> dwc3_octeon_config_gpio(power_gpio, is_bit24) where "is_bit24" is some
> other meaningful boolean name.

As there is no pinctrl driver for octeon, configuration is done here.
There are two UCTLs: at 0x1180068000000 and second at 0x1180069000000.
We are just using bit 24 to distiguish between them. No matter how you
rewrite this function, it is still horrible hack and making it "nice"
does not solve anything. For that reason I stick with original code as
there is no point touching anything that just should not exist.

Once Octeon gets its pinctlr driver, this function will disapear
altogether. The very same is true for clock parsing - there is no clk api.

But note that might as well never happen as documentation is under NDA
and I have it only for single SoC as well as I have only single SoC
available for testing, so it is quite hard to write proper drivers
without breaking anything.

Anyway, what about just passing octeon into dwc3_octeon_config_gpio
and use all that dirty magic inside. Would that work work for you?

> > +		dev_dbg(dev, "power control is using gpio%d\n", power_gpio);
> > +	}
> > +	if (power_active_low)
> > +		val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
> > +	else
> > +		val |= USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
> > +	dwc3_octeon_writeq(uctl_host_cfg_reg, val);
> >  
> >  	/* Step 8d: Deassert UAHC reset signal. */
> >  	val = dwc3_octeon_readq(uctl_ctl_reg);
> > @@ -508,7 +483,28 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *node = dev->of_node;
> >  	struct dwc3_octeon *octeon;
> > -	int err;
> > +	int power_active_low, power_gpio;
> > +	int err, len;
> > +
> > +	power_gpio = DWC3_GPIO_POWER_NONE;
> > +	power_active_low = 0;
> > +	if (of_find_property(node, "power", &len)) {
> > +		u32 gpio_pwr[3];
> > +
> > +		switch (len) {
> > +		case 8:
> > +			of_property_read_u32_array(node, "power", gpio_pwr, 2);
> > +			break;
> > +		case 12:
> > +			of_property_read_u32_array(node, "power", gpio_pwr, 3);
> > +			power_active_low = gpio_pwr[2] & 0x01;
> 
> It would be better for these magic numbers (e.g. 0x01) to be written in
> macros or at least documented in the future. That update can be done in
> a separate commit in the future.

Sure. In the future, this should just wanish as noted above.

> > +			break;
> > +		default:
> > +			dev_err(dev, "invalid power configuration\n");
> > +			return -EINVAL;
> > +		}
> > +		power_gpio = gpio_pwr[1];
> > +	}
> >  
> >  	octeon = devm_kzalloc(dev, sizeof(*octeon), GFP_KERNEL);
> >  	if (!octeon)
> > @@ -519,7 +515,7 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
> >  	if (IS_ERR(octeon->base))
> >  		return PTR_ERR(octeon->base);
> >  
> > -	err = dwc3_octeon_clocks_start(octeon);
> > +	err = dwc3_octeon_setup(octeon, power_gpio, power_active_low);
> >  	if (err)
> >  		return err;
> >  
> > -- 
> > 2.39.2
> > 
> 
> Thanks,
> Thinh
