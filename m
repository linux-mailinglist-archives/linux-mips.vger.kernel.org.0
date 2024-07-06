Return-Path: <linux-mips+bounces-4172-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D9492910E
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 07:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11FCD1C22438
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 05:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D61017740;
	Sat,  6 Jul 2024 05:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="CTsvPm6F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Kkni2iiW"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1EE1CF92;
	Sat,  6 Jul 2024 05:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720242503; cv=none; b=Q4+fk5mjoFDLoTNI17aX9AxTLk5UYjin+ds/S39VfkYp0siXoOJRcFKR2rg/0ZmuWbQisQ7532MR8OnhKq6YS0b1NjeDyINh1rXhonB57hT/PvKzUhEVx3YpHSFTJRw5CGez1h9LudHY/l7oUtkes6RhH8jsBe/ok5mPCgJJayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720242503; c=relaxed/simple;
	bh=40UuOsBIwHIFrdQhruCGrsQbCHrE7MzAtbIQKbDhmG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRJ23JjhQ9mJDfp0sB563LGvX3AKPTpTCjD8Frjb+3vTsRBGjxpQ/USokvUZlMz9KWzQF8fySO9oA9hNTPE9MKoe5BRwnokMjGwP/6fbXWWobIbev9bYGNEFER3fQPld+AhS5l8/5pxuAQvOmRHW0MFm0dM0Jb3fbYjdCyOl2M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=CTsvPm6F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Kkni2iiW; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 983A511402C1;
	Sat,  6 Jul 2024 01:08:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 06 Jul 2024 01:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720242500;
	 x=1720328900; bh=HXny34oNFwETrkhfzSAjHQISVkQHR6yL0d1WvUtzV4s=; b=
	CTsvPm6Fp3c/7ka3sYJ5zSI0lB9nOmtuxaAniZIQ+n8gRAyTqiI0QaLhlbiVH7xt
	y9NrzyBHigPEMdW8HC/jFpvY3TKiRRD0j/wTeH7aBT4FCEFNmrcBKC+V3z2WOqDY
	66okjDhnGDCCTwWaVjKGDA7ap9qmoBqHz7BYWtO2VG4UicgxROGxKTJvHRj7Uz44
	ohVaPwwjkCHGLLzRIkuz1OwTn/Ml7i9bkx6NhYar5nfHiE+Jm8DURXOnpwDgoYnL
	t2op7ytvmvB3tywAiCz+qyaL3tmbslMwOSvnp2Wdej/2BO265OaJgXyCSe8+iu5X
	JP2Mwajhft7+2kYMxiINqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720242500; x=
	1720328900; bh=HXny34oNFwETrkhfzSAjHQISVkQHR6yL0d1WvUtzV4s=; b=K
	kni2iiWWiJ3WC5vDpumkAhXt8/mwMikr/NZJgBt0AMJqAHPj57uKm6MeKmn5byg2
	7cAWDeJs1t2QCyBhQlEjrZXYAsj4EgOSOtabJwJ8xC+Qp5kx0V0LSfLfFP2dNTVq
	FlFiRD5VYXLnNyJ7MgePxiIESVgkY0705CCk35waMxKXgoudGOuzRAEKlQlb07Fy
	2ZnHSId3T6ZDd9cgH9CUElaLTHbouDqt/jPvuEeQSP1UuEQZbqTQKm/r78pKGc/u
	V0AJVrNzHB/HQXq9aBNMvdlh06+wUr1We0nMHkpTpUDxEokLIgayqMdqiNk6zE4y
	5BqzU9hsKxBNqo3gO3IDg==
X-ME-Sender: <xms:RNGIZqUTG-7hPQEO96jgEJi582T62iye3RDedeDThSBdrI7ZIPajkA>
    <xme:RNGIZmm3Py_97BASAJqMDATQAZtiJ2qLwILntSB7aTKiaAgf9CkO_GR0MBeG__OGr
    oy_vmFybdR68fcaciY>
