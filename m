Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AD11D21EC
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731218AbgEMWWm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:22:42 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:35559 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730064AbgEMWWl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:22:41 -0400
IronPort-SDR: xg4C7byhUlpMpYHTcK3gcgzagp8MWVkeBHMYdZgZvsEvxW7/BtVg/b6tTGYkDIfdOcai3VMtxJ
 mp10Tn1YDMTGK0oau2vNWsvfQx5B04yLIctAw1b9Ib/56bufaSODU8UXGFiuUf57BRxZUJh52G
 0whW0upycvddQTh5hbq8loU33vMdopf2fey5tmR/v2emaH4DUNvTnwqOQiGAG98kWdDmSYUqqW
 mMSA8NILnAw0CsDbc8K6xR3vflnpQJPc5FgE1qmgep9b5Ri7SVW9KXza99p0cbyyS3/ivyxBj+
 4qY=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137956939"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:22:41 +0800
IronPort-SDR: 4JsovIqCyQFJ4vKNqcYpPoGNIM97HhA7GjiLoNbnpQFk9XjWU6ogOc6XwFVYGDdie+1rwcwCXU
 D4mR85lRYmf59AAi3tIbdGBXXH/l51Suk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:12:21 -0700
IronPort-SDR: pTpQMiWVCN3sK9EcHkeHPffu4rj382YAL2OszdCBzll585/OnghAS0rDjkBVBkVoMklGr4FKqN
 Dy+7t1CTPUNQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:22:40 -0700
