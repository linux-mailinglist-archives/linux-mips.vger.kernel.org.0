Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0A01D223D
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729788AbgEMWne (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:43:34 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:35333 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWnd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:43:33 -0400
IronPort-SDR: G92AgOXwdeDUyLkhXm+2pFnxwjKeDNm4MdyekH2T6FmXSMoPGWWa14xKuo/Samtiw0OTjRUayu
 HNzBzWbWU6p9zR2jyKDPWTFZ88aT9ZDN+poB871ZBOXg+5GOksf3ovc5fq1a3vMXJ3eLYbxh3h
 T9VKJ1ne8lHd3Nmm+uNzAdgPfHHZBiR8RCyyra4YG/Um95dRSvZBLkWoUUbkuFrshqZQgQ3i6I
 mNjqOFdTdQQBuD6hMuTIMUQ5IgnZuqkHiYfExAzqhi0/ubKO13/VrocB7TqRgxjzxqZpF3uKrr
 IQg=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="246571555"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:43:32 +0800
IronPort-SDR: uzN3g+qEabh+QELmoF1pkTPMU3c+VTLXtyqBQDJbYe33UoSFh+saYeTetpYw9lEgUDBIzvWs9V
 MRwSohb3ntjt+Y9FRau1Dg4p78wYgYhj0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:33:46 -0700
IronPort-SDR: kuI0S78DGtTpoPe/OFav9Ea63TaJtn0GHkphyaKO69xiOKJK4I5Sx1mfa4dY08qVSGlC6zZlp2
 zv1wF+HAjc0Q==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:43:31 -0700
X-Received: from BN6PR04MB1123.namprd04.prod.outlook.com (2603:10b6:a03:74::27)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BYAPR05CA0050.NAMPRD05.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:35:13 +0000
X-Received: from BN3PR05CA0006.namprd05.prod.outlook.com (2603:10b6:400::16) by
 BN6PR04MB1123.namprd04.prod.outlook.com (2603:10b6:404:9b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Wed, 13 May 2020 22:35:10 +0000
X-Received: from BN3NAM04FT044.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:400:0:cafe::f4) by BN3PR05CA0006.outlook.office365.com
 (2603:10b6:400::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.11 via Frontend
 Transport; Wed, 13 May 2020 22:35:10 +0000
Authentication-Results: spf=none (sender IP is 216.71.154.42)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa4.hgst.iphmx.com (216.71.154.42) by
 BN3NAM04FT044.mail.protection.outlook.com (10.152.93.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:35:09 +0000
Authentication-Results-Original: esa4.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: i5tx3H9YsGXEsxtZ5589YnUHcqfythhOcuuELCic947cxBrZQRHe8i/uJh9CSjrJrK+Jf5+2Vv
 w26pJHdywL26j5Lyd9Gf+cPvapvZr+2E6PdJAMyTFH0AvNfY8sJ2dYxmCV8YNAhE+VU5KuD40r
 Nl+Y03/neYgG0caWshQPcqua/LA016+dQXpKsHnrZlG0K6Gi1vnRs0U5KKzHQX11kB+kXnNFwO
 D51rnVNQX15I3Oan1GN1WEFtsu7Zh3p4oLg3LBCVZKY+5O6m/E3pmwZM25bSYQ+uJGpF7z2zTm
 Ro/Oc7XvIZWfwjhG4XjH0fiJ
IronPort-PHdr: =?us-ascii?q?9a23=3A6SAYdhVDpzHOOEQE3aO0mFeiawLV8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYbBGEt8tkgFKBZ4jH8fUM07OQ7/m9Hz1dqs7Q+Fk5M7V0Hy?=
 =?us-ascii?q?cfjssXmwFySOWkMmbcaMDQUiohAc5ZX0Vk9XzoeWJcGcL5ekGA6ibqtW1aFR?=
 =?us-ascii?q?rwLxd6KfroEYDOkcu3y/qy+5rOaAlUmTaxe7x/IAi2oAnLssQbgYRuJro1xx?=
 =?us-ascii?q?DUvnZGZuNayH9yK1mOhRj8/MCw/JBi8yRUpf0s8tNLXLv5caolU7FWFSwqPG?=
 =?us-ascii?q?8p6sLlsxnDVhaP6WAHUmoKiBpIAhPK4w/8U5zsryb1rOt92C2dPc3rUbA5XC?=
 =?us-ascii?q?mp4ql3RBP0jioMKiU0+3/LhMNukK1boQqhpx1hzI7SfIGVL+d1cqfEcd8HWW?=
 =?us-ascii?q?ZNQsNdWipcCY2+coQPFfIMM+hYoYfjulUBrxiwBQejC+zz0TJImmP60bEm3+?=
 =?us-ascii?q?g9DQ3KwgotFM8OvnTOq9X1Mb8fXe6ywqbS0TrDbu1Z2TXg44fIaBwqvO2CXb?=
 =?us-ascii?q?VxcMvR1UYvFALFgluNooHiOjOazPgCs3Kc7+d7UeKvimgnqxx+ozS2w8csi5?=
 =?us-ascii?q?HJhpkPxlDD7yV5z584KNulQ0F0fdCqCoFftz2GN4RoWMMiRXlltSY5x7AFup?=
 =?us-ascii?q?O1cykHxZA5yhPCdvCKbYuF7BL9WeuRPTp1mGxpdK+iixu87UWs1PDxWMe73V?=
 =?us-ascii?q?tLoCdJj9nCu3MQ2xHV98OJSeN981+81TuA1A3f8P9ILEApmabBL5MswqQ8mo?=
 =?us-ascii?q?cdvEnAGCL9hV/4g7WMdko+/+il8+Tnbavipp+bL4J7lh/+Mr80lsy7AOQ4NB?=
 =?us-ascii?q?UOXmeC9eS51b3j5Vb5TK9Njv0snanVqJHaJcIFqa6lGwJZz4ku5hWlAzu40N?=
 =?us-ascii?q?kUgGMLIVZFdR6dkoTkNVLDLOj9DfilglSslDlrx+rBPr3kGpjNK2LMn6v7fb?=
 =?us-ascii?q?Z68ENczAszzdZC55NbE70BJfPzWlfqtNDCCR85KQO0z/79CNphzoMeRX6PAq?=
 =?us-ascii?q?iBPaPXq1CH+vgvI+6XaY4bpTnyN+Ip6OLpjX88yhchevyP1IcXYXbwNfRvJU?=
 =?us-ascii?q?6UZX7rmJ9VF24WswE+RerhhVmGViR7aHO7XqZ67TY+XtGIF4DGE8qIibeA0S?=
 =?us-ascii?q?XzIdseXGdUG1uPED2gI4CNUO0LQCaTJNJx1zkFTaPnTJUug0L9/DTmwqZqe7?=
 =?us-ascii?q?KHshYTsojugZ0sv7WJz0Mb6CB0AsKB0mqEU2BzmCYySiQr2Lxk+BIlmFqY2P?=
 =?us-ascii?q?Q+g/NDCZpS//NMQkExMpuPh+B5CtWnXAXHc5/JTVu9WdypDHk3Sc552N4BZU?=
 =?us-ascii?q?txWp2igxnP0jDsAuoTkLqGV9Qv6qyJ+X/3Ko5mzmrekqwojl0oWMxKYGivjb?=
 =?us-ascii?q?R43wzSAZPZ1kCYj73scr4Tj2bW7GnW622IsQlDVRJoF6XIWXdKfkzNsdHw/V?=
 =?us-ascii?q?/PVZelF69hNgpH1N7HL6pScZvul1ofHqXZNd/TYny8lyKLPTjSl+neSo3sdi?=
 =?us-ascii?q?1d0T7UVA4EnBsPu3eeNQ0uQCympjCWCjsmDl/pb072ueBjtHO2SFM1xACWfi?=
 =?us-ascii?q?gDn/K0/BASn/mVV/IU2PoNpi4grzx+GFv10cjRDpKMoA9ofaMUZt115V5Mz2?=
 =?us-ascii?q?Xxsw17I4zlKqF6nRgZaQs22iGmnxR7B4NckNQ7+XYjzQ58M6WdgxtKczKV24?=
 =?us-ascii?q?y1O6WCczWiukryMuiHhxeHi4bFn8VHoO41oFjiogyzQ0c5+ikh09ZOzz2d/p?=
 =?us-ascii?q?XPHEwZVpeiNyR/vxV8ubzeZTEwoo3O0ng5e6y9uSXF89YoAvY1jxOhZ8wZN7?=
 =?us-ascii?q?mLXlyXcYVSF421JeomlkL8JBcNN/pV3Ko1Od62Mv6HwLXtO/xv1mHunSFM54?=
 =?us-ascii?q?Zz1ViJ/ix3R7vTx5gyxPecz1LdBQ3xh1qgrM373Lt8S2pKTziZzi7pTM5cfa?=
 =?us-ascii?q?QuO4YEEnvoItW3w8U4jJnoCTZe8xa4ClUK1dXhcAeOb1H7wQxb1FgGxB7v0S?=
 =?us-ascii?q?q+wTtuljg1r62ZlCXQyuXmfRADNyZFXm5nxVvrJIG1iZgdUi3KJ0AxkwC54E?=
 =?us-ascii?q?/h26VBjK9hNC/XQEFVb23zLnl5FKyqufvKYsJC7o8prTQCUOm4ZgP/KPa1qB?=
 =?us-ascii?q?8b3iX/WmpGkWlnJ3fw58y/zkE80TnNfz5poXHUeN9930LS/9WAA/5exSZART?=
 =?us-ascii?q?F4jCmRDV+5bLzLtZ2ZkYnOtuemWievTJpWJGPuxIiaswO/5Gt3EVi6nuio3N?=
 =?us-ascii?q?r9HkJptE2zn8kvTijOoBvmN8Pz0L+mNOt8YkRyLFTi8Ix+G4djgs41hYkLn3?=
 =?us-ascii?q?8Aid/GmBhP2Xe2OtJd16XkaXMLTjNe2Mbb1w/j3Fw6cyC5grnhX3DY+fNPIt?=
 =?us-ascii?q?m3ZmRMgnA28dsMDKaS8awBmCptuRy/tw2DOaEszAdY8uMn7Tshu89MvQMsyi?=
 =?us-ascii?q?uHBbVLQxtcPCrxh1GN7sil6qJNazT3fA=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0GNAAC0dbxefYpf+5RmHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgTYEAQELAYIkgWsDBAuNUodgJZtgDwE7BAEBhEQCgisGOQY?=
 =?us-ascii?q?OAgMBAQEDAgUBAQEEAQEBAgEBAQMCAQEBAQIQAQEWOjRgU4FHgUEsCQYDATu?=
 =?us-ascii?q?COykBg2IBAQECARIoPwULCw44VwY1hVwFIKQmAYEoPgIjAT8BDIEFiX6BNIp?=
 =?us-ascii?q?ygTgBjFUGgUE/gREzA4JaPopCBJEZAaFkBwOCTZg0HYJMAZp8r3QigVh9CIM?=
 =?us-ascii?q?lTAECAQIBDAECAgEBAQIBAQgBAQEBkEkXjiZDZwIGCAEBAwmPRAEB?=
X-IPAS-Result: =?us-ascii?q?A0GNAAC0dbxefYpf+5RmHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?TYEAQELAYIkgWsDBAuNUodgJZtgDwE7BAEBhEQCgisGOQYOAgMBAQEDAgUBA?=
 =?us-ascii?q?QEEAQEBAgEBAQMCAQEBAQIQAQEWOjRgU4FHgUEsCQYDATuCOykBg2IBAQECA?=
 =?us-ascii?q?RIoPwULCw44VwY1hVwFIKQmAYEoPgIjAT8BDIEFiX6BNIpygTgBjFUGgUE/g?=
 =?us-ascii?q?REzA4JaPopCBJEZAaFkBwOCTZg0HYJMAZp8r3QigVh9CIMlTAECAQIBDAECA?=
 =?us-ascii?q?gEBAQIBAQgBAQEBkEkXjiZDZwIGCAEBAwmPRAEB?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137621453"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa4.hgst.iphmx.com with ESMTP; 14 May 2020 06:34:57 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992798AbgEMWey4s5qZ (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:34:54 +0200
Date:   Sat, 2 May 2020 14:50:34 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
In-Reply-To: <20200428221419.2530697-5-natechancellor@gmail.com>
Message-ID: <alpine.LFD.2.21.2005021435100.3602499@eddie.linux-mips.org>
References: <20200423171807.29713-1-natechancellor@gmail.com> <20200428221419.2530697-1-natechancellor@gmail.com> <20200428221419.2530697-5-natechancellor@gmail.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:34:54 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to
 link VDSO
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132334541.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:35:09.9397
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 5a878f91-f5e9-4b40-f0d2-08d7f78de4ec
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.154.42;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa4.hgst.iphmx.com;PTR:esa4.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(4744005)(107886003)(82310400002)(86362001)(6862004)(7636003)(7596003)(6666004)(54906003)(26005)(356005)(4326008)(33440700001)(42186006)(5660300002)(1096003)(8676002)(34756004)(336012)(8936002)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT044.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 5a878f91-f5e9-4b40-f0d2-08d7f78de4ec
X-MS-TrafficTypeDiagnostic: BN6PR04MB1123:
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:35:09.6918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a878f91-f5e9-4b40-f0d2-08d7f78de4ec
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.154.42];Helo=[esa4.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB1123
X-MS-Exchange-Transport-EndToEndLatency: 00:00:03.6687989
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EQtjhGjj2AN0kWWQosGRCB39IOcxOF6PPgT9fLS74EENe6DgFvy4EUa7MOtA?=
 =?us-ascii?Q?hCwImUc2MlEKLWwDWWnrPrSp5+BThYk8JDE272nXYhtCEIlQZ9LKrZK2b5/h?=
 =?us-ascii?Q?cc7HKXvxm9LLCWYPhN9GcryrMJlGoE1Z1vk8gG6otH9Ko/ZuzZA+LDfkfsAT?=
 =?us-ascii?Q?v6oAzW9fHq/Ip/+t9jPts7X6zt0+Z1wmLNkgmYY5by8b4es8xY1Led/lvNMp?=
 =?us-ascii?Q?7KUSZAk5CI1BSKjnNqoC9psqP78SSLknFjg6BlTLAyKUSntYhBAZk+vUYSg9?=
 =?us-ascii?Q?fYfaxITEX2W7dHVkrSlxokSkzRAG8z8Z/MlIMwwZ5OkKeYNQjYjJbTpbm1Ts?=
 =?us-ascii?Q?KNZFe69puiSurdgAN1UCukxPSKall64ZM14OBoyf2kZgniQUmVR3WivGlecs?=
 =?us-ascii?Q?JdP/8gbdCh/jgaXIUlzA8y3BSigU7H6nFMDQm/fSYeuatNwTT1ZXuU6HqCmh?=
 =?us-ascii?Q?oDMkmBVzD2+D/lGCWBKAj8M5+yghb0HCX4Y2pbGvSkW3lNImwsS56+pmM7bA?=
 =?us-ascii?Q?2XbZ3jpxmnlmlmLlrFTc7fAhWIzSY91/PClo9uVo6FLqO1dJurtYwLIULxAW?=
 =?us-ascii?Q?lGFSBXIHkkWpFdt1b+SFVVzHjWGet8pusYSWXpMv/dVwntYUhK9TVeRRepBe?=
 =?us-ascii?Q?JQxwAhiR3wIvyfJGLVADWmhzkybxp1ppTwNh0+CwLdCJDt7aW5T8gpmedYqu?=
 =?us-ascii?Q?cnEMuanBfT5qfdvG8Vxmd1DssXHgH7LhKn8+gwChlBtNSDKIDJFolDui99lb?=
 =?us-ascii?Q?1mElVwWOXel3Ix37sn8XCSz8n6Vg3sz11AFDAbaBZKqjjOBDXjMbLdVJJOtf?=
 =?us-ascii?Q?AEf82Nb0Cib3iqTZp0NR7+ZUBrIF6/47208LXIoqnmJk1GwJ97tqXbccBMdJ?=
 =?us-ascii?Q?usYX4tu3taiCXzZwe5+BSTHrLV7r2b6cCTQJ7NMScc7JICFLnYrDhAPHPGrC?=
 =?us-ascii?Q?SRvEc8g5/03SmBw2MHMZkdApLEqfKAK5hAOLO2ZFYIIS+dEacZU18uoStMhq?=
 =?us-ascii?Q?SzV03jsFOjM6ONd50VnxyG6T/3RHxebEx2mvq6/kzVub5AlwNERLnLpLI7/z?=
 =?us-ascii?Q?m8TISSh9XxUh9H3LGb/QXyw4nc/W6JvAf/dwETPjnYITjpKsgcndbSUmTGSE?=
 =?us-ascii?Q?0kP/5Vcn8jS71bG/qHqSHWVDVbp5DJGRUCfalneIgCLl58U6/KzjjIds6ZAE?=
 =?us-ascii?Q?PTeYIkdoNvZ2x4coWJXWyuUWu5OVhmiPzhmZSwo/YjQj06VuHTUyvi77yrlR?=
 =?us-ascii?Q?axgYxoI7xyi+ni4Gj1O1M6btAJYfPsLAN8TbgMcukqiao2lUYpledkNziwNO?=
 =?us-ascii?Q?97viIq02yuHZKVejYzcEn9CSwj+UiGr8OVKWVqi4lrOXfic1ca3njhyFYWK/?=
 =?us-ascii?Q?nu9Wdt0=3D?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 28 Apr 2020, Nathan Chancellor wrote:

> Before this patch, LD=ld.lld did nothing:
> 
> $ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
> String dump of section '.comment':
> [     0] ClangBuiltLinux clang version 11.0.0

 What does it mean "did nothing", is `arch/mips/vdso/vdso.so.dbg.raw' not 
produced?  Where does `arch/mips/vdso/vdso.so.dbg' come from then?

  Maciej


