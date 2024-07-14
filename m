Return-Path: <linux-mips+bounces-4314-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B409930852
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 04:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0651F219E3
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 02:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DA8BA2B;
	Sun, 14 Jul 2024 02:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="JxTPxSMc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hPAuQOVm"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532EF14F62;
	Sun, 14 Jul 2024 02:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720923685; cv=none; b=iCMdrX20qnh87dSU4CILF0u3AKob/z/pJ8hkpf/3Hc8rkMKIqcKsAtm/E10SLoiU9vhoWH/B/2pzTr4EveV5uWSTQd1AtpHj/sklqXzQxFcHLODQh6RKDrrKao/3c3CFnvTW6KUICf5bM/b146HDOBxcKcBXIoyHCLJ5Tns62yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720923685; c=relaxed/simple;
	bh=9w/gXhSH8cTFJ9WkyG+QUL+daKuNKx2bqEPIbSMtBhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac8i4uhSuTGPzxR9G9o+vI39ozaqQhP5oy0AfnVWvhHPtdfOF6p3QYHLbzFYHg/MTnKx2fciyx2wb3zFu0aePKMf19YdA8FSOM6QYvzbIfoiImR22zWu6IY3wYobW72nb3XH9v+zTj+U9NVo4vSop/RdQrfHeR2P8ggD+WnL6MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=JxTPxSMc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hPAuQOVm; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6EAFB1381118;
	Sat, 13 Jul 2024 22:21:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 13 Jul 2024 22:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720923683;
	 x=1721010083; bh=KNlSjJnk5kGhwjk8nWMjqJ0zIonLYzftkxU3Tv1pcg0=; b=
	JxTPxSMcnzjFsyCG7OUEu1QilhjTHWkpjgGnPxVpNj/qL3zeYayxMyrHzeJyHTZk
	wj9WDrbRWYxiATc7DH21XyE1PV7UAJceegRwU4b5XLaPRGOUM773UpkvPSCjjqV+
	+1mvukyw0v7cE+ikNhwFZkhAeJj2iAR6VTQUPQv4wBm1e5XkNGYFPHcFFnIJ1UbG
	RCE4cWP71djaTSp2yH8aQdANkVor+yuri2fQjUIl1Vk0N0yedGjlpVRkM3RokTw1
	3SBpJPXARz8Z0B79ru37OSOgQWTjJyJR4l/q1pEBykdbTMHOYqqo7lKbkUgY05rL
	F0V3yeBr+YoXwB4SJuksPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720923683; x=
	1721010083; bh=KNlSjJnk5kGhwjk8nWMjqJ0zIonLYzftkxU3Tv1pcg0=; b=h
	PAuQOVm0O9GuJ+aB5NJhi6z6cC2e57Jek+jhg6vPzaqEguJTEIERcnKPQnxjhZZG
	AFDHpwNyYk4vY8vn9vjriDENCHWnjmMGsItRuweBNSd6KrJv1zAvKUr9/AU+Pkmq
	HaY/DAYsGQ1C7SL6K3yMlHBusy2DQ2HHRSOrnRJ9IOgBmNiQk3E0nANC6Okaa7j+
	sk2bwlsBQLw/kISQXTm4oSBsSI5lJT61Ykc9IuPi++s6acHy1U/cYrTSTtwIQZj1
	mJloflMqoYUyKyuTDpjpIKjzVcWDYRX0e1VdF01ojSvQOwaAhLtwhkXlSkzVANvs
	eRwlskbWCQPYce1sXrF+w==
X-ME-Sender: <xms:IjaTZjcziRo5aSgG3DgyeqyYbqBLQL3YtqZPsVekxH72c_9lMpoMBA>
    <xme:IjaTZpNUGMG-s8mizZY8XS1788Qjy9r2pKqMrsTX8acdKyPHf9XNfI9IcuQq4rO49
    CgNvIR_HAjDeVhSxHo>
X-ME-Received: <xmr:IjaTZshsPHzhn3vztJNoHYCa8_cWr8zaUlkUpFcFwpW8XOTkHQmWeM_8PTQmsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:IjaTZk9tuSzc10EzQJLEXIiH4q8-cen6tej-Acr-GMJYVP1O-neQdA>
    <xmx:IjaTZvtIQCbOrZmbVP5gDYopvEvBsV1bOytaOA-eB5xN1eGiG55aog>
    <xmx:IjaTZjExO32rDYdOU7GV44tOOHD28P40izohds4XAlqgSZinOvghaQ>
    <xmx:IjaTZmOJL8ocpNOsGe2W18U9rsLc7ynY2QrTKxQbcsS2eTaqoeOG-A>
    <xmx:IzaTZpLBtUOpU4JrDqy210k8-qUgTCEMi4CZCUsd__1H-8Nj3Vpr6FeH>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jul 2024 22:21:20 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 14 Jul 2024 10:20:50 +0800
Subject: [PATCH v2 4/4] MIPS: config: Add ip30_defconfig
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240714-config-refresh-v2-4-33f1649b2efc@flygoat.com>
References: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
In-Reply-To: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4870;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=9w/gXhSH8cTFJ9WkyG+QUL+daKuNKx2bqEPIbSMtBhA=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTJZoLK8Rn5DrMrn7CLvTCU/Mfb2yv/613Bw4PsD75N6
 4+u/CTUUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABPZpMbI8OefbK9Ul5Vi24Gj
 C7x19m9Iur7A+GZVqH96IBPbacdUMUaG8/OmdAX5fTwZFbR+6w/HLfG6IW5v1eeufRyf6a7ZlMn
 KAgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Add ip30_defconfig derived from ip27_defconfig to ensure this
target is build tested by various kernel testing projects.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Update remove WiFi stuff and include IOC3 stuff
---
 arch/mips/configs/ip30_defconfig | 183 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/mips/configs/ip30_defconfig b/arch/mips/configs/ip30_defconfig
new file mode 100644
index 000000000000..178d61645cea
--- /dev/null
+++ b/arch/mips/configs/ip30_defconfig
@@ -0,0 +1,183 @@
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
+CONFIG_LIBFC=m
+CONFIG_SCSI_QLOGIC_1280=y
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
+CONFIG_NETDEVICES=y
+CONFIG_SGI_IOC3_ETH=y
+CONFIG_INPUT_SPARSEKMAP=y
+CONFIG_INPUT_MATRIXKMAP=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIO_SGI_IOC3=y
+CONFIG_SERIO_RAW=m
+CONFIG_SERIO_ALTERA_PS2=m
+# CONFIG_VT is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_IOC3=y
+CONFIG_NOZOMI=m
+CONFIG_HW_RANDOM_TIMERIOMEM=m
+# CONFIG_PTP_1588_CLOCK is not set
+# CONFIG_HWMON is not set
+CONFIG_THERMAL=y
+CONFIG_SGI_MFD_IOC3=y
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


