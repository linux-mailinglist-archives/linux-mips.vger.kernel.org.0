Return-Path: <linux-mips+bounces-12756-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68200CF4AEA
	for <lists+linux-mips@lfdr.de>; Mon, 05 Jan 2026 17:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5629F3034FA8
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jan 2026 16:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072C4334695;
	Mon,  5 Jan 2026 16:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wiwfgUos"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0692733291A;
	Mon,  5 Jan 2026 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630264; cv=none; b=QMcaDaBk4DNMJinPrg9lWj4lo3EnW6q+EitUAMy7biU1JC/oPiGAmiCIev6kmoH2qmUEYcxx9g6D/Rrg+fms645V6pdneT2Yv8G29BWnKke0OjeyxlDqNdEBcnmiOwEdmX75y29e4wm1JwqK2Unp3ufxVSmPAVSElrRmMXjso3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630264; c=relaxed/simple;
	bh=ZF375abMaqPcCosbr7HThENC1dI3rMKv9Td3V3QBTUc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DCUXHHSiPPtuqByqHzUm7QQ48cyR2inSHtPIQeR9I6UdyWRCLnj5NG7RKNsUPIB9csQMPklrRY957tIvUdm3I8L8mDy8O6JZ4jzphkms0CEpdLo5N3uXqdU7q6x+Sl4+XtJmkSKU4OLBk7zLEk7Jvnfv7eNB54/AN0keP6dBqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wiwfgUos; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2C093C1E48A;
	Mon,  5 Jan 2026 16:23:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F2BD60726;
	Mon,  5 Jan 2026 16:24:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04C34103C84AA;
	Mon,  5 Jan 2026 17:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767630255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wmAT0T9ABuwHAf6f+472JmLmotK1cUNIQRvscL78Si8=;
	b=wiwfgUos9MN+41ojRE2Afdk860+ixAWP0mMipfgftY8bfriiGODeIcNdsxpSEyxSzZuFJa
	/ainyHboytM31BdO6DwPeUAdCWVwmTT2dmK1QgCmhf1rblhzkcKWE34hWiu4CZCaBzpA4k
	zvYPutcJjurtbcSdNtsSf5IxXetg/3xZ9i6XBgqQ9GzGrOj1A41xb/1AfYHG4l5vSLjtg8
	bAgrdxFHJsFVQztX8r+3KfCNYlP9TP0gLQ5N+OvP2QC1uszibhEe5U/Vi3CZV4pQ3ADf2A
	GbZdubbRrJ3aTaVd1bVKNCKFbyDfTtjVDECyFrqQtuMpK3UtzTLVLQPw9fHe2g==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 17:24:11 +0100
