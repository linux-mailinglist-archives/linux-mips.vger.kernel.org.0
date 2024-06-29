Return-Path: <linux-mips+bounces-4031-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3832B91CB04
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2024 06:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A9361C21745
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2024 04:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA0F1EB31;
	Sat, 29 Jun 2024 04:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="gtUeHe3n"
X-Original-To: linux-mips@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2019.outbound.protection.outlook.com [40.92.98.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70AD2570;
	Sat, 29 Jun 2024 04:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.98.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719636713; cv=fail; b=KPF8cBsE/+tpQrY4vGAuMD8UeVQJblDo2nYB+AOx+sgJ4lCiLeyezffxnTOYYFAGokNtfMYsYZc3wO3l24Mxbpyr2TBHNQR8dzzFdHwZHEutS0YobO3ZBU8/Di8Uzn84dQ6R5da9Mgb3QMWyqkKkgwImSia4zqO2x8z0+DUGgMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719636713; c=relaxed/simple;
	bh=pHLgOZFr3eVQObqzXDzdUcf5lgNz81Gc6ynBHXyw70s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VCF0bsANV+T2AKaMM6mooQfSxBwOGuJm6+AaAHPrGBwvxsnPSL9wIFFLCkprG/hH6HOU+29sHhM+w0hZALPWF4DBfh9LwlKfFEt7ns5tKAv0GcFCLv3C2en6/y22CcbXHIMdB/kUPkklju5iEGtCAVO2rGRfbLIHnJqpdLnhosI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=gtUeHe3n; arc=fail smtp.client-ip=40.92.98.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJQa8rPigEPeRU7C+cVPn/vEEBbW6gccTctnKXMPUAbwlYhvtM5y+ct0ubbmfHDUy7LDNXxaMyBJosXEuAKxnT7mM0whd6RDqONX1vjA97FAheMCTai6C0MD2GVZCbCkuNzdUkVd98WEVoruCvBoVNdTIIjt2VmHEWqwBl4FuQWDecfjJ7n28GCabNse7AZB/lLNK+vankD9ee8cj2bfDnjaO9WWmcBDsu15pVuSQJGxqjkBoA/9xIFMqKXoAbAqaYgpTWd8xvRUYqmMHWwPWpf1nK/PO0rjrvr+o7iBIKa2CR/Ix0Ap3ZN9HlWpI065AFY+nsimB8HWU7Cn9yHGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6h2ZcaqNodmfOn3vj3xIOsDVQAAGIHARdDbDoYV8t4=;
 b=eIZynly0V1WRgowUOqAJ8xwujtuRG4nI30JWNP1hDntzwfPuYsFsfvlB/lRHLkAOiow+dDNuIgohx/kUwACcikJNviIGYoW4jPJHoyhgD+z1cQ/A9TfBt9jt+3n3gzqEpbGmRntmwk6ILLpgCZo05FpxHEayyBqQMc3bascOBFeZ8fc+XxXIqG6JgUOXUDnuzHjiZTkxNS3Ai4MQiW7yp4QD6L/HeYZnfkQwFKJ/pCrHx0wMzorRwyB4i30g50J+8ljsR3F2rts8wmxxOyWt/5EIcDV2F3hz81LPOrl/KsDhZ3I/CvPgBxLdQA4iWC+IEe8PA6a7Loo+V8UYH0ctGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6h2ZcaqNodmfOn3vj3xIOsDVQAAGIHARdDbDoYV8t4=;
 b=gtUeHe3nJjysr3btSzf00O0RgYljYVHiA6Xr+wiTEW06fjZGKwuNOv5i3CwmxFT+0Ol23k/jPJ9IwPkY/6UoKW1HyZRIZiUbFS562v1OMH3WOG5iQ4WpjLje65pPeJrRwdVf7UdZX5ulaiDMkATCOQ5wln30dqqgAMQKYujpsyOz5aWf4P/EeI1mjnFBrPXdXG8ilxmGhkLRT7UNLiBimavSry7iNJHhFSF3slNliR28njhAhNRYCjYIhyIwkGdecpNPvYXhV0Of0/QBXd1Y8d1mE39kn4GmyqAFYAbF0kPAab3UWzNFv9Htc5z648O8iI5sLphLy8rWRgTPkKyLSg==
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:77::8) by
 TYCP286MB3543.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.28; Sat, 29 Jun 2024 04:51:47 +0000
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c]) by TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c%5]) with mapi id 15.20.7719.028; Sat, 29 Jun 2024
 04:51:47 +0000
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
Subject: [PATCH v3] mips: kernel: fix detect_memory_region() function
Date: Sat, 29 Jun 2024 12:49:08 +0800
Message-ID:
 <TYCP286MB0895F65439037ED134FEA7DDBCD12@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [qzlrWRpwigI4hbFWcoCXzU3S6kxlvrRq]
