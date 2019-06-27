Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC6257ED5
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2019 11:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfF0JBI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Jun 2019 05:01:08 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40435 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfF0JBI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Jun 2019 05:01:08 -0400
Received: by mail-wr1-f65.google.com with SMTP id p11so1580626wre.7
        for <linux-mips@vger.kernel.org>; Thu, 27 Jun 2019 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5yFNTNnYD7AZEAM6W7oabAyA0yimjLZpguXQ1Xm49Vg=;
        b=CFDV7CfOV2SJdhiXOFJzFWZSUa0+9azsQyqHbGb7JaZXEDNJu8G2ggwXsoYG3y4bO5
         XZ/xytS6NhoXMe4CGyOJJJb4Yh5oiKRvnutFxuTF7cAGAWgpGKVKfQO0hF8C4+/tYgp8
         JIC1qwS2jv4/Tgx9+jAOkpknvbQLJ9l2YxGmw6fVAWVcNNMBM48Fo0xR5J1IdAwXZP3M
         blnKXig95Q662W+6nfZiuQF33YMrYt+aYM+F4/E1wmrGxb735SjeB4hLbhWIK4PEvqCn
         NA7jrdITJCqAxOvcnMlNy/Ja8U4woLp0e5xeYc8LAKSykNOTwTv7qS5lteHyjGW/juTD
         eI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5yFNTNnYD7AZEAM6W7oabAyA0yimjLZpguXQ1Xm49Vg=;
        b=CZSVh+hzdcGpnB3evnOZ8iMID8z6wqTKYf15WLSMkEsErPNqPUt6kXXXE+31CwHCqV
         I/JGhxlijl0Vj0Y+zVSouLb2XqzucHKKyxASdyW/DJr2gToK2loR3Kzmqr7TB0on8mZC
         EWxbQW1a8ci4QcaLrqedfnELJU+ThmdT7KKxj95/57Pn61DAh6u4sB2jIlQpsm35KIu5
         cbvK7fnFYk8BJh/BJU3LzUnETZjZir2m/gARPJvLdEsdZ+DkaHfOtd6yn2d77cA5RW7O
         5/1XKibKWQ0kjONnUW+FH1LlHxLMUUtseKL5FYVGpxDtO+QzLXncKuSK1PKMFcHQ4bmQ
         Zg7Q==
X-Gm-Message-State: APjAAAUT6ruzKPbX+R8E84JUWXR0cW8wgJF+S6V3yB4DFULLTBZ6T6w3
        YSLtqEB+Vtol0WyoCWOw1hBS0Q==
X-Google-Smtp-Source: APXvYqzstXSmcKcm/aUFC5bedh0bUG3qltP+jnjnJm3BgcuiWoAt0Fg1yN82dJApydf41ZpPu5vZtg==
X-Received: by 2002:a5d:6b90:: with SMTP id n16mr2328097wrx.206.1561626064958;
        Thu, 27 Jun 2019 02:01:04 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id g123sm1063998wme.12.2019.06.27.02.01.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2019 02:01:04 -0700 (PDT)
Date:   Thu, 27 Jun 2019 10:01:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mathieu Malaterre <malat@debian.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me
Subject: Re: [PATCH v12 04/13] mfd: Add Ingenic TCU driver
Message-ID: <20190627090102.GA2000@dell>
References: <20190521145141.9813-1-paul@crapouillou.net>
 <20190521145141.9813-5-paul@crapouillou.net>
 <20190626131850.GW21119@dell>
 <1561557350.1872.0@crapouillou.net>
 <20190627065808.GY21119@dell>
 <1561625387.1745.0@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1561625387.1745.0@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 27 Jun 2019, Paul Cercueil wrote:
