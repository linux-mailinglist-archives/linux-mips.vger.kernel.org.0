Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602871D2225
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgEMWie (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:38:34 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62695 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgEMWid (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:38:33 -0400
IronPort-SDR: FEnrdFa5rkdSuLF/dg82RJSbpXGRU0rlhvC7mkJPOxdHYN0F1kOQKKLE17sumzpPebf+7JASM9
 CEulnQVyrMUjjFFaNSgmehqCxyN4KKGS4ze8XSKqhwlx+sEzC32o0neXOJk/7OCTQLMyZ3SFdx
 H/atpVkWMBeyeCDSx9BbJtin1AGBHcyMJKBS2AVB4xr4J90QSxMRPW6V70tIBMOn6EYqep2jWk
 x58WdUKqxIzCGSFw13SWVaLzHdZRSuHq0LI+G+BVlPO+W7INDcDQe8L+R2R4VKDu4LgtXpv7zf
 rD4=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="240330812"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:38:45 +0800
IronPort-SDR: NTyzd1iYdQLLdWMEk4Gb/HHxNZBIIwXoiv/DfeFj+nx65R2eeF3PyrLASJPbi27FGgvaSEUyDL
 O5pFXNRIfmghdtNKH2LhUi+aZnw/K0XoE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:28:13 -0700
IronPort-SDR: gRa6Czx7RRtkVyT9DPmcW756hZ0Fx49uWg0mnG5vQfncqVHB3F1PV0B46/58RVoAH0DkqjBlAc
 3ygZtsBVen3A==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:38:32 -0700
X-Received: from BYAPR04MB4053.namprd04.prod.outlook.com (2603:10b6:a03:254::29)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BY3PR05CA0024.NAMPRD05.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:34:05 +0000
X-Received: from BN7PR06CA0065.namprd06.prod.outlook.com (2603:10b6:408:34::42)
 by BYAPR04MB4053.namprd04.prod.outlook.com (2603:10b6:a02:b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Wed, 13 May
 2020 22:34:03 +0000
X-Received: from BN3NAM04FT022.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::66) by BN7PR06CA0065.outlook.office365.com
 (2603:10b6:408:34::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24 via Frontend
 Transport; Wed, 13 May 2020 22:34:02 +0000
Authentication-Results: spf=none (sender IP is 216.71.153.141)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa3.hgst.iphmx.com (216.71.153.141) by
 BN3NAM04FT022.mail.protection.outlook.com (10.152.92.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:34:02 +0000
Authentication-Results-Original: esa3.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: xYd/jbwEOH3Yu2NTWG09mGgmFnJRERgwrzDUFvxwmXyn7LvGRVuYGbxxXlaTJKEL11keRB/Jlg
 ih58XazmpZDMwZF2eMXtStp1RSjWSh5PDGrHL2xX15RQlwneSKMcQAY6ce/Bpy9dOB0bI+pFbz
 KYwAngDSBiJsFmQNZbSkjjkbMyNt0UIU7OnVcl79wc7mJkihRC+Ot0iPS1LopNd4oTFZ7JBddH
 HhfbGPMmnEy1r26Ok0bEMtAqB4VmlfKmz4Zj1jj8GmlravyRY9yyx6y0pIXstF8xxTneR5Lzkz
 ANNUFEJeJ5Ihw1svc18ITgJU
IronPort-PHdr: =?us-ascii?q?9a23=3ACcLszx8S/iMW5/9uRHKM819IXTAuvvDOBiVQ1K?=
 =?us-ascii?q?B31+wcTK2v8tzYMVDF4r011RmVBNiduq8P07uempujcFRI2YyGvnEGfc4EfD?=
 =?us-ascii?q?4+ouJSoTYdBtWYA1bwNv/gYn9yNs1DUFh44yPzahANS47xaFLIv3K98yMZFA?=
 =?us-ascii?q?nhOgppPOT1HZPZg9iq2+yo9JDffgVFiCC5bL5yIxm6sQHcvdQKjIV/Lao81g?=
 =?us-ascii?q?HHqWZSdeRMwmNoK1OTnxLi6cq14ZVu7Sdete8/+sBZSan1cLg2QrJeDDQ9Lm?=
 =?us-ascii?q?A6/9brugXZTQuO/XQTTGMbmQdVDgff7RH6WpDxsjbmtud4xSKXM9H6QawyVD?=
 =?us-ascii?q?+/9KpgVgPmhzkbOD446GHXi9J/jKRHoBK6uhdzx5fYbJyJOPZie6/Qe84RS2?=
 =?us-ascii?q?hcUcZLTyFPDIOyYZUSAeUDPuhYoYbyqEcVoBuiGQWgGP/jxiNUinPo26Axzu?=
 =?us-ascii?q?QvERvB3AwlB98CvnPao8/pO6cTT++1zrTDwjXZY/hLxTn974nJcxA9rvGPXL?=
 =?us-ascii?q?J8f9faxE4qFwzfklqQs4vlMiiR1uQMtWib8uVhWfuqi24mswFxuSKjxsA2io?=
 =?us-ascii?q?nGn48YzE3P+iplzogvP9K4VFJ7bsC+EJtWryyXN4h7T8AhTm9nuSs3zqMLtI?=
 =?us-ascii?q?OmcCUUy5kpxwDSZvybfoWU/B7vSfudLDlkiX57Zb+xiRm//Emux+HhVse500?=
 =?us-ascii?q?tGoyxYmdfPrnAAzwHf58eER/dn4Eus2SuD2xrX5+xEO0w4iKTWJp0nz7UtjJ?=
 =?us-ascii?q?Qcq17DETXzmEjujK+ZaEEk+u+w5uv7fLXmvYWQN4t1igH4L6QvldWzAeE5Mg?=
 =?us-ascii?q?gWRGiX4+O81Kfs/UHhQbVKiOM5krXBvZzHKskWpbS1DxFV34o+8RqyCzer3M?=
 =?us-ascii?q?4FkXQJL19JYBeHgJLoO1HKLvD4F/C/g1G0nTdu3f/JIqfhApLWI3jHkbfhe6?=
 =?us-ascii?q?t96kFFxAo2zNBf/4lUBqsGIPLpVU/9rMbYAQMhMwyo3+bnD81w1oYEVm2TGK?=
 =?us-ascii?q?+ZN7jfsFGV6e0zOeWDeIgVuDOuY8QistzvhG8knxcsdK+mlc8VaXmoA/IgMk?=
 =?us-ascii?q?yfblLihsYOFm4W+AE5Sbq5pkeFVGsZQn+5Xq8+rg59QLihH5bIRYHnyOiE1S?=
 =?us-ascii?q?yhGbVSZ2ZbGhWJEG/zMYKeVKFfO2qpPsZ9n2lcBvCaQIg72ETr7VeikeA1B/?=
 =?us-ascii?q?fI+iAeqZPo3cR04OuWrxwp6DhoFJ3DizOAVGgv2GMHXCNw3bh/pFw7wVCGgu?=
 =?us-ascii?q?B0gP1dQNpU4f4BEgI3LoXVwOEyDdfuEhnAcdGERBfuQtivDTwrCNNkxdgIbh?=
 =?us-ascii?q?U1AM2s2zbE2SfiGLoJj/qODZ0w/Ljb2i30Ls1nzF7C1a88nxwjQ9NUc2q8if?=
 =?us-ascii?q?037BDdUqjOlUjRjKO2beIc0SrKoX+E1naLtVpEXRRYWrveG3QeYFbG6NH4/l?=
 =?us-ascii?q?iESKWhUO51CAZKxM+cJ6cPUeXH1wQcFtHkPtmWI2+qkjz2BRmT2vWNdIrvay?=
 =?us-ascii?q?MW2yCPQE4D2xse+3qLL0A3GzuhrmTCDTdvCUOKAQuk8O9wr2m+R1M1yAfCZl?=
 =?us-ascii?q?No1r688BoYzfKGTPZb0rUBsSYn4zJ6VFO01MjRI96BoRdxOaBdech7501IlA?=
 =?us-ascii?q?e7/0R8MpGmM6F+lwsbegVzsVnp0kY/AYFBnM426XIymVMueeTCjQoHJm7ehM?=
 =?us-ascii?q?ugadi1YiHo8RuiarDbwATTy9/NvKcA8+h+qk3juRHvHU0noBAFm5FY1WWR4p?=
 =?us-ascii?q?LSAU8cS5X0Bwwy/hNgoJneYy8g98bR1GV3d66uvXWRvrBhTPtg0Rumc9pFZe?=
 =?us-ascii?q?mBHQToFOUeBs6zOKkvmkCyKBUeM6oBvL5xNMSgefyc3aetN+s1hyqoumNB5J?=
 =?us-ascii?q?EkiBC2+iFxS/DF09M++9/DhlrVcTD6gR/hv9v+wsZEaioOWGunyS30QoVWY/?=
 =?us-ascii?q?86e4FDEmqoL8Ctjtxjm57gXWJZ/1+/FjZkkIeofxSVdVn0wQxX0wwev3WmnS?=
 =?us-ascii?q?KyyzE8nSsuq+KT2ynHwuKqcxRiWCYDXG55kVLlOpS5lfgRQlPuawkviQvg4E?=
 =?us-ascii?q?fi3O5cvqs+Z2jfTEFUfjTnemFvVqzj09jKK8VL6Z4urWBWSLHlPQDcEOOk5U?=
 =?us-ascii?q?pHlXq4TzgW3j0wejC0t4+skgdz0ySdI21v6nvBecRggxzY4Y+5J7YZ0zwYSS?=
 =?us-ascii?q?1/kTSSCEK7Oozj+NyfjZDrtuG4SnLkU5xLam/s14zK507ZrSV6RAaymfy+gI?=
 =?us-ascii?q?itCQ8hzSryzMVnTw3Dsg26ZojtyrT/NON/ZQ9vHlC2uK8YUslu14A3gp8Xw3?=
 =?us-ascii?q?0TgJ6YqGEfn1D0N9FKgP+sXD82XTcOhuXtzk3l1UlkdCrbzJziEHGcxNZxIt?=
 =?us-ascii?q?y7enhQ3TgyvZgTWfWkqYdclC4wmWKW6AfYYPxzhDAYkKV87H8cnvFMvQs11W?=
 =?us-ascii?q?OaGL9ARUQ=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FTAgBDdbxefYpf+5RmHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgUeCJYFrAwQLjVKHXyWbYA8BOwQBAYREAoIrBjoTAgMBAQE?=
 =?us-ascii?q?DAgUBAQEEAQEBAgEBAQMCAQEBAQIQAQEWOjRgU4FHgUEsCQYDATuCOykBg2I?=
 =?us-ascii?q?BAQECARIoPxALRlcGNYVcBSCkJgGBKD4CIwE/AQyBBYl+gTSKc4E4jFYGgUE?=
 =?us-ascii?q?/gREzA4IsLj6EJYYdBJEZAaFkBwOCTZg0HYJdiGySAK91IYFYfQiDJUwBAgE?=
 =?us-ascii?q?CAQwBAgIBAQECAQEIAQEBAZ8GQ2cCBggBAQMJjH+CRQEB?=
X-IPAS-Result: =?us-ascii?q?A0FTAgBDdbxefYpf+5RmHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?UeCJYFrAwQLjVKHXyWbYA8BOwQBAYREAoIrBjoTAgMBAQEDAgUBAQEEAQEBA?=
 =?us-ascii?q?gEBAQMCAQEBAQIQAQEWOjRgU4FHgUEsCQYDATuCOykBg2IBAQECARIoPxALR?=
 =?us-ascii?q?lcGNYVcBSCkJgGBKD4CIwE/AQyBBYl+gTSKc4E4jFYGgUE/gREzA4IsLj6EJ?=
 =?us-ascii?q?YYdBJEZAaFkBwOCTZg0HYJdiGySAK91IYFYfQiDJUwBAgECAQwBAgIBAQECA?=
 =?us-ascii?q?QEIAQEBAZ8GQ2cCBggBAQMJjH+CRQEB?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141968376"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa3.hgst.iphmx.com with ESMTP; 14 May 2020 06:34:00 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992798AbgEMWd4SLrX5 (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:33:56 +0200
Date:   Fri, 24 Apr 2020 13:22:30 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     linux-mips@vger.kernel.org, clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jouni Hogander <jouni.hogander@unikie.com>,
        Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] MIPS: Truncate link address into 32bit for 32bit
 kernel
In-Reply-To: <B307BFAC-9973-4444-B69A-40B054210E84@flygoat.com>
Message-ID: <alpine.LFD.2.21.2004241316360.851719@eddie.linux-mips.org>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com> <20200422143258.1250960-1-jiaxun.yang@flygoat.com> <alpine.LFD.2.21.2004230036480.851719@eddie.linux-mips.org> <B307BFAC-9973-4444-B69A-40B054210E84@flygoat.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:33:56 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH v5] MIPS: Truncate link address into 32bit for
 32bit kernel
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132333560.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:34:02.5082
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: da7ff3cb-aef9-4b20-b7fb-08d7f78dbcbb
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.153.141;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa3.hgst.iphmx.com;PTR:esa3.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(107886003)(6862004)(4744005)(5660300002)(4326008)(82310400002)(8676002)(54906003)(26005)(6666004)(8936002)(42186006)(356005)(1096003)(7596003)(33440700001)(7636003)(86362001)(34756004)(336012)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT022.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: da7ff3cb-aef9-4b20-b7fb-08d7f78dbcbb
X-MS-TrafficTypeDiagnostic: BYAPR04MB4053:
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:34:02.2024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da7ff3cb-aef9-4b20-b7fb-08d7f78dbcbb
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.153.141];Helo=[esa3.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4053
X-MS-Exchange-Transport-EndToEndLatency: 00:00:03.7406351
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tEOmbArfupDCc9DZQ45nG6xMOxNpACFeVz9sOTXKpDD7pLQd2K7MRjOHo9uX?=
 =?us-ascii?Q?4ahIt/Nh1rXFx9dulmXHPKfuCVywfHpZEpV46fOlixsRX8ofw0/fAfK70cZ8?=
 =?us-ascii?Q?a0cELsUsfJ42pdi9kWs8ONgpjZjxvvORAKs5dwxWwHwoqSPdTvnOsMr22pML?=
 =?us-ascii?Q?iscwbeogshfI7iePl1EJs1OXmmZpm2Hpsz5JH8EJgt1or4OCaR9cxVWuzpHz?=
 =?us-ascii?Q?5XpMaWv1nSCvmmIGZbeUV1zDGd1irQrrdF3PdQaY7KtTlzyElhE/jWkHl/Zl?=
 =?us-ascii?Q?L1pfBpWX0rqe0gJBy+Bq7awWC/vSbUjbjjg3l0lg6K203dlqSpZR2rjlFuK6?=
 =?us-ascii?Q?MbMfnSgb/vw/OBpdn01pa0Ept4P7jiHZHp80/OYn+brjip3mY+npGRokt988?=
 =?us-ascii?Q?PzJRV0gUdy0Pl51m5yt85jz7wfVsLhndBe2dyNuT5Q0nJWouHY+747TX57eJ?=
 =?us-ascii?Q?/G8SUJdauWJOeDxsnxK/M88dO6vh1cM1MYRgNU2pkTibpEqCcNxV3PQV6DQe?=
 =?us-ascii?Q?IUts/9Hbr7UhJ97d0h1WUqoz1HWSeJQqDMAJ1vjmYnuGoWBcqZ3VXNzs0KNj?=
 =?us-ascii?Q?vczeUvotq1LqfcjTJuS9V1DPyMEEBZ0oBVfPom/b0ak5eI2YasInH2ReFswQ?=
 =?us-ascii?Q?n3liaP4cs81CCUlUYHR7n5P7dk0kbb/5y3ePh5uL8eVOWbN8DUf4dAJvoZ2b?=
 =?us-ascii?Q?KxFZ/Czphy+TrKAE57ur9sUdT4LXDdqwuodXYtqK8aI6yK1hrj0nJ1SeKXdh?=
 =?us-ascii?Q?CuQrwv2dt2HSoHQ02K6EMx1v69t1h17Z7W7Gb7r+NmA3Y15lyqdrrK++gnoR?=
 =?us-ascii?Q?QUFq+CnozvuuJgQ3SWP8zbhTD/dVtvhb4dT7uiHrAUH8M/yyxofhttB6Dmuc?=
 =?us-ascii?Q?wf6q82dhTk7h621jWviJI2ODxv6OrJiwT5gwNrhxCuUQ3boNUE6VzioBLuJ2?=
 =?us-ascii?Q?WrRvBMMMqYuz9UqdgRZxMyVdIdnXhWZEewuQ4cHt8kSabHDhVmwNaEihm1Um?=
 =?us-ascii?Q?TUZZCbHabtdWfXKMs4mNCOzrb95Ozmt222esMttoSntS61Q6pe7dc84vh8fv?=
 =?us-ascii?Q?LZxRFznHXq1xhoKZZLHjgKGEocj/syZaKZYWzflOKe4XFwLnI4J80WsVoigC?=
 =?us-ascii?Q?bKZb1mBuV5OZ6pQummf2Wj5pdl2fJ55EUmUFN+ZjQBvHIBDzlBUzLoFB5SjJ?=
 =?us-ascii?Q?lwxX0YulYqri+D9svOWMSWpp5XbIgfYV4gSiOmVS9lIJ6WoBXTWQQS0KSkdP?=
 =?us-ascii?Q?sxhK586Wc2s4js7VdD0QzV05Sm4Uuj7ETnOtrt44lLdPkDJ8Lob0JB23Qi30?=
 =?us-ascii?Q?Qqb8NSGWCiXeC2O959+lTAUE2geKSwAfRk3+x6r3LdWxKP7b+ptC5//0MumN?=
 =?us-ascii?Q?VdSNX+Q=3D?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 23 Apr 2020, Jiaxun Yang wrote:

> > Alternatively, have you made any attempt to verify if actually replacing 
> >the setting for VMLINUX_LOAD_ADDRESS would be safe?  Glancing over its use 
> >there do not appear to be many places.
> 
> Limited experiments showed it should be fine...
> 
> But MIPS kernel has some design I'm not really familiar with like SYM32 for
> 64-bit kernel and special address space design for Trap-and-emul KVM.

 This only affects CONFIG_32BIT kernels, so SYM32 does not apply; I can't 
comment on KVM.  There's still that bunch of:

$(shell expr $(...) \< 0xffffffff80000000)

constructs I mentioned before, so let's leave your change as it stands at 
this time.  Please do rename the variable as I suggested though, I hope 
that's not a big deal.

  Maciej


