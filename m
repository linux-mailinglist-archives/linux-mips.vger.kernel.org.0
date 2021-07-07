Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0DE23BE179
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 05:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhGGDTj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 23:19:39 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:40589 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230271AbhGGDTh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jul 2021 23:19:37 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 31457580452;
        Tue,  6 Jul 2021 23:16:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 06 Jul 2021 23:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=tHdMzeYNXKIpY
        doRIZCZbldyCoKlDLeHyDBjBEaHmN4=; b=TMt0Pba0WkyMA9D6a3MFVpxQozioA
        Ln2DUTYcgmEt2LR41OdBy5S/NTBJbQC0wcJRoFvKk4QB2FS43pKSfLBG/8twVLgE
        rrmK7OJTbHEn1KmTuzWF1SrrNPNNQz/i/c0RJPEqBeTEl4xqq2YTCUJH+rTa9nwp
        E1o4yostrM3B7NpdF0DDTHEwVF8mu7CBwOpMoG+pX1brjQdbigExNfOnl95E9v2W
        DorY1E9EVD3JrnJeb/qxkir9V4PZ64nEM6K6bXD33vpfg1JxGRWo4q+RPUcoHxnt
        zkec2yUG9TGLhF+PwGYLdJvvD7cit0YCMMnd8N0J8mevwLMkbFlF5wFKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=tHdMzeYNXKIpYdoRIZCZbldyCoKlDLeHyDBjBEaHmN4=; b=pmQKJipe
        a1O1130nQfNFvhHG9g1KcFar4sn07QOQmomMWHlXXdmlzu+PLPB0IpQ7Io2x39af
        gAI1cWvgcrF1hR1cgEnwI2fwpnOA/USkj1A7rfmmOq/okaPMpocLCB2ytJrOS+L+
        B09Gt5jU425RHVBQ5yiET30JbRiCWVbF3UWOkoJfn3i0e8s2LZ5WvnCk98dh7s58
        1U4hjLK5ggKVeLEaDAkqbFjmaQu6KmlOMYq0Wou7oqoaDrb5GkEC6gSk57pT74z+
        pfVPzxUOdVDg/Qp2SouWQlzg/8OG4TULg3DiP1ZAO65N9cGypzOLfUHQTCT9dRCO
        xUVPypNWl0ReVw==
X-ME-Sender: <xms:qRzlYOOKZMROUtL47axfWh2LF8fX0NbPAJNywpqBZVTV4prBHwWOYA>
    <xme:qRzlYM8w0R7Ks0xifV6mjs2Rt-1uHvU-yIALZ0RsDziFXpQ6_rMCf9HkujSjB5vmn
    M136l9zO_TzFXa_QZs>
X-ME-Received: <xmr:qRzlYFQaIIlu52EPIrpPYy9mJGIir0Z8-LqKdc46XfTSSjbttwwu_1FAwXbb5hcLU0MOZuUwGIz9Sf8W3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    vdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:qRzlYOsZppxE7qgGxdqjvvpW_kRpiJQQDFH7cghm5vZdujkhQy5Azg>
    <xmx:qRzlYGfv6dgKgpXfbTqWeeZ2Cj5z5_eOyWn2fEnXtnNu71W4Qww_tg>
    <xmx:qRzlYC0VjA6o9ahA8CrsVGDQ2EUJzwXSebpzVKYZ1xqlSQIbfr7Wig>
    <xmx:qRzlYHUpV5K_PYbiTXlSIilFj7O1h_HT4bmUHq_hHa3ICUyWokZ6lw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 23:16:51 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 8/9] MIPS: Retire MACH_PISTACHIO
