Return-Path: <linux-mips+bounces-13287-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDkABnqioWnEvAQAu9opvQ
	(envelope-from <linux-mips+bounces-13287-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 14:56:10 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 296571B800A
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 14:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C64933011D68
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 13:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0FA3F23A5;
	Fri, 27 Feb 2026 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guoTrA3t"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B4E265621;
	Fri, 27 Feb 2026 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200559; cv=none; b=nGDbETCQmgEpjYX1iFs+QUfmagMrrnIqdOcqrT3+MquWOa/wAWldKBoSZthOO56fuqFkULgPP77sOtkkziHBDgsiYb1ATKHgiYQFxsAoRcaEs0NL1ilejh/79tpwDACsHPnCsnwlJEicD7iUmtooiMA/8r2ix1q/UtgCZfTCpFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200559; c=relaxed/simple;
	bh=Z5NdvmHFpqWASNhjEw3AnhNyfE+IsWtjKqCNA37tD2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSfPHTpXwDp2uWCi4afecvqRQwFifOzNWTlM+IbUbN6dXjdH65Cjef6bLy/yuGj8zCAyupt1rctLxLLfOHnWZf9eQg4+QzKLHTcv0diIYxkQQMSusQT+oPeRsRm4HBbGeZw7hUV9cN04Mus6T5xUIkGxR7SErr9VMrDdgJVgqKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guoTrA3t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A027AC116C6;
	Fri, 27 Feb 2026 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200559;
	bh=Z5NdvmHFpqWASNhjEw3AnhNyfE+IsWtjKqCNA37tD2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guoTrA3tySUNzy2jisrkqGd2k4FHDS4iIngYwHJYw9pTwrkQ/ryB4iixO2moZuzpX
	 TacRL9UlkHBSre+N18XIpNM6QnlDnKF2lhK50sxk22DUsItoTexaeq4KwJiTd1enNz
	 UK/63+NILl7z3Pk6yiKXypP7Mm6A0Ge5qIuBYB5jMnqeYawdBTypdlxKlRmt10vm1x
	 dmKx4ofeYN446GJt1mkmS8xKuaW540FXZKBffx7CpoqoUEXyHVu41QyJCDKqw5UgGu
	 tRELXuDIvdOcc9zS566aKbuwkOb49Td3MgxD2kPz4FgrmldyNAMQdfMc2AgoVqLY0P
	 yzUjBQzrC2PfA==
Date: Fri, 27 Feb 2026 19:25:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 1/2] phy: sort Kconfig and Makefile
Message-ID: <aaGia-MYCsRYCPT6@vaman>
References: <20260225-macb-phy-v7-0-e5211a61db56@bootlin.com>
 <20260225-macb-phy-v7-1-e5211a61db56@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-macb-phy-v7-1-e5211a61db56@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13287-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 296571B800A
X-Rspamd-Action: no action

On 25-02-26, 17:54, Théo Lebrun wrote:
> Neither Kconfig nor Makefile are sorted; reorder them.
> 
> $ diff -U100 <(grep ^config drivers/phy/Kconfig) \
>              <(grep ^config drivers/phy/Kconfig | sort)
> 
> $ diff -U100 <(grep ^obj-\\$ drivers/phy/Makefile) \
>              <(grep ^obj-\\$ drivers/phy/Makefile | sort)
> 
> PHY_COMMON_PROPS{,_TEST} are kept at the top which does not respect
> sorting order.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/phy/Kconfig  | 86 ++++++++++++++++++++++++++--------------------------
>  drivers/phy/Makefile |  8 ++---
>  2 files changed, 47 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 02467dfd4fb0..c86e90027443 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -47,6 +47,26 @@ config GENERIC_PHY_MIPI_DPHY
>  	  Provides a number of helpers a core functions for MIPI D-PHY
>  	  drivers to us.
>  
> +config PHY_AIROHA_PCIE
> +	tristate "Airoha PCIe-PHY Driver"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  Say Y here to add support for Airoha PCIe PHY driver.
> +	  This driver create the basic PHY instance and provides initialize
> +	  callback for PCIe GEN3 port.
> +
> +config PHY_CAN_TRANSCEIVER
> +	tristate "CAN transceiver PHY"
> +	select GENERIC_PHY
> +	select MULTIPLEXER
> +	help
> +	  This option enables support for CAN transceivers as a PHY. This
> +	  driver provides function for putting the transceivers in various
> +	  functional modes using gpios and sets the attribute max link
> +	  rate, for CAN drivers.
> +
>  config PHY_GOOGLE_USB
>  	tristate "Google Tensor SoC USB PHY driver"
>  	select GENERIC_PHY
> @@ -69,6 +89,17 @@ config PHY_LPC18XX_USB_OTG
>  	  This driver is need for USB0 support on LPC18xx/43xx and takes
>  	  care of enabling and clock setup.
>  
> +config PHY_NXP_PTN3222
> +	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
> +	depends on I2C
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support NXP PTN3222 1-port eUSB2 to USB2 Redriver.
> +	  This redriver performs translation between eUSB2 and USB2 signalling
> +	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
> +	  Speed and High Speed.
> +
>  config PHY_PISTACHIO_USB
>  	tristate "IMG Pistachio USB2.0 PHY driver"
>  	depends on MIPS || COMPILE_TEST
> @@ -84,6 +115,18 @@ config PHY_SNPS_EUSB2
>  	  Enable support for the USB high-speed SNPS eUSB2 phy on select
>  	  SoCs. The PHY is usually paired with a Synopsys DWC3 USB controller.
>  
> +config PHY_SPACEMIT_K1_PCIE
> +	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on COMMON_CLK
> +	depends on HAS_IOMEM
> +	depends on OF
> +	select GENERIC_PHY
> +	default ARCH_SPACEMIT
> +	help
> +	  Enable support for the PCIe and USB 3 combo PHY and two
> +	  PCIe-only PHYs used in the SpacemiT K1 SoC.

I moved this into spacemit directory and while at it notice the file is
not sorted and patched that up.20260223065743.395539-1-vkoul@kernel.org
Sorry I missed this and earlier one

-- 
~Vinod

