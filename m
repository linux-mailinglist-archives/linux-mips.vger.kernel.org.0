Return-Path: <linux-mips+bounces-14533-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJIgNQ9pAGrhIgEAu9opvQ
	(envelope-from <linux-mips+bounces-14533-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2026 13:16:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBB1503C4D
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2026 13:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D500B300900C
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2026 11:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE4E37E308;
	Sun, 10 May 2026 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDoZE4Di"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586E535F603;
	Sun, 10 May 2026 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411788; cv=none; b=CQV56Qle3t6p8uPNahVp6QmrqP0mCkoPFn1ZRcwcyWSY7z7UoAOlf0lP/Cb7M/JjuS0Tcb2rYb6b0LQnfp3EKb+RRmdMM5Qr6Kw5FwR8kvgbAxsvRbPlBwmyfQ22SVuFbv7OCST+p/+Qvt6XIRhvvpAW0AC2pzNl/N/TQfY7y+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411788; c=relaxed/simple;
	bh=9vz4zc7pY6UY1MsTOwhSxueX2US2lDqZldy5EGxrbH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZvElsdGTLvV+iSLAu47SeryARTAq02St4kKyZ24OqlDajs8zTUGDKW80A5pVsIgo7VPHWwqCHXhtmCHjW1tUVL++T4eFumYLRvlWGagDKYWIxu4AmGcNFlPOFipFXVMQGv/PncpcwAhjwSKO9V6TtJ3kZ8mmA6RF8mK67Kzhik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDoZE4Di; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A35C2BCB8;
	Sun, 10 May 2026 11:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778411787;
	bh=9vz4zc7pY6UY1MsTOwhSxueX2US2lDqZldy5EGxrbH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VDoZE4DiD44EAw/ihWix6qu3McB0RO9xjzXUaWBgaWDKqKtVBTE/N5hCkBuDlaxkr
	 aU+rlHznWcjdIcRG1C+9ekFLUq1pa+Ld2kyA2KqGh3h4pjHdFnscqrZm6cN7W7AM4q
	 NTbJ0hZoGdAOsUzcGQjOMoKSGuPUDdSgjinPEiymKQKCsOyUlL41plDVjIh9O8bUzu
	 bpYrftwkoHldL/48K3p/2ZfG4cSncgf1lnKK6S2HilUBBwTgkubzvGiE1WTpuVM3aZ
	 7lyh0MTCYB+uETvO7XKkm6WZVlz4k7oZZOi/UbGxt9Vsw2g4hWOROu7AxuMXeA7CD5
	 tjgyyHzu3LFDA==
Date: Sun, 10 May 2026 16:46:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-phy@lists.infradead.org, naseefkm@gmail.com,
	neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: econet: Add PCIe PHY driver for EcoNet
 EN751221 and EN7528 SoCs.
Message-ID: <agBpBxofP00bAt7V@vaman>
References: <20260404184918.2184070-1-cjd@cjdns.fr>
 <20260404184918.2184070-3-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404184918.2184070-3-cjd@cjdns.fr>
X-Rspamd-Queue-Id: 4EBB1503C4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14533-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,linaro.org,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tyhicks.com:email,cjdns.fr:email]
X-Rspamd-Action: no action

