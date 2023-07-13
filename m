Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97828752C20
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jul 2023 23:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjGMVdL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Jul 2023 17:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjGMVdK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Jul 2023 17:33:10 -0400
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFF8136
        for <linux-mips@vger.kernel.org>; Thu, 13 Jul 2023 14:33:06 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id K3vqqm37nPm6CK3vrqDoAv; Thu, 13 Jul 2023 23:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689283985; bh=l0rBPT+BLZnp/FmHagZlEIeRorwJzQsZQQXJyG7/tWU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=FO00E6hHiHa+KRS7TjufzJG/4B7Js4h1SYqkm7NO6bRJSd3KPVy26xXs3eDCkACiA
         NEy8mggJGk1xWHlh/D0lm2eWGjYkUVCw1pmfa68cp8XzpgE76RtRpimyt0TeOXZtdq
         CbaOU+hB0HEiKjoto0XJS5aFV9qoZNf4wmUeIzw8BIWX6NQpSeuz49husQrzTH4brF
         Vi8rd7LZLNAXm76vxHzs0I4QKG0jmRwGNAy1BThWLPFJmPWJWT+1YpzWFbPdXlcXth
         oPSGJztA12fxjx7F0FQr4fUh4UvvUJfTejt6ev+AZyPXo4AgSFErIHrWVNv8381eIw
         yB+0y98C4+KpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689283985; bh=l0rBPT+BLZnp/FmHagZlEIeRorwJzQsZQQXJyG7/tWU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=FO00E6hHiHa+KRS7TjufzJG/4B7Js4h1SYqkm7NO6bRJSd3KPVy26xXs3eDCkACiA
         NEy8mggJGk1xWHlh/D0lm2eWGjYkUVCw1pmfa68cp8XzpgE76RtRpimyt0TeOXZtdq
         CbaOU+hB0HEiKjoto0XJS5aFV9qoZNf4wmUeIzw8BIWX6NQpSeuz49husQrzTH4brF
         Vi8rd7LZLNAXm76vxHzs0I4QKG0jmRwGNAy1BThWLPFJmPWJWT+1YpzWFbPdXlcXth
         oPSGJztA12fxjx7F0FQr4fUh4UvvUJfTejt6ev+AZyPXo4AgSFErIHrWVNv8381eIw
         yB+0y98C4+KpA==
Date:   Thu, 13 Jul 2023 23:33:00 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] usb: dwc3: dwc3-octeon: Convert to glue driver
Message-ID: <ZLBtjPQp9LzE0Ger@lenoch>
References: <ZKDBiY6TKdDKIFK+@lenoch>
 <ZKDBxnAulDCQCgVX@lenoch>
 <20230705232541.wsutfrdx5ltp4rw3@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705232541.wsutfrdx5ltp4rw3@synopsys.com>
