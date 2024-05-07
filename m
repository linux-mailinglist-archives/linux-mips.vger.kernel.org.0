Return-Path: <linux-mips+bounces-3123-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE68BDDC4
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 11:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93B7A1C221F6
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 09:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D3A14D45B;
	Tue,  7 May 2024 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="pWrWTBgU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AtwXnpXJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5468614D2BB;
	Tue,  7 May 2024 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072839; cv=none; b=CaH+Kw5RgaKi8f2Bw2VCUqexOFXSB40Ek+TGgN+eMCYVBBbZM96ajsbr20N2jRIgS0NlzoItjcsDadMTfBb3Phi8o+9feOZGwUkPP7zg/lY/g39EzL/m0V+a9LcdGcZHH5QsADc7Q1fg8xl6N0ZRYOP7kPvw9dgxJ2p6SGldo+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072839; c=relaxed/simple;
	bh=iLvYSZ1cPrtSw25FC0zOkazYwmjneV1zMbO0JiN/fgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqdIkUqC8Q4E8a5wFpKHbNxh8xcvnST1eRL01m2DAtLKf7xI8S4pu5zx2d1BPOPh/1je9uPXqSj1Lxv9FeKTgyqkwK3PD0IsBEeqcNvGjPUdSRtn+NkIhM+6LNIuvxfAUiEY2rqTOali5lvKhUbC6qQRX/xaNDXNU6dmFpZo/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=pWrWTBgU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AtwXnpXJ; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6480311400E4;
	Tue,  7 May 2024 05:07:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 07 May 2024 05:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715072836;
	 x=1715159236; bh=4F+iSyQCXKQQrXOl0iGG1KcSfzOVgaOCoWruFzeYcDQ=; b=
	pWrWTBgUh5egErk0zanMsDWMw/U95n2AA12En3jXbUMZ90ho4Hf6rudeW+u7bpmd
	/BNTpHrUybH8s1OKi8FQli5elXykJgdlZ1VPPuhV6wrWx1R5enX3SStDLfTquvf6
	C33zjW1kigFxxJWpbfbyN1pq04CifK11HDEpndiQNLnxLYQwB4cSF7HJgrZO8JB2
	6H+M4Ay7P7b/O5wKmEuzYIMTDDoyokqO1Fp3nWIEvYOhzBbfO2hgbzsD1FAyAfyI
	IDM9dWzqKRGlcdQ9gA+Pabo1f8BD5IcNCGNLdUmwj9d9iISm5k8oFTiKq1uUSgr+
	UXvJjDgdXsGu0n5Dytqceg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715072836; x=
	1715159236; bh=4F+iSyQCXKQQrXOl0iGG1KcSfzOVgaOCoWruFzeYcDQ=; b=A
	twXnpXJgFsG/0NTFITsPU9IjaKMigVrWlD15I6U4sGKnPqkuO1xKcWG4h6BycYgl
	fYwsNyB0APeHgMjQiXWDNamkvNJ7z+GPpUyciaNxi2lNZPhHOtRFHVInKzeAyd+Z
	OtVnFPFhP4IOjWgSfmbdNUOCRHKKJgXfvaPJvYxmlNLtxUtMBcMAWMMECb4mltIP
	H0QHI31xhvYnQKjYyMgS1jBT04X073uqf25E9qeLA6xIfFWIQYBQ+b7tMe6JCgCa
	MP9iEcx2s+MJAGSZZX129h9e5vfhmG2pTS2S4XQIwLoGmMo6q660IkHb+oBML9jw
	sKxZBGy20K2mFDcGLmn0Q==
X-ME-Sender: <xms:RO85ZugRqJpUzAQDyeWsUpx211RxnWdrLOY5vn88NlpF7AZrFndgOg>
    <xme:RO85ZvArfNMc-D7JghuZPx41m63VW5kQnqxfu1205Sxx6zrQ5nhpQH-d6U5-iCT8O
    LzOz2GXmIG_ix6R4AA>