Date:   Wed,  7 Jul 2021 11:15:51 +0800
Message-Id: <20210707031552.20166-9-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now it can be replaced by generic kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kbuild.platforms            |   1 -
 arch/mips/Kconfig                     |  29 ---
 arch/mips/boot/dts/Makefile           |   1 -
 arch/mips/boot/dts/img/Makefile       |   3 -
 arch/mips/configs/pistachio_defconfig | 316 --------------------------
 arch/mips/pistachio/Kconfig           |  14 --
 arch/mips/pistachio/Makefile          |   2 -
 arch/mips/pistachio/Platform          |   6 -
 arch/mips/pistachio/init.c            | 125 ----------
 arch/mips/pistachio/irq.c             |  24 --
 arch/mips/pistachio/time.c            |  55 -----
 11 files changed, 576 deletions(-)
 delete mode 100644 arch/mips/configs/pistachio_defconfig
 delete mode 100644 arch/mips/pistachio/Kconfig
 delete mode 100644 arch/mips/pistachio/Makefile
 delete mode 100644 arch/mips/pistachio/Platform
 delete mode 100644 arch/mips/pistachio/init.c
 delete mode 100644 arch/mips/pistachio/irq.c
 delete mode 100644 arch/mips/pistachio/time.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index e4f6e49417a9..584081df89c2 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -21,7 +21,6 @@ platform-$(CONFIG_MIPS_MALTA)		+= mti-malta/
 platform-$(CONFIG_MACH_NINTENDO64)	+= n64/
 platform-$(CONFIG_NLM_COMMON)		+= netlogic/
 platform-$(CONFIG_PIC32MZDA)		+= pic32/
-platform-$(CONFIG_MACH_PISTACHIO)	+= pistachio/
 platform-$(CONFIG_RALINK)		+= ralink/
 platform-$(CONFIG_MIKROTIK_RB532)	+= rb532/
 platform-$(CONFIG_SGI_IP22)		+= sgi-ip22/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed51970c08e7..c543fad7fe94 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -512,35 +512,6 @@ config MACH_LOONGSON64
 	  and Loongson-2F which will be removed), developed by the Institute
 	  of Computing Technology (ICT), Chinese Academy of Sciences (CAS).
 
-config MACH_PISTACHIO
-	bool "IMG Pistachio SoC based boards"
-	select BOOT_ELF32
-	select BOOT_RAW
-	select CEVT_R4K
-	select CLKSRC_MIPS_GIC
-	select COMMON_CLK
-	select CSRC_R4K
-	select DMA_NONCOHERENT
-	select GPIOLIB
-	select IRQ_MIPS_CPU
-	select MFD_SYSCON
-	select MIPS_CPU_SCACHE
-	select MIPS_GIC
-	select PINCTRL
-	select REGULATOR
-	select SYS_HAS_CPU_MIPS32_R2
-	select SYS_SUPPORTS_32BIT_KERNEL
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select SYS_SUPPORTS_MIPS_CPS
-	select SYS_SUPPORTS_MULTITHREADING
-	select SYS_SUPPORTS_RELOCATABLE
-	select SYS_SUPPORTS_ZBOOT
-	select SYS_HAS_EARLY_PRINTK
-	select USE_GENERIC_EARLY_PRINTK_8250
-	select USE_OF
-	help
-	  This enables support for the IMG Pistachio SoC platform.
-
 config MIPS_MALTA
 	bool "MIPS Malta board"
 	select ARCH_MAY_HAVE_PC_FDC
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 188301164d9e..be96d35eb582 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
 subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
-subdir-$(CONFIG_MACH_PISTACHIO)		+= img
 subdir-$(CONFIG_FIT_IMAGE_FDT_MARDUK)   += img
 subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
 subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
diff --git a/arch/mips/boot/dts/img/Makefile b/arch/mips/boot/dts/img/Makefile
index 24f6bbeadd48..ebb47490b04b 100644
--- a/arch/mips/boot/dts/img/Makefile
+++ b/arch/mips/boot/dts/img/Makefile
@@ -2,6 +2,3 @@
 dtb-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= boston.dtb
 
 dtb-$(CONFIG_FIT_IMAGE_FDT_MARDUK)	+= pistachio_marduk.dtb
