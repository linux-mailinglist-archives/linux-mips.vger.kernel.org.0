Return-Path: <linux-mips+bounces-3228-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7507C8C30B2
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BE64283282
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240CF69959;
	Sat, 11 May 2024 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="b6Ozk9Sq"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2094.outbound.protection.outlook.com [40.107.241.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6B612D3;
	Sat, 11 May 2024 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424250; cv=fail; b=c8/TcHCUr84jusf8KHsNWwcfE7xipvKiIRB6PQpIGravU8oaPpOREkhc/qK5AcWYcQfQq5S+x52HIh1Ln2MqVafWdKF4NBiJOt4o4+kBTtSRfJprNOQOMO7KCCKvV1JJoRSiDpZwgDKpWmb75MHuJTZkXDMlDPrSiWU+iTqA/kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424250; c=relaxed/simple;
	bh=AjDYcS5XWesU60CUzj2bbQirnHDXd7rG+PPnWlY6UAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jhYkBqQIzpj8QiRUlvMiui+4Alt+gmuV7IPMVVU8TZxr55eB6tY0JczPifBtxrMfyF4ajzQhrWvkixShtbsesPsR+PsSnFjstuenq+zAACeUEwEoHvmtG3eB+rWAGSXgS/PMQnwID0xmuWhYnih/irCbfIw/XxREN4N4XP33odc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=b6Ozk9Sq; arc=fail smtp.client-ip=40.107.241.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6laqh+bgp0fRc4lsU8NZQ8TIXnui0xFC8JYTWErU9cCfu8ap2ZuKfQZF5/dHXTFDqyAZB3lg/M6EU0eItKt2kUL1jaDczcbgik6Um1N0ZPIFoqMYuehV92z6k0x7pkpG+xODwHpdAgkMsm/ZIuxWo/amLR0NdVzvQLFhYpSzO2WWpSs5kQT3MsKYpZUeteW8h6il+hHbbwLPra3pn/i736vXx/qo8dNn0kfZ/dbVVMbjVvTJC5lzs9S2eLHeySkm2ljFo3mWxxn+YVJZNentaXBE53Zn0f8K1Ep5iJPYiavHrPrWZIAFYG37/XrVRiN9Etq+77JIOedotJJYrDvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHW/psxzCaBVsUGXu1idsRWg2soj4NwO+66vDVvz8Hs=;
 b=nWuDwtDfXaBYd3ccLAsvY+1nC2KkYnF6JroxW3cFLU3yUWKRInVFc5B0seEYWBE0kBM1FHD7kkZKPwnZeXejz1aZjQWduOnIfRnXwXd0UmZxpGqo4dZXork4vVISgIrMKU9Q1aVN88pvjGFsNgwi5kqSs5IC/eAe5YJ51iFlKYl5cxPaUzGvma+wbQUZP7QVpPhOLWlfU3YtxMMU9mmnIja/FY5zIfXPm1mVOj+eTA7R8cyrf9aeWkCJedAJeAzGgANRkLAnoyG8SnJyglLKxPWZWlCdUWyVyVUrJOSGuvSfPo/gy6FOuDo7v/o5H9t015ohiPlkikhfuW9CP6F41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHW/psxzCaBVsUGXu1idsRWg2soj4NwO+66vDVvz8Hs=;
 b=b6Ozk9SqAAZ//G7GV5sFrcB+k/c+JydGDYtPJ5YDE3V2aAoVoINCPt1ZHaT2++PK7KAyT69AIcZOIerF2ERyppMU6OZgy0nlmZEFxEQ6nz4k/z7Tft3Ca1wMT8M3TzhnqfuqGb+8eRBcwaiCqi6kHFbO68/smj6GhKeol4cOATQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:44:01 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:44:01 +0000
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
Subject: [PATCH v4 13/14] mips: Move FDC driver to a separate directory
Date: Sat, 11 May 2024 12:43:40 +0200
Message-Id: <20240511104341.151550-14-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6ed635f1-8dcb-47e8-37db-08dc71a7452c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B5iKk77CSsOiVr/AmLcUlZu0gvO1AS1OF3+d5GWQitmSIC06dr9x2V8U8kUm?=
 =?us-ascii?Q?exH7Ljj7Dy227P6PKR8CUrzVwgeXo6AdKgPyFSQj/rmCTdjLQvP5w46m94g1?=
 =?us-ascii?Q?im9BL4nycs+fCyYDp03Nl2eQhr5Mrljdi9AQAFzcE5fgtB8S5/ST6Jt5qH8n?=
 =?us-ascii?Q?clRz8A0/Z2dp6g40AdP8WUDcwioxXi3UilbgWt0arChSinivYChpIt10SEi8?=
 =?us-ascii?Q?4TKP3QdyG1nBsQCAxaBDtGAGZwD6TGyu7dFP9u68W1uxAexYB7l70AS4Qna5?=
 =?us-ascii?Q?QIN47MavIjQ+Ulvfl2zaieLlRAVRvVLMuurmGvaZQD/xESdFxpo+pu25ipSP?=
 =?us-ascii?Q?DVD8Z0D+9vPgKQxO9uYSHzmrpVQ1rHFJLntj1aQQNDYrtQfois45WTIQyG/+?=
 =?us-ascii?Q?BGvTVd55yTEwuZHYvuXL+Y2yNghYrJQW9GVPlB7ZkRsBD1ckZ+QRg+86Fmjt?=
 =?us-ascii?Q?pgjQOiA1DvMwg8w4fP+/fOXB5bc2w2VTR9037oGDP5Fz1EUHuV/b0FlAiQZc?=
 =?us-ascii?Q?OSeMgVsInVADCCWE1fLN6bxdf+Xnzm9+VsGNA0oNW44VxzRYDuQyS45FRBhj?=
 =?us-ascii?Q?xFAJshoRgNFbrPH6L7vLv0hFlFEBCM7ZiwMq3LSwX2Br+zy4rHw9JlsXjBy8?=
 =?us-ascii?Q?p2NftiV1C+lGmlWsFqQf5RGhwJxaYYgAVlu1/6HdPd0XCKZPcZYxTakiyRkY?=
 =?us-ascii?Q?J6Yrf24Ewut9h0nYEhiB+lcJSOV9kJw9KCaXVNCMVhzufSd3xdwyyNdbE+xV?=
 =?us-ascii?Q?ZKU3ncaALbeLM2uf6gPEU5uW2Ly7e4sPgc0B5En/orRFNMavu/PnG9n8vpOE?=
 =?us-ascii?Q?Xv+hVnaSApIgbECIFgE5sDQoAeKHqZ6oLw9AYMfwpBsRVA+S+CDK0wuFFrfF?=
 =?us-ascii?Q?Nuyc20RQsM79Zlqs3fBrH+nfNQaV+022q22F9skTxVonwxt4OOkwvQzRLnr5?=
 =?us-ascii?Q?vKS5x4UpnkGrNNquaH6mbdRV91vJfVmrQkl+n3aJxKeDgP8DrB6aktowIocu?=
 =?us-ascii?Q?6BIXxtvKWbq8TIoYw4Gr08y8I7BHMH29lUWn7Gqzp3OkBMRW1lJH6GmeMjsC?=
 =?us-ascii?Q?6Nqo1htfp9+AxS+r7iphkw0/bBtThrDkwTElxYHCvb8QCPIydal1GKF1B8Ej?=
 =?us-ascii?Q?5jZnIf83oW+2YoS5xiWEwX9K3f/O2zwtA21cWNXDpjk4RGFVY561Ko52CBM/?=
 =?us-ascii?Q?MqQ9hKSLZGP0ZQua+ZUBR3mcJCOzBeN8F8sHhssorRB1MjnAivYWONw0SOAM?=
 =?us-ascii?Q?ilBPJe0jwiLyaRnyX1ypgo7xpgoBou07MEMI0rClRRu0wnUHK84ESCi5ZV+S?=
 =?us-ascii?Q?Ta9uG5O1Mgfz0zSEX1AkJwUDZsMCwKlx6tvQ9TL0lp+AFw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?debIy35JUIZN27iirqLVRu1EJef6aZyA+s2JXn+69IWH/oP0QllZfR+++sl2?=
 =?us-ascii?Q?dqo+OKR58SaTUFOCN7/kFGPlTEae406QSJ9aFuuECGXMoNr1WBcgqSxjZyQP?=
 =?us-ascii?Q?mFpm7yp50SgXUyt4uUrB4lRbxQDXsam13x7HfLClKrRh33jc45CieRMNuiyo?=
 =?us-ascii?Q?pMgu/7G82F8xohR7T9TldA7plU9/mkdNTl+tjrdRWPmT4uZFb05GWDlGhVu+?=
 =?us-ascii?Q?gRlDC4E5J//NzB+BiYQtKcu/0a8837vbn12pZVZ3Sge8WZeQpMMDs/taceSL?=
 =?us-ascii?Q?xrgS8QY15s7waX6TF0sesyQn6kmQp3DWYNi4hnZ24l2s+j6d+pZZ6mlaAAlE?=
 =?us-ascii?Q?pd/ZK/GmVR1pxNKFjD8PGuqua+pSPpIldiq/03drTmq6F2IpZNfath360ZK8?=
 =?us-ascii?Q?mhOevD5osZNnetPbiHbB6bnatIk8DXCmbhKBlZMpsjRIfB4ogmS4rsPJFICA?=
 =?us-ascii?Q?mNGdoGHynxPZs/okLOMMORmLmhBFV/SnZ7HSt/heQtFVqJh7c6GhYCYxSnmC?=
 =?us-ascii?Q?f3H1iKuzXAUkY/UNyIZKTlER0xYoyjfctOWKxAoZFou8JbyDQb0lFTVZ7UVC?=
 =?us-ascii?Q?YlAvNRDyYTdLQkVAVLWq6Sjz/EXEsAOB2EhdkuxV94cnSTgZaHmNRV8ZhDMy?=
 =?us-ascii?Q?qJqjX2iTZzfdxUeylNzCOU908Em6uO8HgWX1JvJ8OsjEZpMP9T9yHQnkKDTu?=
 =?us-ascii?Q?HIsZddhWjbHSvmPDuA5uZFXllaZqyxqEyVM7I7G80CWNTOksfGUZdLDIfHSg?=
 =?us-ascii?Q?D5Kot8qHe/PARXtjFhJ53IwRDgmdvsTShaNqohE7De52qAteoUWDBbE/vuKa?=
 =?us-ascii?Q?yk9Z3jtAU8oizIptJmLhpC+Z7lLM7nG0CU7/c1UxufzmNp3u/L7aznCihJ+f?=
 =?us-ascii?Q?hujFHAkQQMkpYpGpjN8GWWE/h0KxYIX7uvDtT7Q9Z8SI8gHa/RQnmSM8e3l9?=
 =?us-ascii?Q?CU4zjRNIX6QnXpc9ENsUqi+UhvyzJAlNrupnRM078eEhvxa9KCLbO8GeHKLc?=
 =?us-ascii?Q?qW4HCtk8q43b4/uHvo4/z2O/n0sg7mDdOKbyi/lwxOyaIn2kWfv4JeWAD96T?=
 =?us-ascii?Q?4HBFCJRwT05cvo3IYQodbB+X+kv6pTMuce+OPWfcZaYfiMw1okPHs/FNxuHw?=
 =?us-ascii?Q?55TfZML8C4ctUlkV45ESaCn5JygYxTGAEKCiunCKb4be5iwTrB24tB3Vut0h?=
 =?us-ascii?Q?GZnq3NfvH2ByQJwpuWC2ubz5MvAYuA0cCBpqWZ1q2ALdcTNEx41oosLX22iF?=
 =?us-ascii?Q?67MfTAatVOSMc3mMU33Z7xAVbDJYZFlG2MKlNjFyJjxbSTmKD5iLUQUb0D98?=
 =?us-ascii?Q?xlzJpRfWyYvCS2ke4G+75p/kM0jmV34I8EFTKiDg1Hr8iDyoVwV6EgdG5TeA?=
 =?us-ascii?Q?nMFRnHwikV0Ka1EAI+KPMSJfKXwj/iabOeJAggqmBrFKQZ7hxMP3KyQ5KxtP?=
 =?us-ascii?Q?Teu7rC89iqSAI9IfQlOY2hlqeP2m1s3HbYnmo/lF+SAsmoU6UJv2w96H0v03?=
 =?us-ascii?Q?d6bcvluiPpdQVV3Kz5ulgQKuesZZ/xlnE9gN6tbdgcNumiVAhbNl5qsqXXNo?=
 =?us-ascii?Q?bCWPhZ0KLOAaYoCw6HsanUTpKz7WkcnO3m6kjpUbawT7vEqi8lY7C7R4UVen?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed635f1-8dcb-47e8-37db-08dc71a7452c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:44:01.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTZr2SpQu7RbcBzWi3JRnatGdtxM8C2F2si0GmfMTjYIqyA8anGf5FqI34d2PzjJcsXBa6vP52qecLKc390U5gDWmZzbDpe7BZWUryATR38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

This is in preparation for the further changes that will address
FDC multicluster driver support, as well as FDC support for other
architectures.

No functional impact.

Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@syrmia.com>
---
 drivers/tty/Makefile                                   | 2 +-
 drivers/tty/mips_fdc/Makefile                          | 2 ++
 drivers/tty/{mips_ejtag_fdc.c => mips_fdc/ejtag-fdc.c} | 0
 3 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 drivers/tty/mips_fdc/Makefile
 rename drivers/tty/{mips_ejtag_fdc.c => mips_fdc/ejtag-fdc.c} (100%)

diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
index 07aca5184a55..8846080d91b8 100644
--- a/drivers/tty/Makefile
+++ b/drivers/tty/Makefile
@@ -24,7 +24,7 @@ obj-$(CONFIG_NULL_TTY)	        += ttynull.o
 obj-$(CONFIG_SYNCLINK_GT)	+= synclink_gt.o
 obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
 obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
-obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
+obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_fdc/
 obj-$(CONFIG_VCC)		+= vcc.o
 obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
 
diff --git a/drivers/tty/mips_fdc/Makefile b/drivers/tty/mips_fdc/Makefile
new file mode 100644
index 000000000000..03b2781e1090
--- /dev/null
+++ b/drivers/tty/mips_fdc/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += ejtag-fdc.o
diff --git a/drivers/tty/mips_ejtag_fdc.c b/drivers/tty/mips_fdc/ejtag-fdc.c
similarity index 100%
rename from drivers/tty/mips_ejtag_fdc.c
rename to drivers/tty/mips_fdc/ejtag-fdc.c
-- 
2.25.1


