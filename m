Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59496446478
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 14:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhKEN4Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 09:56:24 -0400
Received: from mail-eopbgr1300108.outbound.protection.outlook.com ([40.107.130.108]:7190
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232106AbhKEN4Y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Nov 2021 09:56:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4WfJT74lgAIAaWKc5pj+OW5HIhnTmUDtfoBjIxaah+MmJKjSyKv4/HTDi6WyBazBpwCv0Lp0pGcUe67W8qQcCAorlVZaaGS/CuXXj/tPvhGLAabAqQWtEKlhod8dqIb10XMif/IPbOejOA7Y0trZEioXwFi1ltZ+6XWqolXWujJc1Oj8GuPTV8ASsOW0sRe+6A9UxNtj5py91lEqs6gJM8ME8/aN2ighzY2wSFlHpJGDTVcoBezSQT6k3zuXgFjYZ/5o8TTS0PHNZ5vvaOk9v+3GyoTXeVWNYRn/Kw9ooSUy8dh2y7HaEIc6V+E62DmfYw14zV8JABH8Zg1S7suCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWSrYkfScE44YfMrxrQvTr1F9iCxpdHw+GzWCyzejs0=;
 b=XJ7P0psadU1U6TjBgVwme9Se2nwG4nLDM9446wpCtz5GYRHuLX6wbP8scZ5UOVYh16rRaVAIvlYip+gzPO/oFY4O/gw0bnvRG08U4osYuyyk16JVNKjV6gGrNFi3Fknb6Tr39H1NIRkBJqRTB4grU/S+92WiMof3LgDR6jp18RxKPQxufEN4Y1uq0GfgdvBASXkCOF3u5KKCnEYiJyVundQJVg5Bz3TiCPvk2Lf4r1oVZtE4q5ztruI/WQqI5mMZ3lIyzjQCzpda8GtLyMOkpFMQcpymgrr2LIaPe8dBhwi3EtT7OevM1g/oIcFbGAMdYouZzwBJFUAsxqj77iH4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cipunited.com; dmarc=pass action=none
 header.from=cipunited.com; dkim=pass header.d=cipunited.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cipunited.onmicrosoft.com; s=selector1-cipunited-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWSrYkfScE44YfMrxrQvTr1F9iCxpdHw+GzWCyzejs0=;
 b=IvJ0KtTtUtVkOS4DQxIq85maF364mGSCD/TOZ+Cp3ocf1z6MdKAE5mN28yoFaW0EUm94MLOUa3gaDoU19QR3WNPv8ehpWcOSCWxmq6TucjFhJ5UoetV04qzOnHT8sZIBR+VNrXtV4RvzcLHS5ORN31ExXxLU2Y6DOfKIqYVxqjE=
Authentication-Results: alpha.franken.de; dkim=none (message not signed)
 header.d=none;alpha.franken.de; dmarc=none action=none
 header.from=cipunited.com;
Received: from HKAPR04MB3956.apcprd04.prod.outlook.com (2603:1096:203:d5::13)
 by HK0PR04MB2370.apcprd04.prod.outlook.com (2603:1096:203:4f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 13:53:42 +0000
Received: from HKAPR04MB3956.apcprd04.prod.outlook.com
 ([fe80::4d0:36d8:f42d:4927]) by HKAPR04MB3956.apcprd04.prod.outlook.com
 ([fe80::4d0:36d8:f42d:4927%9]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 13:53:42 +0000
From:   YunQiang Su <yunqiang.su@cipunited.com>
To:     tsbogend@alpha.franken.de
Cc:     paul@crapouillou.net, zhouyanjie@wanyeetech.com,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
        YunQiang Su <yunqiang.su@cipunited.com>
Subject: [RFC] MIPS: fix generic zboot support
Date:   Fri,  5 Nov 2021 09:52:32 -0400
Message-Id: <20211105135232.2128420-1-yunqiang.su@cipunited.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:a03:54::46) To HKAPR04MB3956.apcprd04.prod.outlook.com
 (2603:1096:203:d5::13)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:da8:20f:4532:feda::b016) by BYAPR02CA0069.namprd02.prod.outlook.com (2603:10b6:a03:54::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 13:53:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6370bdf1-c210-4df3-82e0-08d9a063ad27
X-MS-TrafficTypeDiagnostic: HK0PR04MB2370:
X-Microsoft-Antispam-PRVS: <HK0PR04MB23704F1417725E7D8284BB2FF28E9@HK0PR04MB2370.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mlYf0p8XJ6zNawK1VEKKsgV89ubePJv9/zMG8mDo3drGukqxV9RcsbfihLReaHnK6g0gf0dOtxK8Tus20CSAuB1zWVz95h/2JWBz2F0FjGFAj5eSBjTQNb2eP1muvmAL71Yd6Q4ZPm25tlPsyyyXvFX4HQxYg+gaZcd7IA2dTa/kSTdw3ht655uupoUQlQ/BaYicOg3dzq1DOtgkvn4yu1MNFv/nyFS5mxSIRKZi0FspM71sGoxwhp7HuDHkjFnW8WKZkc0Gk/VzpewfPEf+/0cmFrKmi4McqBqsgZXpXOXDp+M58nvCuWIGdMmZUw4oO2yw9zfp7mb0m5cvaqHp+WTkLwi5LLKyYs3us2kB5p07Qpc5mW1Em3na4LhmEjaXvwN3JCb5LJiyzJqkAl6+jJdXxsvbE8HAeD7nCMhogOFjhYPu1x/mYJqXLwbgQfRl7lXGgYtkFKCDenTmmNx1e70KjCsLzIKL49oeuGgRzR29O68z+J+C+jqE0JRdM62qFAMJak29RKnj0wwLniY9hZZyXgzOm1AoEfLtv4fSJMlub6EAUPNwJcbYNoxgvMc0UUC4RqYNVFLmvifZtGQWIdw+bZfwI1ZrpRWNgtaDh4CBypMbIwdf9xmrxAzOk5zu6jWX1w9496DAG5QDJ/6jlmQuiMTHrFdXk1Obpi5SUxAP9e+fsvUC60ATecl95UOj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HKAPR04MB3956.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(39830400003)(396003)(366004)(36756003)(508600001)(38100700002)(186003)(8936002)(66946007)(66556008)(316002)(5660300002)(66476007)(6666004)(4326008)(1076003)(86362001)(2906002)(8676002)(2616005)(6916009)(6486002)(6512007)(83380400001)(107886003)(6506007)(52116002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/jjqG83+BYwj1iYKKVefq6B3tOKAfzjvzlLbzrelGb00Jiijx2oqor5OyyY?=
 =?us-ascii?Q?vY8ieXZNOhRyQH4F8/OeTS2dKS8Ut9QT2doX0LvIhC5a3QfMq5WeNpKCsR2L?=
 =?us-ascii?Q?X/WVQIfiu8UVY+u6wufv+U0KYJo2g/s8VL0cP2pnuNvkov47x4BsyRNnTHk6?=
 =?us-ascii?Q?sYhDIX9ufRaNJZFRKAyq0X1VRFYItSEebwDTZ4NB6Xc1xSfYh7RChCALVre5?=
 =?us-ascii?Q?p1jbEfZu9cF/Ca4hXa70n4z8wPS6oh5TVnpF0ns4YQJiqJw1wKYF+/GX3Rqa?=
 =?us-ascii?Q?ri2EtwvPq64vKRn+fms44XX7mz3IgtY8jx7ORI0kKM6R5KleiEiegA6UXd79?=
 =?us-ascii?Q?HaljkSfbUiFBkeZDIewzj/BlDe8pDf23mViMBwlCLL4b+82YroOy8Ht12PA9?=
 =?us-ascii?Q?JamMsCgIkuSilQqL3Lr3Lx+lvI+D0n80Eh8T/pEY3JqJZgA8Z2YAHFWw7Wnv?=
 =?us-ascii?Q?+WwWCfZzEFWy5M2mwEOWLpEYIAa2DOBLdb0sM858/pToOc/H+hvnxtMZupXY?=
 =?us-ascii?Q?Ma1ca+bX0JiOp0fo9AvBbmbyBvmb5+2r8T0PbIjT2ibNV1Bw0xaXEM3lO67v?=
 =?us-ascii?Q?bAOEnWP8qvi1KFaiHDUD1FUb6swiWf/HTs4iEvffmW1f7m38+GweE5fgq/Ch?=
 =?us-ascii?Q?Mib7Emv+w2+6xq3DVhheriDDopBKvuxpC+R0lZNSnMO9mN7xaA50Jx+4/ZVn?=
 =?us-ascii?Q?6gkGlH+L2kqFCj1/dKv2goMK42ddfi7E0aWVn7pFvOQjCXdycsxrUjqU4qyh?=
 =?us-ascii?Q?44ryE074Lc4P3vnlxeeHNjATxaynpw2xZr8dklBEDXvkivGL2J3svkmw6fay?=
 =?us-ascii?Q?RU8yWwm72gdl3cLJi+S7fJpFFrJHkQmr8OOgZOwuwb7YtVlVUipkPug4NSz8?=
 =?us-ascii?Q?BMHKO/o7jevnagj+swTgBlCGwuEUoUDHMrDFliR83EOGNrUsPJCwtn8Ks+9H?=
 =?us-ascii?Q?mQZjoINID7/1TbHzUO8YY04xdaYylYAxJp5vmKZEqyY4DjfqNhRKhJly5zQa?=
 =?us-ascii?Q?8yXc4WKacxk3Yc03GFM1h08KrS1ouPn5Wc0vlofLzn7tjgClICpG5fD2Powx?=
 =?us-ascii?Q?0CspniRvjv7ZBKqw1iLsiMChIyZL+CRVLzYrFX8JUQtwSEAtkEL/rwbz7cYB?=
 =?us-ascii?Q?KPEuEDzvX0KD4S7WGFS33zQxKguDGvK63popKNUeSr8/3J+d8ZRz8Z3L5Y6E?=
 =?us-ascii?Q?j440gl5S+Jpc1tV+lL5rsxspX6U6WMyeAIOQSgxmvPeId6rMP6wKXbk2u9s1?=
 =?us-ascii?Q?/qWDP05j1iKkNPKbuGHYvmoixg1OOpSaX/3s/IKjEDEWgVIEmeA8KVeFViJU?=
 =?us-ascii?Q?Olhrkzv/155xh5JPzWxaEwnwbE6GdMIeu/CDJHHWL5xH7UQjzLYSPaBRswAQ?=
 =?us-ascii?Q?cToGTK3Ov3TnVuvRtSxgGlWOkAeMSzvJh3ogpyuuOzlUfrBE0wGjTCix6Swk?=
 =?us-ascii?Q?FDf6DpGQ79lBfk19iRhm+VFKkY9fbvjcHwcEHbYIWrMoxTYT/u8+s65Vpeoa?=
 =?us-ascii?Q?oNs2BRLuH5B0DA0v5wXWxB12nslK9WC/gLaHfx+xb8SUMfMeO2S1Mbfa6ZQC?=
 =?us-ascii?Q?wbNatWUJt7Yp0DLKB2TVYdjNxdKrlzUp6jFeNnDsMpfTSeUtvxfnrKd8Od3+?=
 =?us-ascii?Q?RCyqBk6SGOny0fjdSFirJ3wk8DHaS1pMTNzHQQz4sNZT7Ro1QPIdLbhXknpj?=
 =?us-ascii?Q?zdo9rdA1LhJHAh7SaAgIVYc/fYulNN2wc+LPQ++17j8sEiOF?=
X-OriginatorOrg: cipunited.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6370bdf1-c210-4df3-82e0-08d9a063ad27
X-MS-Exchange-CrossTenant-AuthSource: HKAPR04MB3956.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 13:53:42.2455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e31cf5b5-ee69-4d5f-9c69-edeeda2458c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqRJMBio+4WezK+Io2NyMHlQglv/0VlGB/F1IYs+F4dhrycnK22leogFNggTo5dCKj7w3zAWvP5PUFoDv/Cj03CGi5eP/Xq0h/QL7ccbHaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2370
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are 2 problems here:
1. setting zload-y to 0xffffffff81000000 breaks booting on qemu -M boston.
   Why it is set here? Any other platform needs this value?
2. vmlinux.gz.itb should be appended to all-$(CONFIG_MIPS_GENERIC) instead
   of replacing. Otherwise, no vmlinuz will be built.
---
 arch/mips/generic/Platform | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index e1abc113b409..0c03623f3897 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -13,8 +13,7 @@ cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ing
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
-zload-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff81000000
-all-$(CONFIG_MIPS_GENERIC)	:= vmlinux.gz.itb
+all-$(CONFIG_MIPS_GENERIC)	+= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= board-boston.its.S
-- 
2.30.2

