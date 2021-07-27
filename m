Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C823D786F
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jul 2021 16:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbhG0O1F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Jul 2021 10:27:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:59212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232136AbhG0O1F (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Jul 2021 10:27:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F352761A80;
        Tue, 27 Jul 2021 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627396025;
        bh=v/tEQ3PQ1eef41dTT73R8Pz7a9kFv4BM4FDDufD4pWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tjQz6Ms92du6kRrp3+vpMiIH8pBOZuRvlRsTvkDuQaOMFWnJmLB9eVNh0Tzzvqk1G
         0HXXtlpKRgw8S3QISeSbIkKBc2fbzFj8F7hzOwEIEjNXI5680ZAhdlycEETd3k9kxm
         MVWmKn3N6PYws2NssShV0TU4NNT8Slc1TGC63tZs=
Date:   Tue, 27 Jul 2021 16:27:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     robh+dt@kernel.org, hminas@synopsys.com, paul@crapouillou.net,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        Dragan =?utf-8?B?xIxlxI1hdmFj?= <dragancecavac@yahoo.com>
Subject: Re: [PATCH 2/2] USB: dwc2: Add OTG support for Ingenic SoCs.
Message-ID: <YQAXt1pCFZqRm2ud@kroah.com>
References: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627116521-124612-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1627116521-124612-3-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 24, 2021 at 04:48:41PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add OTG support for the JZ4775 SoC, the JZ4780 SoC, the X1000
> SoC, the X1600 SoC, the X1830 SoC, and the X2000 SoC. Introduce
> support for disable Ingenic overcurrent detection, once selected
> it enables GOTGCTL register bits VbvalidOvEn and VbvalidOvVal to
> disable the VBUS overcurrent detection.
> 
> This patch is derived from Dragan Čečavac (in the kernel 3.18.3
> tree of CI20). It is very useful for the MIPS Creator CI20 (r1).
> Without this patch, OTG port of CI20 has a great probability to
> face overcurrent warning, which breaks the OTG functionality.
> 
> Signed-off-by: Dragan Čečavac <dragancecavac@yahoo.com>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  drivers/usb/dwc2/core.c   |  9 +++++++++
>  drivers/usb/dwc2/core.h   |  5 +++++
>  drivers/usb/dwc2/params.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
> index 272ae57..c35b2e2 100644
> --- a/drivers/usb/dwc2/core.c
> +++ b/drivers/usb/dwc2/core.c
> @@ -1153,6 +1153,7 @@ static void dwc2_set_turnaround_time(struct dwc2_hsotg *hsotg)
>  int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
>  {
>  	u32 usbcfg;
> +	u32 otgctl;
>  	int retval = 0;
>  
>  	if ((hsotg->params.speed == DWC2_SPEED_PARAM_FULL ||
> @@ -1187,6 +1188,14 @@ int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
>  		dwc2_writel(hsotg, usbcfg, GUSBCFG);
>  	}
>  
> +	if (hsotg->params.deactivate_ingenic_overcurrent_detection) {
> +		if (dwc2_is_host_mode(hsotg)) {
> +			otgctl = readl(hsotg->regs + GOTGCTL);
> +			otgctl |= GOTGCTL_VBVALOEN | GOTGCTL_VBVALOVAL;
> +			writel(otgctl, hsotg->regs + GOTGCTL);
> +		}
> +	}
> +
>  	return retval;
>  }
>  
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index ab6b815..e026d13 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -418,6 +418,10 @@ enum dwc2_ep0_state {
>   *			detection using GGPIO register.
>   *			0 - Deactivate the external level detection (default)
>   *			1 - Activate the external level detection
> + * @deactivate_ingenic_overcurrent_detection: Deactivate Ingenic overcurrent
> + *			detection.
> + *			0 - Activate the overcurrent detection (default)

Having 0 as "active" is rough to handle over time.

All of the other options are "activate", so please, keep them the same
if at all possible.

thanks,

greg k-h
