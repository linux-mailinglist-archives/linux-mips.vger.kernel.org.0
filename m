Return-Path: <linux-mips+bounces-3229-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29F8C30B6
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC3C1B21403
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E757BB19;
	Sat, 11 May 2024 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="FrbKgALj"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2117.outbound.protection.outlook.com [40.107.241.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F10657AE;
	Sat, 11 May 2024 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424252; cv=fail; b=QjF6ZS0zIEV008zlguHxw209bpkAF7AKtQpFu6VsnRu/ZglOPGrjm7xZgXmI3WJfzkVihhhcaXh4ecHOYBcIDVs7moggNDtd2FItvu4vsBTpGND8oCZxrUdhE7rG/CYgJ3EjpGzyw4SB+CRnIPuM428iKoL6zbZDw7k4Bs74Gzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424252; c=relaxed/simple;
	bh=gbj8niS7B+edIY5VnHb5+l4YnChjOlOZ1glPCTdgYpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AhoR7O308/eg+HGLJLmvh5oKEPuM8LkKSv+5DEFyQdMIybh3xcRhAxsqdBxQG0RMlJGXkqIq2kXJp+bFKdFgWWdBMgDG2gd0VZpafeoEpZ35C9ZCM02CJ63g2JeBAIYyaqN5/2Tkv86tBY06a1tKGkJlO+KjYZVNef8VXQK7VVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=FrbKgALj; arc=fail smtp.client-ip=40.107.241.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yrn4ik+/VwbKb9UAqDCgKeXlLEzdl6uRpfOQt3bt3pRy7SSEwwFvcP8ujDz4yJkDspcSiwkpp7ZICv7Er0V32D+gU5X7ZipK1lf0pMLnH0O4SmuhLj+0wGU1MBa5ZGYtw0uMG/GEg70hA0Y8epAd+6/AGPi8YkxKI4zap1tfVzDIkTHdqFq8kE0Swy7nMEXBkIzUOGfMWpM+VuuwW/LNrKHMSWcd2G3JwgDXjaQcZwWv0wDY82hSXAuFKA0zx8CUkqw33TRI4NgbWg/hcydYpJjzCpEbLm0q/HFQDjNOn3Do8zzreNpff6PfW41wr5QDwT/w9xpmfAKO5Y6ySkkFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32lTG3IW2XyUQ2zZD9wBltUg6IOcVvaaih9ITzyiNIg=;
 b=jjtl/wZEtHRGva/VP3UZpp3kKQS9LVXovqhiBV9usnXtS5dw3pgJ9+tKoDAQn2ZKsHPixz52chAhr7F5bkpt+C5G8mSZcqzEBbKaMrbFdq/5ZcjILqK6N0tC9wQD0E8wiOxNzLpIfmFzu6Uj+sZe2ivAgJc7L3G/5gQULM+f7SQt2T89zwDFXs4FkpmxSZQalA3aYNtFEL4cQBPIwhfXJ74KURwoV0scOZQSfAWGNzgOwE2LDvUwD+KHWEV0ztZLkuh3FzcT63XNrlHjZIOJYt/BMyDsaZcWFm9DxuMJUcIWePojBl8nIEi4Q9J+ztYtxjJIk455mVG8QHnsWWAs6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32lTG3IW2XyUQ2zZD9wBltUg6IOcVvaaih9ITzyiNIg=;
 b=FrbKgALjgJKyEOAul3W3CxwrMR8rCEUC5rjmKoT4GjoiDVdvhwm5QKV+MNHB2qJsSuL6/HziIY9DaLrAb6UBjj/uXdlJ1hktaejUR7WEVoIu/Uae28oBGypdkKL0Y0lMokLOEDJI7dYYWAYLPzjHo98CZ3NCblSqwchzEjSWq1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:44:02 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:44:02 +0000
From: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v4 14/14] mips: FDC driver refactor
Date: Sat, 11 May 2024 12:43:41 +0200
Message-Id: <20240511104341.151550-15-aleksandar.rikalo@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0235.eurprd07.prod.outlook.com
 (2603:10a6:802:58::38) To AM9PR03MB6916.eurprd03.prod.outlook.com
 (2603:10a6:20b:2d7::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB6916:EE_|GVXPR03MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 7369d48b-a361-4ef6-341b-08dc71a745bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bsTABszupbl5lhiUPwMEsyQ9jTrf1O2Hk29xcId8uAAHF8mk6QohucWTVZXQ?=
 =?us-ascii?Q?6njSgY12a6MVcKPfevMEpIHX0+bro51TVracl46TKQWqnXdtG2fxisF8cc42?=
 =?us-ascii?Q?PHcxZ+H8/EDMjb09Ujw5ENCkDmbKJGFeMtbk75ZyghlNywzc/oslxGrGnEZq?=
 =?us-ascii?Q?rn99pO3SGDGxxXAvX1gdnSTIeRKIfEFvSP3Y0/goqWaVzKrspg7xj4+/+PEF?=
 =?us-ascii?Q?ek5nE7AVL9XQqPTv+0o2UFwgSg28UwtdEtAs/7Px/Ms+gNvzQEZtPOjxAbY3?=
 =?us-ascii?Q?9J8irkmV/tieBh+bA/In0LGhOThyHtAS6g1hcF1lf4p2LAMXz3STgNpAiC4r?=
 =?us-ascii?Q?gG1/BBOnMtlSyyDrYfZ2AAtLPoyYn/tUOETp3RTJPjLeEOmBayMC4+2RtIdw?=
 =?us-ascii?Q?uGtoOW11E0ddfucn7D7E3ni7WcRtDUUZc729AGYHXVsU9kRjMeszDAOarKXW?=
 =?us-ascii?Q?v7QxJbGpQ0Ev4YqdgrR/XgHnfZ5NpfcBfUzixoK7HxNQIpeUmKEYAM1h5q2G?=
 =?us-ascii?Q?DERNUySRHNHKLwKNmsMMxVR5ayDPVmmzTdJlmhg+3DhSBEL0QFbzFTa4BQW4?=
 =?us-ascii?Q?xENOtlPowYAzlcPLUcNJ4ED6gF0BNRplKfc1zXJlEnbWTztlFQtC9eKo5kM3?=
 =?us-ascii?Q?+H1vw6dmcMZVbEMmdsMKfJKsTFiqGvBklOBxxuZMYqbyrE7uvBa+h7Mt/FWU?=
 =?us-ascii?Q?u3H0dPj0hThsytnskPCg4PCVMxmihae51TmpWwR3jPAogXoJAXh3uqisZChu?=
 =?us-ascii?Q?s5RmNRbE1gfGqGjVoZiL00x1Hb/klzOfWa0yXRBqwFmlri1CScy3j6ft4gE0?=
 =?us-ascii?Q?d/Wd6LqZPWLm5yVBqMRUaSKHKIjzlbzfbT43MoTQTHJ95W3AEFIi/OLW8IYv?=
 =?us-ascii?Q?wx1n9w9n0hVHncffRh2Vc1DnmSoF1F2VD+rjqSF7aO+0Qa5mibTV7OJKvI1C?=
 =?us-ascii?Q?KTl6mP6x/rvMfetUljRS32yLZw1qzZ8sJqW/2I5nFCTTSFIcXTT78fW/R2Mq?=
 =?us-ascii?Q?pp1V+wP0R1Jsd/rG9rK6fPLZum6QDlXPW+918yX7i5M9jr8Bi6JVGyNlCiNd?=
 =?us-ascii?Q?d94RA3JVbPyvVT1zhEF6SvmQdQ9XA2uBYOu6gWUy3pKMpCfQsdqI7Xfnsqon?=
 =?us-ascii?Q?ziC3fifqO1j80vkzSHSC3+TyXjPi9ubPU0UDCLTrHtSf4xCZkSLd2fBtzbrR?=
 =?us-ascii?Q?4LC7sDwU/Z7bAudx9choe46vqlBvw/SyhfNZr4VFKur8KL5F6EZADdk5VIaW?=
 =?us-ascii?Q?4fUTZ1fFfhAFR7VSDfM8Dz+r8cxLC4asEW9yfHtiuKHzSF3UVEkzwz+haafj?=
 =?us-ascii?Q?t5uFbjHz4oDtWTREVKJZLnEyS4i0Eox79nQvadncfgEDlw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?296MJIxsWL44eGOjoUazzwEed4RsQ+LHLz4+ABbnJt3WS31Vaf9iJIaHkWTk?=
 =?us-ascii?Q?IaKqMDTOxshU30gLGq5UK65sSBPjsbCB3MZ6UA/ssVFYLXi64+TYa888FYWc?=
 =?us-ascii?Q?kf4HkQwi0XJETQGocW4UkL21/Mo81z/YIYFLE9oz0gcnrHV0k8J1Ozhlfwvv?=
 =?us-ascii?Q?qsNHIKX4ZeBxMF5VwkiNh9lxyqoOouceQcaDY9biuTOCQ758jetS2mrTHTmd?=
 =?us-ascii?Q?kk+ycknJe7VbrOETOizC03BNfD8DSvNq71w+Eiidk9+eSO2RdJ5nv2ba27/k?=
 =?us-ascii?Q?DGkyfwMcr1RLt5O786OLD6qFTklHJdqG1sKzjTh6wMrbRkr/N3fFIAtjCIaA?=
 =?us-ascii?Q?6gb29liWFv0uGYViH09kGMdJT77xDI+dVwpi9D0mZHvhTTxEZH+FZODUyZOa?=
 =?us-ascii?Q?I+wf3r5p0KGE5tmZ7z4ujrAUqmcaYoZ4zahV7XPUJEhBF547ItQhCLEnmdVo?=
 =?us-ascii?Q?WvlSyrexrG2xigSAFbbyvQ1smLlSI1Sar9hCsCqE88NL0WwEByqsX+EbTt8Z?=
 =?us-ascii?Q?tFPz7gowxj33VMOZijZ3cALN7kyiRG8+B1iQZfRtpEIWbwJwKOL2Kcxe3scK?=
 =?us-ascii?Q?m0b4iZIXKM67pmBRfNjClL7eyyGBy6P/Y26gfSVq1M/0RrCwLTU9vJYSnaB1?=
 =?us-ascii?Q?eAsLlKtqDLFv44rRTtjlm+Ue9F+Dy2wQVx+zjTkgXYwctsJMfqOvOTMpwmbB?=
 =?us-ascii?Q?IeuaqusBE7Wf//74uq2ml/83ZD71daqEGi6MwMzQci6dnIlz7D+WenCg3wV2?=
 =?us-ascii?Q?HMFhegsN9Xaw8ZWQtaGpyEzlUX4/UdWXGKHW7vflN4HBOqcThycnDxdqDFzU?=
 =?us-ascii?Q?FdAIWJOqXCWYlyXsE+2P8QVUKuRpmwmNORQLLB7JlYIZ9eB2p+OSG8hBnqYg?=
 =?us-ascii?Q?c3XcnIPUCa2TZ7ZLIHPjI1Pv8hPC3QCQ5mkvmxdCi7VVs/YqbOB84kabrib+?=
 =?us-ascii?Q?L4dtPM+nh807wDwQqp3juEDNSkP0GB9WKPMsWKwMWbHfgBhksEEiujX/jFdV?=
 =?us-ascii?Q?y5sbIGNgq1lmu8FKWhH+MQm8YPGNcItP6piY2ElRRZp0fTR7l+IUUj/gCf0x?=
 =?us-ascii?Q?chuTlRYNnmC6Nb3c/G93rJ85sZZik6ygJOM+WRyGy+HhKQs6v5f6pmClr18a?=
 =?us-ascii?Q?OoHEERqK6o4y0ZaUKMzr8OnK/wA1gw71WYp+8oUHqGc/Oh+XEp+d01bNjkDh?=
 =?us-ascii?Q?6jYCDALJsuB4NbLWRoKK5bHhZaR3MCnbgHkGfi58BFLBHrTsNg9OU4/e0VPV?=
 =?us-ascii?Q?/By3MoXlyoEzBxaNUT6PzhN5ckcMD69hBZ565/zuh9V4lyPuQHAkfURP3YH6?=
 =?us-ascii?Q?V03PDUCmFZDqAbi/NCvZapf9dPjfTou876ItK9xvXG5PiruTh4adhyutlO2d?=
 =?us-ascii?Q?B9TI5h4jY2Aj/APTZIUUdkUpAukLoFeNFznY8/NlLjQP1+OMgcKfcznsI1/0?=
 =?us-ascii?Q?qo3slMOJgsEf4aoJ57k3xpEoLdWreq6wtcar6zQaUM83hTOdhHwIgjRIaRhD?=
 =?us-ascii?Q?TycJrcoxH9DaqHWDfwgZo2mcU1lCsdKLdUNo3Ttq0tyENj7L60GQFOGyqS/1?=
 =?us-ascii?Q?O1719GeWyQuIXaYIzVGwwQJXJpE4Ux91T4qXTrS/BXSCkGO91VcSGS64aWaC?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7369d48b-a361-4ef6-341b-08dc71a745bb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:44:02.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lg9L/eqpxzHbKmem2Xp2UkCenmipqQPVtyEkDCoWdUD8/f4d4Xtz+6Hyoy9O0yShTRTeU8ET7XS9W0RuP2dVDfXNJ+E+FKECVMllhnJg5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

Separate the FDC driver code into two parts, common and
mips-specific.

No functional impact.

Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@syrmia.com>
---
 drivers/tty/mips_fdc/Makefile         |  2 +
 drivers/tty/mips_fdc/ejtag-fdc-mips.c | 29 ++++++++++++
 drivers/tty/mips_fdc/ejtag-fdc.c      | 66 +++------------------------
 drivers/tty/mips_fdc/ejtag-fdc.h      | 55 ++++++++++++++++++++++
 4 files changed, 93 insertions(+), 59 deletions(-)
 create mode 100644 drivers/tty/mips_fdc/ejtag-fdc-mips.c
 create mode 100644 drivers/tty/mips_fdc/ejtag-fdc.h

diff --git a/drivers/tty/mips_fdc/Makefile b/drivers/tty/mips_fdc/Makefile
index 03b2781e1090..9e0894a8b342 100644
--- a/drivers/tty/mips_fdc/Makefile
+++ b/drivers/tty/mips_fdc/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += ejtag-fdc.o
+
+obj-$(CONFIG_MIPS) += ejtag-fdc-mips.o
diff --git a/drivers/tty/mips_fdc/ejtag-fdc-mips.c b/drivers/tty/mips_fdc/ejtag-fdc-mips.c
new file mode 100644
index 000000000000..3942ee818f0b
--- /dev/null
+++ b/drivers/tty/mips_fdc/ejtag-fdc-mips.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "ejtag-fdc.h"
+
+void __iomem *get_fdc_regs(void)
+{
+	return mips_cdmm_early_probe(0xfd);
+}
+
+int is_fdc_interrupt(void)
+{
+	return read_c0_cause() & CAUSEF_FDCI;
+}
+
+static const struct mips_cdmm_device_id mips_ejtag_fdc_tty_ids[] = {
+	{ .type = 0xfd },
+	{ }
+};
+
+static struct mips_cdmm_driver mips_ejtag_fdc_tty_driver = {
+	.drv		= {
+		.name	= "mips_ejtag_fdc",
+	},
+	.probe		= mips_ejtag_fdc_tty_probe,
+	.cpu_down	= mips_ejtag_fdc_tty_cpu_down,
+	.cpu_up		= mips_ejtag_fdc_tty_cpu_up,
+	.id_table	= mips_ejtag_fdc_tty_ids,
+};
+builtin_mips_cdmm_driver(mips_ejtag_fdc_tty_driver);
diff --git a/drivers/tty/mips_fdc/ejtag-fdc.c b/drivers/tty/mips_fdc/ejtag-fdc.c
index afbf7738c7c4..fecd96118019 100644
--- a/drivers/tty/mips_fdc/ejtag-fdc.c
+++ b/drivers/tty/mips_fdc/ejtag-fdc.c
@@ -28,45 +28,9 @@
 #include <linux/tty_flip.h>
 #include <linux/uaccess.h>
 
-#include <asm/cdmm.h>
 #include <asm/irq.h>
 
-/* Register offsets */
-#define REG_FDACSR	0x00	/* FDC Access Control and Status Register */
-#define REG_FDCFG	0x08	/* FDC Configuration Register */
-#define REG_FDSTAT	0x10	/* FDC Status Register */
-#define REG_FDRX	0x18	/* FDC Receive Register */
-#define REG_FDTX(N)	(0x20+0x8*(N))	/* FDC Transmit Register n (0..15) */
-
-/* Register fields */
-
-#define REG_FDCFG_TXINTTHRES_SHIFT	18
-#define REG_FDCFG_TXINTTHRES		(0x3 << REG_FDCFG_TXINTTHRES_SHIFT)
-#define REG_FDCFG_TXINTTHRES_DISABLED	(0x0 << REG_FDCFG_TXINTTHRES_SHIFT)
-#define REG_FDCFG_TXINTTHRES_EMPTY	(0x1 << REG_FDCFG_TXINTTHRES_SHIFT)
-#define REG_FDCFG_TXINTTHRES_NOTFULL	(0x2 << REG_FDCFG_TXINTTHRES_SHIFT)
-#define REG_FDCFG_TXINTTHRES_NEAREMPTY	(0x3 << REG_FDCFG_TXINTTHRES_SHIFT)
-#define REG_FDCFG_RXINTTHRES_SHIFT	16
-#define REG_FDCFG_RXINTTHRES		(0x3 << REG_FDCFG_RXINTTHRES_SHIFT)
-#define REG_FDCFG_RXINTTHRES_DISABLED	(0x0 << REG_FDCFG_RXINTTHRES_SHIFT)
-#define REG_FDCFG_RXINTTHRES_FULL	(0x1 << REG_FDCFG_RXINTTHRES_SHIFT)
-#define REG_FDCFG_RXINTTHRES_NOTEMPTY	(0x2 << REG_FDCFG_RXINTTHRES_SHIFT)
-#define REG_FDCFG_RXINTTHRES_NEARFULL	(0x3 << REG_FDCFG_RXINTTHRES_SHIFT)
-#define REG_FDCFG_TXFIFOSIZE_SHIFT	8
-#define REG_FDCFG_TXFIFOSIZE		(0xff << REG_FDCFG_TXFIFOSIZE_SHIFT)
-#define REG_FDCFG_RXFIFOSIZE_SHIFT	0
-#define REG_FDCFG_RXFIFOSIZE		(0xff << REG_FDCFG_RXFIFOSIZE_SHIFT)
-
-#define REG_FDSTAT_TXCOUNT_SHIFT	24
-#define REG_FDSTAT_TXCOUNT		(0xff << REG_FDSTAT_TXCOUNT_SHIFT)
-#define REG_FDSTAT_RXCOUNT_SHIFT	16
-#define REG_FDSTAT_RXCOUNT		(0xff << REG_FDSTAT_RXCOUNT_SHIFT)
-#define REG_FDSTAT_RXCHAN_SHIFT		4
-#define REG_FDSTAT_RXCHAN		(0xf << REG_FDSTAT_RXCHAN_SHIFT)
-#define REG_FDSTAT_RXE			BIT(3)	/* Rx Empty */
-#define REG_FDSTAT_RXF			BIT(2)	/* Rx Full */
-#define REG_FDSTAT_TXE			BIT(1)	/* Tx Empty */
-#define REG_FDSTAT_TXF			BIT(0)	/* Tx Full */
+#include "ejtag-fdc.h"
 
 /* Default channel for the early console */
 #define CONSOLE_CHANNEL      1
@@ -375,7 +339,7 @@ static int __init mips_ejtag_fdc_console_init(struct mips_ejtag_fdc_console *c)
 	if (c->initialised)
 		goto out;
 	/* Look for the FDC device */
-	regs = mips_cdmm_early_probe(0xfd);
+	regs = get_fdc_regs();
 	if (IS_ERR(regs)) {
 		ret = PTR_ERR(regs);
 		goto out;
@@ -664,7 +628,7 @@ static irqreturn_t mips_ejtag_fdc_isr(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	/* If no FDC interrupt pending, it wasn't for us */
-	if (!(read_c0_cause() & CAUSEF_FDCI))
+	if (!is_fdc_interrupt())
 		return IRQ_NONE;
 
 	mips_ejtag_fdc_handle(priv);
@@ -882,7 +846,7 @@ int __weak get_c0_fdc_int(void)
 	return -1;
 }
 
-static int mips_ejtag_fdc_tty_probe(struct mips_cdmm_device *dev)
+int mips_ejtag_fdc_tty_probe(struct mips_cdmm_device *dev)
 {
 	int ret, nport;
 	struct mips_ejtag_fdc_tty_port *dport;
@@ -1045,7 +1009,7 @@ static int mips_ejtag_fdc_tty_probe(struct mips_cdmm_device *dev)
 	return ret;
 }
 
-static int mips_ejtag_fdc_tty_cpu_down(struct mips_cdmm_device *dev)
+int mips_ejtag_fdc_tty_cpu_down(struct mips_cdmm_device *dev)
 {
 	struct mips_ejtag_fdc_tty *priv = mips_cdmm_get_drvdata(dev);
 	unsigned int cfg;
@@ -1068,7 +1032,7 @@ static int mips_ejtag_fdc_tty_cpu_down(struct mips_cdmm_device *dev)
 	return 0;
 }
 
-static int mips_ejtag_fdc_tty_cpu_up(struct mips_cdmm_device *dev)
+int mips_ejtag_fdc_tty_cpu_up(struct mips_cdmm_device *dev)
 {
 	struct mips_ejtag_fdc_tty *priv = mips_cdmm_get_drvdata(dev);
 	unsigned int cfg;
@@ -1106,22 +1070,6 @@ static int mips_ejtag_fdc_tty_cpu_up(struct mips_cdmm_device *dev)
 	return ret;
 }
 
-static const struct mips_cdmm_device_id mips_ejtag_fdc_tty_ids[] = {
-	{ .type = 0xfd },
-	{ }
-};
-
-static struct mips_cdmm_driver mips_ejtag_fdc_tty_driver = {
-	.drv		= {
-		.name	= "mips_ejtag_fdc",
-	},
-	.probe		= mips_ejtag_fdc_tty_probe,
-	.cpu_down	= mips_ejtag_fdc_tty_cpu_down,
-	.cpu_up		= mips_ejtag_fdc_tty_cpu_up,
-	.id_table	= mips_ejtag_fdc_tty_ids,
-};
-builtin_mips_cdmm_driver(mips_ejtag_fdc_tty_driver);
-
 static int __init mips_ejtag_fdc_init_console(void)
 {
 	return mips_ejtag_fdc_console_init(&mips_ejtag_fdc_con);
@@ -1166,7 +1114,7 @@ static void __iomem *kgdbfdc_setup(void)
 	regs = mips_ejtag_fdc_con.regs[cpu];
 	/* First console output on this CPU? */
 	if (!regs) {
-		regs = mips_cdmm_early_probe(0xfd);
+		regs = get_fdc_regs();
 		mips_ejtag_fdc_con.regs[cpu] = regs;
 	}
 	/* Already tried and failed to find FDC on this CPU? */
diff --git a/drivers/tty/mips_fdc/ejtag-fdc.h b/drivers/tty/mips_fdc/ejtag-fdc.h
new file mode 100644
index 000000000000..62e8fbe1b614
--- /dev/null
+++ b/drivers/tty/mips_fdc/ejtag-fdc.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * TTY driver for MIPS EJTAG Fast Debug Channels.
+ *
+ * Copyright (C) 2007-2015 Imagination Technologies Ltd
+ */
+
+#ifndef __EJTAG_FDC_H
+#define __EJTAG_FDC_H
+
+#include <asm/cdmm.h>
+
+/* Register offsets */
+#define REG_FDACSR	0x00	/* FDC Access Control and Status Register */
+#define REG_FDCFG	0x08	/* FDC Configuration Register */
+#define REG_FDSTAT	0x10	/* FDC Status Register */
+#define REG_FDRX	0x18	/* FDC Receive Register */
+#define REG_FDTX(N)	(0x20+0x8*(N))	/* FDC Transmit Register n (0..15) */
+
+/* Register fields */
+#define REG_FDCFG_TXINTTHRES_SHIFT	18
+#define REG_FDCFG_TXINTTHRES		(0x3 << REG_FDCFG_TXINTTHRES_SHIFT)
+#define REG_FDCFG_TXINTTHRES_DISABLED	(0x0 << REG_FDCFG_TXINTTHRES_SHIFT)
+#define REG_FDCFG_TXINTTHRES_EMPTY	(0x1 << REG_FDCFG_TXINTTHRES_SHIFT)
+#define REG_FDCFG_TXINTTHRES_NOTFULL	(0x2 << REG_FDCFG_TXINTTHRES_SHIFT)
+#define REG_FDCFG_TXINTTHRES_NEAREMPTY	(0x3 << REG_FDCFG_TXINTTHRES_SHIFT)
+#define REG_FDCFG_RXINTTHRES_SHIFT	16
+#define REG_FDCFG_RXINTTHRES		(0x3 << REG_FDCFG_RXINTTHRES_SHIFT)
+#define REG_FDCFG_RXINTTHRES_DISABLED	(0x0 << REG_FDCFG_RXINTTHRES_SHIFT)
+#define REG_FDCFG_RXINTTHRES_FULL	(0x1 << REG_FDCFG_RXINTTHRES_SHIFT)
+#define REG_FDCFG_RXINTTHRES_NOTEMPTY	(0x2 << REG_FDCFG_RXINTTHRES_SHIFT)
+#define REG_FDCFG_RXINTTHRES_NEARFULL	(0x3 << REG_FDCFG_RXINTTHRES_SHIFT)
+#define REG_FDCFG_TXFIFOSIZE_SHIFT	8
+#define REG_FDCFG_TXFIFOSIZE		(0xff << REG_FDCFG_TXFIFOSIZE_SHIFT)
+#define REG_FDCFG_RXFIFOSIZE_SHIFT	0
+#define REG_FDCFG_RXFIFOSIZE		(0xff << REG_FDCFG_RXFIFOSIZE_SHIFT)
+
+#define REG_FDSTAT_TXCOUNT_SHIFT	24
+#define REG_FDSTAT_TXCOUNT		(0xff << REG_FDSTAT_TXCOUNT_SHIFT)
+#define REG_FDSTAT_RXCOUNT_SHIFT	16
+#define REG_FDSTAT_RXCOUNT		(0xff << REG_FDSTAT_RXCOUNT_SHIFT)
+#define REG_FDSTAT_RXCHAN_SHIFT		4
+#define REG_FDSTAT_RXCHAN		(0xf << REG_FDSTAT_RXCHAN_SHIFT)
+#define REG_FDSTAT_RXE			BIT(3)	/* Rx Empty */
+#define REG_FDSTAT_RXF			BIT(2)	/* Rx Full */
+#define REG_FDSTAT_TXE			BIT(1)	/* Tx Empty */
+#define REG_FDSTAT_TXF			BIT(0)	/* Tx Full */
+
+void __iomem *get_fdc_regs(void);
+int is_fdc_interrupt(void);
+int mips_ejtag_fdc_tty_probe(struct mips_cdmm_device *dev);
+int mips_ejtag_fdc_tty_cpu_down(struct mips_cdmm_device *dev);
+int mips_ejtag_fdc_tty_cpu_up(struct mips_cdmm_device *dev);
+
+#endif /* __EJTAG_FDC_H */
-- 
2.25.1


