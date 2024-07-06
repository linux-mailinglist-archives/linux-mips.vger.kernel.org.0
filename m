Return-Path: <linux-mips+bounces-4178-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 698EF9293CD
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 15:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2FA4B216FC
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 13:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC51D757EA;
	Sat,  6 Jul 2024 13:34:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A182200CB;
	Sat,  6 Jul 2024 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720272886; cv=none; b=BDIf44PCIjlX6hEzppRZxZRNfAky6NCxKaaAzANkvCuN5Fp+XuOUI6uDM85L/7CajuB6xW3ZhCnqWt/7PVfEL5oJXF8iR1uHsBQQJUHrAXaUPqp6NXeSBDx+IhEhtR62k3GlMSpa3YiXs1XQuUX01nRlSZ+Xj0tz+Sf0//5Vf5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720272886; c=relaxed/simple;
	bh=G3ZZmX0QyqTzLDykjYjnvyZQxhMoFAkIDvFb0p7hRds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0npPR9Z3jwTyxeP83ZIRvfCWdXLGxgyVVkFb+R8lGDQGjqipsaeFJuyUlxBbr3azerIbh7/q7Fw1wbWS+IFWnYL0kKzSdydJwxS6giOG/jXdI8yvB1bcE2cVJCHaFCZwC/5X8XwDjZu2AHIdNSSdmDHHzSTxypyzHHaeAqb6pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sQ5YN-0004a8-00; Sat, 06 Jul 2024 15:34:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 06526C0120; Sat,  6 Jul 2024 15:33:53 +0200 (CEST)
Date: Sat, 6 Jul 2024 15:33:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] MIPS: config: Add ip30_defconfig
Message-ID: <ZolHwLu0u0aQY81I@alpha.franken.de>
References: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
 <20240706-config-refresh-v1-4-5dba0064cf08@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706-config-refresh-v1-4-5dba0064cf08@flygoat.com>

On Sat, Jul 06, 2024 at 01:08:01PM +0800, Jiaxun Yang wrote:
> Add ip30_defconfig derived from ip27_defconfig to ensure this
> target is build tested by various kernel testing projects.

thank you for doing this.

> +CONFIG_CFG80211=m
> +CONFIG_MAC80211=m
> +CONFIG_RFKILL=m

no wifi

> +# CONFIG_VGA_ARB is not set
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_CDROM_PKTCDVD=m
> +CONFIG_ATA_OVER_ETH=m
> +CONFIG_SCSI=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_CHR_DEV_ST=y
> +CONFIG_BLK_DEV_SR=m
> +CONFIG_CHR_DEV_SG=m
> +CONFIG_CHR_DEV_SCH=m
> +CONFIG_SCSI_CONSTANTS=y
> +CONFIG_SCSI_LOGGING=y
> +CONFIG_SCSI_SCAN_ASYNC=y
> +CONFIG_SCSI_SPI_ATTRS=y
> +CONFIG_SCSI_FC_ATTRS=y
> +CONFIG_SCSI_CXGB3_ISCSI=m
> +CONFIG_SCSI_BNX2_ISCSI=m
> +CONFIG_BE2ISCSI=m
> +CONFIG_SCSI_HPSA=m
> +CONFIG_SCSI_3W_SAS=m
> +CONFIG_SCSI_AIC94XX=m
> +# CONFIG_AIC94XX_DEBUG is not set
> +CONFIG_SCSI_MVSAS=m
> +# CONFIG_SCSI_MVSAS_DEBUG is not set
> +CONFIG_SCSI_MPT2SAS=m
> +CONFIG_LIBFC=m
> +CONFIG_SCSI_QLOGIC_1280=y
> +CONFIG_SCSI_PMCRAID=m
> +CONFIG_SCSI_BFA_FC=m
> +CONFIG_SCSI_DH=y
> +CONFIG_SCSI_DH_RDAC=m
> +CONFIG_SCSI_DH_HP_SW=m
> +CONFIG_SCSI_DH_EMC=m
> +CONFIG_SCSI_DH_ALUA=m

for SCSI only QLOGIC_1280 should be enough