> Le jeu. 27 juin 2019 à 8:58, Lee Jones <lee.jones@linaro.org> a écrit :
> > On Wed, 26 Jun 2019, Paul Cercueil wrote:
> > >  Le mer. 26 juin 2019 à 15:18, Lee Jones <lee.jones@linaro.org> a
> > > écrit :
> > >  > On Tue, 21 May 2019, Paul Cercueil wrote:
> > >  >
> > >  > >  This driver will provide a regmap that can be retrieved very
> > > early
> > >  > > in
> > >  > >  the boot process through the API function
> > > ingenic_tcu_get_regmap().
> > >  > >
> > >  > >  Additionally, it will call devm_of_platform_populate() so that
> > > all
> > >  > > the
> > >  > >  children devices will be probed.
> > >  > >
> > >  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > >  > >  ---
> > >  > >
> > >  > >  Notes:
> > >  > >      v12: New patch
> > >  > >
> > >  > >   drivers/mfd/Kconfig             |   8 +++
> > >  > >   drivers/mfd/Makefile            |   1 +
> > >  > >   drivers/mfd/ingenic-tcu.c       | 113
> > >  > > ++++++++++++++++++++++++++++++++
> > >  > >   include/linux/mfd/ingenic-tcu.h |   8 +++
> > >  > >   4 files changed, 130 insertions(+)
> > >  > >   create mode 100644 drivers/mfd/ingenic-tcu.c
> > 
> > [...]
> > 
> > >  > >  +static struct regmap * __init ingenic_tcu_create_regmap(struct
> > >  > > device_node *np)
> > >  > >  +{
> > >  > >  +	struct resource res;
> > >  > >  +	void __iomem *base;
> > >  > >  +	struct regmap *map;
> > >  > >  +
> > >  > >  +	if (!of_match_node(ingenic_tcu_of_match, np))
> > >  > >  +		return ERR_PTR(-EINVAL);
> > 
> > Drop this check.
> > 
> > >  > >  +	base = of_io_request_and_map(np, 0, "TCU");
> > >  > >  +	if (IS_ERR(base))
> > >  > >  +		return ERR_PTR(PTR_ERR(base));
> > >  > >  +
> > >  > >  +	map = regmap_init_mmio(NULL, base,
> > > &ingenic_tcu_regmap_config);
> > >  > >  +	if (IS_ERR(map))
> > >  > >  +		goto err_iounmap;
> > 
> > Place this inside probe().
> > 
> > >  > >  +	return map;
> > >  > >  +
> > >  > >  +err_iounmap:
> > >  > >  +	iounmap(base);
> > >  > >  +	of_address_to_resource(np, 0, &res);
> > >  > >  +	release_mem_region(res.start, resource_size(&res));
> > >  > >  +
> > >  > >  +	return map;
> > >  > >  +}
> > >  >
> > >  > Why does this need to be set-up earlier than probe()?
> > > 
> > >  See the explanation below.
> > 
> > I think the answer is, it doesn't.
> > 
> > >  > >  +static int __init ingenic_tcu_probe(struct platform_device
> > > *pdev)
> > >  > >  +{
> > >  > >  +	struct regmap *map =
> > > ingenic_tcu_get_regmap(pdev->dev.of_node);
> > >  > >  +
> > >  > >  +	platform_set_drvdata(pdev, map);
> > >  > >  +
> > >  > >  +	regmap_attach_dev(&pdev->dev, map,
> > > &ingenic_tcu_regmap_config);
> > >  > >  +
> > >  > >  +	return devm_of_platform_populate(&pdev->dev);
> > >  > >  +}
> > >  > >  +
> > >  > >  +static struct platform_driver ingenic_tcu_driver = {
> > >  > >  +	.driver = {
> > >  > >  +		.name = "ingenic-tcu",
> > >  > >  +		.of_match_table = ingenic_tcu_of_match,
> > >  > >  +	},
> > >  > >  +};
> > >  > >  +
> > >  > >  +static int __init ingenic_tcu_platform_init(void)
> > >  > >  +{
> > >  > >  +	return platform_driver_probe(&ingenic_tcu_driver,
> > >  > >  +				     ingenic_tcu_probe);
> > >  >
> > >  > What?  Why?
> > > 
> > >  The device driver probed here will populate the children devices,
> > >  which will be able to retrieve the pointer to the regmap through
> > >  device_get_regmap(dev->parent).
> > 
> > I've never heard of this call.  Where is it?
> 
> dev_get_regmap, in <linux/regmap.h>.
> 
> > >  The children devices are normal platform drivers that can be probed
> > >  the normal way. These are the PWM driver, the watchdog driver, and
> > > the
> > >  OST (OS Timer) clocksource driver, all part of the same hardware
> > > block
> > >  (the Timer/Counter Unit or TCU).
> > 
> > If they are normal devices, then there is no need to roll your own
> > regmap-getter implementation like this.
> > 
> > >  > >  +}
> > >  > >  +subsys_initcall(ingenic_tcu_platform_init);
> > >  > >  +
> > >  > >  +struct regmap * __init ingenic_tcu_get_regmap(struct
> > > device_node
> > >  > > *np)
> > >  > >  +{
> > >  > >  +	if (!tcu_regmap)
> > >  > >  +		tcu_regmap = ingenic_tcu_create_regmap(np);
> > >  > >  +
> > >  > >  +	return tcu_regmap;
> > >  > >  +}
> > >  >
> > >  > This makes me pretty uncomfortable.
> > >  >
> > >  > What calls it?
> > > 
> > >  The TCU IRQ driver (patch [06/13]), clocks driver (patch [05/13]),
> > > and the
> > >  non-OST clocksource driver (patch [07/13]) all probe very early in
> > > the boot
> > >  process, and share the same devicetree node. They call this
> > > function to get
> > >  a pointer to the regmap.
> > 
> > Horrible!
> > 
> > Instead, you should send it through platform_set_drvdata() and collect
> > it in the child drivers with platform_get_drvdata(dev->parent).
> 
> The IRQ, clocks and clocksource driver do NOT have a "struct device" to
> begin with. They are not platform drivers, and cannot be platform drivers,
> as they must register so early in the boot process, before "struct device"
> is even a thing.
> 
> All they get is a pointer to the same devicetree node. Since all of these
> have to use the same registers, they need to use a shared regmap, which
> they obtain by calling ingenic_tcu_get_regmap() below.
> 
> Then, when this driver's probe gets called, the regmap is retrieved and
> attached to the struct device, and then the children devices will be
> probed: the watchdog device, the PWM device, the OST device. These three
> will retrieve the regmap by calling dev_get_regmap(dev->parent, NULL).

