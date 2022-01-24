Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BAF497960
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jan 2022 08:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbiAXH0p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jan 2022 02:26:45 -0500
Received: from mail-eopbgr670066.outbound.protection.outlook.com ([40.107.67.66]:27590
        "EHLO CAN01-TO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241758AbiAXH0o (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jan 2022 02:26:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9dXEZGFkZwVmwqk/MjqduEJZHnSWcylX1KNYl8NONIj6HSTnzDhF+QmHDFPe3mHqSSnbbPUIDAUtT7jvxPH8MsbofLrdbKq4o3ifBa1j3NgUJPpkb/sCCwWnL8OWRTIedOKP9sTE7Bc4yvv/nbHumnd2hLLs1FjSiDQI/XKrh5Zh37kUeUyBoU/LRcXzSty9mG0sGqxhzrjAmUjNGREOS7xgttljWdqrBNNo7nogZzJWzrGHbPXGUof5O2gHQPdB+qoq4okbeYm9jAcNzTDB1KdiA6bxGLRmwQz/HDxGPuno8n+HMoXZMNAPa5jmYfXsfAELaBD4Eb758TXGobSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVnLrXAq2m90aJ89nZVQgiWLri5G8LALAsTEn8Ealls=;
 b=I8BVytGSMwWLIN/J68EPve0OwbYSr4/moLBjSXvR2kTr1DRgFZJhviPvmv/fmfAOake7+M8xZmZZYj/frud80ZOcEwoqeeJXAL3LpXVzDMRASDgA6AphMErZ6+axfDsjLc1yQHw8MBoZ/HOtZI1xg7dMq1d3bjp49TS0d0jFKzs0UghjPQj8OB+4f4MTeRgsMxN9En72cZACth7p4cKWJhYx9ygulf9sxdOE+t8nL8y53YLA/VxGCDTvP9oQcpasaO575PudCorcU8bJ2BkmsrkI7JzRUFr3ahAMaoTOn77EAMihxc5MXomJYNGFB7MlkEjo5Tn9FGfG/ya1VIOE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ucalgary.ca;
Received: from YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:4a::23)
 by YQBPR0101MB8976.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 07:26:42 +0000