X-Received: from MN2PR04MB5792.namprd04.prod.outlook.com (2603:10b6:a03:1a0::17)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BY5PR16CA0004.NAMPRD16.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:18:41 +0000
X-Received: from BN6PR04CA0094.namprd04.prod.outlook.com (2603:10b6:404:c9::20)
 by MN2PR04MB5792.namprd04.prod.outlook.com (2603:10b6:208:a5::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Wed, 13 May
 2020 22:18:40 +0000
X-Received: from BN3NAM04FT010.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:404:c9:cafe::d3) by BN6PR04CA0094.outlook.office365.com
 (2603:10b6:404:c9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Wed, 13 May 2020 22:18:40 +0000
Authentication-Results: spf=none (sender IP is 216.71.153.141)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa3.hgst.iphmx.com (216.71.153.141) by
 BN3NAM04FT010.mail.protection.outlook.com (10.152.92.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:18:39 +0000
Authentication-Results-Original: esa3.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: HeQbNWBerY+NlTTft4NC8QBsMf9L8cOywOsihBwdjnAAMc4tkUId/GGfnY67ZsBYc628MOzysw
 MrAUVpGNHU3ZjY7O2cqoMmhHb7/a3GGjQK3XR4imZnwZpTPF7BXQAK4ucUNr2KuDCa/mZeScvz
 8LDEndB+DGbWOWaQWFu/srq6qHK+lWu9pF5+xAuO6g+DsQhn2Y7NgtTHvLE1Vel7ioQTo7m5Z+
 FV0pXbbpevUeOClRonHYA3ZvEB1NdFD2YNseehxFKBSxJmxDfAlolYeHDA+WXc9YZ8SOr5+pTL
 AUJK79S7cxviOHYbmO4iB36g
IronPort-PHdr: =?us-ascii?q?9a23=3Apf+k6h16MmIYrXJnsmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseIRLPad9pjvdHbS+e9qxAeQG9mCtrQV1qGO7ejJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVhDexe7d/IRW5oQnNt8QdnJdvJLs2xh?=
 =?us-ascii?q?bVuHVDZv5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3UbJXAjImM3?=
 =?us-ascii?q?so5MLwrhnMURGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RT?=
 =?us-ascii?q?Kv5LpwRRT2lCkIKSI28GDPisxxkq1bpg6hpwdiyILQeY2ZKeZycr/Ycd4cWG?=
 =?us-ascii?q?FPXNteVzZZD42yb4UBEfcPMuRboYnzqFQBsQCzBRWwCO/z1jNEmmP60bM83u?=
 =?us-ascii?q?88EQ/GxgsgH9cWvXjaq9v6LrsdUeGrw6nK0D7Mb+la0irh5ojPcxEgoe2DXb?=
 =?us-ascii?q?Fxccbf1EIiEAbFgU+Mpoz/ODOYzeANs2md7+p9WuOjkmsnqwBpoji03MssjZ?=
 =?us-ascii?q?PJho0Mx13C6C52z5o7K8eiR05nfd6rDoFQtyeCOoZrTc0vQWFmtigmx7MIuZ?=
 =?us-ascii?q?C2fTUHxZs7yhPeZfKJfJSF7w79WOqNPTp1mX1odKyjixqu9UWty+LxWtS23V?=
 =?us-ascii?q?hFrydIlMTHuH4K1xzW8MeHS/1981+l2TmSzADf8PpELlsymKHGKJAh2qY9mo?=
 =?us-ascii?q?ccvEnABCP6hkX7gLKMekgg+uWk8fnrb7vlq5KaKoR6kBvxMr40lcy6Gek4Mh?=
 =?us-ascii?q?YBX2yc+emkyLLj41b5TK9Ojv03lKnZrZ/bKd0epq64Gw9VyZwv6xGlDzepyN?=
 =?us-ascii?q?gYnH8HI0xZeB+fkoTkNFLDLOrmAfq/nligijNmyvDcMrH8DJjALWDPkLL7cr?=
 =?us-ascii?q?Z8705cxhAzzdda559MD7EOOu78WlX2tNHDCh85Mgq0w/voCdlk04MeWHqPAr?=
 =?us-ascii?q?SDPKPVq1+I6fojI/OQa48NpDb9N/8l6ubrjXAjhVAdZ66p0IAZaX+lAvtqOV?=
 =?us-ascii?q?mWYX3pgoRJLWBfnAs3XPHswGyLVzEbM3SzVrIh4HcqAYSpJYnHV4+qiaDH1y?=
 =?us-ascii?q?C+SM54fGdDXxqpGHzpeofMZLFEUiWAM8Rik3ZMAb2oQJUm/RWvshLqjr9mNv?=
 =?us-ascii?q?GS/TcX48GwnONp7vHewElhvQd/CN6QhiTUFzkuxDEhWiM20aZjoEd01laE1+?=
 =?us-ascii?q?1CjudFEcBIvq0RAAohPMWaz+NhF5bzQgLEbpGCT1P1CtmlADRkSNU3zpdOZk?=
 =?us-ascii?q?tmANytg1jF2DbiGL4akbGHRdQ0/6vQ0mK3JpN7zHDLh+E6l1dzZMxJOCW9g7?=
 =?us-ascii?q?JnsQ3aBorHiUKcwqOjfr4b9CrM8nqTiG+PpFoeVxR/Au3eRX5KQEzQoJzi41?=
 =?us-ascii?q?/aCb+jDbNyKgxa1cuLMbdHcPXik04AQPblJcSbZmOpgCG3HxnRnOG2YYHnen?=
 =?us-ascii?q?sQ0GDmMGZewlpB23GAOEB+Czyo+CTeAydyU1P3Y0b8t+J5rSHzSEh81AyMY0?=
 =?us-ascii?q?B7n7Oo5h4Yg+CdQPIPz9dm8G8grTtzBlO0w9PRDZKJuQNgeKxWZd517k1A0C?=
 =?us-ascii?q?rVsAl0P5roKK4qg1cVaQNfu0LoygUyD4RYio4ttnxrqWg6YaOU3VVddi+JiJ?=
 =?us-ascii?q?X5O7nZMG73r1ikb6/b3E2b0c7Do/tfrq5l8hOy4UfwTRpxlhcvm8NY2Had+J?=
 =?us-ascii?q?jQWQcJWMm3Ukks6157v7Hfcm824IaHsB8keaSyrDLG3MokQeU/zRP1NdJWO7?=
 =?us-ascii?q?mDPAvzFdAKQs2vMPdsnEKmJEFhXqga5OsvMsWqeuHTkquiN/xntDani3lXpY?=
 =?us-ascii?q?V8ylnK8DBzAL2Az9MOxPeW2RGCXjH3gQK6qs7AnoZAdGhITFCywiXlGoNdI5?=
 =?us-ascii?q?ZKU91TWDWIJMu6jpVznJe2HX5X70LlBksG3d/vch2XPRT72kVL2EIbrGbvkD?=
 =?us-ascii?q?akzzFyjzAir7aOuU6Gi+Xkeh0dP2dXRW5kxV7yKImwhtoeUQCmdQ8s3Bei4E?=
 =?us-ascii?q?/7weBcqsEdZyHLRlxUeiHtM2x4eqCurfyGYshS+NYtsD1MFuOmbhHSS7LwpQ?=
 =?us-ascii?q?cbzzK2H2Zaw2NeFXnisZH4khpmzWOFeS8v/DyDJJg2lEqZvYeMFrZL0zELRT?=
 =?us-ascii?q?d1k2zaHVHnedmm5snSlo/Dt/D4XGWkBfgxOWHmy52NsCyj6ChkGxq6yrq2k9?=
 =?us-ascii?q?b9FiA+0Cnmx5xvVD3T6hHmbcO4ssbyefIiZURuCFLmvoBiHZpil4IrmJwK8X?=
 =?us-ascii?q?MEndOR/HwagSL2MM1An6XkYzBeIFxDi86Q6w/j1kp5K3uPzI+sTW2T9cxnY8?=
 =?us-ascii?q?jjMzEmnxkl5sUPM5+6qblNnC97uF299FyDZfl7gydYzPo28zgdme5b4FNwnB?=
 =?us-ascii?q?XYOagbGAxjBQKplxmM6Irm/q5JfyCrcL6txA97nMi6SraYrVMEVQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ExAADGcbxefYpf+5RmHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQIEzCAELAYF8KIFGJQMEC4xyYIdfJZllgXsPATsEAQGERAKCKwY2CQ4?=
 =?us-ascii?q?CAwEBAQMCBQEBAQQBAQECAQEBAwIBAQEBAhABARY6NGBTgUeBQSwJBgMBO4I?=
 =?us-ascii?q?7KQGDYgEBAQIBEig/EAtGVwY1hVwFIKQyAYEoPgIjAT8BDIEFiX6BNIpwgTg?=
 =?us-ascii?q?BjFUGgUE/gREzA4IsLj6KQgSRGQGhZAcDgk2YNB2dSa9eOIFYfQiDJUwBAgE?=
 =?us-ascii?q?CAQwBAgIBAQECAQEIAQEBAZFjAQKNIENnAgYIAQEDCY9EAQE?=
X-IPAS-Result: =?us-ascii?q?A0ExAADGcbxefYpf+5RmHQEBAQEJARIBBQUBQIEzCAELA?=
 =?us-ascii?q?YF8KIFGJQMEC4xyYIdfJZllgXsPATsEAQGERAKCKwY2CQ4CAwEBAQMCBQEBA?=
 =?us-ascii?q?QQBAQECAQEBAwIBAQEBAhABARY6NGBTgUeBQSwJBgMBO4I7KQGDYgEBAQIBE?=
 =?us-ascii?q?ig/EAtGVwY1hVwFIKQyAYEoPgIjAT8BDIEFiX6BNIpwgTgBjFUGgUE/gREzA?=
 =?us-ascii?q?4IsLj6KQgSRGQGhZAcDgk2YNB2dSa9eOIFYfQiDJUwBAgECAQwBAgIBAQECA?=
 =?us-ascii?q?QEIAQEBAZFjAQKNIENnAgYIAQEDCY9EAQE?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141966936"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa3.hgst.iphmx.com with ESMTP; 14 May 2020 06:18:35 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991633AbgEMWSeGV0RN (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:18:34 +0200
Date:   Mon, 13 Apr 2020 21:06:33 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     linux-mips@vger.kernel.org, clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: Truncate link address into 32bit for 32bit
 kernel
In-Reply-To: <20200413153205.4ee52239@flygoat-x1e>
Message-ID: <alpine.LFD.2.21.2004132103080.851719@eddie.linux-mips.org>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>        <alpine.LFD.2.21.2004130736410.851719@eddie.linux-mips.org> <20200413153205.4ee52239@flygoat-x1e>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:18:28 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH v4] MIPS: Truncate link address into 32bit for
 32bit kernel
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132318280.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:18:39.4640
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: d2ad998a-6c22-4203-5a33-08d7f78b968e
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.153.141;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa3.hgst.iphmx.com;PTR:esa3.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(33440700001)(42186006)(54906003)(4744005)(107886003)(34756004)(4326008)(336012)(6862004)(86362001)(82310400002)(5660300002)(26005)(8936002)(7636003)(8676002)(1096003)(7596003)(356005)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT010.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: d2ad998a-6c22-4203-5a33-08d7f78b968e
X-MS-TrafficTypeDiagnostic: MN2PR04MB5792:
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:18:39.1492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ad998a-6c22-4203-5a33-08d7f78b968e
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.153.141];Helo=[esa3.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5792
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.4793614
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BeZKYrivPibrinq1rb02RlwUIwoVPyyw9tCxNDK76plsWNOdXB6wSmHT8LP5?=
 =?us-ascii?Q?BKoEYI/+dCU9EeU8wl5nIQB4leVDVJkNCt+RBHxchu6YfNmntrYZ36euiOnn?=
 =?us-ascii?Q?Y1VW6jHgnEQDTG1KF4qH+BaJNs90LMBU8chmnKvSjxtFsuKDXoPGO+5uiTTW?=
 =?us-ascii?Q?4PI0j1oaPPUhDlRb3QMPhzhgwxrJxrWi6kKFagMdEgI/9JsJxILNlcekgTXP?=
 =?us-ascii?Q?Yw4iLR0vjYxDkZAwjaixeHvYlpJ6uqAsHjNypaz8R+3NesMFBbGuDE4+juPe?=
 =?us-ascii?Q?+/1ZqTcXChDSW04/dAp1r/hmvFWD8fl3BppT0mv907eSHrpjD/7nb7F6LbQz?=
 =?us-ascii?Q?WjUXXfS3UED53TeEN1ivsGynz8w8XK8BrW76eOO5RtV7FLynIehY44S5gWke?=
 =?us-ascii?Q?NKiHKaPmKupeNP4hbP5qMsZ/Vv1npBLBJksFlvO7RXbEd9cIqAGms1iav2OK?=
 =?us-ascii?Q?8pUkLBjQ0WIUykSALxFLXpI86piJG62s10101rCQlXp3rMWwnayi4fvx6kq3?=
 =?us-ascii?Q?tu4btTos8zROlSHeTERFCTr/FUbvskzPbHdlfDT6m1rXDIZh3r/U7SvNF4bv?=
 =?us-ascii?Q?EAzb2HdedbWreEBA9lepZg4o1bBaKfCGkEPyJbd3dzz5HnECF7kLVcl8onU2?=
 =?us-ascii?Q?Io5FShkf1/PEOpJ7HTHKUrChXtGqLa3O+0tg9p6xso6pRZhLDeuDC8PR9hCt?=
 =?us-ascii?Q?lmrDCaEdafFaurDTOrbn++JqWAVPS7smmPf+wqkfBcrPboQAtzTaBTYeXOMW?=
 =?us-ascii?Q?xrTad7Q8aBALiOjN7yk5tcg4w+1kQEDcCXIsqyHFqRRy6i3fTIDIhaP+iP4P?=
 =?us-ascii?Q?78RgsVChCJDjOKVj6mtXZinYo08b+bCjyzjyhjGPZSzAulosBvYGaDfWkfnq?=
 =?us-ascii?Q?pjNMK8DW0P7JO8wvlWPaH24RU1qhA0P6iVpVyRKXbGPfBjUb87u0aMBsWY6/?=
 =?us-ascii?Q?ciBiNlwzS6+Mk0WsXZwEHOaQo3FnnmwmVZQ+wGQ7UShogDPyuwD2Pm8ZziPc?=
 =?us-ascii?Q?p1bPtaal9kajni6EAOXmhhCmsMwvhXM9wujtnJqKy90nlxgfbPTDWMErkvEk?=
 =?us-ascii?Q?l4jS3BGrHYERE9mZuImrQPnv10SS3gkCPlMRLenlR+4Sattv4dey4TgcSV9O?=
 =?us-ascii?Q?GzftDPaC+m89JEBT4M0dbAfnr5NDMmGxfAV3GHNVFobKGYaF9D6V1vZh1t8f?=
 =?us-ascii?Q?0AwTWxJiJeoZV5sxegN/sGcLl487G3plDPltNQ=3D=3D?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 13 Apr 2020, Jiaxun Yang wrote:

> > > diff --git a/arch/mips/kernel/vmlinux.lds.S
> > > b/arch/mips/kernel/vmlinux.lds.S index a5f00ec73ea6..5226cd8e4bee
> > > 100644 --- a/arch/mips/kernel/vmlinux.lds.S
> > > +++ b/arch/mips/kernel/vmlinux.lds.S
> > > @@ -55,7 +55,7 @@ SECTIONS
> > >  	/* . = 0xa800000000300000; */
> > >  	. = 0xffffffff80300000;
> > >  #endif
> > > -	. = VMLINUX_LOAD_ADDRESS;
> > > +	. = VMLINUX_LINK_ADDRESS;  
> > 
> >  The CONFIG_BOOT_ELF64 cruft right above it looks interesting to me,
> > never have ever been used.  We have had the current arrangement since:
> 
> It confused me either.
> It's only used by SGI so probably it's time to rename it as
> BOOT_SEG_ELF64.

 Well, as seen above the first assignment is immediately overridden by the 
second and the rest of the conditional are comments.  So as I say it's not 
used ever, not even any SGI configuration, and from Git history it looks 
like it has never been.

  Maciej


