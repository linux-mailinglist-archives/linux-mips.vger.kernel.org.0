Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A1C47D321
	for <lists+linux-mips@lfdr.de>; Wed, 22 Dec 2021 14:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhLVNoh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Dec 2021 08:44:37 -0500
Received: from mail-eopbgr1300113.outbound.protection.outlook.com ([40.107.130.113]:22208
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229834AbhLVNoh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Dec 2021 08:44:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhAWf/k2ylHsJkRP6aQpviIxhZGf9LZecFnZ351GhV2Blw6+mtBovRee4b1PcQ0lpdz2nG9uE+iOSAE2FofWgJDcLB61aOj3L0AXFpWEXjPkYd+NAl8ttE1vzINjNvMRSwRJvk4KoY8/FuM8orpPaFSUFgkRoJXRlVilnPCu7YTVHr6Mg4EspXxZx7VvpPRyxw1NZoOzbZnjf7wRM9f87ynsqL5KZ3b1GfqfX5mN3OWAapuPdhDvmmWMs1zX3ZEP3F1RR7+resbcjOiGLO1aEQCtL2WMIW7dq09SJ+SMFxyRvqFT4q4EOqQqJngLQAAOOZNeMzwB/wdy4hPKWx/0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCTppL0TFc72xu/2IOWz3Jy+bINnI6W/dYJ4Ie9lEik=;
 b=ogD8mGMQWZgiStKHLaiuaiLdH40icPcE+pB5BE1TO5j6UndlMjiKJjOVwaqEJiXATlQpzZyL/aD31h1m0Eh7VczN5Z47gaLj6rKcukuL7q/vf6TCGZkM4skFTHxbeWq7RdtJO+U1zB13TQdFOQSddoFqVVoWHeakTSHGYDGRcoEsXVVZxhIlSBtdFjA5uv5tj/IWw46Qr4Kvu5x46pSL8hZNxigwBOnl56/5hw4qlfoojcDQnVIv8Z4WIAqsOjmUp+GBd5k3A2acAgEBIqmkjht50ZOU45gUBeyKT/zzpvSOMNJT/UATnUJJM06pfUHVOUXMGiu4wDBaaWNwKTXgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cipunited.com; dmarc=pass action=none
 header.from=cipunited.com; dkim=pass header.d=cipunited.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cipunited.onmicrosoft.com; s=selector1-cipunited-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCTppL0TFc72xu/2IOWz3Jy+bINnI6W/dYJ4Ie9lEik=;
 b=EfL53E6xsJk3BN6ivqy6QnGeIufzfaV7fop9yS3eCqu4I/Vk1tykulS9onw5yi94z2CAejqisMtaC4TaVcPZuB+JiZxAl5pMq0PlsHm34djw+QaKi/j6/qr7pgB0lbMakxDWp4SMb0HbTpLUvfcwYZh2Pn2yigcNZbcQJVZO0dA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cipunited.com;
Received: from SG2PR04MB3961.apcprd04.prod.outlook.com (2603:1096:0:f::8) by
 SG2PR04MB3818.apcprd04.prod.outlook.com (2603:1096:4:a2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Wed, 22 Dec 2021 13:44:34 +0000
Received: from SG2PR04MB3961.apcprd04.prod.outlook.com
 ([fe80::e848:e901:d420:fa49]) by SG2PR04MB3961.apcprd04.prod.outlook.com
 ([fe80::e848:e901:d420:fa49%6]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 13:44:33 +0000
From:   YunQiang Su <yunqiang.su@cipunited.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, paul@crapouillou.net,
        zhouyanjie@wanyeetech.com, jiaxun.yang@flygoat.com, syq@debian.org,
        aaro.koskinen@iki.fi, YunQiang Su <yunqiang.su@cipunited.com>
Subject: [PATCH 1/2] MIPS: enable both vmlinux.gz.itb and vmlinuz for generic
Date:   Wed, 22 Dec 2021 13:43:45 +0000
Message-Id: <20211222134346.1366067-1-yunqiang.su@cipunited.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To SG2PR04MB3961.apcprd04.prod.outlook.com
 (2603:1096:0:f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54b31bad-be7c-48e0-a600-08d9c5512f1d
X-MS-TrafficTypeDiagnostic: SG2PR04MB3818:EE_
X-Microsoft-Antispam-PRVS: <SG2PR04MB3818555718EF2C20C3315AFFF27D9@SG2PR04MB3818.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjLGR25wPkmXKxZlun7V8hYyN2VXg2k2ZQHhETN2M49RKiXodxaNh1QyWZiCubBQZ7eA6D2imBgLhVqXsGtQeb7LLq7vGeXLVKSt3wTUHiSfj+FBafAbl+vlvTGK6sLNUH8r27TtbXY5l83C2o2mn9cOHuopD2E0WQwARRLBvZ5wDKQrT7sl1RqGs9VZYTRhJ54lnX+Zvadt5T+FDgjz0+3F74NVn7KKXz0k3TFv7KAjVRjFYlUVJOrx/j5LMjMwnGoeCUp6vD46GvCC1e8no00BCpf9Wb7pgG5FpXrzOKesTDIKs0hqqzpfVZRvt+1sg9lvudiHLzUeYsHfUFR3zPR6fNNB9K+RKIoJqXfFMjk7PU8kYAaxZ5l7WVcVtSwAD4Kr0d5y0UgG6B3Ox6mg522tBfq8HznH4UoVpInWB0VdMX//EBWB+jAlYaVhPXhWNwM2msaXfEe91mDTCtcgPXwFWy4CQ9mU9KTx4G4n07jmq3OsHd3eiUXOiutWSJEPwrHMtuBMQqvYjM95nz5XsGFibuFKK8PY6GIA3r0aHx/TSecv550miInz57KcxnF2RS4oRFJcV81IsNtQTKC57jUfNZac9xEjMdi506csftWXsmb6w15aX38RuaQ8yvfWIoY4Z9ArUB/NGbJPFJKuxma5dokOo4KibfmxayK1XaR7dIvMJ5ge9fqIk+I8qijoTZd/dymzt/cmz0AbwFuVmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB3961.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(66476007)(4744005)(66946007)(6486002)(6916009)(107886003)(8676002)(38100700002)(4326008)(83380400001)(6512007)(66556008)(5660300002)(1076003)(186003)(36756003)(2906002)(316002)(6666004)(8936002)(86362001)(52116002)(508600001)(6506007)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X4Unud/X6HpYWqe/yEC8fSrP99uaBQQn3z5jNCnwyJf+g7hb50v5iBR6p8hY?=
 =?us-ascii?Q?NB+g8QD4Wo8WYhxMzg5S1Xj1krjL5+PRpEl0oFvdITipC4J5/mnFzahN96mB?=
 =?us-ascii?Q?udv6C3xr2Wwejo5BktSrOPzubGJJw8OWdp8YpY5QHZtuC0i0FuMXq6xqjoty?=
 =?us-ascii?Q?RfxzsAvWTnlhM7wQ+v/vmJVA1AxPucdb4GayFWAPDg21CCPehFCqxmCHQ8xK?=
 =?us-ascii?Q?5n5FKrX558S9wR7X6TeaJTPhYNLpjaZzBWaIpt6vsqOSAKVg7otSMVORK3Lh?=
 =?us-ascii?Q?J+oPlRCjPAYWVhkrFZIxi+cBrqym27ATdzDekU3E4Ofke1NFAqmuLennpivL?=
 =?us-ascii?Q?YcPDOA5salw8crZJBhewm/ZdQBek2AWli8WUsGwNsYKXmSrj0idID+0k7/S4?=
 =?us-ascii?Q?BkM3FSO4QSi4bq4IiRoGlrnBR2WnDj6OU0t1XwEGfNwebxcpFU0rSjlnwJY/?=
 =?us-ascii?Q?g8s5KwanuoLBvXr5NLbdsfKMwim+tN8KjTNyG1g0MNt/BBKtWpev7VXxR+ex?=
 =?us-ascii?Q?+qY+Q8G4fmvwoX2FYJRgXoYiLwmbrMDIIgFPDL6pUAjF4vCfFEfq+3t0UgSj?=
 =?us-ascii?Q?qTnwuqYIpTCbyobsM3enTzVuBySXs9Iq//R0DPk+UFimlLF4MGgfePzSzlpC?=
 =?us-ascii?Q?W8LNrS+vCRwJmLChDipwu9LGhrRQr1I5K54n+CHbOwkj/FZ9AzflA+F5g3d8?=
 =?us-ascii?Q?inI9WpZjp3J6SyRCB64TVUAFhY9LBabKWZSkzL8eVwRccY18RABlIiSdnZWU?=
 =?us-ascii?Q?PNaxXXzdz4Li6rjYzV8kDdCftzafUmmI6gX/f2srlTZj//T3sTPj55R9ZBfE?=
 =?us-ascii?Q?ug/MDRZUfo4koKoXENCep2hVkpq3tBjC3/FYBr1EZ/HeP61yNq7cSlNycKp0?=
 =?us-ascii?Q?DMkeHUp5ewn5PoM/1rvDlxdkj0tmeYi1YgPNnI0zd0Y2tdfyGPif7VHMOQhA?=
 =?us-ascii?Q?nB44ZPi9H6Fa/HjFd4unTdkxm1EfTLsmG1mWtfGJz2u6bL9byGNF+tgGC1S1?=
 =?us-ascii?Q?w3CWVN91usJWttIkYT5aHuRjJAecTr2yNVdIOp27TtacAYyt1/yuTyfXMpwU?=
 =?us-ascii?Q?mOumE3P8wxEGu0mtZadOzf68qqxvDNq0fH+2nxUY4da6UXsbjeP+ID9osjS6?=
 =?us-ascii?Q?MGS3LGPyMSq1BkmSr37Z+1WAo3LAb3e684c5j8fAlg4D2OBGv1ph5TiDX4Bs?=
 =?us-ascii?Q?55TdKLq8z12NjznAro1jJcEV/w2ninLldYtll7jwWBL60eF4X0UZtjkwUlG7?=
 =?us-ascii?Q?rTT3yTMMbPDyAAgpT98B6BmjBZd+FGyOj1jOgAPQXN/tK7bqL7KfChgkGNTW?=
 =?us-ascii?Q?Hcwd9yJjPrf/AkymIEcUjFQ3nmg5YzEnVjtm+uwrIeyMis+qorW3X+3bRy5q?=
 =?us-ascii?Q?kYyJAm5WD8hBWHj/xM5DHjPhlNe5Hms76Sd0psdbsmjWE/KXYPhQxybd7htv?=
 =?us-ascii?Q?NOe4uFcv6NR+sDl7Nb4nXc625RCVQt7M2+Fu0+Hho0RRvyA2WFwobTy7jclP?=
 =?us-ascii?Q?qwcl90ZGfZl/4K/H2zW8EneSRgDWKK5aDQoHggiXsx2oTMvaISVRD/h3Cu88?=
 =?us-ascii?Q?w+GIvst8AGQ/heZeSW4SWkyfHxFEDZ8h2z0vr3tOEGzz91bNypGFR4+jw5gk?=
 =?us-ascii?Q?jL64dxqKdt1J6rLUWXIOC9JKvo8uqOaiaP7uZT7eWWz7MiJkshi4Zi1xwK7E?=
 =?us-ascii?Q?76hOoqCXoEfsKAEbhZZFVsFtMV7/jxnJqGt6qAj2DqqlDt60o1raDW1VNRNl?=
 =?us-ascii?Q?8xvZsPuKVQ=3D=3D?=
X-OriginatorOrg: cipunited.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b31bad-be7c-48e0-a600-08d9c5512f1d
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB3961.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 13:44:33.6759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e31cf5b5-ee69-4d5f-9c69-edeeda2458c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ik6OaR6gH6pM1Zac/QETn4Uw8868QFJssLa4Vl8LEOZclhnpdSomWEeEWmogAI4xuRDS4WTgCyzqO5IkRcfqjaOld4KR8w31tx62JK7x6xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3818
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

vmlinux.gz.itb should be appended to all-$(CONFIG_MIPS_GENERIC)
instead of replacing. Otherwise, no vmlinuz will be built.

Signed-off-by: YunQiang Su <yunqiang.su@cipunited.com>
---
 arch/mips/generic/Platform | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index e1abc113b409..d7c8cff6de2c 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -14,7 +14,7 @@ cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
 zload-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff81000000
-all-$(CONFIG_MIPS_GENERIC)	:= vmlinux.gz.itb
+all-$(CONFIG_MIPS_GENERIC)	+= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= board-boston.its.S
-- 
2.30.2