-
-dtb-$(CONFIG_MACH_PISTACHIO)	+= pistachio_marduk.dtb
-obj-$(CONFIG_MACH_PISTACHIO)	+= pistachio_marduk.dtb.o
diff --git a/arch/mips/configs/pistachio_defconfig b/arch/mips/configs/pistachio_defconfig
deleted file mode 100644
index b9adf15ebbec..000000000000
--- a/arch/mips/configs/pistachio_defconfig
+++ /dev/null
@@ -1,316 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="localhost"
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_PREEMPT_VOLUNTARY=y
-CONFIG_IKCONFIG=m
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=18
-CONFIG_CGROUPS=y
-CONFIG_CGROUP_SCHED=y
-CONFIG_CFS_BANDWIDTH=y
-CONFIG_CGROUP_FREEZER=y
-CONFIG_NAMESPACES=y
-CONFIG_USER_NS=y
-CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
-# CONFIG_RD_LZMA is not set
-# CONFIG_RD_LZO is not set
-# CONFIG_RD_LZ4 is not set
-CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_EMBEDDED=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_PROFILING=y
-CONFIG_MACH_PISTACHIO=y
-CONFIG_MIPS_CPS=y
-CONFIG_NR_CPUS=4
-CONFIG_PM_DEBUG=y
-CONFIG_PM_ADVANCED_DEBUG=y
-CONFIG_CPU_IDLE=y
-# CONFIG_MIPS_CPS_CPUIDLE is not set
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_COMPACTION is not set
-CONFIG_DEFAULT_MMAP_MIN_ADDR=32768
-CONFIG_ZSMALLOC=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_NET_KEY=m
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_ADVANCED_ROUTER=y
-CONFIG_IP_MULTIPLE_TABLES=y
-CONFIG_IP_ROUTE_MULTIPATH=y
-CONFIG_IP_ROUTE_VERBOSE=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_MROUTE=y
-CONFIG_IP_PIMSM_V1=y
-CONFIG_IP_PIMSM_V2=y
-CONFIG_SYN_COOKIES=y
-CONFIG_INET_AH=m
-CONFIG_INET_ESP=m
-CONFIG_INET_IPCOMP=m
-CONFIG_INET_XFRM_MODE_TRANSPORT=m
-CONFIG_INET_XFRM_MODE_TUNNEL=m
-CONFIG_INET_XFRM_MODE_BEET=m
-# CONFIG_INET_DIAG is not set
-CONFIG_TCP_CONG_ADVANCED=y
-# CONFIG_TCP_CONG_BIC is not set
-# CONFIG_TCP_CONG_WESTWOOD is not set
-# CONFIG_TCP_CONG_HTCP is not set
-CONFIG_TCP_CONG_LP=m
-CONFIG_TCP_MD5SIG=y
-CONFIG_INET6_AH=m
-CONFIG_INET6_ESP=m
-CONFIG_INET6_XFRM_MODE_TRANSPORT=m
-CONFIG_INET6_XFRM_MODE_TUNNEL=m
-CONFIG_INET6_XFRM_MODE_BEET=m
-CONFIG_IPV6_SIT=m
-CONFIG_NETWORK_SECMARK=y
-CONFIG_NETFILTER=y
-# CONFIG_BRIDGE_NETFILTER is not set
-CONFIG_NF_CONNTRACK=y
-CONFIG_NF_CT_NETLINK=y
-CONFIG_NETFILTER_XT_MARK=m
-CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
-CONFIG_NETFILTER_XT_TARGET_DSCP=y
-CONFIG_NETFILTER_XT_TARGET_NFLOG=y
-CONFIG_NETFILTER_XT_TARGET_NFQUEUE=y
-CONFIG_NETFILTER_XT_TARGET_SECMARK=y
-CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
-CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
-CONFIG_NETFILTER_XT_MATCH_DSCP=y
-CONFIG_NETFILTER_XT_MATCH_POLICY=y
-CONFIG_NETFILTER_XT_MATCH_STATE=y
-CONFIG_NF_NAT_IPV4=m
-CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
-CONFIG_IP_NF_TARGET_REJECT=y
-CONFIG_IP_NF_MANGLE=y
-CONFIG_NF_NAT_IPV6=m
-CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP6_NF_MATCH_IPV6HEADER=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
-CONFIG_BRIDGE=m
-CONFIG_VLAN_8021Q=m
-CONFIG_NET_SCHED=y
-CONFIG_NET_SCH_HTB=m
-CONFIG_NET_SCH_CODEL=m
-CONFIG_NET_SCH_FQ_CODEL=m
-CONFIG_NET_CLS_U32=m
-CONFIG_CLS_U32_MARK=y
-CONFIG_BT=m
-CONFIG_BT_RFCOMM=m
-CONFIG_BT_HCIBTUSB=m
-CONFIG_BT_HCIBFUSB=m
-CONFIG_BT_HCIVHCI=m
-CONFIG_CFG80211=m
-CONFIG_NL80211_TESTMODE=y
-CONFIG_CFG80211_DEBUGFS=y
-CONFIG_CFG80211_WEXT=y
-CONFIG_MAC80211=m
-CONFIG_MAC80211_LEDS=y
-CONFIG_MAC80211_DEBUGFS=y
-CONFIG_MAC80211_DEBUG_MENU=y
-CONFIG_MAC80211_VERBOSE_DEBUG=y
-CONFIG_RFKILL=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_DEBUG_DEVRES=y
-CONFIG_CONNECTOR=y
-CONFIG_MTD=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_SPI_NOR=y
-CONFIG_MTD_UBI=y
-CONFIG_MTD_UBI_BLOCK=y
-CONFIG_ZRAM=m
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_BLK_DEV_SR=m
-CONFIG_SCSI_SPI_ATTRS=y
-CONFIG_MD=y
-CONFIG_BLK_DEV_DM=y
-CONFIG_DM_CRYPT=y
-CONFIG_DM_VERITY=y
-CONFIG_NETDEVICES=y
-CONFIG_TUN=m
-CONFIG_VETH=m
-# CONFIG_NET_VENDOR_MARVELL is not set
-# CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_MICROCHIP is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
-# CONFIG_NET_VENDOR_SEEQ is not set
-# CONFIG_NET_VENDOR_SMSC is not set
-CONFIG_STMMAC_ETH=y
-# CONFIG_NET_VENDOR_VIA is not set
-CONFIG_PPP=m
-CONFIG_PPP_ASYNC=m
-CONFIG_USB_PEGASUS=m
-CONFIG_USB_RTL8150=m
-CONFIG_USB_RTL8152=m
-CONFIG_USB_NET_DM9601=m
-CONFIG_USB_NET_SMSC75XX=m
-CONFIG_USB_NET_SMSC95XX=m
-CONFIG_USB_NET_MCS7830=m
-# CONFIG_USB_NET_CDC_SUBSET is not set
-# CONFIG_USB_NET_ZAURUS is not set
-CONFIG_HOSTAP=m
-CONFIG_HOSTAP_FIRMWARE=y
-CONFIG_HOSTAP_FIRMWARE_NVRAM=y
-CONFIG_LIBERTAS_THINFIRM=m
-CONFIG_RT2X00=m
-CONFIG_RT2800USB=m
-CONFIG_MAC80211_HWSIM=m
-CONFIG_USB_NET_RNDIS_WLAN=m
-CONFIG_INPUT_EVDEV=y
-# CONFIG_KEYBOARD_ATKBD is not set
-CONFIG_KEYBOARD_GPIO=y
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-# CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_8250=y
-# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_DW=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_HW_RANDOM=y
-CONFIG_TCG_TPM=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=m
-CONFIG_I2C_IMG=y
-CONFIG_I2C_STUB=m
-CONFIG_SPI=y
-CONFIG_SPI_BITBANG=m
-CONFIG_SPI_IMG_SPFI=y
-CONFIG_SPI_SPIDEV=y
-CONFIG_DEBUG_GPIO=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_POWER_SUPPLY=y
-CONFIG_THERMAL=y
-CONFIG_WATCHDOG=y
-CONFIG_IMGPDC_WDT=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_REGULATOR_GPIO=y
-CONFIG_RC_CORE=y
-CONFIG_RC_DEVICES=y
-CONFIG_IR_IMG=y
-CONFIG_IR_IMG_NEC=y
-CONFIG_IR_IMG_JVC=y
-CONFIG_IR_IMG_SONY=y
-CONFIG_IR_IMG_SHARP=y
-CONFIG_IR_IMG_SANYO=y
-CONFIG_IR_IMG_RC5=y
-CONFIG_IR_IMG_RC6=y
-CONFIG_MEDIA_SUPPORT=y
-CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
-# CONFIG_LCD_CLASS_DEVICE is not set
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_HRTIMER=m
-CONFIG_SND_DYNAMIC_MINORS=y
-CONFIG_SND_SEQUENCER=m
-CONFIG_SND_SEQ_DUMMY=m
-# CONFIG_SND_SPI is not set
-CONFIG_SND_USB_AUDIO=m
-CONFIG_USB=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-# CONFIG_USB_DEFAULT_PERSIST is not set
-CONFIG_USB_MON=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_ROOT_HUB_TT=y
-CONFIG_USB_ACM=y
-CONFIG_USB_STORAGE=y
-CONFIG_USB_DWC2=y
-CONFIG_USB_SERIAL=y
-CONFIG_USB_SERIAL_GENERIC=y
-CONFIG_USB_SERIAL_CP210X=m
-CONFIG_USB_SERIAL_FTDI_SIO=m
-CONFIG_USB_SERIAL_KEYSPAN=m
-CONFIG_USB_SERIAL_PL2303=m
-CONFIG_USB_SERIAL_OTI6858=m
-CONFIG_USB_SERIAL_QUALCOMM=m
-CONFIG_USB_SERIAL_SIERRAWIRELESS=m
-CONFIG_USB_SERIAL_OPTION=m
-CONFIG_MMC=y
-CONFIG_MMC_BLOCK_MINORS=16
-CONFIG_MMC_TEST=m
-CONFIG_MMC_DW=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_RTC_CLASS=y
-CONFIG_DMADEVICES=y
-CONFIG_IMG_MDC_DMA=y
-CONFIG_STAGING=y
-CONFIG_ASHMEM=y
-# CONFIG_IOMMU_SUPPORT is not set
-CONFIG_MEMORY=y
-CONFIG_IIO=y
-CONFIG_CC10001_ADC=y
-CONFIG_PWM=y
-CONFIG_PWM_IMG=y
-CONFIG_PHY_PISTACHIO_USB=y
-CONFIG_ANDROID=y
-CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-# CONFIG_DNOTIFY is not set
-CONFIG_FUSE_FS=m
-CONFIG_ISO9660_FS=m
-CONFIG_JOLIET=y
-CONFIG_ZISOFS=y
-CONFIG_UDF_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_ECRYPT_FS=y
-CONFIG_HFSPLUS_FS=m
-CONFIG_UBIFS_FS=y
-CONFIG_SQUASHFS=y
-CONFIG_SQUASHFS_FILE_DIRECT=y
-CONFIG_SQUASHFS_LZO=y
-CONFIG_PSTORE=y
-CONFIG_PSTORE_CONSOLE=y
-CONFIG_PSTORE_RAM=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_DEFAULT="utf8"
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_SECURITY=y
-CONFIG_SECURITY_NETWORK=y
-CONFIG_SECURITY_YAMA=y
-CONFIG_CRYPTO_AUTHENC=y
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_SHA1=y
-CONFIG_CRYPTO_SHA256=y
-CONFIG_CRYPTO_SHA512=m
-CONFIG_CRYPTO_ARC4=y
-CONFIG_CRYPTO_DES=y
-CONFIG_CRC_CCITT=y
-CONFIG_CRC_T10DIF=m
-CONFIG_CRC7=m
-# CONFIG_XZ_DEC_X86 is not set
-CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0
-# CONFIG_SCHED_DEBUG is not set
-CONFIG_SCHEDSTATS=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_CREDENTIALS=y
-CONFIG_FUNCTION_TRACER=y
-CONFIG_BLK_DEV_IO_TRACE=y
-CONFIG_LKDTM=y
-CONFIG_TEST_UDELAY=m
diff --git a/arch/mips/pistachio/Kconfig b/arch/mips/pistachio/Kconfig
deleted file mode 100644
index 9a0e06c95184..000000000000
--- a/arch/mips/pistachio/Kconfig
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config PISTACHIO_GPTIMER_CLKSRC
-	bool "Enable General Purpose Timer based clocksource"
-	depends on MACH_PISTACHIO
-	select CLKSRC_PISTACHIO
-	select MIPS_EXTERNAL_TIMER
-	help
-	  This option enables a clocksource driver based on a Pistachio
-	  SoC General Purpose external timer.
-
-	  If you want to enable the CPUFreq, you need to enable
-	  this option.
-
-	  If you don't want to enable CPUFreq, you can leave this disabled.
diff --git a/arch/mips/pistachio/Makefile b/arch/mips/pistachio/Makefile
deleted file mode 100644
index 66f4af17fb66..000000000000
--- a/arch/mips/pistachio/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y	+= init.o irq.o time.o
diff --git a/arch/mips/pistachio/Platform b/arch/mips/pistachio/Platform
deleted file mode 100644
index c59de86dbddf..000000000000
--- a/arch/mips/pistachio/Platform
+++ /dev/null
@@ -1,6 +0,0 @@
-#
-# IMG Pistachio SoC
-#
-load-$(CONFIG_MACH_PISTACHIO)		+= 0xffffffff80400000
-zload-$(CONFIG_MACH_PISTACHIO)		+= 0xffffffff81000000
-all-$(CONFIG_MACH_PISTACHIO)		:= uImage.gz
diff --git a/arch/mips/pistachio/init.c b/arch/mips/pistachio/init.c
deleted file mode 100644
index e0bacfc3c6b4..000000000000
--- a/arch/mips/pistachio/init.c
+++ /dev/null
@@ -1,125 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Pistachio platform setup
- *
- * Copyright (C) 2014 Google, Inc.
- * Copyright (C) 2016 Imagination Technologies
- */
-
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/of_address.h>
-#include <linux/of_fdt.h>
-
-#include <asm/cacheflush.h>
-#include <asm/fw/fw.h>
-#include <asm/mips-boards/generic.h>
-#include <asm/mips-cps.h>
-#include <asm/prom.h>
-#include <asm/smp-ops.h>
-#include <asm/traps.h>
-
-/*
- * Core revision register decoding
- * Bits 23 to 20: Major rev
- * Bits 15 to 8: Minor rev
- * Bits 7 to 0: Maintenance rev
- */
-#define PISTACHIO_CORE_REV_REG	0xB81483D0
-#define PISTACHIO_CORE_REV_A1	0x00100006
-#define PISTACHIO_CORE_REV_B0	0x00100106
-
-const char *get_system_type(void)
-{
-	u32 core_rev;
-	const char *sys_type;
-
-	core_rev = __raw_readl((const void *)PISTACHIO_CORE_REV_REG);
-
-	switch (core_rev) {
-	case PISTACHIO_CORE_REV_B0:
-		sys_type = "IMG Pistachio SoC (B0)";
-		break;
-
-	case PISTACHIO_CORE_REV_A1:
-		sys_type = "IMG Pistachio SoC (A1)";
-		break;
-
-	default:
-		sys_type = "IMG Pistachio SoC";
-		break;
-	}
-
-	return sys_type;
-}
-
-void __init *plat_get_fdt(void)
-{
-	if (fw_arg0 != -2)
-		panic("Device-tree not present");
-	return (void *)fw_arg1;
-}
-
-void __init plat_mem_setup(void)
-{
-	__dt_setup_arch(plat_get_fdt());
-}
-
-#define DEFAULT_CPC_BASE_ADDR	0x1bde0000
-#define DEFAULT_CDMM_BASE_ADDR	0x1bdd0000
-
-phys_addr_t mips_cpc_default_phys_base(void)
-{
-	return DEFAULT_CPC_BASE_ADDR;
-}
-
-phys_addr_t mips_cdmm_phys_base(void)
-{
-	return DEFAULT_CDMM_BASE_ADDR;
-}
-
-static void __init mips_nmi_setup(void)
-{
-	void *base;
-
-	base = cpu_has_veic ?
-		(void *)(CAC_BASE + 0xa80) :
-		(void *)(CAC_BASE + 0x380);
-	memcpy(base, except_vec_nmi, 0x80);
-	flush_icache_range((unsigned long)base,
-			   (unsigned long)base + 0x80);
-}
-
-static void __init mips_ejtag_setup(void)
-{
-	void *base;
-	extern char except_vec_ejtag_debug[];
-
-	base = cpu_has_veic ?
-		(void *)(CAC_BASE + 0xa00) :
-		(void *)(CAC_BASE + 0x300);
-	memcpy(base, except_vec_ejtag_debug, 0x80);
-	flush_icache_range((unsigned long)base,
-			   (unsigned long)base + 0x80);
-}
-
-void __init prom_init(void)
-{
-	board_nmi_handler_setup = mips_nmi_setup;
-	board_ejtag_handler_setup = mips_ejtag_setup;
-
-	mips_cm_probe();
-	mips_cpc_probe();
-	register_cps_smp_ops();
-
-	pr_info("SoC Type: %s\n", get_system_type());
-}
-
-void __init device_tree_init(void)
-{
-	if (!initial_boot_params)
-		return;
-
-	unflatten_and_copy_device_tree();
-}
diff --git a/arch/mips/pistachio/irq.c b/arch/mips/pistachio/irq.c
deleted file mode 100644
index 437c3101ac45..000000000000
--- a/arch/mips/pistachio/irq.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Pistachio IRQ setup
- *
- * Copyright (C) 2014 Google, Inc.
- */
-
-#include <linux/init.h>
-#include <linux/irqchip.h>
-#include <linux/kernel.h>
-
-#include <asm/cpu-features.h>
-#include <asm/irq_cpu.h>
-
-void __init arch_init_irq(void)
-{
-	pr_info("EIC is %s\n", cpu_has_veic ? "on" : "off");
-	pr_info("VINT is %s\n", cpu_has_vint ? "on" : "off");
-
-	if (!cpu_has_veic)
-		mips_cpu_irq_init();
-
-	irqchip_init();
-}
diff --git a/arch/mips/pistachio/time.c b/arch/mips/pistachio/time.c
deleted file mode 100644
index de64751dec40..000000000000
--- a/arch/mips/pistachio/time.c
+++ /dev/null
@@ -1,55 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Pistachio clocksource/timer setup
- *
- * Copyright (C) 2014 Google, Inc.
- */
-
-#include <linux/clk.h>
-#include <linux/clocksource.h>
-#include <linux/init.h>
-#include <linux/of.h>
-#include <linux/of_clk.h>
-
-#include <asm/mips-cps.h>
-#include <asm/time.h>
-
-unsigned int get_c0_compare_int(void)
-{
-	return gic_get_c0_compare_int();
-}
-
-int get_c0_perfcount_int(void)
-{
-	return gic_get_c0_perfcount_int();
-}
-EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
-
-int get_c0_fdc_int(void)
-{
-	return gic_get_c0_fdc_int();
-}
-
-void __init plat_time_init(void)
-{
-	struct device_node *np;
-	struct clk *clk;
-
-	of_clk_init(NULL);
-	timer_probe();
-
-	np = of_get_cpu_node(0, NULL);
-	if (!np) {
-		pr_err("Failed to get CPU node\n");
-		return;
-	}
-
-	clk = of_clk_get(np, 0);
-	if (IS_ERR(clk)) {
-		pr_err("Failed to get CPU clock: %ld\n", PTR_ERR(clk));
-		return;
-	}
-
-	mips_hpt_frequency = clk_get_rate(clk) / 2;
-	clk_put(clk);
-}
-- 
2.32.0

