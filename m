Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41051D2237
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731476AbgEMWmZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:42:25 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63019 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWmY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:42:24 -0400
IronPort-SDR: 7Enpq1+L5AMxxs97FS4DL9LpMJhNirelAq9nTHkru1GIwhbS7BAeiUthHx31JIUuCVjt5vLT9Y
 3a62lLTX327Z3wkZExPrYQD9AZBJRpQSQEVH6GtQG4JGNlHEbVw5QQXtfaQ/Agd8ttdEnq+8oE
 fXUohFZiCN3DJELBPPDQlntJQZCGK2lnj1ex+HjN5jXD6qlEIdDCMLo0lPW1xyJZTAxplj7NZr
 KDbNtdGy/tC/dzNa1+FZWRe6We8j2fF0y68TW4u104qEZ98x5OU7czgR5gyQApCToF9PZru5lR
 n4Q=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="240330949"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:42:25 +0800
IronPort-SDR: NG7MFcFtY+fZ06EgJZ5jT/7mjcvLWg/S+kAe6w5VzEQCiABQFshOvYNAtr9QTB9tdPe1NmGh3h
 St5G1U26k5jnCAcsKJUNzR8u9d+EnDgRs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:32:37 -0700
IronPort-SDR: 6LVGCMudx5YirHBcPvRHZ0h2mP1mLCOXSjGj9gAZTRhXjpD9wkiY1q0pr6zOJpI+e7FkjIW59i
 acXiVlX1FjiQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:42:22 -0700
