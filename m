Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0447F752C42
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jul 2023 23:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbjGMVhl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Jul 2023 17:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjGMVhk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Jul 2023 17:37:40 -0400
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8A12705
        for <linux-mips@vger.kernel.org>; Thu, 13 Jul 2023 14:37:37 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id K40EqqwnQv5uIK40FqaZWI; Thu, 13 Jul 2023 23:37:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689284256; bh=iDPVub+KKpn1ANzg5PkPC252fE7qrXd2YD5EGrv5mc8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=icqm5yR2W6Yc/qsq2onM0HTF4MYAy35bDhlbeMyYiZbv6livDuOjP2GPlkqIrBBc1
         tRDDay/PjiZLEp4klWQ44mGyvvtUXCZBAu125KEEXxDNI9r56e7eLZF9JzZ4PK6FDk
         K5PTClsY7oKDHzPktM97m2BtDED2S71tHakDj2hoQzKBOt1OHEx9jAtXwu8g9SDAzT
         aX8VHZewDmIrphvE2PgG7jqvQy9HnSlndD1YbW+B0Zc8043DiJPVNMas2Y9zTq//Fo
         5F9qA8l7gth3cBHrnoLAh9Y6ckUVzOzCccLBUjRZQ0zaRR/07upOpb1zRtV7b91jJA
         u/Uzv6I72hQ6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689284256; bh=iDPVub+KKpn1ANzg5PkPC252fE7qrXd2YD5EGrv5mc8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=icqm5yR2W6Yc/qsq2onM0HTF4MYAy35bDhlbeMyYiZbv6livDuOjP2GPlkqIrBBc1
         tRDDay/PjiZLEp4klWQ44mGyvvtUXCZBAu125KEEXxDNI9r56e7eLZF9JzZ4PK6FDk
         K5PTClsY7oKDHzPktM97m2BtDED2S71tHakDj2hoQzKBOt1OHEx9jAtXwu8g9SDAzT
         aX8VHZewDmIrphvE2PgG7jqvQy9HnSlndD1YbW+B0Zc8043DiJPVNMas2Y9zTq//Fo
         5F9qA8l7gth3cBHrnoLAh9Y6ckUVzOzCccLBUjRZQ0zaRR/07upOpb1zRtV7b91jJA
         u/Uzv6I72hQ6g==
Date:   Thu, 13 Jul 2023 23:37:34 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Message-ID: <ZLBunhzPaRsFlg41@lenoch>
References: <ZKDBiY6TKdDKIFK+@lenoch>
 <ZKDB+d49HVfoZDdd@lenoch>
 <20230705230827.ckzaryaaz73sjrqb@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705230827.ckzaryaaz73sjrqb@synopsys.com>