X-ClientProxiedBy: JH0PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::20) To TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:77::8)
X-Microsoft-Original-Message-ID:
 <20240629044908.9509-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB0895:EE_|TYCP286MB3543:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd96a7c-11fd-4aee-4112-08dc97f72dbc
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799006|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	74XScfcY67jXcA+v3/CzksAWcXf+F4eEovWCqVWWzg8m1wVvT55SO7tY1+6E/7nd0awQdFCOv554RNLsWAQYQ5ZhnaXdxWpb9Vu/3kdNWvsZVGtF+eES45XTXFr8+lXx+9V3iLlL5mYvQcPwYzrtROL8XryhUghF0TKt8mI66akpf5GoHMiGpE+szgD6NCYDtuKV14X/PPFggOAnQxkfhSkqWM5HTedvzSHOo95Bzx46XWsAQ/I5azk1Cz+KlKlIJScyT6Zl3PSLqOB8kmzOdzpKB6fNADr/jRg0xKGUlNPQkZZH0pMWVP71KbdJmpZASdtwTch9ynPfYTUofNavXKQcJdOuSSwc/BmVRennaabcOYXvuOP9gtyoqw44i87ZISFFWJANf0MVCxm9HfhTjqzAR/uPuqh2ZUH3o6FBXmBHK0u0obk+McQPSW7oZPHAvr4zz89yNOGAKNUUwM5VMsIw6Pl56n643iSRMEVmW8vzA5GP1/PcfuFtkiAgHrosS2wi58jGU61ae7YK6gBEBmppC3PBFHvdByAz3Ebh8wWIcR3s8k7WCVrWWKr2/lBB64V4R7XR1JoW/PT3uOs5G3Pgp8I6Jm2y1BglUB47BcTLzRPOZnYW5lWvjqZwTKSOj/KjCCiEVIHW/YR4hiKKACKAf9PgHtEMGIrmRgu/80DRLmuUukzCxHAUAIA3JSpQgt74Pe0PwgU58d3jZ5R3Nw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HczfOwJeklLsSMWrO2azHUKnRhJB3FXHqRNLvUJw+zTFZAfu922p5iEwqwWr?=
 =?us-ascii?Q?1Pyx1W6XO9nX8ffY5CXc7fG2uXLxhFop9F/5uo8PYxMA2prw3gwJ5m49lkDs?=
 =?us-ascii?Q?QOQr2OodQ/uAMn05csDM21og24UwSQWsKq5UJp04mn46Rg4TDl+DtAAoDW+o?=
 =?us-ascii?Q?cnLLjcl25tvTGI8+mEQFTC4Lz9OhPfFwAa6bHlW60ew9tuw3j/WRfE+rTemy?=
 =?us-ascii?Q?ly/TD7RaM2IJBlDmt9aaO6iQs7wKQzjM3YorzYVUztFiKmSG7MqhfJIl0VzD?=
 =?us-ascii?Q?3/s7w/BBNCMR/D9VCtbHa1jQ0LR/UfEm7ppI99Upuu49Kz2RoB+TIQIXj5Qa?=
 =?us-ascii?Q?MNGfj5LooGUTmDaerX98fq5A6Bq+fWK4ACtNFhDNJveDY26UTfrSFYEUfOvn?=
 =?us-ascii?Q?1Mx96F5CLUdQiwZHYR5zS8qNyC1abhFGQLdcj3W8ha2+fMNpedewrKGmv60R?=
 =?us-ascii?Q?dTFIisGf4pCpY4e8e1sUOH+Cz7jzqeg9zbLDwKWR80ypjg1cVdpozJXSjj4p?=
 =?us-ascii?Q?6qLYiCvRn5JvxxDmmISbZ1MpxRNnm/bmjNkAlP4wDmAFugxoDxbRFl48Qy8N?=
 =?us-ascii?Q?hjZWAjm0hM3SCyiAaO4JdWDqviJzPePnPnFTQCg6kZ4gInBIY9QJsJj42xFC?=
 =?us-ascii?Q?F4B58hrO6KAK8wx4rCY+/8OyMZ2qof5dbaztCJqowHVYfYNaID9EUYKUPX6/?=
 =?us-ascii?Q?nrWwUPuIupk0Cjv0NLfyA+GZ0YQMRPEw3XCRYEN8HoDNjnybZHrJxaMLFI3n?=
 =?us-ascii?Q?26lQ8JxfiUaPTEQifIzvC+k/VN3FbAGzgnFkdF66PrPQSPNQMUzuMNNvWhxJ?=
 =?us-ascii?Q?qNAz+I+3qB+ZnM4YTuYh/9WY93UFGaaSdoI51B/4I8VpDZosu/jGDgLWcp1v?=
 =?us-ascii?Q?1gIsG65//xviOf8ALMS5z+6mksOZ0N1xwiC8TKpzeKLbCDxrgfvZ7xYVBKS/?=
 =?us-ascii?Q?gjpuAJjS+oCpUG/vjXwf5YkOQmbh/xhjAkMZU/YzTKLtFl9hTzzc5LUlIR49?=
 =?us-ascii?Q?CZtKx3VjhDCasB6BnIRfbAPwYnXVQ0EMuMS0DPMQ+1XmnzjkQVYOOyDOB2bS?=
 =?us-ascii?Q?XHUo0RFflgAP5easDvImO6nh9CaRIktOLRnz1ilxsdZuyFHlOE3KDtbV7lho?=
 =?us-ascii?Q?+BpAYWcfL0gVcbn4DPcJ+vFBg0DciXmcCg2oyFuNpyjzqGUGbaUzIzj+ZNsl?=
 =?us-ascii?Q?Dat+wm4M6N7ZhM9N6sFWB56mHKl0TzNI+5EFrTiQeuJhWniYCtj455ZRyOwr?=
 =?us-ascii?Q?WFC28v6m/c6TAEvWoYFI?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd96a7c-11fd-4aee-4112-08dc97f72dbc
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2024 04:51:46.3105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3543