X-ME-Received: <xmr:RO85ZmGt-DMZpToePJh4_KGJ9FB1YHF4vkhIbdAP1j1JG4m0wA6cI_gJFyYsFY8tDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepleeuffehheegleeuvdelgffhueekjeetueevuefhffdtgfeu
    hfeggfeukefffedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:RO85ZnRk9sSmqTuZX9kMepqPg6Fr7aPlKRU_uliUhLgWVx_XsWwNbg>
    <xmx:RO85ZrzBXKoY5-XiTFZS6w3V5BOnU7_elxPj8PKgR-pNEIZb8Mk0KA>
    <xmx:RO85Zl4BxAGcAhcS8ZJhewvMNcqNw3dgXd7mul_PxGHJjxUF2U_YVQ>
    <xmx:RO85Zoya9BIxypsNT9887Glfsop8rM2Ka0NIgFcwX1uylUOfNeWAUg>
    <xmx:RO85ZjhMamicjaNNgQuJflIMLoH1EIZkXAz-GfaiKuqhNdmy_MVdRfva>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 05:07:14 -0400 (EDT)
Message-ID: <8c245a4b-881f-4a08-8028-46ba409a1c47@flygoat.com>
Date: Tue, 7 May 2024 10:07:14 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] MIPS: mobileye: Add EyeQ6H support
Content-Language: en-GB
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com>
 <20240506-eyeq6h-v1-3-f29b5269cc43@bootlin.com>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Autocrypt: addr=jiaxun.yang@flygoat.com;
 keydata= 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
 HVO98ZmbMeg=