X-CMAE-Envelope: MS4wfCcIus07gXlhNcVehH4BNpUwDi32vMOrM+rfCUnhYBgWY/LHxOJqo0E68AB9I9YOmPxK9rOTCLOWp2acrutJj33VL9SbeKlS8kODUA5HuNSAV8y0cRYQ
 ZnOE8dhKWzF16IVAb/wUFLGNMV/koFrk+9TZ3kIaVXjs3xLbbGD5RECW5oMfK+K3sav9teYjUNf9Hp0PSfnPgrXeuHlMnPyfMs6U+yM8Q4IoA6NHT47o16cP
 ZC2/rgyFtfJ6ufSCtlUsa78vgdHE8WidKMBYkoy8zfalgN+er/byZ4tdspAC4BWzAd/IXn1LCmF0+26zwAO86zesnMDG8XuR2XYIpJMxiqv9n+LPJU8Kb23O
 FijOFiDN
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 05, 2023 at 11:08:31PM +0000, Thinh Nguyen wrote:
> On Sun, Jul 02, 2023, Ladislav Michl wrote:
> > From: Ladislav Michl <ladis@linux-mips.org>
> > 
> > Make dwc3_octeon_clocks_start just start the clocks.
> 
> This commit message is different than the subject. Also, please explain
> why we need to move this logic to probe in this commit message body.
> 
> > 
> > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> > ---
> >  CHANGES:
> >  -v2: if else block bracket according CodingStyle
> >  
> >  drivers/usb/dwc3/dwc3-octeon.c | 148 ++++++++++++++++-----------------
> >  1 file changed, 71 insertions(+), 77 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
> > index 8d5facd881c1..668f6d3490b1 100644
> > --- a/drivers/usb/dwc3/dwc3-octeon.c
> > +++ b/drivers/usb/dwc3/dwc3-octeon.c
> > @@ -300,67 +300,14 @@ static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
> >  	return 0;
> >  }
> >  
> > -static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
> > +static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base,
> > +				    int ref_clk_sel, int ref_clk_fsel,
> > +				    int mpll_mul)
> >  {
> > -	int i, div, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
> > -	u32 clock_rate;
> > +	int div;
> >  	u64 val;
> >  	void __iomem *uctl_ctl_reg = base + USBDRD_UCTL_CTL;
> >  
> > -	if (dev->of_node) {
> > -		const char *ss_clock_type;
> > -		const char *hs_clock_type;
> > -
> > -		i = of_property_read_u32(dev->of_node,
> > -					 "refclk-frequency", &clock_rate);
> > -		if (i) {
> > -			dev_err(dev, "No UCTL \"refclk-frequency\"\n");
> > -			return -EINVAL;
> > -		}
> > -		i = of_property_read_string(dev->of_node,
> > -					    "refclk-type-ss", &ss_clock_type);
> > -		if (i) {
> > -			dev_err(dev, "No UCTL \"refclk-type-ss\"\n");
> > -			return -EINVAL;
> > -		}
> > -		i = of_property_read_string(dev->of_node,
> > -					    "refclk-type-hs", &hs_clock_type);
> > -		if (i) {
> > -			dev_err(dev, "No UCTL \"refclk-type-hs\"\n");
> > -			return -EINVAL;
> > -		}
> > -		if (strcmp("dlmc_ref_clk0", ss_clock_type) == 0) {
> > -			if (strcmp(hs_clock_type, "dlmc_ref_clk0") == 0)
> > -				ref_clk_sel = 0;
> > -			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
> > -				ref_clk_sel = 2;
> > -			else
> > -				dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
> > -					 hs_clock_type);
> > -		} else if (strcmp(ss_clock_type, "dlmc_ref_clk1") == 0) {
> > -			if (strcmp(hs_clock_type, "dlmc_ref_clk1") == 0)
> > -				ref_clk_sel = 1;
> > -			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
> > -				ref_clk_sel = 3;
> > -			else {
> > -				dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
> > -					 hs_clock_type);
> > -				ref_clk_sel = 3;
> > -			}
> > -		} else
> > -			dev_warn(dev, "Invalid SS clock type %s, using dlmc_ref_clk0 instead\n",
> > -				 ss_clock_type);
> > -
> > -		if ((ref_clk_sel == 0 || ref_clk_sel == 1) &&
> > -		    (clock_rate != 100000000))
> > -			dev_warn(dev, "Invalid UCTL clock rate of %u, using 100000000 instead\n",
> > -				 clock_rate);
> > -
> > -	} else {
> > -		dev_err(dev, "No USB UCTL device node\n");
> > -		return -EINVAL;
> > -	}
> > -
> >  	/*
> >  	 * Step 1: Wait for all voltages to be stable...that surely
> >  	 *         happened before starting the kernel. SKIP
> > @@ -404,24 +351,6 @@ static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
> >  	val &= ~USBDRD_UCTL_CTL_REF_CLK_SEL;
> >  	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
> >  
> > -	ref_clk_fsel = 0x07;
> > -	switch (clock_rate) {
> > -	default:
> > -		dev_warn(dev, "Invalid ref_clk %u, using 100000000 instead\n",
> > -			 clock_rate);
> > -		fallthrough;
> > -	case 100000000:
> > -		mpll_mul = 0x19;
> > -		if (ref_clk_sel < 2)
> > -			ref_clk_fsel = 0x27;
> > -		break;
> > -	case 50000000:
> > -		mpll_mul = 0x32;
> > -		break;
> > -	case 125000000:
> > -		mpll_mul = 0x28;
> > -		break;
> > -	}
> >  	val &= ~USBDRD_UCTL_CTL_REF_CLK_FSEL;
> >  	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_FSEL, ref_clk_fsel);
> >  
> > @@ -505,8 +434,72 @@ static void __init dwc3_octeon_phy_reset(void __iomem *base)
> >  static int dwc3_octeon_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > +	struct device_node *node = dev->of_node;
> >  	struct dwc3_data *data;
> > -	int err;
> > +	int err, ref_clk_sel, ref_clk_fsel, mpll_mul;
> > +	uint32_t clock_rate;
> 
> Use u32?

I do not like homebrew types when we have standard ones. But it seems almost
all usb code is using u32, so I can live with that.

> > +	const char *hs_clock_type, *ss_clock_type;
> > +
> > +	if (!node) {
> > +		dev_err(dev, "No USB UCTL device node\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (of_property_read_u32(node, "refclk-frequency", &clock_rate)) {
> > +		dev_err(dev, "No UCTL \"refclk-frequency\"\n");
> > +		return -EINVAL;
> > +	}
> > +	if (of_property_read_string(node, "refclk-type-ss", &ss_clock_type)) {
> > +		dev_err(dev, "No UCTL \"refclk-type-ss\"\n");
> > +		return -EINVAL;
> > +	}
> > +	if (of_property_read_string(node, "refclk-type-hs", &hs_clock_type)) {
> > +		dev_err(dev, "No UCTL \"refclk-type-hs\"\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ref_clk_sel = 2;
> > +	if (strcmp("dlmc_ref_clk0", ss_clock_type) == 0) {
> > +		if (strcmp(hs_clock_type, "dlmc_ref_clk0") == 0)
> > +			ref_clk_sel = 0;
> > +		else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
> > +			ref_clk_sel = 2;
> > +		else
> > +			dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
> > +				 hs_clock_type);
> > +	} else if (strcmp(ss_clock_type, "dlmc_ref_clk1") == 0) {
> 
> Did you run checkpatch? I still see some minor formatting issues.

Yes I did. What complain do you see from checkpatch?

> > +		if (strcmp(hs_clock_type, "dlmc_ref_clk1") == 0)
> > +			ref_clk_sel = 1;
> > +		else if (strcmp(hs_clock_type, "pll_ref_clk") == 0) {
> > +			ref_clk_sel = 3;
> > +		} else {
> > +			dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
> > +				 hs_clock_type);
> > +			ref_clk_sel = 3;
> > +		}
> > +	} else {
> > +		dev_warn(dev, "Invalid SS clock type %s, using dlmc_ref_clk0 instead\n",
> > +			 ss_clock_type);
> > +	}
> > +
> > +	ref_clk_fsel = 0x07;
> > +	switch (clock_rate) {
> > +	default:
> > +		dev_warn(dev, "Invalid ref_clk %u, using 100000000 instead\n",
> > +			 clock_rate);
> > +		fallthrough;
> > +	case 100000000:
> > +		mpll_mul = 0x19;
> > +		if (ref_clk_sel < 2)
> > +			ref_clk_fsel = 0x27;
> > +		break;
> > +	case 50000000:
> > +		mpll_mul = 0x32;
> > +		break;
> > +	case 125000000:
> > +		mpll_mul = 0x28;
> > +		break;
> > +	}
> >  
> >  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >  	if (!data)
> > @@ -516,7 +509,8 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
> >  	if (IS_ERR(data->base))
> >  		return PTR_ERR(data->base);
> >  
> > -	err = dwc3_octeon_clocks_start(dev, data->base);
> > +	err = dwc3_octeon_clocks_start(dev, data->base,
> > +				       ref_clk_sel, ref_clk_fsel, mpll_mul);
> >  	if (err)
> >  		return err;
> >  
> > -- 
> > 2.39.2
> > 
> 
> BR,
> Thinh