1. Do not use memcmp() on unallocated memory, as the new introduced
   fortify dynamic object size check[1] will return unexpected result.
2. Use a fixed pattern instead of a random function pointer as the
   magic value. "0xaa5555aa" has a large information entropy and is
   widely used in memory testing.
3. Flip the magic value and double check it to ensure memory overlap.

Tested on ralink/mt7620 and ath79/ar9344

[1] commit 439a1bcac648 ("fortify: Use __builtin_dynamic_object_size() when available")
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
Tested-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---

changes:
v2 -> v3:
* Using CKSEG1ADDR_OR_64BIT() instead of excluding 64bit system.

* Using volatile pointer to get and compare u32 data.

v1: 
https://lore.kernel.org/all/TYAP286MB0315E609C476B86E22700626BC292@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM/

v2:
https://lore.kernel.org/all/TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM/ 

 arch/mips/kernel/setup.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 12a1a4ffb602..4197c7568f49 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -86,21 +86,26 @@ static struct resource bss_resource = { .name = "Kernel bss", };
 unsigned long __kaslr_offset __ro_after_init;
 EXPORT_SYMBOL(__kaslr_offset);
 
-static void *detect_magic __initdata = detect_memory_region;
-
 #ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
 unsigned long ARCH_PFN_OFFSET;
 EXPORT_SYMBOL(ARCH_PFN_OFFSET);
 #endif
 
+#define MIPS_MEM_TEST_PATTERN		0xaa5555aa
+
 void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_addr_t sz_max)
 {
-	void *dm = &detect_magic;
+	u32 detect_magic;
+	volatile u32 *dm = (volatile u32 *)CKSEG1ADDR_OR_64BIT(&detect_magic);
 	phys_addr_t size;
 
 	for (size = sz_min; size < sz_max; size <<= 1) {
-		if (!memcmp(dm, dm + size, sizeof(detect_magic)))
-			break;
+		*dm = MIPS_MEM_TEST_PATTERN;
+		if (*dm == *(volatile u32 *)((void *)dm + size)) {
+			*dm = ~MIPS_MEM_TEST_PATTERN;
+			if (*dm == *(volatile u32 *)((void *)dm + size))
+				break;
+		}
 	}
 
 	pr_debug("Memory: %lluMB of RAM detected at 0x%llx (min: %lluMB, max: %lluMB)\n",
-- 
2.45.1