X-CMAE-Envelope: MS4wfLwduUeVkOTYiJX7izPmSEynRZ/Fc+StHiz2X3D+BpQTYg6prgXWvljRiZ8i8pFU6BVkq0XU7eLvLeCQ1WX0dWsHwdQJbqjHuQj4m3F13Zq5BOReJEsN
 aorYa9yC15Ra2jXCQxKD5s2DB+jrvWRdd9OeTFftEbyyw27j5a/oGC5igKoML5oYy7pS4MFmojwsbNmyxDExY1/nguV7/B12M84LUZ6FFMZ7geT4sQDl72/t
 AWJ9c5rNqG0uli47D7bkr8ZFsXKgJELOJtUHvhFyBulFTZhrrY9QGbcR5FdpaNH398cgUQlHFMatyoyXMJY39+5ZrsF0OxXjTnY0TGDq1NLyd5oahaSY0CFI
 rjE8Idve
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 05, 2023 at 11:25:46PM +0000, Thinh Nguyen wrote:
> On Sun, Jul 02, 2023, Ladislav Michl wrote:
> > From: Ladislav Michl <ladis@linux-mips.org>
> > 
> > Move Octeon DWC3 glue code from arch/mips and use it
> > instead of dwc3-of-simple.
> 
> Please provide more context and the reason to why the move here.
> 
> > 
> > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> > Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> >  CHANGES:
> >  - v2: squashed move and glue conversion patch, fixed sparse warning
> >        and formatting issue. Set private data at the end of probe.
> >        Clear drvdata on remove. Added host mode only notice.
> >        Collected ack for move from arch/mips.
> > 
> >  arch/mips/cavium-octeon/Makefile              |   1 -
> >  arch/mips/cavium-octeon/octeon-platform.c     |   1 -
> >  drivers/usb/dwc3/Kconfig                      |  10 ++
> >  drivers/usb/dwc3/Makefile                     |   1 +
> >  .../usb/dwc3/dwc3-octeon.c                    | 108 ++++++++++--------
> >  drivers/usb/dwc3/dwc3-of-simple.c             |   1 -
> >  6 files changed, 69 insertions(+), 53 deletions(-)
> >  rename arch/mips/cavium-octeon/octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c (91%)
> > 
> > diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/Makefile
> > index 7c02e542959a..2a5926578841 100644
> > --- a/arch/mips/cavium-octeon/Makefile
> > +++ b/arch/mips/cavium-octeon/Makefile
> > @@ -18,4 +18,3 @@ obj-y += crypto/
> >  obj-$(CONFIG_MTD)		      += flash_setup.o
> >  obj-$(CONFIG_SMP)		      += smp.o
> >  obj-$(CONFIG_OCTEON_ILM)	      += oct_ilm.o
> > -obj-$(CONFIG_USB)		      += octeon-usb.o
> > diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
> > index ce05c0dd3acd..235c77ce7b18 100644
> > --- a/arch/mips/cavium-octeon/octeon-platform.c
> > +++ b/arch/mips/cavium-octeon/octeon-platform.c
> > @@ -450,7 +450,6 @@ static const struct of_device_id octeon_ids[] __initconst = {
> >  	{ .compatible = "cavium,octeon-3860-bootbus", },
> >  	{ .compatible = "cavium,mdio-mux", },
> >  	{ .compatible = "gpio-leds", },
> > -	{ .compatible = "cavium,octeon-7130-usb-uctl", },
> >  	{},
> >  };
> >  
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index be954a9abbe0..98efcbb76c88 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -168,4 +168,14 @@ config USB_DWC3_AM62
> >  	  The Designware Core USB3 IP is programmed to operate in
> >  	  in USB 2.0 mode only.
> >  	  Say 'Y' or 'M' here if you have one such device
> > +
> > +config USB_DWC3_OCTEON
> > +	tristate "Cavium Octeon Platforms"
> > +	depends on CAVIUM_OCTEON_SOC || COMPILE_TEST
> > +	default USB_DWC3
> > +	help
> > +	  Support Cavium Octeon platforms with DesignWare Core USB3 IP.
> > +	  Only the host mode is currently supported.
> > +	  Say 'Y' or 'M' here if you have one such device.
> > +
> >  endif
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 9f66bd82b639..fe1493d4bbe5 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -54,3 +54,4 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
> >  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
> >  obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> >  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
> > +obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
> > diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/drivers/usb/dwc3/dwc3-octeon.c
> > similarity index 91%
> > rename from arch/mips/cavium-octeon/octeon-usb.c
> > rename to drivers/usb/dwc3/dwc3-octeon.c
> > index 2add435ad038..8d5facd881c1 100644
> > --- a/arch/mips/cavium-octeon/octeon-usb.c
> > +++ b/drivers/usb/dwc3/dwc3-octeon.c
> > @@ -187,7 +187,10 @@
> >  #define USBDRD_UCTL_ECC				0xf0
> >  #define USBDRD_UCTL_SPARE1			0xf8
> >  
> > -static DEFINE_MUTEX(dwc3_octeon_clocks_mutex);
> > +struct dwc3_data {
> > +	struct device *dev;
> > +	void __iomem *base;
> > +};
> >  
> >  #ifdef CONFIG_CAVIUM_OCTEON_SOC
> >  #include <asm/octeon/octeon.h>
> > @@ -233,6 +236,11 @@ static inline uint64_t dwc3_octeon_readq(void __iomem *addr)
> >  static inline void dwc3_octeon_writeq(void __iomem *base, uint64_t val) { }
> >  
> >  static inline void dwc3_octeon_config_gpio(int index, int gpio) { }
> > +
> > +static uint64_t octeon_get_io_clock_rate(void)
> > +{
> > +	return 150000000;
> > +}
> >  #endif
> >  
> >  static int dwc3_octeon_get_divider(void)
> > @@ -271,7 +279,7 @@ static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
> >  			dev_err(dev, "invalid power configuration\n");
> >  			return -EINVAL;
> >  		}
> > -		dwc3_octeon_config_gpio(((u64)base >> 24) & 1, gpio);
> > +		dwc3_octeon_config_gpio(((__force u64)base >> 24) & 1, gpio);
> 
> You're doing more than just moving the code here. Please separate the
> change to a different patch if there are additional functional change
> and provide the reason for it.

Is it okay to move file with sparse warning or am I supposed to fix it
in the arch code first?

