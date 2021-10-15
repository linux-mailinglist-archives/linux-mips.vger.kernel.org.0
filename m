Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE5E42E99F
	for <lists+linux-mips@lfdr.de>; Fri, 15 Oct 2021 09:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbhJOHDu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Oct 2021 03:03:50 -0400
Received: from mail-eopbgr1310132.outbound.protection.outlook.com ([40.107.131.132]:40164
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234350AbhJOHDt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Oct 2021 03:03:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGao05piLLwLhH+e4xSFTCkilsnkr3NoES71AayjjUFCYEGl8TWphR0q0kHQWIdC3mOpOrdVssgEufNd4QNUn6DkUiMmhQTu6xyPjX+Hw8U3tEl8mJJ1KrGg3zqy6aJVhVco56SgCsjOVPh7ieHFGTMihBOGl4+TANGHeawq21gIVId2h3LGpIJI6SJ0g90atSGyHWJbQmLI0heWTnfXhU9FV+HiQWR+T3uGkSFb+2Rh4PwK+SHbJzsHm8PntxO8wCx6k2TfBgqbeTmKJ9KhLtsqo+t1rXDWN5VqflB7OKSiopEMQ03Sy2xPcV34014pQUsPrANatJlsymN9Rj27Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDXorQ8DhQGfAxMiwA8DdT0WSoJaiIQRmSJcNbk+DRs=;
 b=IP3KvlmAv6yA+LGoqhieWyeaAPbhliW02VS0Bwc9RBLKRXfPP/HihZ6EmNBOV2WCBroyNG+7ZiaWdnHBw/TNwOkaCc23hUM6plkhVahqHc9v7ZUxuZk95mSX5GtWwQI7mQKlxtNcpuLQOHqxKEQ8lJ2vTTVJOlSgf9xSo3+e8ZUF2robEMXILaueFlz7psZ1x9AZL1tzG0NK4Uu0zozm19+Zpk6MypHFWEnPo9zCHJIyOxnR4PTqQ1LQQbVVsSQoQ0dhJYJgngudYH4nyRKipmP1QfDTcunzMWtAEUSfGGMhG22FoSoFwnG9s3D7RO9Si9meiRws1dwA8Datiu1YHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDXorQ8DhQGfAxMiwA8DdT0WSoJaiIQRmSJcNbk+DRs=;
 b=UTqQE0MoELffWPvCsy8ho9c0E6lUyi5INRruMVmp71bMeB2eZg5d7u+QkDWbg/9G3il0xehrc/RxtYCzk0/BMj9abLlS1CP11Wvu1RcFctFfVf6oV1Lj7vm8NVzuEQjmjJlflV5DgCOLYRtKKiZkeTERzmgzBiqS3sBiSKONXYc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2858.apcprd06.prod.outlook.com (2603:1096:4:1b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20; Fri, 15 Oct 2021 07:01:39 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 07:01:39 +0000
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] MIPS: Loongson64: Add of_node_put() before break
Date:   Fri, 15 Oct 2021 03:01:22 -0400
Message-Id: <20211015070122.11467-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0177.apcprd02.prod.outlook.com
 (2603:1096:201:21::13) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by HK2PR02CA0177.apcprd02.prod.outlook.com (2603:1096:201:21::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 07:01:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9886da56-0379-48e5-e4e1-08d98fa9a28f
X-MS-TrafficTypeDiagnostic: SG2PR06MB2858:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB28584C7C7CC7523B4580A7D7ABB99@SG2PR06MB2858.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ArUWt8YF0zb9hAzSisued4S5mLZ3dwqanciHPH75wmkVM3goM3DpmqxoN3jRs7hbrU+qFWjPDL/kwgguBzDJkOEcFBoPrSOm592jPYRs80TOOyuANlIPQDND+OFJSpkXrI7cgDAbiBzlH92k/+ZpDF0JBpfk0oVXxwQAnh8DptiAEbLOtsxi8IaRKUkwz/9NsR/CSrI7nf2kPSD2ridY9D1PgmM/4aibYyRGkWs4ELagWibv/okLd5z3MHpvgrgux1YelI+18cD2pYlCpiX8yNPeI5gIUQKScsDC6GoZrVeFKOoR1ZXfRjM0XsLhsg/VdkcMn1VWilC1Il9qLZUGDiO6FNoPTcVvy0zcY6grbmM5b4vj7XnJP0IV6fXshZajzdVwaEKNo3dRZkoswB+BYM7coxLYbOuKugjnTxhLweMevFhYo92t/sC2UhDR1fLNHRdsqB3XstVsuTTF3pBAwfty2B6/0zy3HoFipnLjkGNhVHnIWI9+k8pKGtw4a7Ve535P4B7V2csEHiAIwra++wR/DxY6lJKJ2N+7yvxW+fnkgFvC3eI+1t9WhnGssQNgu8a8YTkJRtdxL8+mJ0Zir2TfdaCn899SoCERjqqmt4mJx6Jw3q12VQ2wvVbhA3j5E1D6f4Um4cJFWXFN0kli5bAmUwTqYYFxXOniQTvzvV5Z+A+TohHiMrgPi2tabPDeujUg7maidTSJg1S0ZYidFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3367.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(86362001)(8676002)(6506007)(6512007)(5660300002)(956004)(52116002)(110136005)(2616005)(6666004)(83380400001)(26005)(508600001)(8936002)(4744005)(107886003)(66476007)(186003)(66946007)(38100700002)(4326008)(36756003)(66556008)(2906002)(1076003)(38350700002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KJIILsV6mQPzJahQmeVvVTnXCAUQFDl5Xc85vWGcP7C6MKEvnkfYKH+cP9CY?=
 =?us-ascii?Q?kcpc+UHT7UqS2aqH402+YUjongFybrZrd8Zjhtz/YY71k04DGXdEFTq/c4a0?=
 =?us-ascii?Q?FGXS1Y1q5i/zJxIE4tQhUoZicneh2JosNOP+Fl7YWhtar12fUxqx01DOwVaG?=
 =?us-ascii?Q?SokMoTZrxFIBUV+BCBpyA7IDZYWLCy2z9drp1PNGejcOiO+VTjjnQrh+vM7r?=
 =?us-ascii?Q?jrZOeyg4CLsn0ZvAht/5X8L8Ki9FL4R6vUNT/AdVZFLul67j95hO6jtDDFd+?=
 =?us-ascii?Q?48MnNe2YTz1EYadzXvvkAgnB4LVYkIBmvpfhTh7cxz4tyBsicESTrA2TRUDy?=
 =?us-ascii?Q?bzNubH++4DGTnYswJ3DWAjDdhX3EAJNkf9WcFKSd5JzcHIPHCHhY5M6tyPJe?=
 =?us-ascii?Q?i//V0z+63TRlDRlXJGbvcJ77SFC2q7p84H1w0PqKkcJqr87ybQz/0kZdiG8d?=
 =?us-ascii?Q?+WldTKm5iQDeyzY463QzhTwFzkEFlCT49nbrrYImD8PDfsRB5l9HkxIroWmq?=
 =?us-ascii?Q?DNzEwd8cFpL8Uch/tfcXxmPZ6ND8uVEp17T+uLDHZPpagoxZABkioX3GF/Vi?=
 =?us-ascii?Q?ThTwYcSJ33YxUjmDF0iwPGXBsWM4hLvVqIvvrdSNbOY1JfFn5OlvVKGFJLCa?=
 =?us-ascii?Q?G5MCTUvdOzHi3fXJGuLYSnoo1xbJVjb9f9yq5tbWvL07ODuexosdeJn2IaMG?=
 =?us-ascii?Q?TOU3IBpibWtgaJC6Ey7Vuex+cNOnd7msGhydtlRUVT0lEWbZQeakDD+i2SvD?=
 =?us-ascii?Q?9sbP0l0wlZbtxqezjXlT5nzzNS/Fk+gPnF7+xyVmr8s2CvY1VhNIoOkxn47A?=
 =?us-ascii?Q?z3Bwh5iToAaK2F7VaZ1bKcB1q4SvQZd5Vb3JJtNEf9cKG7AO9aBjqam/Xffn?=
 =?us-ascii?Q?UY+9CgJSpYvq+1EtLpYfNsJarinh6//n4ISZEYX7UCJoLpTJ7kUQtHwCkmB4?=
 =?us-ascii?Q?lYf7qoQs6IIp0ZfMSjQV/tlG81vPb8+xGXkAzRZuZB9Wz8FDcz/pNrS7vHoz?=
 =?us-ascii?Q?ho6WMjaabNAgJ0CEts0ScyI5y47QyeS/kQNLIeDj8pU6P4v7hiq5gNiY8zmf?=
 =?us-ascii?Q?GuXwAA/50k87yFpVH7qfHmWC/fhXD48H6RG2Y4TQcgKkW0VpKq5v06ryXVTT?=
 =?us-ascii?Q?0TN4otjHX0I3tZq5uc/RDuB9vvxayA644sm4U75dkBmy7sjVEQozNnorecXS?=
 =?us-ascii?Q?J0Ngxi25zZ6+eZS8rAxjSqufDVaaX8WNRv3IBK0TxCMLmYLX2uR1uHYCif0l?=
 =?us-ascii?Q?Ux/9lmFQI3eeO4gOfvQvXJk5S6510a7xyru6jDX+AuFssv+iJtYsmGOyKfff?=
 =?us-ascii?Q?h7+k1u1MrFCFSWbhHDPKDmzH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9886da56-0379-48e5-e4e1-08d98fa9a28f
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 07:01:39.1418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUkQmfCEqxkR3QpAjksl+5Nmc3whq1l3qLCyB99VV9R34fO5IAFUO3t3OTtAue2y9rTQ0JxGLxlbpbUSuxc48g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2858
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix following coccicheck warning:
./arch/mips/loongson64/init.c:174:1-22: WARNING: Function
for_each_node_by_name should have of_node_put() before break

Early exits from for_each_node_by_name should decrement the
node reference counter.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 arch/mips/loongson64/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 4ac5ba80bbf6..ee8de1735b7c 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -179,6 +179,7 @@ static __init void reserve_pio_range(void)
 
 		if (of_range_parser_init(&parser, np)) {
 			pr_info("Failed to parse resources.\n");
+			of_node_put(np);
 			break;
 		}
 
-- 
2.20.1