In-Reply-To: <20240506-eyeq6h-v1-3-f29b5269cc43@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/5/6 17:16, Gregory CLEMENT 写道:
> EyeQ6H (or “High”) is an other SoC from Mobileye still based on the
> MIPS I6500 architecture as the EyeQ5. The 2 clusters of this SoC
> contains 4 cores which are capable of running 4 threads. Besides this,
> it features multiple controllers such as the classic UART, high speed
> I2C, SPI, as well as CAN-FD, PCIe Gen4, Octal/Quad SPI Flash
> interface, Gigabit Ethernet, MIPI CSI-2, MIPI DSI, and eMMC 5.1. It
> also includes a Hardware Security Module, Functional Safety Hardware,
> and video encoders and more.
>
> This commit provides the infrastructure to build a kernel running on
> EyeQ6H SoC. For now the support is limited and only one CPU core is
> running.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   arch/mips/Kbuild.platforms           |   2 +-
>   arch/mips/Kconfig                    |   7 ++-
>   arch/mips/boot/dts/Makefile          |   2 +-
>   arch/mips/boot/dts/mobileye/Makefile |   1 +
>   arch/mips/configs/eyeq5_defconfig    |   1 +
>   arch/mips/configs/eyeq6_defconfig    | 111 +++++++++++++++++++++++++++++++++++
>   arch/mips/mobileye/Kconfig           |  26 ++++++++
>   arch/mips/mobileye/Platform          |   1 +
>   8 files changed, 146 insertions(+), 5 deletions(-)
>
> diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
> index 5c145b67d3bf..bca37ddf974b 100644
> --- a/arch/mips/Kbuild.platforms
> +++ b/arch/mips/Kbuild.platforms
> @@ -8,6 +8,7 @@ platform-$(CONFIG_BCM47XX)		+= bcm47xx/
>   platform-$(CONFIG_BCM63XX)		+= bcm63xx/
>   platform-$(CONFIG_BMIPS_GENERIC)	+= bmips/
>   platform-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon/
> +platform-$(CONFIG_EYEQ)			+= mobileye/
>   platform-$(CONFIG_MIPS_COBALT)		+= cobalt/
>   platform-$(CONFIG_MACH_DECSTATION)	+= dec/
>   platform-$(CONFIG_MIPS_GENERIC)		+= generic/
> @@ -17,7 +18,6 @@ platform-$(CONFIG_MACH_LOONGSON2EF)	+= loongson2ef/
>   platform-$(CONFIG_MACH_LOONGSON32)	+= loongson32/
>   platform-$(CONFIG_MACH_LOONGSON64)	+= loongson64/
>   platform-$(CONFIG_MIPS_MALTA)		+= mti-malta/
> -platform-$(CONFIG_MACH_EYEQ5)		+= mobileye/
>   platform-$(CONFIG_MACH_NINTENDO64)	+= n64/
>   platform-$(CONFIG_PIC32MZDA)		+= pic32/
>   platform-$(CONFIG_RALINK)		+= ralink/
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 516dc7022bd7..ac330b135346 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -575,8 +575,8 @@ config MACH_PIC32
>   	  Microchip PIC32 is a family of general-purpose 32 bit MIPS core
>   	  microcontrollers.
>   
> -config MACH_EYEQ5
> -	bool "Mobileye EyeQ5 SoC"
> +config EYEQ
> +	bool "Mobileye EyeQ SoC"
>   	select MACH_GENERIC_CORE
>   	select ARM_AMBA
>   	select PHYSICAL_START_BOOL
> @@ -615,7 +615,7 @@ config MACH_EYEQ5
>   	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
>   	select USE_OF
>   	help
> -	  Select this to build a kernel supporting EyeQ5 SoC from Mobileye.
> +	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
>   
>   	bool
>   
> @@ -1021,6 +1021,7 @@ source "arch/mips/generic/Kconfig"
>   source "arch/mips/ingenic/Kconfig"
>   source "arch/mips/jazz/Kconfig"
>   source "arch/mips/lantiq/Kconfig"
> +source "arch/mips/mobileye/Kconfig"
>   source "arch/mips/pic32/Kconfig"
>   source "arch/mips/ralink/Kconfig"
>   source "arch/mips/sgi-ip27/Kconfig"
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index efff87cb33a9..e2476b12bb0c 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -1,6 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
>   subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
> +subdir-$(CONFIG_EYEQ)			+= mobileye
>   subdir-$(CONFIG_FIT_IMAGE_FDT_MARDUK)   += img
>   subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
>   subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
> @@ -8,7 +9,6 @@ subdir-$(CONFIG_LANTIQ)			+= lantiq
>   subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
>   subdir-$(CONFIG_SOC_VCOREIII)		+= mscc
>   subdir-$(CONFIG_MIPS_MALTA)		+= mti
> -subdir-$(CONFIG_MACH_EYEQ5)		+= mobileye
>   subdir-$(CONFIG_LEGACY_BOARD_SEAD3)	+= mti
>   subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
>   subdir-$(CONFIG_MACH_PIC32)		+= pic32
> diff --git a/arch/mips/boot/dts/mobileye/Makefile b/arch/mips/boot/dts/mobileye/Makefile
> index 01c01c3aad81..7cc89968aaac 100644
> --- a/arch/mips/boot/dts/mobileye/Makefile
> +++ b/arch/mips/boot/dts/mobileye/Makefile
> @@ -2,3 +2,4 @@
>   # Copyright 2023 Mobileye Vision Technologies Ltd.
>   
>   dtb-$(CONFIG_MACH_EYEQ5)		+= eyeq5-epm5.dtb
> +dtb-$(CONFIG_MACH_EYEQ6H)		+= eyeq6h-epm6.dtb
> diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_defconfig
> index c35c29a4d479..84e26ef2e3a0 100644
> --- a/arch/mips/configs/eyeq5_defconfig
> +++ b/arch/mips/configs/eyeq5_defconfig
> @@ -19,6 +19,7 @@ CONFIG_USER_NS=y
>   CONFIG_SCHED_AUTOGROUP=y
>   CONFIG_BLK_DEV_INITRD=y
>   CONFIG_EXPERT=y
> +CONFIG_EYEQ=y
>   CONFIG_MACH_EYEQ5=y
>   CONFIG_FIT_IMAGE_FDT_EPM5=y
>   CONFIG_PAGE_SIZE_16KB=y
> diff --git a/arch/mips/configs/eyeq6_defconfig b/arch/mips/configs/eyeq6_defconfig
> new file mode 100644
> index 000000000000..6597d5e88b33
> --- /dev/null
> +++ b/arch/mips/configs/eyeq6_defconfig
> @@ -0,0 +1,111 @@
> +CONFIG_SYSVIPC=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_BPF_SYSCALL=y
> +CONFIG_TASKSTATS=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_MEMCG=y
> +CONFIG_BLK_CGROUP=y
> +CONFIG_CFS_BANDWIDTH=y
> +CONFIG_RT_GROUP_SCHED=y
> +CONFIG_CGROUP_PIDS=y
> +CONFIG_CGROUP_FREEZER=y
> +CONFIG_CPUSETS=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_NAMESPACES=y
> +CONFIG_USER_NS=y
> +CONFIG_SCHED_AUTOGROUP=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_EXPERT=y
> +CONFIG_EYEQ=y
> +CONFIG_MACH_EYEQ6H=y
> +CONFIG_MIPS_CPS=y
> +CONFIG_CPU_HAS_MSA=y
> +CONFIG_NR_CPUS=16
> +CONFIG_MIPS_RAW_APPENDED_DTB=y
> +CONFIG_JUMP_LABEL=y
> +CONFIG_PAGE_SIZE_16KB=y
> +CONFIG_COMPAT_32BIT_TIME=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_TRIM_UNUSED_KSYMS=y
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SPARSEMEM_MANUAL=y
> +CONFIG_USERFAULTFD=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_NET_KEY=y
> +CONFIG_INET=y
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_NETFILTER=y
> +CONFIG_CAN=y
> +CONFIG_PCI=y
> +CONFIG_PCI_MSI=y
> +CONFIG_PCI_DEBUG=y
> +CONFIG_PCI_ENDPOINT=y
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_CONNECTOR=y
> +CONFIG_MTD=y
> +CONFIG_MTD_UBI=y
> +CONFIG_MTD_UBI_BLOCK=y
> +CONFIG_SCSI=y
> +CONFIG_NETDEVICES=y
> +CONFIG_MACVLAN=y
> +CONFIG_IPVLAN=y
> +CONFIG_MACB=y
> +CONFIG_MARVELL_PHY=y
> +CONFIG_MICREL_PHY=y
> +CONFIG_CAN_M_CAN=y
> +CONFIG_SERIAL_AMBA_PL011=y
> +CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> +CONFIG_HW_RANDOM=y
> +CONFIG_I2C=y
> +CONFIG_I2C_CHARDEV=y
> +# CONFIG_PTP_1588_CLOCK is not set
> +CONFIG_PINCTRL=y
> +CONFIG_PINCTRL_SINGLE=y
> +CONFIG_MFD_SYSCON=y
> +CONFIG_HID_A4TECH=y
> +CONFIG_HID_BELKIN=y
> +CONFIG_HID_CHERRY=y
> +CONFIG_HID_CYPRESS=y
> +CONFIG_HID_EZKEY=y
> +CONFIG_HID_ITE=y
> +CONFIG_HID_KENSINGTON=y
> +CONFIG_HID_REDRAGON=y
> +CONFIG_HID_MICROSOFT=y
> +CONFIG_HID_MONTEREY=y
> +CONFIG_MMC=y
> +CONFIG_MMC_SDHCI=y
> +# CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_RESET_CONTROLLER=y
> +# CONFIG_NVMEM is not set
> +CONFIG_EXT4_FS=y
> +CONFIG_EXT4_FS_POSIX_ACL=y
> +CONFIG_EXT4_FS_SECURITY=y
> +CONFIG_FS_ENCRYPTION=y
> +CONFIG_FUSE_FS=y
> +CONFIG_CUSE=y
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_UBIFS_FS=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V3_ACL=y
> +CONFIG_NFS_V4=y
> +CONFIG_NFS_V4_1=y
> +CONFIG_NFS_V4_2=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_CRYPTO_CRC32_MIPS=y
> +CONFIG_FRAME_WARN=1024
> +CONFIG_DEBUG_FS=y
> +# CONFIG_RCU_TRACE is not set
> +# CONFIG_FTRACE is not set
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE="earlycon"
> diff --git a/arch/mips/mobileye/Kconfig b/arch/mips/mobileye/Kconfig
> new file mode 100644
> index 000000000000..f9abb2d6e178
> --- /dev/null
> +++ b/arch/mips/mobileye/Kconfig
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0
> +if EYEQ
> +
> +choice
> +	prompt "Mobileye EyeQ SoC selection"
> +	default MACH_EYEQ5
> +	help
> +	  Select Mobileye EyeQ MIPS SoC type.
> +
> +	config MACH_EYEQ5
> +		bool "Mobileye EyeQ5 SoC"
> +
> +	config MACH_EYEQ6H
> +		bool "Mobileye EyeQ6H SoC"
> +endchoice
> +
> +config FIT_IMAGE_FDT_EPM5
> +	bool "Include FDT for Mobileye EyeQ5 development platforms"
> +	depends on MACH_EYEQ5
> +	default n
> +	help
> +	  Enable this to include the FDT for the EyeQ5 development platforms
> +	  from Mobileye in the FIT kernel image.
> +	  This requires u-boot on the platform.
> +
> +endif
> diff --git a/arch/mips/mobileye/Platform b/arch/mips/mobileye/Platform
> index c69f811dd13a..69f775bbbb1e 100644
> --- a/arch/mips/mobileye/Platform
> +++ b/arch/mips/mobileye/Platform
> @@ -9,6 +9,7 @@
>   #
>   
>   load-$(CONFIG_MACH_EYEQ5)	= 0xa800000808000000
> +load-$(CONFIG_MACH_EYEQ6H)	= 0xa800000100800000
>   all-$(CONFIG_MACH_EYEQ5)	+= vmlinux.gz.itb
>   
>   its-y					:= vmlinux.its.S
>