> >  
> >  		/* Enable XHCI power control and set if active high or low. */
> >  		val = dwc3_octeon_readq(uctl_host_cfg_reg);
> > @@ -383,7 +391,7 @@ static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
> >  	if ((div != FIELD_GET(USBDRD_UCTL_CTL_H_CLKDIV_SEL, val)) ||
> >  	    (!(FIELD_GET(USBDRD_UCTL_CTL_H_CLK_EN, val)))) {
> >  		dev_err(dev, "dwc3 controller clock init failure.\n");
> > -			return -EINVAL;
> > +		return -EINVAL;
> 
> Avoid mixing cleanup change with functional change.

I'll just drop it, not worth separate patch.

> >  	}
> >  
> >  	/* Step 4c: Deassert the controller clock divider reset. */
> > @@ -494,58 +502,58 @@ static void __init dwc3_octeon_phy_reset(void __iomem *base)
> >  	dwc3_octeon_writeq(uctl_ctl_reg, val);
> >  }
> >  
> > -static int __init dwc3_octeon_device_init(void)
> > +static int dwc3_octeon_probe(struct platform_device *pdev)
> >  {
> > -	const char compat_node_name[] = "cavium,octeon-7130-usb-uctl";
> > -	struct platform_device *pdev;
> > -	struct device_node *node;
> > -	struct resource *res;
> > -	void __iomem *base;
> > +	struct device *dev = &pdev->dev;
> > +	struct dwc3_data *data;
> > +	int err;
> >  
> > -	/*
> > -	 * There should only be three universal controllers, "uctl"
> > -	 * in the device tree. Two USB and a SATA, which we ignore.
> > -	 */
> > -	node = NULL;
> > -	do {
> > -		node = of_find_node_by_name(node, "uctl");
> > -		if (!node)
> > -			return -ENODEV;
> > -
> > -		if (of_device_is_compatible(node, compat_node_name)) {
> > -			pdev = of_find_device_by_node(node);
> > -			if (!pdev)
> > -				return -ENODEV;
> > -
> > -			/*
> > -			 * The code below maps in the registers necessary for
> > -			 * setting up the clocks and reseting PHYs. We must
> > -			 * release the resources so the dwc3 subsystem doesn't
> > -			 * know the difference.
> > -			 */
> > -			base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > -			if (IS_ERR(base)) {
> > -				put_device(&pdev->dev);
> > -				return PTR_ERR(base);
> > -			}
> > +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> >  
> > -			mutex_lock(&dwc3_octeon_clocks_mutex);
> > -			if (dwc3_octeon_clocks_start(&pdev->dev, base) == 0)
> > -				dev_info(&pdev->dev, "clocks initialized.\n");
> > -			dwc3_octeon_set_endian_mode(base);
> > -			dwc3_octeon_phy_reset(base);
> > -			mutex_unlock(&dwc3_octeon_clocks_mutex);
> > -			devm_iounmap(&pdev->dev, base);
> > -			devm_release_mem_region(&pdev->dev, res->start,
> > -						resource_size(res));
> > -			put_device(&pdev->dev);
> > -		}
> > -	} while (node != NULL);
> > +	data->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(data->base))
> > +		return PTR_ERR(data->base);
> >  
> > -	return 0;
> > +	err = dwc3_octeon_clocks_start(dev, data->base);
> > +	if (err)
> > +		return err;
> > +
> > +	dwc3_octeon_set_endian_mode(data->base);
> > +	dwc3_octeon_phy_reset(data->base);
> > +
> > +	data->dev = dev;
> > +	platform_set_drvdata(pdev, data);
> > +
> > +	return of_platform_populate(node, NULL, NULL, dev);
> > +}
> > +
> > +static void dwc3_octeon_remove(struct platform_device *pdev)
> > +{
> > +	struct dwc3_data *data = platform_get_drvdata(pdev);
> > +
> > +	of_platform_depopulate(data->dev);
> > +	platform_set_drvdata(pdev, NULL);
> >  }
> > -device_initcall(dwc3_octeon_device_init);
> >  
> > +static const struct of_device_id dwc3_octeon_of_match[] = {
> > +	{ .compatible = "cavium,octeon-7130-usb-uctl" },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_octeon_of_match);
> > +
> > +static struct platform_driver dwc3_octeon_driver = {
> > +	.probe		= dwc3_octeon_probe,
> > +	.remove_new	= dwc3_octeon_remove,
> > +	.driver		= {
> > +		.name	= "dwc3-octeon",
> > +		.of_match_table = dwc3_octeon_of_match,
> > +	},
> > +};
> > +module_platform_driver(dwc3_octeon_driver);
> > +
> > +MODULE_ALIAS("platform:dwc3-octeon");
> >  MODULE_AUTHOR("David Daney <david.daney@cavium.com>");
> >  MODULE_LICENSE("GPL");
> > -MODULE_DESCRIPTION("USB driver for OCTEON III SoC");
> > +MODULE_DESCRIPTION("DesignWare USB3 OCTEON III Glue Layer");
> > diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
> > index 71fd620c5161..e3423fbea3ed 100644
> > --- a/drivers/usb/dwc3/dwc3-of-simple.c
> > +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> > @@ -172,7 +172,6 @@ static const struct dev_pm_ops dwc3_of_simple_dev_pm_ops = {
> >  
> >  static const struct of_device_id of_dwc3_simple_match[] = {
> >  	{ .compatible = "rockchip,rk3399-dwc3" },
> > -	{ .compatible = "cavium,octeon-7130-usb-uctl" },
> >  	{ .compatible = "sprd,sc9860-dwc3" },
> >  	{ .compatible = "allwinner,sun50i-h6-dwc3" },
> >  	{ .compatible = "hisilicon,hi3670-dwc3" },
> > -- 
> > 2.39.2
> > 
> 
> Thanks,
> Thinh