Received: from YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::9171:2dc8:bb93:44c9]) by YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::9171:2dc8:bb93:44c9%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 07:26:42 +0000
From:   Wenli Looi <wlooi@ucalgary.ca>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     Wenli Looi <wlooi@ucalgary.ca>
Subject: [PATCH] MIPS: ath79: add support for QCN550x
Date:   Sun, 23 Jan 2022 23:13:31 -0800
Message-Id: <20220124071329.76057-1-wlooi@ucalgary.ca>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:4a::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fe5b49e-5ef0-43d3-c375-08d9df0ade1d
X-MS-TrafficTypeDiagnostic: YQBPR0101MB8976:EE_
X-Microsoft-Antispam-PRVS: <YQBPR0101MB89764C636063E3E2E3D59E8AB25E9@YQBPR0101MB8976.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RbWluhciaeAHwl1D2RChttDnS1HJ94dMMXIqQtmVl6TgDw+EzXeywzv1CYuQXjxd8iPNjs26fp5rL/UnvsiUFbgjBZvbeAXsGVBccyZ3I/cG1DXSSIDCEexAp+n+rpkqNx6WqNLyeV/7aBtQ91rVBfqdzUTTjPD1EcLkbPmso0AsX45ReS2sv3j15NFE26U9t+5k5x7bx3q5bxiHWuiFqDTRjWH8SURFPFYu0IuYpHSFoKFUw/XmzBnGIX8ECIkJ2K8Lmam6vjfnnNmeU2ieYic+JZw9BVGtJPP++7uLfpfhxXYKzeDO914ZDmjbSLK149sISSyIIUYYMv3QtkqhW+n8lq/RAbXuKCCEnu7DpTkQdFzOgROeJndufQ1RMaeSVJhpqit3idn7ZKfV+/c7oO+HiDW1CrmFGHoYosqEXNz568vYUiGqEEwBzXtAuHcdO6N5oC12ZYxbMKXJaCHKh0iVJKX5cBkb6saVeAgwCFhd8dp4nJSmf1ODS+3wwn5iBETA7o2Bwov2wwSo3WQ6XkiB0QcGr8CthgWLOMTsoEu3Nv+DNk0TgiUzLopNSw9mxNeKQfA9Qvc+kzKfmwFZc1px/wlbUaNEeaoSHHVfu8vgFcdEbwU4F3hKV5aM+UNQnqlF6tnQXCTpIOtJ4yZtfIyD69KBVCofiOHwTn4wXNEcTfQyWnI7i40l2GgnbTKyAoKga03aRqdcjmhV228AUUPnWgqxS5LRq48p/ZXLNO01UkEEG2zqad8v2wNAloKk39FNDZKWFeziqE3j0CqtdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(8676002)(966005)(6506007)(66476007)(83380400001)(26005)(2906002)(508600001)(6512007)(86362001)(107886003)(186003)(1076003)(4326008)(2616005)(66556008)(66946007)(316002)(5660300002)(36756003)(786003)(6486002)(38350700002)(38100700002)(6666004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QdnGtikJ3FAid21UvyZgrYkLbDdg/qyl5dcZ1vB5Ii0lSWZwkbQFaa26ay9f?=
 =?us-ascii?Q?vxl46OyIdNgUZSBnzwZZ9vE2dZ9pkMDkKHvd8tmQaZgBjwIRgtqCcixJ7+sA?=
 =?us-ascii?Q?gFLyMY9ZuqituJ1fvD0HhGq0LUQ6CMC1VIM5R+IhjY5PJWMFcedvnwixJLtn?=
 =?us-ascii?Q?C0TD37rnw2LEzAx1oR90IDqwMGMdKjhsxdwbc5OI+YPCouxEYztSScGJSxxc?=
 =?us-ascii?Q?yz8LMvFd+rdy2ipAv5PfXPb00DOsMHd4xjxo5/juxk0NqDeOmk+DsyoF4uuw?=
 =?us-ascii?Q?iARmCvfmRj+0KrGZyOZpSExJ2lV/lYv7osc/htMq6EYX5/vXnNXDKNgraMuG?=
 =?us-ascii?Q?oaj8Uo2EU6kYJiE9i3bU9rPLbdGLhlDNAjtC7xd//SYQVz//G5ylx/SWqyDy?=
 =?us-ascii?Q?syuf+wt3UgWJb9ttRGtxfZy9XO4VN38klTAVTMSWOLdI/wc38GI1HPTqOMPQ?=
 =?us-ascii?Q?xiY1ZHYpWkRXL+sP6U2r+1Qt4MMdYg9FvhVTX71vAW3ugBRPwqsGLnMdQTIC?=
 =?us-ascii?Q?pimCcsmLNcbq3M5PDzRDV4Mm3hXTiSf22m7SaiF2rJq6bdStWKcoeLgiASqD?=
 =?us-ascii?Q?/UL+CJBYos9rCyyRvjGhfY7PwXUHVe6qpLxfHrmqPnMqvU+38Nj4rKXfdI7P?=
 =?us-ascii?Q?XGemx9vGW7e/4JiR7y2hOd3FgrlJ3P1iHJcgHFYXyOq0fUquKbnquLZ3vknV?=
 =?us-ascii?Q?eP9Zgji1dbA8sdTgXerQwjc4dpKTTsSTNVYJowulCsOyGuHavWWy6EUtVYHG?=
 =?us-ascii?Q?Zsi4d2bx1cYe7WJwR0FzHmOGAap6sbGZ1QbHA0EdINlQY2ox+3U0cegXmRrF?=
 =?us-ascii?Q?JKMTg2eIzEgLtKvihoaQbjBDTS0B/0jkZ7Et8TJdcMF7TwQl5WO3qb9Z5Gw9?=
 =?us-ascii?Q?P/jzQWhTMXWgoVp6qsJFzsMlFA5LQCwDTO4oEGw2LXmu6Upfrgq+9SGiKM3A?=
 =?us-ascii?Q?f1CqvZSsRA1tmpVjQN4w5q5ZbRyM2VU20BxFqF6vgd4aEQN2e4jE6Mqogg1k?=
 =?us-ascii?Q?CARKcnIkEQL/CaQSAhSrM2MK1hqhvlruJ/c59hQTggrAZTyaBNyAYjuSxufl?=
 =?us-ascii?Q?aDoqHoSjfQWxL2NOXZ6C6rhvUl6kx+aFTzSnDmX4srR9IocUjrPG2D5qgV7z?=
 =?us-ascii?Q?rK+uZl/sY1gdt5Pq0TRFnhPAJvNXXUq+gI7XqFkK5k2M5JjrX9KBCUDbql/D?=
 =?us-ascii?Q?VFBMmj5vliJ7ZZ23UKGJgMs6gA/QZSNN8NKToyNVslzl9sO5iOKiEyja8jNs?=
 =?us-ascii?Q?d2SbH4HK1u/IQUATIiReT1mhLlzh0QLgI5NhWKrHr5lxpbetzgiim2R+jPDN?=
 =?us-ascii?Q?VdsN0gzdZ9hKBX/oDHWixmUM+uID18C/n2C6HwbcVp4No62gZdO2KdjOt92M?=
 =?us-ascii?Q?+tH4Oguxi8xMSsauiCViVSgYT4PFllUE/GFr/6lZsf63PMKNO33WPV7pbMK7?=
 =?us-ascii?Q?zSol7fFl8x2bQ79q5tX6pjZc8UN7rGo9l1ejOCO+tphj3Fs50CG/Lj75+Coy?=
 =?us-ascii?Q?tMjW5aAbcx4QcervDQIrlQNhhJPKLu9N10ZjUgh9Ea7ZvbzggdG/Kzj9AmTX?=
 =?us-ascii?Q?qieKQaaqAcq1YyWcWDN3LO4ZdapKEt1zIHr7gEPc8PjNs8ohB66vqnqW/m52?=
 =?us-ascii?Q?b5Jr4+CddcZErMDY/CJKKNc=3D?=
X-OriginatorOrg: ucalgary.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe5b49e-5ef0-43d3-c375-08d9df0ade1d
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 07:26:42.0826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c609a0ec-a5e3-4631-9686-192280bd9151
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rWfUD065ejNyKmmVdlFOlb2BZX5LAHTOA4TFoy50mz+LyiJJxSaYTFVKg1PWdqw04AwfYDKGEu4S1BJ1SVHpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB8976
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds support for QCN550x, which appears to be very similar to QCA956x.

Signed-off-by: Wenli Looi <wlooi@ucalgary.ca>
---

Notes:
- OpenWrt pull request: https://github.com/openwrt/openwrt/pull/4271
  (contains boot log with stock firmware and with this patch)
- QSDK source: https://source.codeaurora.org/quic/qsdk/oss/system/openwrt/tree/target/linux/ar71xx/patches-3.3/9991-MIPS-ath79-add-SoC-detection-code-for-QCN550X.patch?h=aa/banana
- QSDK clock init appears identical to QCA956x.
- Only tested on QCN5502, not sure if it works for QCN5500.

 arch/mips/ath79/early_printk.c                 | 1 +
 arch/mips/ath79/setup.c                        | 6 ++++++
 arch/mips/include/asm/mach-ath79/ar71xx_regs.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/arch/mips/ath79/early_printk.c b/arch/mips/ath79/early_printk.c
index 782732cd1..8751d067f 100644
--- a/arch/mips/ath79/early_printk.c
+++ b/arch/mips/ath79/early_printk.c
@@ -121,6 +121,7 @@ static void prom_putchar_init(void)
 	case REV_ID_MAJOR_QCA9558:
 	case REV_ID_MAJOR_TP9343:
 	case REV_ID_MAJOR_QCA956X:
+	case REV_ID_MAJOR_QCN550X:
 		_prom_putchar = prom_putchar_ar71xx;
 		break;
 
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 891f495c4..24aa13b4f 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -177,6 +177,12 @@ static void __init ath79_detect_sys_type(void)
 		rev = id & QCA956X_REV_ID_REVISION_MASK;
 		break;
 
+	case REV_ID_MAJOR_QCN550X:
+		ath79_soc = ATH79_SOC_QCA956X;
+		chip = "550X";
+		rev = id & QCA956X_REV_ID_REVISION_MASK;
+		break;
+
 	case REV_ID_MAJOR_TP9343:
 		ath79_soc = ATH79_SOC_TP9343;
 		chip = "9343";
diff --git a/arch/mips/include/asm/mach-ath79/ar71xx_regs.h b/arch/mips/include/asm/mach-ath79/ar71xx_regs.h
index 1f9e571af..5f8370607 100644
--- a/arch/mips/include/asm/mach-ath79/ar71xx_regs.h
+++ b/arch/mips/include/asm/mach-ath79/ar71xx_regs.h
@@ -862,6 +862,7 @@
 #define REV_ID_MAJOR_QCA9558		0x1130
 #define REV_ID_MAJOR_TP9343		0x0150
 #define REV_ID_MAJOR_QCA956X		0x1150
+#define REV_ID_MAJOR_QCN550X		0x2170
 
 #define AR71XX_REV_ID_MINOR_MASK	0x3
 #define AR71XX_REV_ID_MINOR_AR7130	0x0
-- 
2.25.1