> +CONFIG_ATL2=m
> +CONFIG_ATL1E=m
> +CONFIG_ATL1C=m
> +CONFIG_B44=m
> +CONFIG_BNX2X=m
> +CONFIG_ENIC=m
> +CONFIG_DNET=m
> +CONFIG_BE2NET=m
> +CONFIG_E1000E=m
> +CONFIG_IGB=m
> +CONFIG_IGBVF=m
> +CONFIG_IXGBE=m
> +CONFIG_JME=m
> +CONFIG_MLX4_EN=m
> +# CONFIG_MLX4_DEBUG is not set
> +CONFIG_KS8851_MLL=m
> +CONFIG_AX88796=m
> +CONFIG_AX88796_93CX6=y
> +CONFIG_ETHOC=m
> +CONFIG_QLA3XXX=m
> +CONFIG_NETXEN_NIC=m
> +CONFIG_SFC=m
> +CONFIG_SMC91X=m
> +CONFIG_SMSC911X=m
> +CONFIG_NIU=m
> +CONFIG_TEHUTI=m
> +CONFIG_VIA_VELOCITY=m
> +CONFIG_PHYLIB=y
> +CONFIG_CICADA_PHY=m
> +CONFIG_DAVICOM_PHY=m
> +CONFIG_ICPLUS_PHY=m
> +CONFIG_LXT_PHY=m
> +CONFIG_LSI_ET1011C_PHY=m
> +CONFIG_MARVELL_PHY=m
> +CONFIG_NATIONAL_PHY=m
> +CONFIG_QSEMI_PHY=m
> +CONFIG_REALTEK_PHY=m
> +CONFIG_SMSC_PHY=m
> +CONFIG_STE10XP=m
> +CONFIG_VITESSE_PHY=m
> +CONFIG_ADM8211=m

for wired ethernet IOC3, TG3, ACENIC. The first comes on motherboards,
the other two are common card. Everything else non 64bit will simply
not work.

> +CONFIG_ATH5K=m
> +CONFIG_ATH9K=m
> +CONFIG_B43=m
> +CONFIG_B43LEGACY=m
> +# CONFIG_B43LEGACY_DEBUG is not set
> +CONFIG_IPW2100=m
> +CONFIG_IPW2100_MONITOR=y
> +CONFIG_IPW2100_DEBUG=y
> +CONFIG_IPW2200=m
> +CONFIG_IPW2200_MONITOR=y
> +CONFIG_IPW2200_PROMISCUOUS=y
> +CONFIG_IPW2200_QOS=y
> +CONFIG_IPW2200_DEBUG=y
> +CONFIG_IWLWIFI=m
> +CONFIG_P54_COMMON=m
> +CONFIG_P54_PCI=m
> +CONFIG_LIBERTAS_THINFIRM=m
> +CONFIG_MWL8K=m
> +CONFIG_RT2X00=m
> +CONFIG_RT2400PCI=m
> +CONFIG_RT2500PCI=m
> +CONFIG_RT61PCI=m
> +CONFIG_RT2800PCI=m
> +CONFIG_RTL8180=m
> +CONFIG_WL1251=m
> +CONFIG_WL12XX=m

placing WIFI cards into a IP30 would be challengin ;-) Better drop
it

> +# CONFIG_INPUT is not set

there are keyboard and mouse on IP30, so enabling it would make sense

> +CONFIG_SERIO_LIBPS2=m
> +CONFIG_SERIO_RAW=m
> +CONFIG_SERIO_ALTERA_PS2=m
> +# CONFIG_VT is not set
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_EXTENDED=y
> +CONFIG_SERIAL_8250_MANY_PORTS=y
> +CONFIG_SERIAL_8250_SHARE_IRQ=y
> +CONFIG_NOZOMI=m
> +CONFIG_HW_RANDOM_TIMERIOMEM=m
> +CONFIG_I2C_CHARDEV=m
> +CONFIG_I2C_ALI1535=m
> +CONFIG_I2C_ALI1563=m
> +CONFIG_I2C_ALI15X3=m
> +CONFIG_I2C_AMD756=m
> +CONFIG_I2C_AMD8111=m
> +CONFIG_I2C_I801=m
> +CONFIG_I2C_ISCH=m
> +CONFIG_I2C_PIIX4=m
> +CONFIG_I2C_NFORCE2=m
> +CONFIG_I2C_SIS5595=m
> +CONFIG_I2C_SIS630=m
> +CONFIG_I2C_SIS96X=m
> +CONFIG_I2C_VIA=m
> +CONFIG_I2C_VIAPRO=m
> +CONFIG_I2C_OCORES=m
> +CONFIG_I2C_PCA_PLATFORM=m
> +CONFIG_I2C_SIMTEC=m
> +CONFIG_I2C_TAOS_EVM=m
> +CONFIG_I2C_STUB=m

there is no i2c in IP30

important pieces missing:

CONFIG_SGI_IOC3_ETH=y
CONFIG_SERIO_SGI_IOC3=y
CONFIG_SERIAL_8250_IOC3=y
CONFIG_SGI_MFD_IOC3=y

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

