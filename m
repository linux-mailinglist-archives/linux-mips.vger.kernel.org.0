Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3B2446954
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 20:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhKETzX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 15:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhKETzX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 15:55:23 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BC6C061714;
        Fri,  5 Nov 2021 12:52:43 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id p8so7870373pgh.11;
        Fri, 05 Nov 2021 12:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZQdM0FjDLNp4zlaEgvDZy/XXFTR4OGKY2F6Xds6H3oI=;
        b=erIKF2HQi589UpApQTAZCOL5IHDmWHZjDPx4iTN371TERSxCRKM1rWX/4UR7JWdbls
         bMwq8O0Lcto15eAajnDvZmD0sXdpAKMNFJJktzAH4YIWPvAzBiJneM6nRUyOgSX2zv4+
         quNblzMPBdIoBTYZLnKy8yM218Q3KLWXm/GkCsUAIfZpGAeJ4UqOgBmhrbWAYnIJhnpF
         dSgSgiTPdz/vSMeilZuF2KgsgmZWKCmtYphXq/KgXwELNYYT7wSXgZcarjn3+r0jtqVz
         meyTFA/oV4t8rw5oROSi3AJq8dEwApLmb6dKBK6kxgvIAa4A7Xkz/1l2i3Mn64BWicED
         JByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZQdM0FjDLNp4zlaEgvDZy/XXFTR4OGKY2F6Xds6H3oI=;
        b=vzvmGSpvCjP5ESCUUnBT2aWlUu/LVGbYTbGqS7zIbTLyKrUCLwttfpJQSaTDN3bK7d
         YiU07njpIfSrXWI7O1QaNn1x2JL9j0F4HRIoWDHmcx0vIQ/v8eAphImDWCtocMg6w4e+
         UXlndimhzdwuncXG6S3N4Ct32Xv/QVsjzNTV121dcdO9P0eZ9njnuURcO8zOHJNjg1ah
         ISFNzJLN6Gi9aAYL9uMmb+d5UYVqbSWdWYrH0h2yZJnROZirDrG2b+dL41diRYwGJ6wm
         o68XQlHAnbxAU04bpGAqdfYM2DlFHIlipqUUff2DdmOnVeegglbknI30zdoP+6ZjJUrt
         4fyg==
X-Gm-Message-State: AOAM532Ef+9pCFfhGANprG4bQe6bn8N/ZBE+P72ei0wZRA1BngWOODfA
        EXRCtUO1KMTx2bJ6B3h57ip/W3lhIdU=
X-Google-Smtp-Source: ABdhPJzaA8APiZgGMTWpz++/TZZ0MPsZA393UTjEtNq+P27FdJBD3j1bFVIXXd5oVlCANuQfigZtlw==
X-Received: by 2002:a63:a01a:: with SMTP id r26mr45486892pge.88.1636141962195;
        Fri, 05 Nov 2021 12:52:42 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s11sm7901398pfd.182.2021.11.05.12.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 12:52:41 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     jim2101024@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: Update bmips_stb_defconfig
Date:   Fri,  5 Nov 2021 12:52:39 -0700
Message-Id: <20211105195240.1400898-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Align the bmips_stb_defconfig with its downstream version at:
https://github.com/Broadcom/stblinux-4.1/blob/master/linux/arch/mips/configs/bmips_stb_defconfig
to be slightly more useful and include support for all of these options:

- latest Broadcom STB drivers
- support for high resolution timers
- cpufreq
- function tracers
- extending command line from DTB
- task lockup detector
- strong stack protector support
- IP auto-configuration

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/configs/bmips_stb_defconfig | 155 ++++++++++++++++++++++++--
 1 file changed, 147 insertions(+), 8 deletions(-)

diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index 625bd2d7e685..5956fb95c19f 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -1,6 +1,7 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 # CONFIG_SWAP is not set
 CONFIG_NO_HZ=y
+CONFIG_HZ=1000
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
@@ -8,17 +9,34 @@ CONFIG_EXPERT=y
 CONFIG_BMIPS_GENERIC=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_HIGHMEM=y
+CONFIG_HIGH_RES_TIMERS=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=4
+CONFIG_CC_STACKPROTECTOR_STRONG=y
 # CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
+# CONFIG_RD_GZIP is not set
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+CONFIG_RD_XZ=y
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCIEASPM_POWERSAVE=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIE_BRCMSTB=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_STAT_DETAILS=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
-CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_BMIPS_CPUFREQ=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_NET=y
@@ -32,32 +50,99 @@ CONFIG_INET=y
 # CONFIG_INET_DIAG is not set
 CONFIG_CFG80211=y
 CONFIG_NL80211_TESTMODE=y