That makes sense.

This explanation certainly belongs in the commit log.

Can you send your v14, as you intended.  I will re-review it with new
eyes when you do.

> > >  > >  +bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned
> > > int
> > >  > > channel)
> > >  > >  +{
> > >  > >  +	const struct ingenic_soc_info *soc =
> > >  > > device_get_match_data(dev->parent);
> > >  > >  +
> > >  > >  +	/* Enable all TCU channels for PWM use by default except
> > > channels
> > >  > > 0/1 */
> > >  > >  +	u32 pwm_channels_mask = GENMASK(soc->num_channels - 1, 2);
> > >  > >  +
> > >  > >  +	device_property_read_u32(dev->parent,
> > > "ingenic,pwm-channels-mask",
> > >  > >  +				 &pwm_channels_mask);
> > 
> > Doesn't this call overwrite the previous assignment above?
> 
> Yes, that's intended. You have a default value, that can be overriden
> by a device property.

You should provide a comment here to make your intentions clear.

> > >  > >  +	return !!(pwm_channels_mask & BIT(channel));
> > >  > >  +}
> > >  > >  +EXPORT_SYMBOL_GPL(ingenic_tcu_pwm_can_use_chn);
> > 
> > Where is this called from?
> 
> This is called from the PWM driver.

Why can't it live in the PWM driver?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
