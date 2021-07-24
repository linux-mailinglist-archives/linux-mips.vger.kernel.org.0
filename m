Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C4B3D4738
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 12:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbhGXKJL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 24 Jul 2021 06:09:11 -0400
Received: from aposti.net ([89.234.176.197]:46804 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229966AbhGXKJK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Jul 2021 06:09:10 -0400
Date:   Sat, 24 Jul 2021 11:49:30 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] USB: dwc2: Add OTG support for Ingenic SoCs.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        hminas@synopsys.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com,
        Dragan =?iso-8859-2?b?yGXoYXZhYw==?= <dragancecavac@yahoo.com>
Message-Id: <IQWQWQ.9EAMZ76IPL892@crapouillou.net>
In-Reply-To: <1627116521-124612-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1627116521-124612-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam., juil. 24 2021 at 16:48:41 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
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
>  drivers/usb/dwc2/params.c | 49 
> ++++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
> index 272ae57..c35b2e2 100644
> --- a/drivers/usb/dwc2/core.c
> +++ b/drivers/usb/dwc2/core.c
> @@ -1153,6 +1153,7 @@ static void dwc2_set_turnaround_time(struct 
> dwc2_hsotg *hsotg)
>  int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
>  {
>  	u32 usbcfg;
> +	u32 otgctl;
>  	int retval = 0;
> 
>  	if ((hsotg->params.speed == DWC2_SPEED_PARAM_FULL ||
> @@ -1187,6 +1188,14 @@ int dwc2_phy_init(struct dwc2_hsotg *hsotg, 
> bool select_phy)
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
> + * @deactivate_ingenic_overcurrent_detection: Deactivate Ingenic 
> overcurrent
> + *			detection.
> + *			0 - Activate the overcurrent detection (default)
> + *			1 - Deactivate the overcurrent detection
>   * @g_dma:              Enables gadget dma usage (default: 
> autodetect).
>   * @g_dma_desc:         Enables gadget descriptor DMA (default: 
> autodetect).
>   * @g_rx_fifo_size:	The periodic rx fifo size for the device, in
> @@ -489,6 +493,7 @@ struct dwc2_core_params {
>  	u8 hird_threshold;
>  	bool activate_stm_fs_transceiver;
>  	bool activate_stm_id_vb_detection;
> +	bool deactivate_ingenic_overcurrent_detection;
>  	bool ipg_isoc_en;
>  	u16 max_packet_count;
>  	u32 max_transfer_size;
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 67c5eb1..a7a1b50 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -71,6 +71,47 @@ static void dwc2_set_his_params(struct dwc2_hsotg 
> *hsotg)
>  	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
>  }
> 
> +static void dwc2_set_jz4775_params(struct dwc2_hsotg *hsotg)
> +{
> +	struct dwc2_core_params *p = &hsotg->params;
> +
> +	p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
> +	p->speed = DWC2_SPEED_PARAM_HIGH;
> +	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
> +	p->phy_utmi_width = 16;
> +	p->deactivate_ingenic_overcurrent_detection =
> +		device_property_read_bool(hsotg->dev, "disable-over-current");

That device property was not documented in the previous patch. Also 
this probably should be "ingenic,disable-over-current".

Cheers,
-Paul

> +}
> +
> +static void dwc2_set_x1600_params(struct dwc2_hsotg *hsotg)
> +{
> +	struct dwc2_core_params *p = &hsotg->params;
> +
> +	p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
> +	p->speed = DWC2_SPEED_PARAM_HIGH;
> +	p->host_channels = 16;
> +	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
> +	p->phy_utmi_width = 16;
> +	p->deactivate_ingenic_overcurrent_detection =
> +		device_property_read_bool(hsotg->dev, "disable-over-current");
> +}
> +
> +static void dwc2_set_x2000_params(struct dwc2_hsotg *hsotg)
> +{
> +	struct dwc2_core_params *p = &hsotg->params;
> +
> +	p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
> +	p->speed = DWC2_SPEED_PARAM_HIGH;
> +	p->host_rx_fifo_size = 1024;
> +	p->host_nperio_tx_fifo_size = 1024;
> +	p->host_perio_tx_fifo_size = 1024;
> +	p->host_channels = 16;
> +	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
> +	p->phy_utmi_width = 16;
> +	p->deactivate_ingenic_overcurrent_detection =
> +		device_property_read_bool(hsotg->dev, "disable-over-current");
> +}
> +
>  static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
>  {
>  	struct dwc2_core_params *p = &hsotg->params;
> @@ -202,7 +243,13 @@ static void 
> dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
> 
>  const struct of_device_id dwc2_of_match_table[] = {
>  	{ .compatible = "brcm,bcm2835-usb", .data = dwc2_set_bcm_params },
> -	{ .compatible = "hisilicon,hi6220-usb", .data = dwc2_set_his_params 
>  },
> +	{ .compatible = "hisilicon,hi6220-usb", .data = dwc2_set_his_params 
> },
> +	{ .compatible = "ingenic,jz4775-otg", .data = 
> dwc2_set_jz4775_params },
> +	{ .compatible = "ingenic,jz4780-otg", .data = 
> dwc2_set_jz4775_params },
> +	{ .compatible = "ingenic,x1000-otg", .data = dwc2_set_jz4775_params 
> },
> +	{ .compatible = "ingenic,x1600-otg", .data = dwc2_set_x1600_params 
> },
> +	{ .compatible = "ingenic,x1830-otg", .data = dwc2_set_x1600_params 
> },
> +	{ .compatible = "ingenic,x2000-otg", .data = dwc2_set_x2000_params 
> },
>  	{ .compatible = "rockchip,rk3066-usb", .data = dwc2_set_rk_params },
>  	{ .compatible = "lantiq,arx100-usb", .data = dwc2_set_ltq_params },
>  	{ .compatible = "lantiq,xrx200-usb", .data = dwc2_set_ltq_params },
> --
> 2.7.4
> 


