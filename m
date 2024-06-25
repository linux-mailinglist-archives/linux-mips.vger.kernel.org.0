Return-Path: <linux-mips+bounces-3910-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0082915BD5
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2024 03:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EB02B21268
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2024 01:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59971B7F4;
	Tue, 25 Jun 2024 01:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oPXwHAl+"
X-Original-To: linux-mips@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2017.outbound.protection.outlook.com [40.92.99.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F68218030;
	Tue, 25 Jun 2024 01:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.99.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719280052; cv=fail; b=ECyl67UVJqTKrIbTkNoYbzgo5YT8plqbsZUDU/RyNtXmvkPz0MPGZENLdKDYlW/sFlA89xpQAZxlXTCmMxNI/ptRT27323GKowRM3W70DKDl3w0kaIY1i+rCoNkDKIUBXm6L5AK8hLsIqg9driqLA8OuErp+yxuiO9Hki+qOjgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719280052; c=relaxed/simple;
	bh=BXWjBWGgbhYOyQq8mlt9vPcJ0imFByAxJu59c7wDYuw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Hx+lvdp5p5DhDiUX80yHcwVjrEbFeIps+yYYnbx2fm2fmVzuyXYHpZLpVdggVssrrebK45b8kH7X0H+c5JgjkWUY+GAm9e8AjGd8G9bqoKG4EkgxaoUQ9/6MqsBssd9eu7BRIxJSfSE8GKuqU1hWnxzkrHnmb3uaAVjWEENAXxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oPXwHAl+; arc=fail smtp.client-ip=40.92.99.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIQtZCbyZ4bEYiP1nuyiG/MNT2UDjM8/361NjQ0dk+l8+Oqy2YBkOyFrQpf0dYRo69wdeY1IW9qWIvyxM0lvWx/ZwO3mU/Im1R8pKXPsdThrbSVqhFk8ExuNHAgoufJIM/qGdkc+v6jSQR67VDXeS/u8HRaV2lLv4/znaRIzUUlBJd651mZ8AJ5TORYzULkZCUMcyrngtaE7BxmF28T4OcSsUErh7ikSVbIHoym5UKIQeAxGqvZZUUBmR844F3LPVXGk34F14iBxuBGzlO4AXbXubTvWmE56glJQnV7tsPh7M4/uCeaTeJ8KkSWi4gMSZfp4CClqN6UuEHGqTg2N2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSYeoKoxFit/GEJ5Ip/TrbcsZ8o5UanzV6RIYYmglpQ=;
 b=ZLp8I0munQtDffFbfll0qQF+V3Mn86Vb9DZJPrM2c7t1+Fi4Eiks5jcB5u05B0PDH3T6wmdC6fIKp63D8A9Mq6IXFGU2erM0XtC6/AzAevsSDxPn/+3EKgAdu6tHeuk6fLhd381gqe2TjhmpA7kDiyB2zsVtI8hf0up2ZAq5Z9ST/vrfJ0WiDKmixZMj+5aEAMjQl8DN1mI/ClgqPusUmW16auDPTwt9vlnCzvhv7XamD6HFkEDlEqFgKZO7kJyjAKY0SeVVNS+gpNUdqZIjw+NXlYrul8He0FlGozm8O0nwZ8Vb8KjrC4niihR7iXea+iNTB+VZzORxzrxx06UotQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSYeoKoxFit/GEJ5Ip/TrbcsZ8o5UanzV6RIYYmglpQ=;
 b=oPXwHAl+XwEi9FzSkp7r1bg9Z5KKxVdwVLSPBjhRplEWwvCI8zlF13LTXNuNe9c2Ly4YZclQq+5V0W8vusK3Hd5d9M3tfGFp6br7+L6HAbwbMCht74jP4w95/jkSshYDwinCpl7g+jh4rfNncjAxEUoNPa0RsXYgkS8bIScFMRITzebiOG9CzDZjWx6+mM49fv5Ws/gVYs1MKHt/Q19UIeAXszvS56JYtg15UccavKa/8wEOFTb9gFsh86oJ9ag2jldc87K9hTtZ3oG4FUEBCO3xTEy8zGjNAIsOM5U+/iyvZR4YCArb8qzZX1arb28da/vDibHEb154yrsCVpa2LA==
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:77::8) by
 TY1P286MB3358.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.28; Tue, 25 Jun 2024 01:47:27 +0000
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c]) by TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 01:47:27 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Khalid Aziz <khalid@gonehiking.org>,
	Baoquan He <bhe@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: [PATCH V2] mips: kernel: fix detect_memory_region() function