Message-Id: <DFGSMN8268O0.33TYCQDBVHUHZ@bootlin.com>
Subject: Re: [PATCH v5 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Kishon Vijay Abraham I"
 <kishon@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
To: "Vinod Koul" <vkoul@kernel.org>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com>
 <20251215-macb-phy-v5-2-a9dfea39da34@bootlin.com> <aUq7E4yh0OgTfdxF@vaman>
In-Reply-To: <aUq7E4yh0OgTfdxF@vaman>
X-Last-TLS-Session-Version: TLSv1.3

Hello Vinod,

On Tue Dec 23, 2025 at 4:53 PM CET, Vinod Koul wrote:
> On 15-12-25, 17:26, Th=C3=A9o Lebrun wrote:
>> EyeQ5 embeds a system-controller called OLB. It features many unrelated
>> registers, and some of those are registers used to configure the
>> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
>>=20
>> Wrap in a neat generic PHY provider, exposing two PHYs with standard
>> phy_init() / phy_set_mode() / phy_power_on() operations.
>>=20
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>> ---
>>  MAINTAINERS                 |   1 +
>>  drivers/phy/Kconfig         |  13 +++
>>  drivers/phy/Makefile        |   1 +
>>  drivers/phy/phy-eyeq5-eth.c | 249 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  4 files changed, 264 insertions(+)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5b11839cba9d..2f67ec9fad57 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17605,6 +17605,7 @@ F:	arch/mips/boot/dts/mobileye/
>>  F:	arch/mips/configs/eyeq5_defconfig
>>  F:	arch/mips/mobileye/board-epm5.its.S
>>  F:	drivers/clk/clk-eyeq.c
>> +F:	drivers/phy/phy-eyeq5-eth.c
>>  F:	drivers/pinctrl/pinctrl-eyeq5.c
>>  F:	drivers/reset/reset-eyeq.c
>>  F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index 678dd0452f0a..1aa6eff12dbc 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
>>  	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
>>  	  Speed and High Speed.
>> =20
>> +config PHY_EYEQ5_ETH
>
> sorted please

I wouldn't mind, but entries are currently (v6.19-rc4) not sorted:

$ diff -U100 <(grep ^config drivers/phy/Kconfig) \
             <(grep ^config drivers/phy/Kconfig | sort)
--- /dev/fd/63 2026-01-05 15:55:53.891922890 +0100
+++ /dev/fd/62 2026-01-05 15:55:53.891922890 +0100
@@ -1,11 +1,11 @@
 config GENERIC_PHY
 config GENERIC_PHY_MIPI_DPHY
+config PHY_AIROHA_PCIE
+config PHY_CAN_TRANSCEIVER
+config PHY_EYEQ5_ETH
 config PHY_LPC18XX_USB_OTG
+config PHY_NXP_PTN3222
 config PHY_PISTACHIO_USB
 config PHY_SNPS_EUSB2
 config PHY_XGENE
 config USB_LGM_PHY
-config PHY_CAN_TRANSCEIVER
-config PHY_AIROHA_PCIE
-config PHY_NXP_PTN3222
-config PHY_EYEQ5_ETH

This is why I appended. In V2, I'll send a first patch to reorder
entries to then be able to add PHY_EYEQ5_ETH in the correct location.

>> +	tristate "Ethernet PHY Driver on EyeQ5"
>> +	depends on OF
>> +	depends on MACH_EYEQ5 || COMPILE_TEST
>> +	select AUXILIARY_BUS
>> +	select GENERIC_PHY
>> +	default MACH_EYEQ5
>
> hmmm why should it be default? Maybe add this is respective defconfig for
> platform instead..?

We have been doing this for other parts of OLB. If you are doing a
config for EyeQ5, most probably you want this enabled.

One example usecase this default field makes config easier: when you
migrate an eyeq* config to eyeq5 without resetting the full config by
applying eyeq5_defconfig. With default field you get this driver
enabled, otherwise you don't and Ethernet doesn't work.

I'd prefer keeping this default but we can drop it if you lean strongly
against it.

>> +	help
>> +	  Enable this to support the Ethernet PHY integrated on EyeQ5.
>> +	  It supports both RGMII and SGMII. Registers are located in a
>> +	  shared register region called OLB. If M is selected, the
>> +	  module will be called phy-eyeq5-eth.
>> +
>>  source "drivers/phy/allwinner/Kconfig"
>>  source "drivers/phy/amlogic/Kconfig"
>>  source "drivers/phy/broadcom/Kconfig"
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index bfb27fb5a494..8289497ece55 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -13,6 +13,7 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)		+=3D phy-snps-eusb2.o
>>  obj-$(CONFIG_USB_LGM_PHY)		+=3D phy-lgm-usb.o
>>  obj-$(CONFIG_PHY_AIROHA_PCIE)		+=3D phy-airoha-pcie.o
>>  obj-$(CONFIG_PHY_NXP_PTN3222)		+=3D phy-nxp-ptn3222.o
>> +obj-$(CONFIG_PHY_EYEQ5_ETH)		+=3D phy-eyeq5-eth.o
>
> sorted please

Same as for Kconfig. Will do it in two steps: first sort, then add the
CONFIG_PHY_EYEQ5_ETH line.

$ diff -U100 <(grep ^obj-\\$ drivers/phy/Makefile) \
             <(grep ^obj-\\$ drivers/phy/Makefile | sort)