X-ME-Received: <xmr:RNGIZubFFXcrnDvjid659kNgmXIF0D6lXodys1yPKK-hjOGIMDrepkMq08TlwcYkv9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:RNGIZhVT_WzlvptndB2hp5tnPL7ilVQ2RQNW1RR7V4ddaTbAfBuzVQ>
    <xmx:RNGIZkkCIQpTxUDwlGRGfxlcwe1pxwfsAJKpJyjq3slVXtyu7C1r9w>
    <xmx:RNGIZmcrTuJBXUwLAMEbmJmslqrV80xbUhgLzFqXvTKf8xdMR8UPOQ>
    <xmx:RNGIZmGW2F2AyVusQGxzUmtQhQcOXXyYycv3Kdq2fTco5Pv4dnL-eg>
    <xmx:RNGIZlAwSO6bwTLDBLrzm0_xevGwlwdgXXhC0P-LPXIIOebT9XX9zBzd>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Jul 2024 01:08:18 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 06 Jul 2024 13:08:01 +0800
Subject: [PATCH 4/4] MIPS: config: Add ip30_defconfig
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240706-config-refresh-v1-4-5dba0064cf08@flygoat.com>
References: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
In-Reply-To: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6971;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=40UuOsBIwHIFrdQhruCGrsQbCHrE7MzAtbIQKbDhmG8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSOixZzVvjfkDu3uOXkHLG3Rttqnuy8nnCwv+aV+ZNKn
 paMjwtnd5SyMIhxMciKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBEEr0Y/ifLdcvueshTbpr7
 4P+O1y9jONdErPo9tXvDlp7sVa7R2hsY/iee4mnlWTr18KMLrZ/45hpxOat5ORyWy2d/f7H82Pt
 1WTwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Add ip30_defconfig derived from ip27_defconfig to ensure this
target is build tested by various kernel testing projects.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/configs/ip30_defconfig | 285 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 285 insertions(+)

