Return-Path: <linux-mips+bounces-9401-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB80ADF192
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 17:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2D13B63EF
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 15:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1A42EFDA7;
	Wed, 18 Jun 2025 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="vBs1cLnT"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010001.outbound.protection.outlook.com [52.103.43.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035412EE980;
	Wed, 18 Jun 2025 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261255; cv=fail; b=X0CCPmxVLqAhfXxe9lo36kultX7fQc3Ba2n1CBKy40Uuv1Iso9f6dholtmucDxD3g7AFo2NXYzYbYISXYvROH1xKalVrSM1jJ+DyXdIc/aUnNpg72pHzzbHm9QVBy2se0Cszm6dfv/ImLUDjxWdUKhBtz6thdF7KQhahxNFZtHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261255; c=relaxed/simple;
	bh=iuYgC7f50m3y+KEelpC5SCfSs1CUrXO3aEy4S0y5TWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LXFKIXr7K3fnNp7AJen3O4CHjkDynpf5fo/+qsUW9Lbqhk+Jw054dUbWiI+umk7rMCCu9UvYa3mF7sCF+xPbysj0nO9iG8PGJct+e6zPKsAoicZzL41yc7vHI1qyl2KOluFz/WCx6eai5iKqc8DaGrqVPd+jW+Ai7R61y3Sz5+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=vBs1cLnT; arc=fail smtp.client-ip=52.103.43.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeeUNdsHAA6jxGIPQbCUcm31enNqsVfUOOUiTT623ApB329bRhtbLzaroCqdofjlmPPMoVJ6WjNtbIQEjxStS702yVOG5VrOGSJUTCzFCicibuoxEmyTfNSizi/ZpjblBAGptQNPdnIhdM/NOAylrfhZOhqjbmruMzPhUJm1kcSEGF7cdTVurY552t9kRIJPeKFs1/url/bDS/TjLAR2WjgylpGI05psL7/zh6+5p6jaIGf5bq10SF4Jv+ZoEVwv/nJh9dQ0GuwHghVfCmZSm2PWtwKj39Rn2iF1CGzYJOH6EACTe0EMLYbizgYpcxotfLQ7JW89B54xUCyXhRKQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7CU9buTwJCJMU3QYQFRbyS8MI35elAnp0pQpPOpu7A=;
 b=lX72deXn/JKah7pgfcZG+ALHkeer7DwKDs/kLS6S8npMy8l0UXRZjCdcEAEY7kXvwkV/knjpEZzbMlXHhkvTaljSyDg/qJdx4ZPu3lf5jWcPQbtUga835+Zdkn4zvtMAR3sBrGR3j+BnpsszkZjn2AHytn1jPpd0AnwY1aFKU9qebNrXKmifKY6km/wPIM0AaNj9q83e2H2ndGzkeBWt0T2Pmf8ac6cEAdApbarsi3qZ2Q/3HQ50xGal0iE+/6U0JjQWcg3RQO1PfqLl4rkxAOzjhMbSlNuJg2pXuMJ7wtrca3RFo9z498b7WaqkTWg2U+Nc2vURVrdxXrXJzCLVRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7CU9buTwJCJMU3QYQFRbyS8MI35elAnp0pQpPOpu7A=;
 b=vBs1cLnTSkd2umPW9DyX+SqmtV+hcOdnggjV2F9K4mJZd2C/96CL09tMUwwTQOXsBttOXS47dJlMrHq4kv8f2XGmjF0qN5xvirKxBAfBgNM8Axr5nu7S6+YTAOr4CeUY2VliVrg+WCYjfUOx720BKc8PeiRtxJRHqik6sMGXh/WE08GUCNawkFLbybtuM/E/kpeAzvh4WPVWDYmN+bN0Z+sWuTxQfyMhxCZHpzc0Nc+ZgVZYk4vDA6l7eUkPj0InAALe2iBCcOP0hjekkDdSqIAf2QDpL9yIh8KVXsBOejQ9k/ryeMigm/H2O1XIePIOgvlkzEZJSRWpiA/fKdmloA==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by OS7PR01MB14883.jpnprd01.prod.outlook.com (2603:1096:604:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 15:40:51 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 15:40:51 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH 1/2] MIPS: ralink: add missing header include
Date: Wed, 18 Jun 2025 23:40:25 +0800
Message-ID:
 <OSBPR01MB16707BD9B6915603B36FD072BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <OSBPR01MB1670AB9E2C07690BF71FA6F5BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
References: <OSBPR01MB1670AB9E2C07690BF71FA6F5BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID:
 <20250618154026.13752-2-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|OS7PR01MB14883:EE_
X-MS-Office365-Filtering-Correlation-Id: 6560efac-a237-4ded-c2c8-08ddae7e810b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|8060799009|7092599006|21061999006|15080799009|5072599009|440099028|3412199025|51005399003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d4ddFzirkp1vLaR9PCHgfHylIMN4LYVx3x4phdRp08FdLpbblXVmc0aQm2RA?=
 =?us-ascii?Q?MYQK49dUX/u1iZMPYGhBFvfJjFq8n2usJxAIdmDNsv2GvfxY36RG0paHn2oU?=
 =?us-ascii?Q?cgPpu1WraHgQoiPR1ilmBpZMCL6P8oNxkTg09cpjE/xIpClz6BJbYJtClx0V?=
 =?us-ascii?Q?d+wMXLIcW9L3wR6sA2etPT9+RSDZuP0uBm0B0wwZI4HhK4l4fghAFJku/eHo?=
 =?us-ascii?Q?+DeIuD3cerJyTU/bGOfNtmcG3epBLvK7eajmiLB4rd+fcOVH9Ib+9r6r9fD/?=
 =?us-ascii?Q?/pFlmpLS6mHCmKSuUdjWmkxOptLKy9yoMLzIfcDCUwWvoQQ42JxLodfOCOYZ?=
 =?us-ascii?Q?sOwDsGN474sNRcscM5ecY0NsdkffVi81TuGI8JP+8fKWTWnqvLJJI4VUYzbz?=
 =?us-ascii?Q?L/7PaYqDivjemd18n+W96xpNVChhI5411mPcFBdI3lrIRVStAfbj9JpeKlwv?=
 =?us-ascii?Q?Lh4++VkxK43tTuYrts5mekIYDzPWgSDgHsHIKbj9Z1UNT7xXjQCNBVc29FY7?=
 =?us-ascii?Q?PcrWRybdLDhHWB21e574yTAomWxqyWYaOiSn3tV9li8KVwR6rNHTddZ6LDsJ?=
 =?us-ascii?Q?r5mZI5up3zC+tZbpY/qlkSRe2YrSF9zDEnDuRkBGgEnCMBOuVYdl5KRVaVFv?=
 =?us-ascii?Q?RmIc+yKIeQpTsmRmk89E0qsMbpNLz6d5r2iEDgaHq+lVrVILZMlEoGMAIAEK?=
 =?us-ascii?Q?/gedTZbq61ybPd/6qMZb7SURPQa79DJjI6l0B3VIgwechdoKCz+DqZPhoAZ6?=
 =?us-ascii?Q?EaoEDS6Lba2b+9i37cGR1h/Nb5odw0WPhYEHLzajT6guEQLzXZZnVg6Ui41S?=
 =?us-ascii?Q?aOuo4JK9S6XqBLKNNMo1PFGp+YKytxZnTLphUVzFvqyOOQ+yCVjPBRRXQi4H?=
 =?us-ascii?Q?2I4lEDVmrBhSU6kX90Ntexmh7NCVBe7btwLKCawjmFtEO1nTEya1aP9Bw9Of?=
 =?us-ascii?Q?+vLRKZzhf8WVykELtakuo9ffSmgVb2+DsBZV8dZLC40s2sExp5IusDUs5pOc?=
 =?us-ascii?Q?6/FwzPwAuNMjejY55ufhw8a7TAmUjnxh/8B99nvnhVuv31GT5sDczl9CefEN?=
 =?us-ascii?Q?J/igkeDgbNgHj/q/7ojOpO5P2KQ2UfbDbxzvgl7eN8zndf/LGlYXw8A46Xfh?=
 =?us-ascii?Q?jvhuu953Q0FqF9vISZBi0aJlv4sViMJixCzE3s713gdizXoDdatT333Ko6ty?=
 =?us-ascii?Q?g6PQBdiPrYfwVY5CPffG45Ih3BKdHjoe2kdpXlNGY0mLCmHaqc/mwc5/gE4?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1OBgnTWiW+mYFQNrTqm1M58NQyvJ60b+ibRmLsNs6O6DxOV6M6Wk58q4B4Nr?=
 =?us-ascii?Q?BKBYG+RbsrwAXC5NWof/SevNv46RR1ltmbVKSrO9gaA+oJijiOaF1RgAVdqz?=
 =?us-ascii?Q?amu6NcDxXEIsDUEyUq1QXtG3FJ6Wl3OMqXPBhtwN8hk0C7obPe7GzT/yF/HA?=
 =?us-ascii?Q?1BlqUIXP+AR649gV/RAgafG66QqYaQWh93RBBqSri3DtAGL5dH35IenJmUkW?=
 =?us-ascii?Q?MNvu+4L3gdMdktk+wQlympeBO0EKH3MrqF0hou5kel5HIE2H6Wqd1mLBY9x7?=
 =?us-ascii?Q?IJgYtEyFsSZNT1YmH8JAvZO1SjkWtyrDD80+eOXEgkZi4e/dEFMrPDAUayuS?=
 =?us-ascii?Q?zUocV4344JxqdFKEKiSuxyadwYc4GmycVSSBMEx4qOs3Y4jdcJLFiPUGVqpV?=
 =?us-ascii?Q?pVaoO7cYQBIaShzHP1B7m/VRl7gvEEgVL3lvsV+dxIazteNivbRBxlYkijpl?=
 =?us-ascii?Q?MoitkqhxsGEsV4t5m8e4xcIiIENWI2QhFIybDdHNN1Ktnd6xkLWqUvj2gV01?=
 =?us-ascii?Q?TuUX3U1mGQ9wTwI+Z0HkjFPlUH9L7l9QnbvbYMkt4P++m5iqOhpdHQ4fKczX?=
 =?us-ascii?Q?J3c43ygAtsQWFeQuiWmjCJcuR4Kj5CkGhGO2LMhErerh2VlpZ+Ic+lH32Gp5?=
 =?us-ascii?Q?zKLiTCdmgS8PH8aHefPUw3SYbehozjRcoWOo3rtpuZA+gKjA6Uw8u3woTz0F?=
 =?us-ascii?Q?kpER6A7okCb1FyxFg8lcQ4YclBeBmFNRgj0H9gIm/sEkuXCvHJgPI02ijWPZ?=
 =?us-ascii?Q?A8svQHGxIscjI1Zl6T8TCFaxnGrpvlg0qQTgRRFk195/BSCCk4CMheiixgYf?=
 =?us-ascii?Q?5KjSC57C1Hc8TL0RCN1DDoPnaoa7SPciD8hGUpDyvjvmHQtN5KNGmuKdOxT9?=
 =?us-ascii?Q?Mz8KLwZ7bCQ/ZDYPSkk+ymw16yX+FzSKofY4h1R0L4/MeSFvnaWfG39X/2y2?=
 =?us-ascii?Q?XFrPc4x219/gR2DwnFmYIAmJEsELBHlEWHw1eutogqleH/9UGvQiWqvTi5Ih?=
 =?us-ascii?Q?XKcG9XwthiBWxDcqVvK7MTOwmlmbLEEFqm3r2MLNgLPDzfEMwKWA+fCqOX/f?=
 =?us-ascii?Q?1t6ewytNUQD3gdHfTq2eCbd6YU+NtmDYBQEyYexkSlpERG0y7byvvoKYfKxd?=
 =?us-ascii?Q?q63a+djOkMnVrDonRsYpv6WJJsmG92N0RNqnNmc9Wh8n/JRmGOWCZxuWnPu0?=
 =?us-ascii?Q?tkZsAeby7f8Fh5W6YW0xJwCHSl9PvejSOw2r+zJ6JFa0rl7TJyoLqg1e/2rS?=
 =?us-ascii?Q?bHtmX6NNOPbQqVI5yMTm?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6560efac-a237-4ded-c2c8-08ddae7e810b
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 15:40:51.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14883

From: Mieczyslaw Nalewaj <namiltd@yahoo.com>

Add the missing header "asm/time.h" which defines the function
prototypes of get_c0_perfcount_int() and get_c0_compare_int().
This patch fixes the following build warnings:

arch/mips/ralink/irq.c:86:5: error: no previous prototype for 'get_c0_perfcount_int' [-Werror=missing-prototypes]
   86 | int get_c0_perfcount_int(void)
      |     ^~~~~~~~~~~~~~~~~~~~
arch/mips/ralink/irq.c:92:14: error: no previous prototype for 'get_c0_compare_int' [-Werror=missing-prototypes]
   92 | unsigned int get_c0_compare_int(void)
      |              ^~~~~~~~~~~~~~~~~~

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 arch/mips/ralink/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ralink/irq.c b/arch/mips/ralink/irq.c
index af5bbbea9..955b36e89 100644
--- a/arch/mips/ralink/irq.c
+++ b/arch/mips/ralink/irq.c
@@ -15,6 +15,7 @@
 
 #include <asm/irq_cpu.h>
 #include <asm/mipsregs.h>
+#include <asm/time.h>
 
 #include "common.h"
 
-- 
2.50.0


