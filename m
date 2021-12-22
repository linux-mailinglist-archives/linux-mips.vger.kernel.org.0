Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFC547D322
	for <lists+linux-mips@lfdr.de>; Wed, 22 Dec 2021 14:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbhLVNon (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Dec 2021 08:44:43 -0500
Received: from mail-sgaapc01on2096.outbound.protection.outlook.com ([40.107.215.96]:27233
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229834AbhLVNon (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Dec 2021 08:44:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5HH1/DJM4+yDN6fyk7zQezEfLfHAUArGk22OqrbPW0G/f2ZslEMsquvVP8P7r8EGUcYr9lICdnqdiur181x/sh7M1cR/kqrUbwg3dyr2cs760ZSvFCM7pk/Q6KwamxeIVgfSiLSePEwVDizurArC8/qw20sFBMXKkXNF2YiY7edPEIZYPddUCcvntdE8LoJ4XiCZU9ZtUIK7DULYLzPVlOcbOV68L310eiO5C0vjMoKdCDbhWUU45CQMZFr9ExQ7GXP0isBWsoT/31DG0lbUJsdJEF5Ng6GUXVhVdfnKgPhmeIVolf06VAVJWdjBD2HG5AAWdP670uil1dFgKHFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtXZTeVWYvwR4vJVsFtVTJJnp4vS4EgHZwNvHqSMcls=;
 b=RMQWOLYdBNQbftrXXmTWXOfVL4b+B6jO8M7C1gq25Jh4bPDOypzjg7ExM0nL4dT50qFzua85d7aDLu500nybbgpjrLlppm1ip5ptfLR2wc0TQHQchA4vn7zmqSIiNwIlO7dPL2DjpvYcNMgZpdetSjy3gI8N2LokglvrzD/sUsONlR8GiTfH6BgGboadjHI+dkL2M4XbANAVkcbiQNQ7QOXrFM5dQMux2OUsQjJF7INcmQgBBTsP17DRdf+sf7/VGMchPfabwmU5TlFhqUp3OTD9XIvKeqf93+T8eZcQ/fqflZL+9L89bu85yD5DnPuP8MyIcNuiRK5sKgcP2vyRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cipunited.com; dmarc=pass action=none
 header.from=cipunited.com; dkim=pass header.d=cipunited.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cipunited.onmicrosoft.com; s=selector1-cipunited-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtXZTeVWYvwR4vJVsFtVTJJnp4vS4EgHZwNvHqSMcls=;
 b=mz5CAp/1RSlktlGWuo/8HXz0A7IfJn/lof+FJViVaUCyRv/mz/csVUxxRN06LdVzuRUS/69s6jG9OzBlIvysGoZwK2uKLKggHwoyQ1B4WCZqQdPR5YenzyZlefol3VdQYeY2b18pMxUuZxwl//duF+2qm9/QBTKYUvjzjU93PjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cipunited.com;
Received: from SG2PR04MB3961.apcprd04.prod.outlook.com (2603:1096:0:f::8) by
 SG2PR04MB3818.apcprd04.prod.outlook.com (2603:1096:4:a2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Wed, 22 Dec 2021 13:44:41 +0000
Received: from SG2PR04MB3961.apcprd04.prod.outlook.com
 ([fe80::e848:e901:d420:fa49]) by SG2PR04MB3961.apcprd04.prod.outlook.com
 ([fe80::e848:e901:d420:fa49%6]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 13:44:41 +0000
From:   YunQiang Su <yunqiang.su@cipunited.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, paul@crapouillou.net,
        zhouyanjie@wanyeetech.com, jiaxun.yang@flygoat.com, syq@debian.org,
        aaro.koskinen@iki.fi, YunQiang Su <yunqiang.su@cipunited.com>
Subject: [PATCH 2/2] MIPS: new Kconfig option ZBOOT_LOAD_ADDRESS
Date:   Wed, 22 Dec 2021 13:43:46 +0000
Message-Id: <20211222134346.1366067-2-yunqiang.su@cipunited.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211222134346.1366067-1-yunqiang.su@cipunited.com>
References: <20211222134346.1366067-1-yunqiang.su@cipunited.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To SG2PR04MB3961.apcprd04.prod.outlook.com
 (2603:1096:0:f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea0cbf4b-c120-406b-19ef-08d9c551343d
X-MS-TrafficTypeDiagnostic: SG2PR04MB3818:EE_
X-Microsoft-Antispam-PRVS: <SG2PR04MB3818176F63A4D5F4C973E44FF27D9@SG2PR04MB3818.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/SlPLBPhFshtyn1AH20AUJ1h/IHkMYbSJ4XotkzntuB/q/D2sqOCKMToYP2k/Yx3zcbxxnRsJEIyUGP/4Phck8PSil0C0JIMmQ1Z/WGdLeYiFQ7io3Re4iVPZO7JQOxGIlCTlHDVGkFmDnJPeLkDHfL10eHBo8QWFwmjvCZowOtoNXgwz0uG5Zu/+JiDD2HO8w5GnPDzP21iU+mj/4Yv1f8QIbsrJA47b50Q1c/8wkrTyN1lsMrwC8/BhPtFwNEXFRBTQ4nyvIhrrKNiWXru6dh4kf8+w+6P9AaeSOZZDZl0j7KKxms8gOq4cs8BFq+fKfiypnbLIR+ULRDxOILdm4hpJaluYg5sWbTAx+Vsd246aGrnXPa0N8fwVT5+C+3EJICVk5u4U9BvIr6z4tFgfi0gpzFYt8DgHFeXfsjsVDTDWHYatQEcLKVlAupPN6Gz8rGqCiOVgUnnohU8QcAia4KLcrEI2GaQWAFm4mpFkZ7P9XUEDiR1pndQDlAJyeRH97jE4Kb2yThBnc8nVu/j5xgmHQnvt/if4cYIa7bQ8pRRFcKEKfAg7glZR9VAU+uzlKaefaRFRsPTSX9xLFAZuAwTSZNVqToMh2BQonmS8Glw14RNKHifGJmaLbJWpCM2Z9TW5+ydBwHhWPJOqvBOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB3961.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39840400004)(396003)(346002)(136003)(376002)(2616005)(66476007)(66946007)(6486002)(6916009)(107886003)(8676002)(38100700002)(4326008)(83380400001)(6512007)(66556008)(5660300002)(1076003)(186003)(36756003)(2906002)(316002)(8936002)(86362001)(52116002)(508600001)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7RMBNEfKozz0Xlz6bWEEenqcfHqGLOiJfkRwdxBJd7jWeJaqqZSnBoo6qZzD?=
 =?us-ascii?Q?bVyrW0DzhYkC5k4/m6sxVL0P4JmTjyi49g0tFdwpv0JAxnCBbBZqT7BdtohN?=
 =?us-ascii?Q?gHYLY1Z9FVBSGsM0wn32s2NlYYQI6qLAyJTCL6KA/gC8uaGWebMDyYhQd2Lf?=
 =?us-ascii?Q?zTIqiUBLWvPXq0o+gj2eYjUsNLsoVB7TVnzNPhp8Ym3oNvNf9iIuJUXizcXv?=
 =?us-ascii?Q?oqSppj8CG5JAK7hKTqhOVGdWMMQIMjyYi0LDbPcMWcSwDVdXHGctv1F7sQDe?=
 =?us-ascii?Q?g7Xr8Gttz0/5L2s7m1wlyofXnkhJAK4n1OIj7pAREtbXby9M4UEkXNByeiIw?=
 =?us-ascii?Q?mulbr48hkmsAL3IQaNDXiUryMMzfbcJicDc1Gro03OFRxLJxNN4cGwzdzVg6?=
 =?us-ascii?Q?jMT8yuRgrEU3cYCurp8hD+lqvHDkTViiRaZFxQ2duaOYzXxu6MWUouHx8OfH?=
 =?us-ascii?Q?uDkm0YqGuEqYPegk6cP6rQ6Ef24XrAFqJOtoKAw1sjhXY8l4KK27sDA+wI5L?=
 =?us-ascii?Q?5C3ho8jpczyvdHThGrQm506EwLhIPWe2s3gL+nRBIEC0DenwTY6pLwID3BMb?=
 =?us-ascii?Q?dV2FOaZcsPcloFGevw8/k5L3rm3ErHPyc3OrDtOJ5LHdQXXoYJAlWS343Q6z?=
 =?us-ascii?Q?2bSQERkHrNok6QWhv3BzHpzHnZ27iMY4j1J5FL79lCgwKOzeY24e7SXTudjp?=
 =?us-ascii?Q?zEswdwj2M0xkvnYzscStNvanaJ5+1p223/K0xncd3/NfYl3daUTf3zn9kDH8?=
 =?us-ascii?Q?QT6JYZTdfEGm9NOk03ai4R3MX28K3gJWKBcWcCu6LBhjBHX+YWlYMCzUQvw6?=
 =?us-ascii?Q?ATKWai6hifBiindg60kXbPYAXSr8CwqT0N9f8v0bVAc5sf4T5AUpcpTKzNs9?=
 =?us-ascii?Q?2+4Gg25meQ18lLOjgR0YvRaQ3j61k+3O3dYLYfTxykfW4XzPlOMDoiGSDX1g?=
 =?us-ascii?Q?B1GAALxR1i5jQ3Pc2d5+hJIa4cBgrp6P5COZHtmuiYuFRFU6VbdwNURRzB6G?=
 =?us-ascii?Q?nPb18ysajx7Uxcs3DTlmuiaYR8k/zH272mKry2RH/In+5iGJeHjA/nJ0xccE?=
 =?us-ascii?Q?XkEeaA/tX9XR7JfpVZbJ1lDUk+w6wQTqJgP1n9Dclny2H4vKohELZI5fkJV8?=
 =?us-ascii?Q?GC/o/BtTt9D0zW9LZWkyv8mo/Vwjw4pzoVXOrCQe/3nyB/ik77RRoARRX55T?=
 =?us-ascii?Q?R+Rk6CMZo3gsguptIr2yW4JX1e4j95vVEeZcXsqlBTBiQObfBMXfK/1FgiMI?=
 =?us-ascii?Q?aL1JpwZIwal4uNyX9PiSjkV++Zl1RTAtiWBE8LwCv6N/t0uT8j2QurZbc3w9?=
 =?us-ascii?Q?qrHSfSoh5k3+DSOGycgKRiFD3uuKDPcrmiToNpMYDG4GzhQdo4d1YL6KwTR5?=
 =?us-ascii?Q?fNzQW7OtoDDEjK1YuQQ+IlujGe/xFhDFzr4aauPvqRZQmuJAPUlvIHNThzbi?=
 =?us-ascii?Q?mU8Bfr3txVpzBgysm+AwKrWOF1s6DR6CB1hO2J0b5VhQcRU/ZMcuus2irrin?=
 =?us-ascii?Q?2B47Axr3xbqN57wLiu4wyOZhQjHblPe72MIQOZDaZZ/51vj6UX86gYyieZaF?=
 =?us-ascii?Q?kFAyQyly2ZcKRSL6YrOpsrs8eetFNNd/B9QY108BcECO7waJAxmRy3uIdNqQ?=
 =?us-ascii?Q?FIidblozQL6q9LYWoYZhXfC7tuDVQlD8EVP1axTfk6Xwt5Akubn0TgSISchU?=
 =?us-ascii?Q?VoH0dV1SW/K5AMV+l5xqbh1ZokQQBdYcQ9ECTh437OtyEfpaUDRNShx+b37G?=
 =?us-ascii?Q?LfLt7EjqiQ=3D=3D?=
X-OriginatorOrg: cipunited.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0cbf4b-c120-406b-19ef-08d9c551343d
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB3961.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 13:44:41.2202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e31cf5b5-ee69-4d5f-9c69-edeeda2458c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFnOuxkUbC/N3KtlsyqANRnESU7rUMrlvWpPL3oD3BcJUjj7kdhtTwKLFiJ3O6MEh/a/NHMy1tFcPUtKt18LtyBHpzkYn/pwP7AnaDpCeuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3818
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If this option is not 0x0, it will be used for zboot load address.
Otherwise, the result of calc_vmlinuz_load_addr will be used.

The zload-y value for generic are also removed then, as the current
value breaks booting on qemu -M boston.
The result of calc_vmlinuz_load_addr works well for most of cases.

The default value of bcm47xx keeps as it currently.

Signed-off-by: YunQiang Su <yunqiang.su@cipunited.com>
---
 arch/mips/Kconfig                  | 10 ++++++++++
 arch/mips/bcm47xx/Platform         |  1 -
 arch/mips/boot/compressed/Makefile |  4 ++++
 arch/mips/generic/Platform         |  1 -
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d6898c7e2cb8..610cb7d36967 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2114,6 +2114,16 @@ config MIPS_VA_BITS_48
 
 	  If unsure, say N.
 
+config ZBOOT_LOAD_ADDRESS
+	hex "Compressed kernel load address"
+	default 0xffffffff80400000 if BCM47XX
+	default 0x0
+	depends on SYS_SUPPORTS_ZBOOT
+	help
+	  The address to load compressed kernel, aka vmlinuz.
+
+	  This is only used if non-zero.
+
 choice
 	prompt "Kernel page size"
 	default PAGE_SIZE_4KB
diff --git a/arch/mips/bcm47xx/Platform b/arch/mips/bcm47xx/Platform
index 833b204fe5da..fe6daba3f948 100644
--- a/arch/mips/bcm47xx/Platform
+++ b/arch/mips/bcm47xx/Platform
@@ -4,4 +4,3 @@
 cflags-$(CONFIG_BCM47XX)	+=					\
 		-I$(srctree)/arch/mips/include/asm/mach-bcm47xx
 load-$(CONFIG_BCM47XX)		:= 0xffffffff80001000
-zload-$(CONFIG_BCM47XX)		+= 0xffffffff80400000
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index f27cf31b4140..85d5082db917 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -89,6 +89,10 @@ HOSTCFLAGS_calc_vmlinuz_load_addr.o += $(LINUXINCLUDE)
 # Calculate the load address of the compressed kernel image
 hostprogs := calc_vmlinuz_load_addr
 
+ifneq (0x0,$(CONFIG_ZBOOT_LOAD_ADDRESS))
+zload-y	= $(CONFIG_ZBOOT_LOAD_ADDRESS)
+endif
+
 ifneq ($(zload-y),)
 VMLINUZ_LOAD_ADDRESS := $(zload-y)
 else
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index d7c8cff6de2c..0c03623f3897 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -13,7 +13,6 @@ cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ing
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
-zload-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff81000000
 all-$(CONFIG_MIPS_GENERIC)	+= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S
-- 
2.30.2