X-Received: from DM6PR04MB6650.namprd04.prod.outlook.com (2603:10b6:a03:f4::33)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BYAPR11CA0092.NAMPRD11.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:35:11 +0000
X-Received: from CO2PR04CA0137.namprd04.prod.outlook.com (2603:10b6:104::15) by
 DM6PR04MB6650.namprd04.prod.outlook.com (2603:10b6:5:24d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28; Wed, 13 May 2020 22:35:10 +0000
X-Received: from CO1NAM04FT036.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:104:0:cafe::f7) by CO2PR04CA0137.outlook.office365.com
 (2603:10b6:104::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Wed, 13 May 2020 22:35:10 +0000
Authentication-Results: spf=none (sender IP is 216.71.154.42)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa4.hgst.iphmx.com (216.71.154.42) by
 CO1NAM04FT036.mail.protection.outlook.com (10.152.91.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:35:08 +0000
Authentication-Results-Original: esa4.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: jdoA3nmIA1oxNDjwZfaT2BXScpEKcVKr8QqOw7iFkVh3zKtXGw50U/+lZBdOOK9lhqmS7cglVS
 gctrgnHmrbTX/qadPCKLvLuw/+GX7Jq8KAOIUwtq7qCToG9E5ttcxDaz0BhGkm2PDBDO7MW0C0
 nNwNI6uxLaK1K2T8NV8WXpQ730IN5hf7tBA8vzpJrnAGWxIGwt6R7LiNAI/0djRJ3VNW37YtvM
 4XQSQeXU4pbD0xtRCSBqKP/oH6cbfQc9ZC4iWnsRD1sS3kjYYvoBdrkXPL71TtIKgqNQHmuW8T
 H/QRa/LGCtO6DuhZTs1jqMLP
IronPort-PHdr: =?us-ascii?q?9a23=3A2wMHAB/lnShKQf9uRHKM819IXTAuvvDOBiVQ1K?=
 =?us-ascii?q?B31+gcTK2v8tzYMVDF4r011RmVBNiduq8P07uempujcFRI2YyGvnEGfc4EfD?=
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
 =?us-ascii?q?+ZN7jfsFGV6e0zOeWDeIgVuDOuY8QistDni3AjhF5VRq6v0tNDbXmjHe5vMm?=
 =?us-ascii?q?2WZn3jhtpHGmAP6FkQVuvv3RenWDVSanT6YOR03DYpGYmlDM2LEoWki6aG9C?=
 =?us-ascii?q?O6GIBGI2VHEkvKFm3nIdbXE8wQYT6fd5cy2gcPUqKsHsp4jUn07l3T1qZnI+?=
 =?us-ascii?q?zI+yYRqZPk0p1P6vbOkQ0prGIsXcmG2j3LT25vgiUJXz8zzOZ0pkkugluA0K?=
 =?us-ascii?q?0thfteGJQT4v5SSQ41ONbayPAyENH9XA/NP5+JRV+qT8/gAGQ3SdQ8kJcVe0?=
 =?us-ascii?q?goPdKkg1jY2jayRboclriFHpsxp6fV1GL2D8J8zWvWkawgl0JgRdFAZiW9nq?=
 =?us-ascii?q?Aq0Q/VCsbSllmB0aancaNJxCnW6GKK1naDpmlTThU2VaTDQGBaY0rOtpL+/E?=
 =?us-ascii?q?ybFe2UBL8qMxVMxYu5EoUQO4e7q1JASb+jNc/XPySxlHysQxeQxracKoHtfj?=
 =?us-ascii?q?dV2iKVE0UCnw0JtX+bKQgzADugqGPCHVkMXRruZU3r6+x3tHK8SAc90QiLa0?=
 =?us-ascii?q?Rr07f99AQSgLSQTPYa37RMvylprjx/BlGV29PQFsrFogt5Z+Nbe9x8hTUPnW?=
 =?us-ascii?q?PVugphP4CxeqVrh1oQaQNy7Avl0xR6DJkFkNB/9S96ilAvcOTJjRUYLGPLuP?=
 =?us-ascii?q?K4cqfaIWTz4h21PqPN0w2Y0NmN5uEO8PQ9uxPouwT6cyhqu3hhzdRR1GORo5?=
 =?us-ascii?q?vQCw9HG5f4WVww3xx7oazKJyw8/5iS0mdje/rR0HeKy5cyCe0pxwz1NdJWO7?=
 =?us-ascii?q?mDPAvzFdAKQs2vMPdsnEKmJEFMLKVZ86g6ONmjfv2N1fuwJOhXmzSinD0dsr?=
 =?us-ascii?q?pw2U+N6SdwD9Xw8c1dkqO+2Q2KH3fxl1799MD4gpwCZCkSG3r5wi/hVsZXYe?=
 =?us-ascii?q?VpcIAHBH3mKtCrxth4m5/mWmJJkTzrT1IA1sizfBOOblv7lQRO3EUTqHajlG?=
 =?us-ascii?q?O21Ttx2z0uq6Oe2mTJzYGAPFIfPXVXQWB5kVr2CYOqlJYeXU61f00slQO+o0?=
 =?us-ascii?q?HgyOkTpahyKXXSXVYdfyXyKDIHMOP4vb6DbshTrZIw5HwLAKLmPAncG+O7+k?=
 =?us-ascii?q?BKgGv5EmBTxS42bWSnoZyl2Rx1k37bLW5zqWqfcsZ1lnK9rJTRQ+Bc2j0eSW?=
 =?us-ascii?q?x2kz7SUxK5NtKz+v2QlpHeoqW7Vnq6EJpJfmO4qOHI/Dv+/mBsDRClyrqrnc?=
 =?us-ascii?q?b7FAEhzSLh/9J0TmPMrRDhcszu1ryhd+V9cQM7YT20o9o/EYZ4nIwqgZgW0n?=
 =?us-ascii?q?VPnY2byn0BlXaqYIdrnJnmZX9IfgYlhtvc4Qzrwkpmdyzbw4P/S2XYx8p5fJ?=
 =?us-ascii?q?+9eGxEgntgvfAPM7+d6fl/pQUwole8qliJM/NjhXEZyP0z+DsfgvkS/g03wX?=
 =?us-ascii?q?fFDw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FVAgC0dbxefYpf+5RmHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgUeCJYFrAwQLLI0mh2Alm2APATsEAQGERAKCKwY6EwIDAQE?=
 =?us-ascii?q?BAwIFAQEBBAEBAQIBAQEDAgEBAQECEAEBFjo0YFOBR4FBLAkGAwE7gjspAYN?=
 =?us-ascii?q?iAQEBAgESKD8FCwsOBjJXBhMihVwFIKQmAYEoPgIjAT8BDIEFiX6BNIpygTi?=
 =?us-ascii?q?MVgaBQT+BEAEzA4JaPopCBI5/ghqhZQcDgk2YNB2dSa91IYFYfQiDJE0BAgE?=
 =?us-ascii?q?CAQwBAgIBAQECAQEIAQEBAZ8GQzA3AgYIAQEDCY9EAQE?=
X-IPAS-Result: =?us-ascii?q?A0FVAgC0dbxefYpf+5RmHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?UeCJYFrAwQLLI0mh2Alm2APATsEAQGERAKCKwY6EwIDAQEBAwIFAQEBBAEBA?=
 =?us-ascii?q?QIBAQEDAgEBAQECEAEBFjo0YFOBR4FBLAkGAwE7gjspAYNiAQEBAgESKD8FC?=
 =?us-ascii?q?wsOBjJXBhMihVwFIKQmAYEoPgIjAT8BDIEFiX6BNIpygTiMVgaBQT+BEAEzA?=
 =?us-ascii?q?4JaPopCBI5/ghqhZQcDgk2YNB2dSa91IYFYfQiDJE0BAgECAQwBAgIBAQECA?=
 =?us-ascii?q?QEIAQEBAZ8GQzA3AgYIAQEDCY9EAQE?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137621451"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa4.hgst.iphmx.com with ESMTP; 14 May 2020 06:34:57 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992669AbgEMWeyqsEAU (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:34:54 +0200
Date:   Sat, 2 May 2020 14:34:06 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Fangrui Song <maskray@google.com>
cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
In-Reply-To: <20200428225401.7yrld7u2xr67t4xf@google.com>
Message-ID: <alpine.LFD.2.21.2005021408420.3602499@eddie.linux-mips.org>
References: <20200423171807.29713-1-natechancellor@gmail.com> <20200428221419.2530697-1-natechancellor@gmail.com> <20200428221419.2530697-5-natechancellor@gmail.com> <20200428225401.7yrld7u2xr67t4xf@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:34:54 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to
 link VDSO
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132334540.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:35:08.8628
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 91382ca1-941f-4c9c-9f9a-08d7f78de448
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.154.42;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa4.hgst.iphmx.com;PTR:esa4.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(54906003)(7636003)(33440700001)(356005)(82310400002)(7596003)(86362001)(4326008)(42186006)(336012)(26005)(6862004)(5660300002)(1096003)(34756004)(6666004)(8936002)(8676002)(107886003)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: CO1NAM04FT036.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 91382ca1-941f-4c9c-9f9a-08d7f78de448
X-MS-TrafficTypeDiagnostic: DM6PR04MB6650:
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:35:08.6669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91382ca1-941f-4c9c-9f9a-08d7f78de448
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.154.42];Helo=[esa4.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6650
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.6518899
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v1lH+0KoD/nzclmpQaQR2wcZkDH1rdDn7Aw6eic4sZopnLferg/gGeEs+/Q6?=
 =?us-ascii?Q?DiwHreyX+guTLsbZ6FodPHcTy2kkylVRivqCT96K5mRYXV7G0Oz3REWEet5l?=
 =?us-ascii?Q?1aLOaBeTY40UUSmZK+B0YaDRVOsGDxdafKSHNlKjm7CrKST/J96VRy5067GH?=
 =?us-ascii?Q?ED4NyRbLrBnAkMf6viPQPVHi75KreQjfy5XpYpcY3nEBCFPFqjCB+UfZTRyG?=
 =?us-ascii?Q?vmOv5r4N42tJcZO2rLDvZNrpxrxUXmDhDEa5z5eLfw3ESY8dvSg1oa+edZYj?=
 =?us-ascii?Q?iCKKdVyhjR2139TW1hp0P4lehCtxNx8DDOX+QEtTISotXGoGCk8OqRI7mTbg?=
 =?us-ascii?Q?OhH4YXJaiGeqD5mMTLokm1Uz7HHSovRJ8QrIl+a+/r/5l8jK+tty5kDG1+ph?=
 =?us-ascii?Q?WoS1IzUqKenChq62lZSUS8+1rNz911rDrdYvezK2kvjzOoL9NUZAMhBhddS3?=
 =?us-ascii?Q?AW7iJgbMbsZ+rL245g7RxBwy7etUXFZYQd1aS873sSHpAL68UX+vluMrW3Ax?=
 =?us-ascii?Q?MFGjDnRAFrerDFz4BRkOvoZJkNWAosaAeteu13yW7+id0x0wMWdPwPezSQiw?=
 =?us-ascii?Q?HXpupDCNsQ+x+24ZJ0QAfBqbDz2EOw18XOsp5wejNJByxaIxexnBAXaDc65X?=
 =?us-ascii?Q?TTPJ2DeH1Ef4Ogxulvepued70w5UaZ6AFxf4aCDEsmQ3gIidI/iBkWtb8+oJ?=
 =?us-ascii?Q?1q75hRwE6t7BYM1GMjXPbi9lNdyBCKUUvXCR/PydH2mIMxf8I8rWr5ShNUkZ?=
 =?us-ascii?Q?+SGFkbG/2nND6wcQe2WLWBnlZKCTTQhqghCLdrQC00fPizjCZISLH1DuiAVY?=
 =?us-ascii?Q?1jWOaPy7SJ8jAuW1gSVprGu/8X2lttyx0cVw8X+PuFYzwqzVXPx2id8eB7xg?=
 =?us-ascii?Q?xFmYtaua91HbIhp058zT99rrhvfTnEVL7BMvryd5kS+7qe5WrdHK51cXz4TA?=
 =?us-ascii?Q?ZvZv6hTcUq/FoN4jvk9rEXNBYBf7Qdo2wl6t10QnQYgPn73ajLklxLO3mTeE?=
 =?us-ascii?Q?MvMFtppDkcP0hlmAanMwHmnNzsT7ms1Bw9h9uYFrMgShx1nwcIFs5mMz9dqi?=
 =?us-ascii?Q?LKgRbJPW746WiB9k2h1AIf0abUwy3NJ4B7Z6w6M43ct/v3Fw/tmisTZwBlit?=
 =?us-ascii?Q?GDQfURfgJftbDdWSvMjytwo7VxIRTZ3Q88RDNMERwLx7qYMluc2+2Gg3pKgH?=
 =?us-ascii?Q?DGwccQ6x867cCO9y6t49eURhajxn+svEJlRnQzTOn87uNjds2Aph72Getv96?=
 =?us-ascii?Q?Ss+pRX7BATC0zUwEa5uxzVvVCCCdqvMEARhFKUC9yG9zUqtexK9QgPc/XjIi?=
 =?us-ascii?Q?+zF6xBPZt+4HwnVaPFMEssYN8RO3YyKjkHASW2uj6Wqy21Dc57ez63uol0RK?=
 =?us-ascii?Q?BXr4cfQ=3D?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 28 Apr 2020, Fangrui Song wrote:

> Sigh...  -G 0. This is an option ignored by LLD. GCC devs probably should
> have used the long option --gpsize rather than take the short option -G.
> Even better, -z gpsize= or similar if this option is specific to ELF.

 Well, the `-G' option is some 30 years old and comes from RISC-OS where 
the vendor linker had it; it was already present with the initial MIPS 
port of GCC:

commit fe3ec4f798ceea52e1b542b481670b83c12347fd
Author: Michael Meissner <meissner@gcc.gnu.org>
Date:   Sun Dec 1 05:02:56 1991 +0000

    Initial revision

    From-SVN: r88

specifically:

+#define LINK_SPEC	"%{G*}						\

there, so I don't know of what GCC developers' choice you are talking 
about.

 Much of GCC legacy comes from various vendors' compilation systems; in 
this case it was the MIPS Computer Systems (aka MIPSCO) compiler.  There 
may not have been a GNU linker port to RISC-OS at that point (or ever), 
and the assembler and linker invocation interfaces were kept compatible as 
ports were added to individual GNU development tools, for obvious reasons.  
I still remember using GCC with vendor's assembler and linker on DEC 
Ultrix/MIPS myself many years ago, to overcome some vendor compiler's 
limitations.

 And FTR this was still a few years before ELF was even invented; MIPS OSs 
used the COFF binary format back then.

 Sorry.  I think it's LLVM/LLD that ignores compatibility, not the other 
way round.

  Maciej