On 04-04-26, 18:49, Caleb James DeLisle wrote:
> Introduce support for EcoNet PCIe PHY controllers found in EN751221
> and EN7528 SoCs, these SoCs are not identical but are similar, each
> having one Gen1 port, and one Gen1/Gen2 port.
> 
> Co-developed-by: Ahmed Naseef <naseefkm@gmail.com>
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> [cjd@cjdns.fr: add EN751221 support and refactor for clarity]
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/phy/Kconfig           |  12 +++
>  drivers/phy/Makefile          |   1 +
>  drivers/phy/phy-econet-pcie.c | 180 ++++++++++++++++++++++++++++++++++
>  4 files changed, 194 insertions(+)
>  create mode 100644 drivers/phy/phy-econet-pcie.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1b016212e4cb..b2d37c7c80af 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9177,6 +9177,7 @@ M:	Caleb James DeLisle <cjd@cjdns.fr>
>  L:	linux-mips@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
> +F:	drivers/phy/phy-econet-pcie.c
>  
>  ECRYPT FILE SYSTEM
>  M:	Tyler Hicks <code@tyhicks.com>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 227b9a4c612e..9aad68829d72 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -66,6 +66,18 @@ config PHY_CAN_TRANSCEIVER
>  	  functional modes using gpios and sets the attribute max link
>  	  rate, for CAN drivers.
>  
> +config PHY_ECONET_PCIE
> +	tristate "EcoNet PCIe-PHY Driver"
> +	depends on ECONET || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	select REGMAP_MMIO
> +	help
> +	  Say Y here to add support for EcoNet PCIe PHY driver.
> +	  This driver create the basic PHY instance and provides initialize
> +	  callback for PCIe GEN1 and GEN2 ports. This PHY is found on
> +	  EcoNet SoCs including EN751221 and EN7528.
> +
>  config PHY_GOOGLE_USB
>  	tristate "Google Tensor SoC USB PHY driver"
>  	select GENERIC_PHY
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index f49d83f00a3d..42959ed383fd 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
>  obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
>  obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
> +obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
>  obj-$(CONFIG_PHY_GOOGLE_USB)		+= phy-google-usb.o
>  obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
>  obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
> diff --git a/drivers/phy/phy-econet-pcie.c b/drivers/phy/phy-econet-pcie.c
> new file mode 100644
> index 000000000000..d2c6e0c1f331
> --- /dev/null
> +++ b/drivers/phy/phy-econet-pcie.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Author: Caleb James DeLisle <cjd@cjdns.fr>
> + *	   Ahmed Naseef <naseefkm@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +/* Rx detection timing for EN751221: 16*8 clock cycles  */
> +#define EN751221_RXDET_VAL		16
> +
> +/* Rx detection timing when in power mode 3 */
> +#define EN75_RXDET_P3_REG		0xa28
> +#define EN75_RXDET_P3_MASK		GENMASK(17, 9)
> +
> +/* Rx detection timing when in power mode 2 */
> +#define EN75_RXDET_P2_REG		0xa2c
> +#define EN75_RXDET_P2_MASK		GENMASK(8, 0)
> +
> +/* Rx impedance */
> +#define EN75_RX_IMPEDANCE_REG		0xb2c
> +#define EN75_RX_IMPEDANCE_MASK		GENMASK(13, 12)
> +enum en75_rx_impedance {
> +	EN75_RX_IMPEDANCE_100_OHM	= 0,
> +	EN75_RX_IMPEDANCE_95_OHM	= 1,
> +	EN75_RX_IMPEDANCE_90_OHM	= 2,
> +};
> +
> +/* PLL Invert clock */
> +#define EN75_PLL_PH_INV_REG		0x4a0
> +#define EN75_PLL_PH_INV_MASK		BIT(5)
> +
> +struct en75_phy_op {
> +	u32 reg;
> +	u32 mask;
> +	u32 val;
> +};
> +
> +struct en7528_pcie_phy {
> +	struct regmap *regmap;
> +	const struct en75_phy_op *data;
> +};
> +
> +/* Port 0 PHY: set LCDDS_CLK_PH_INV for PLL operation */
> +static const struct en75_phy_op en7528_phy_gen1[] = {
> +	{
> +		.reg = EN75_PLL_PH_INV_REG,
> +		.mask = EN75_PLL_PH_INV_MASK,
> +		.val = 1,
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +/* EN7528 Port 1 PHY: Rx impedance tuning, target R -5 Ohm */
> +static const struct en75_phy_op en7528_phy_gen2[] = {
> +	{
> +		.reg = EN75_RX_IMPEDANCE_REG,
> +		.mask = EN75_RX_IMPEDANCE_MASK,
> +		.val = EN75_RX_IMPEDANCE_95_OHM,
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +/* EN751221 Port 1 PHY, set RX detect to 16*8 clock cycles */
> +static const struct en75_phy_op en751221_phy_gen2[] = {
> +	{
> +		.reg = EN75_RXDET_P3_REG,
> +		.mask = EN75_RXDET_P3_MASK,
> +		.val = EN751221_RXDET_VAL,
> +	},
> +	{
> +		.reg = EN75_RXDET_P2_REG,
> +		.mask = EN75_RXDET_P2_MASK,
> +		.val = EN751221_RXDET_VAL,
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +static int en75_pcie_phy_init(struct phy *phy)
> +{
> +	struct en7528_pcie_phy *ephy = phy_get_drvdata(phy);
> +	const struct en75_phy_op *data = ephy->data;
> +	int i, ret;
> +	u32 val;
> +
> +	for (i = 0; data[i].mask || data[i].val; i++) {
> +		if (i)
> +			usleep_range(1000, 2000);
> +
> +		val = field_prep(data[i].mask, data[i].val);

Please see:

https://sashiko.dev/#/patchset/20260425173642.406089-1-cjd%40cjdns.fr

-- 
~Vinod