Date: Tue, 25 Jun 2024 09:44:44 +0800
Message-ID:
 <TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [NCiTcmbz88KS6xxY0GBCm75t+Nr48gvr]
X-ClientProxiedBy: OS0PR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:604:26::18) To TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:77::8)
X-Microsoft-Original-Message-ID:
 <20240625014444.12421-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB0895:EE_|TY1P286MB3358:EE_
X-MS-Office365-Filtering-Correlation-Id: a247ef53-62b4-4ec0-8d79-08dc94b8c43d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199025|4302099010|440099025|3412199022|1602099009|1710799023;
X-Microsoft-Antispam-Message-Info:
	Vx6A9RsvhG2RJiK5eWgnVVm8H0PpZ0WqVuCLtbl4SJzgi71gDXa0IGWY2anqqis4JHXRGaT6XMaK3dgkD/hIm6/+xkI21xSyiUjpKG7Tv4HC/+GItXz9J8GUWIqW0hHdCPqdmeRIw8RpDmavK6DO5kzsMNBB4QDY2C4rCtTsnPZbbG7ORpfDRWsCB8YSrdn/FVCXnaPy3akTEZaI9bEyTeGCi1I6nhRDgmgFEAe5oUwvIae9R8WAESuBApFMS/hjDS+LRqk1jBkVS/JpGM0cbjKjUDWNJskuJiqc49vzqQm3IQ+vE5wYkGAgMrbDBHFslmGlBZA7xv7sGXtCWTvoISf8BcYVQHjIYOUD5oHkHwCjf3EGtCZAxpmnGiE6CwKyBxIeTEkq6+UY/3wB5hpfTLpmk/QbBNyCyk0u0Rf+9C9no8YhbGkGiiy6eRt4mzjku/Z4eBHDEJCaqc8wc56SjOkZVX8dcZZ5L7wxoeKnSTWT8coZSpq4XtTG9elSjyiBiy2S2XdFJ2id9G2h5YEjUlXimFVCcCkZUojkaANcXShjjYgxjHq04Qjj8NveJ9lqps88WnNVNf51dyv8i6d98WdhmXUxnyKs6jiEw4b9mhuv1vNQRfCWukNzBJV89EsDUuNkebE8kmkvkF6MnozSd0mirOek9kuh72WIKNWnUOBfWjVgjOknwLcYzeZ1BMaJlPp69uFVo6ch/t/BDJEKg6KopNJRShxT63rP1iDN6lA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9448PIojvV9VDpH0rEN6qO6TikGd22y4dEusCHu2Gm32VChNkMnevLAWhGlv?=
 =?us-ascii?Q?LSLdN2XjdeSnzi0oJ0NvN5W5YRJrg28GeH/V+ktB/IpHkbbaplsvfXfgUi5S?=
 =?us-ascii?Q?zG9GyMSTqRGNkHtoMoofUqw24+Y8v65lKJYupZjqHfsT3WgWLIl4BuYmfn+f?=
 =?us-ascii?Q?RKIWBQokGGIc5XX04ExmIrjk+LybWMES7aJ5l0gF1YYqaA4mKwVwokWWBxye?=
 =?us-ascii?Q?8+nqpOpj+6U0tdRUstkOPwo1J1MDmXl+YfIS6BreikchfW5/tQTs6Xu2krjx?=
 =?us-ascii?Q?f3A2CH/Og9W+uUauHivHW4vK30uRFTg8UdgLNJEn993ep0xVBGYCejkwCkYp?=
 =?us-ascii?Q?hZQ2g09DcZWSmoL3/yIGtL4fKJQt+/RKld9xHPc02m1ATG+vaqro2/7s3KA+?=
 =?us-ascii?Q?BS5vAKRIjZdeCwlvQZh8wdWY53xvh/S3ccwo1EKpjHOvPmN80uGvnQp6Ye9A?=
 =?us-ascii?Q?BnBBzT22RDzXtBCOg8qMtqMCsCWN8l6U67jXC7oq+6kahnNdgIBkdl8We3gI?=
 =?us-ascii?Q?bGJRiGw/vHodlEYTqBeNWV5yyzc9hW9c07X/JEJ5jE+AgB7eVu3Juk8bji74?=
 =?us-ascii?Q?BsdrcXeTD4Yzzh20pRBVU6NGtaBf3aICsoq5gpEDX8DbZZujBHxP0sn6C3d7?=
 =?us-ascii?Q?2iWAMhdRhRYJ3B6nPN4D2hoMF7oPE0gNPfk8O1bxw/2vA+nYeSy4YzYjjFgz?=
 =?us-ascii?Q?4PPrOQqPOrmeGyCB3eGd8v3lJ22cPUNL+LntsR/MRXxvuv9PucAqSpajmByJ?=
 =?us-ascii?Q?9CguscB0yzQ3gH65MTjbq99qyakUi0INP6/KbSWCOmVnVeJV+vrWpIe2UePh?=
 =?us-ascii?Q?rIZJviAxEVFeubRUyBlptPtHIahCgyquUklALGDeu0vueiywd1YMTN0OTPlL?=
 =?us-ascii?Q?RUPlW6GySG9I7D1WGh5qi+wWSuIpFfIF6WsZF+bWJNOFcQypHpk9aN14A3q7?=
 =?us-ascii?Q?WT1fnJ0CQDmKQ06oTxnyHJlHp8RctwQNt817na3W1t5mificy3EJTpKOIgYh?=
 =?us-ascii?Q?dURtxCi9fsqhO5jvvN1a1ujA5xvnMjurrie+Exx8tkT0XOGDQqSJ14O4roA0?=
 =?us-ascii?Q?CAcRXcQVydIwYINtrSdbtL046YfaEY5AsZVaCkCfT25tkGF45c7UqIa7Fk3H?=
 =?us-ascii?Q?/BAIiB73EHGIvNUwwkSyluK7MllQWCSOwhtXvhOHhLX4W2AN6pVw0OIpsUgh?=
 =?us-ascii?Q?NkibJ0SzWztdEH0FMqA1urAIysu+zhTWUsGetdcY72APReXHpcXGY73b2cAj?=
 =?us-ascii?Q?N7zcCmwgg9z2i2cOwYnH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a247ef53-62b4-4ec0-8d79-08dc94b8c43d
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 01:47:26.9909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3358