--- /dev/fd/63 2026-01-05 16:11:10.977537425 +0100
+++ /dev/fd/62 2026-01-05 16:11:10.978537396 +0100
@@ -1,11 +1,11 @@
-obj-$(CONFIG_GENERIC_PHY)              +=3D phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)    +=3D phy-core-mipi-dphy.o
+obj-$(CONFIG_GENERIC_PHY)              +=3D phy-core.o
+obj-$(CONFIG_PHY_AIROHA_PCIE)          +=3D phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)      +=3D phy-can-transceiver.o
+obj-$(CONFIG_PHY_EYEQ5_ETH)            +=3D phy-eyeq5-eth.o
 obj-$(CONFIG_PHY_LPC18XX_USB_OTG)      +=3D phy-lpc18xx-usb-otg.o
-obj-$(CONFIG_PHY_XGENE)                +=3D phy-xgene.o
+obj-$(CONFIG_PHY_NXP_PTN3222)          +=3D phy-nxp-ptn3222.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)        +=3D phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)           +=3D phy-snps-eusb2.o
+obj-$(CONFIG_PHY_XGENE)                +=3D phy-xgene.o
 obj-$(CONFIG_USB_LGM_PHY)              +=3D phy-lgm-usb.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)          +=3D phy-airoha-pcie.o
-obj-$(CONFIG_PHY_NXP_PTN3222)          +=3D phy-nxp-ptn3222.o
-obj-$(CONFIG_PHY_EYEQ5_ETH)            +=3D phy-eyeq5-eth.o

[...]

>> +static int eq5_phy_exit(struct phy *phy)
>> +{
>> +	struct eq5_phy_inst *inst =3D phy_get_drvdata(phy);
>> +	struct eq5_phy_private *priv =3D inst->priv;
>> +	struct device *dev =3D priv->dev;
>> +
>> +	dev_dbg(dev, "phy_exit(inst=3D%td)\n", inst - priv->phys);
>> +
>> +	writel(0, inst->gp);
>> +	writel(0, inst->sgmii);
>> +	udelay(5);
>
> this is same patter in init as well...?

Yes! phy_ops::init() must reinit the HW to ensure its config fields
are well taken into account. We might inherit an already initialised
PHY from the bootloader.

We could in theory move those three ops (writel+writel+udelay) into a
helper function but I feel like it would decrease readability without
increasing code quality.

>> +
>> +	return 0;
>> +}
>> +
>> +static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int su=
bmode)
>> +{
>> +	struct eq5_phy_inst *inst =3D phy_get_drvdata(phy);
>> +	struct eq5_phy_private *priv =3D inst->priv;
>> +	struct device *dev =3D priv->dev;
>> +
>> +	dev_dbg(dev, "phy_set_mode(inst=3D%td, mode=3D%d, submode=3D%d)\n",
>> +		inst - priv->phys, mode, submode);
>
> these are good for debug but not for upstream, please drop

Ah this is surprising! They helped me debug this driver and fix one bug
or two so I thought I'd leave them in. They get compiled out by
default. And there is no ftrace events equivalent which would make
those dev_dbg() moot.

=E2=9F=A9 git grep -F dev_dbg\( drivers/ | wc -l
25174
=E2=9F=A9 git grep -F dev_dbg\( drivers/phy/ | wc -l
260

[...]

>> +static int eq5_phy_probe(struct auxiliary_device *adev,
>> +			 const struct auxiliary_device_id *id)
>> +{
>> +	struct device *dev =3D &adev->dev;
>> +	struct phy_provider *provider;
>> +	struct eq5_phy_private *priv;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->dev =3D dev;
>> +	dev_set_drvdata(dev, priv);
>> +
>> +	base =3D (void __iomem *)dev_get_platdata(dev);
>
> no need to cast for void *

Yes! My initial goal was to prevent a sparse warning about the implicit
cast from `void *` as returned by dev_get_platdata() and
`void __iomem *base`.

But it does not matter in our case (and the correct solution for
explicit cast would have implied __force).

--

I'll wait for feedback on `default MACH_EYEQ5` and `dev_dbg()` before
sending the next revision.

Thanks for the review!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