diff --git a/arch/mips/configs/ip30_defconfig b/arch/mips/configs/ip30_defconfig
new file mode 100644
index 000000000000..c0e790e68977
--- /dev/null
+++ b/arch/mips/configs/ip30_defconfig
@@ -0,0 +1,285 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=15
+CONFIG_CGROUPS=y
+CONFIG_CPUSETS=y
+CONFIG_RELAY=y
+CONFIG_EXPERT=y
+CONFIG_SGI_IP30=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_HZ_1000=y
+CONFIG_MIPS32_O32=y
+CONFIG_MIPS32_N32=y
+CONFIG_PM=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_SRCVERSION_ALL=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_SGI_PARTITION=y
+CONFIG_DEFAULT_MMAP_MIN_ADDR=65536
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM_USER=m
+CONFIG_XFRM_STATISTICS=y
+CONFIG_NET_KEY=y
+CONFIG_NET_KEY_MIGRATE=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_TCP_MD5SIG=y
+CONFIG_IPV6_ROUTER_PREF=y
+CONFIG_IPV6_ROUTE_INFO=y
+CONFIG_IPV6_OPTIMISTIC_DAD=y
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+CONFIG_IPV6_MIP6=m
+CONFIG_IPV6_SIT=m
+CONFIG_IPV6_SIT_6RD=y
+CONFIG_IPV6_TUNNEL=m
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_IPV6_SUBTREES=y
+CONFIG_IPV6_MROUTE=y
+CONFIG_IPV6_PIMSM_V2=y
+CONFIG_NETWORK_SECMARK=y
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_HTB=m
+CONFIG_NET_SCH_HFSC=m
+CONFIG_NET_SCH_PRIO=m
+CONFIG_NET_SCH_MULTIQ=y
+CONFIG_NET_SCH_RED=m
+CONFIG_NET_SCH_SFQ=m
+CONFIG_NET_SCH_TEQL=m
+CONFIG_NET_SCH_TBF=m
+CONFIG_NET_SCH_GRED=m
+CONFIG_NET_SCH_NETEM=m
+CONFIG_NET_SCH_INGRESS=m
+CONFIG_NET_CLS_BASIC=m
+CONFIG_NET_CLS_ROUTE4=m
+CONFIG_NET_CLS_FW=m
+CONFIG_NET_CLS_U32=m
+CONFIG_CLS_U32_MARK=y
+CONFIG_NET_CLS_FLOW=m
+CONFIG_NET_CLS_CGROUP=y
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_ACT_POLICE=y
+CONFIG_NET_ACT_GACT=m
+CONFIG_GACT_PROB=y
+CONFIG_NET_ACT_MIRRED=m
+CONFIG_NET_ACT_NAT=m
+CONFIG_NET_ACT_PEDIT=m
+CONFIG_NET_ACT_SKBEDIT=m
+CONFIG_CFG80211=m
+CONFIG_MAC80211=m
+CONFIG_RFKILL=m
+# CONFIG_VGA_ARB is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_CDROM_PKTCDVD=m
+CONFIG_ATA_OVER_ETH=m
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_ST=y
+CONFIG_BLK_DEV_SR=m
+CONFIG_CHR_DEV_SG=m
+CONFIG_CHR_DEV_SCH=m
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_SPI_ATTRS=y
+CONFIG_SCSI_FC_ATTRS=y
+CONFIG_SCSI_CXGB3_ISCSI=m
+CONFIG_SCSI_BNX2_ISCSI=m
+CONFIG_BE2ISCSI=m
+CONFIG_SCSI_HPSA=m
+CONFIG_SCSI_3W_SAS=m
+CONFIG_SCSI_AIC94XX=m
+# CONFIG_AIC94XX_DEBUG is not set
+CONFIG_SCSI_MVSAS=m
+# CONFIG_SCSI_MVSAS_DEBUG is not set
+CONFIG_SCSI_MPT2SAS=m
+CONFIG_LIBFC=m
+CONFIG_SCSI_QLOGIC_1280=y
+CONFIG_SCSI_PMCRAID=m
+CONFIG_SCSI_BFA_FC=m
+CONFIG_SCSI_DH=y
+CONFIG_SCSI_DH_RDAC=m
+CONFIG_SCSI_DH_HP_SW=m
+CONFIG_SCSI_DH_EMC=m
+CONFIG_SCSI_DH_ALUA=m
+CONFIG_MD=y
+CONFIG_BLK_DEV_MD=y
+CONFIG_MD_RAID0=y
+CONFIG_MD_RAID1=y
+CONFIG_MD_RAID10=m
+CONFIG_MD_RAID456=y
+CONFIG_BLK_DEV_DM=m
+CONFIG_DM_CRYPT=m
+CONFIG_DM_SNAPSHOT=m
+CONFIG_DM_MIRROR=m
+CONFIG_DM_LOG_USERSPACE=m
+CONFIG_DM_ZERO=m
+CONFIG_DM_MULTIPATH=m
+CONFIG_DM_MULTIPATH_QL=m
+CONFIG_DM_MULTIPATH_ST=m
+CONFIG_DM_UEVENT=y
+CONFIG_IFB=m
+CONFIG_MACVLAN=m
+CONFIG_VETH=m
+CONFIG_ATL2=m
+CONFIG_ATL1E=m
+CONFIG_ATL1C=m
+CONFIG_B44=m
+CONFIG_BNX2X=m
+CONFIG_ENIC=m
+CONFIG_DNET=m
+CONFIG_BE2NET=m
+CONFIG_E1000E=m
+CONFIG_IGB=m
+CONFIG_IGBVF=m
+CONFIG_IXGBE=m
+CONFIG_JME=m
+CONFIG_MLX4_EN=m
+# CONFIG_MLX4_DEBUG is not set
+CONFIG_KS8851_MLL=m
+CONFIG_AX88796=m
+CONFIG_AX88796_93CX6=y
+CONFIG_ETHOC=m
+CONFIG_QLA3XXX=m
+CONFIG_NETXEN_NIC=m
+CONFIG_SFC=m
+CONFIG_SMC91X=m
+CONFIG_SMSC911X=m
+CONFIG_NIU=m
+CONFIG_TEHUTI=m
+CONFIG_VIA_VELOCITY=m
+CONFIG_PHYLIB=y
+CONFIG_CICADA_PHY=m
+CONFIG_DAVICOM_PHY=m
+CONFIG_ICPLUS_PHY=m
+CONFIG_LXT_PHY=m
+CONFIG_LSI_ET1011C_PHY=m
+CONFIG_MARVELL_PHY=m
+CONFIG_NATIONAL_PHY=m
+CONFIG_QSEMI_PHY=m
+CONFIG_REALTEK_PHY=m
+CONFIG_SMSC_PHY=m
+CONFIG_STE10XP=m
+CONFIG_VITESSE_PHY=m
+CONFIG_ADM8211=m
+CONFIG_ATH5K=m
+CONFIG_ATH9K=m
+CONFIG_B43=m
+CONFIG_B43LEGACY=m
+# CONFIG_B43LEGACY_DEBUG is not set
+CONFIG_IPW2100=m
+CONFIG_IPW2100_MONITOR=y
+CONFIG_IPW2100_DEBUG=y
+CONFIG_IPW2200=m
+CONFIG_IPW2200_MONITOR=y
+CONFIG_IPW2200_PROMISCUOUS=y
+CONFIG_IPW2200_QOS=y
+CONFIG_IPW2200_DEBUG=y
+CONFIG_IWLWIFI=m
+CONFIG_P54_COMMON=m
+CONFIG_P54_PCI=m
+CONFIG_LIBERTAS_THINFIRM=m
+CONFIG_MWL8K=m
+CONFIG_RT2X00=m
+CONFIG_RT2400PCI=m
+CONFIG_RT2500PCI=m
+CONFIG_RT61PCI=m
+CONFIG_RT2800PCI=m
+CONFIG_RTL8180=m
+CONFIG_WL1251=m
+CONFIG_WL12XX=m
+# CONFIG_INPUT is not set
+CONFIG_SERIO_LIBPS2=m
+CONFIG_SERIO_RAW=m
+CONFIG_SERIO_ALTERA_PS2=m
+# CONFIG_VT is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_NOZOMI=m
+CONFIG_HW_RANDOM_TIMERIOMEM=m
+CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_ALI1535=m
+CONFIG_I2C_ALI1563=m
+CONFIG_I2C_ALI15X3=m
+CONFIG_I2C_AMD756=m
+CONFIG_I2C_AMD8111=m
+CONFIG_I2C_I801=m
+CONFIG_I2C_ISCH=m
+CONFIG_I2C_PIIX4=m
+CONFIG_I2C_NFORCE2=m
+CONFIG_I2C_SIS5595=m
+CONFIG_I2C_SIS630=m
+CONFIG_I2C_SIS96X=m
+CONFIG_I2C_VIA=m
+CONFIG_I2C_VIAPRO=m
+CONFIG_I2C_OCORES=m
+CONFIG_I2C_PCA_PLATFORM=m
+CONFIG_I2C_SIMTEC=m
+CONFIG_I2C_TAOS_EVM=m
+CONFIG_I2C_STUB=m
+# CONFIG_HWMON is not set
+CONFIG_THERMAL=y
+CONFIG_MFD_PCF50633=m
+CONFIG_PCF50633_ADC=m
+CONFIG_PCF50633_GPIO=m
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_M48T35=y
+CONFIG_UIO=y
+CONFIG_UIO_AEC=m
+CONFIG_UIO_SERCOS3=m
+CONFIG_UIO_PCI_GENERIC=m
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT3_FS_SECURITY=y
+CONFIG_XFS_FS=m
+CONFIG_XFS_QUOTA=y
+CONFIG_XFS_POSIX_ACL=y
+CONFIG_BTRFS_FS=m
+CONFIG_BTRFS_FS_POSIX_ACL=y
+CONFIG_QUOTA_NETLINK_INTERFACE=y
+CONFIG_FUSE_FS=m
+CONFIG_CUSE=m
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_SQUASHFS=m
+CONFIG_OMFS_FS=m
+CONFIG_NFS_FS=y
+CONFIG_SECURITYFS=y
+CONFIG_CRYPTO_CRYPTD=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_FCRYPT=m
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_CTS=m
+CONFIG_CRYPTO_LRW=m
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_XTS=m
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_VMAC=m
+CONFIG_CRYPTO_WP512=m
+CONFIG_CRYPTO_XCBC=m
+CONFIG_CRYPTO_LZO=m
+CONFIG_CRC_T10DIF=m

-- 
2.45.2