The detect_memory_region() has been broken on 6.6 kernel[1]. This
patch fixes it by:
1. Do not use memcmp() on unallocated memory, as the new introduced
   fortify dynamic object size check[2] will return unexpected result.
2. Use a fixed pattern instead of a random function pointer as the
   magic value.
3. Flip magic value and double check it.
4. Enable this feature only for 32-bit CPUs. Currently, only ath79 and
   ralink CPUs are using it. And 64-bit CPU doesn't have the KSEG1ADDR
   definition.

[1] https://github.com/openwrt/openwrt/pull/14774#issuecomment-1989356746
[2] commit 439a1bcac648 ("fortify: Use __builtin_dynamic_object_size() when available")
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
Tested-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 arch/mips/include/asm/bootinfo.h |  2 ++
 arch/mips/kernel/setup.c         | 17 ++++++++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 2128ba903391..8516c11916a4 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -93,7 +93,9 @@ const char *get_system_type(void);
 
 extern unsigned long mips_machtype;
 
+#ifndef CONFIG_64BIT
 extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
+#endif
 
 extern void prom_init(void);
 extern void prom_free_prom_memory(void);
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 12a1a4ffb602..3a3bc1b7e62e 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -86,21 +86,27 @@ static struct resource bss_resource = { .name = "Kernel bss", };
 unsigned long __kaslr_offset __ro_after_init;
 EXPORT_SYMBOL(__kaslr_offset);
 
-static void *detect_magic __initdata = detect_memory_region;
-
 #ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
 unsigned long ARCH_PFN_OFFSET;
 EXPORT_SYMBOL(ARCH_PFN_OFFSET);
 #endif
 
+#ifndef CONFIG_64BIT
+static u32 detect_magic __initdata;
+#define MIPS_MEM_TEST_PATTERN		0xaa5555aa
+
 void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_addr_t sz_max)
 {
-	void *dm = &detect_magic;
+	void *dm = (void *)KSEG1ADDR(&detect_magic);
 	phys_addr_t size;
 
 	for (size = sz_min; size < sz_max; size <<= 1) {
-		if (!memcmp(dm, dm + size, sizeof(detect_magic)))
-			break;
+		__raw_writel(MIPS_MEM_TEST_PATTERN, dm);
+		if (__raw_readl(dm) == __raw_readl(dm + size)) {
+			__raw_writel(~MIPS_MEM_TEST_PATTERN, dm);
+			if (__raw_readl(dm) == __raw_readl(dm + size))
+				break;
+		}
 	}
 
 	pr_debug("Memory: %lluMB of RAM detected at 0x%llx (min: %lluMB, max: %lluMB)\n",
@@ -111,6 +117,7 @@ void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_add
 
 	memblock_add(start, size);
 }
+#endif /* CONFIG_64BIT */
 
 /*
  * Manage initrd
-- 
2.45.1