+CONFIG_WIRELESS=y
 CONFIG_MAC80211=y
+CONFIG_NL80211=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_BRCMSTB_GISB_ARB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_IP_MROUTE=y
+CONFIG_IP_PIMSM_V1=y
+CONFIG_IP_PIMSM_V2=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+CONFIG_INET_UDP_DIAG=y
+CONFIG_TCP_CONG_ADVANCED=y
+CONFIG_TCP_CONG_BIC=y
+# CONFIG_TCP_CONG_WESTWOOD is not set
+# CONFIG_TCP_CONG_HTCP is not set
+# CONFIG_IPV6 is not set
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_NETFILTER=y
+CONFIG_NETFILTER_XTABLES=y
+CONFIG_BRIDGE=y
+CONFIG_BRIDGE_NETFILTER=m
+CONFIG_BRIDGE_NF_EBTABLES=m
+CONFIG_BRIDGE_EBT_BROUTE=m
+CONFIG_NET_DSA=y
+CONFIG_NET_SWITCHDEV=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_ALIGNMENT=12
+CONFIG_SPI=y
+CONFIG_SPI_BRCMSTB=y
 CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_CFI_STAA=y
+CONFIG_MTD_ROM=y
+CONFIG_MTD_ABSENT=y
+CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_BRCMNAND=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_GLUEBI=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
 # CONFIG_BLK_DEV is not set
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_MULTI_LUN=y
 # CONFIG_SCSI_LOWLEVEL is not set
 CONFIG_NETDEVICES=y
+CONFIG_VLAN_8021Q=y
+CONFIG_MACVLAN=y
 CONFIG_BCMGENET=y
 CONFIG_USB_USBNET=y
-# CONFIG_INPUT is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_UINPUT=y
 # CONFIG_SERIO is not set
-# CONFIG_VT is not set
+CONFIG_VT=y
+CONFIG_VT_HW_CONSOLE_BINDING=y
+# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_BRCMSTB=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_SUPPLY=y
 # CONFIG_HWMON is not set
@@ -69,22 +154,76 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_SOC_BRCMSTB=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK_MINORS=16
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
 # CONFIG_DNOTIFY is not set
+CONFIG_PROC_KCORE=y
+CONFIG_CIFS=y
+CONFIG_JBD2_DEBUG=y
 CONFIG_FUSE_FS=y
+CONFIG_FHANDLE=y
+CONFIG_CGROUPS=y
+CONFIG_CUSE=y
+CONFIG_ISO9660_FS=y
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
+CONFIG_UDF_FS=y
+CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
-CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
+CONFIG_JFFS2_FS=y
+CONFIG_UBIFS_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_LZO=y
+CONFIG_SQUASHFS_XZ=y
 CONFIG_NFS_FS=y
-CONFIG_CIFS=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_CRYPTO_HW is not set
 CONFIG_PRINTK_TIME=y
+CONFIG_DYNAMIC_DEBUG=y
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_INFO_REDUCED is not set
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_LOCKUP_DETECTOR=y
+CONFIG_DEBUG_USER=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon"
+# CONFIG_MIPS_CMDLINE_FROM_DTB is not set
+CONFIG_MIPS_CMDLINE_DTB_EXTEND=y
+# CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER is not set
+# CONFIG_CRYPTO_HW is not set
+CONFIG_DT_BCM974XX=y
+CONFIG_FW_CFE=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_AHCI_BRCMSTB=y
+CONFIG_GENERIC_PHY=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_PHY_BRCM_USB=y
+CONFIG_PHY_BRCM_SATA=y
+CONFIG_PM_RUNTIME=y
+CONFIG_PM_DEBUG=y
+CONFIG_SYSVIPC=y
+CONFIG_FUNCTION_GRAPH_TRACER=y
+CONFIG_DYNAMIC_FTRACE=y
+CONFIG_FUNCTION_TRACER=y
+CONFIG_FUNCTION_PROFILER=y
+CONFIG_IRQSOFF_TRACER=y
+CONFIG_SCHED_TRACER=y
+CONFIG_BLK_DEV_IO_TRACE=y
+CONFIG_FTRACE_SYSCALLS=y
+CONFIG_TRACER_SNAPSHOT=y
+CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
+CONFIG_STACK_TRACER=y
-- 
2.25.1

