Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40FD11D221F
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729917AbgEMWhH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:37:07 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:62244 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgEMWhG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:37:06 -0400
IronPort-SDR: Eo6h2K3vQvqaPxorUSaqny1wMp8KfptcVN/jsz+v6FgcAu6MKLzNtxZ09/PkGY8qfpj9m+ZcYt
 dT8kwWAnPFm6MhMCEAvxKiNkyTqKflLR7VgItCxZXBeGTMy0ieFe7rkEkwnETdjTyZ9jzuGlQa
 z1ODp7qCAxjzvBOALd9EP5duAzqw3u7rYCHSzHS0svhaTLoYhP9WSej4zPhXfMiz8g42EwUUzE
 hbUhgyAcnKCmltT0x2+kRvLUxJBHMXInarGlS+JXneCo3NGuCGF967KKo1xozVPZCkA6B2kdnw
 hrY=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137621610"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:37:05 +0800
IronPort-SDR: gftozH7j1MFWity66YQACpDdWtK7h/4QaOPMsW0dbnYJtAafqJ8kLnNRDb9cPZCLJgzlRvxl9y
 3QbQW6sW0tyXvX8V7m5XAM0oEgXuEOixQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:27:19 -0700
IronPort-SDR: cHomWiaGs3C+XUXVUpOLyvwXlJnQi3W49MfFkHmxIrdTPfEs/uXIulFs5OTJQrgtW0JesK2DZj
 i78zybzzLo/A==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:37:04 -0700
X-Received: from SN6PR04MB4928.namprd04.prod.outlook.com (2603:10b6:a02:a8::40)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BYAPR03CA0027.NAMPRD03.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:34:03 +0000
X-Received: from BN8PR15CA0028.namprd15.prod.outlook.com (2603:10b6:408:c0::41)
 by SN6PR04MB4928.namprd04.prod.outlook.com (2603:10b6:805:9d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Wed, 13 May
 2020 22:34:01 +0000
X-Received: from BN3NAM04FT037.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::7f) by BN8PR15CA0028.outlook.office365.com
 (2603:10b6:408:c0::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Wed, 13 May 2020 22:34:01 +0000
Authentication-Results: spf=none (sender IP is 216.71.153.141)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa3.hgst.iphmx.com (216.71.153.141) by
 BN3NAM04FT037.mail.protection.outlook.com (10.152.92.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:34:00 +0000
Authentication-Results-Original: esa3.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: GhPcoY2ZAFrFu1uC2ELxmX9RFQAOIEqVWx56kzuGmzf87WzuXkAIHJEHbGBYVuTbyjAvSGAWTv
 jq8bgUFt+qIcx+vGOLziKTwQSSlfwfHl/2WUr4y+6EnV7QEUyp1jg3nmFASrTonXm5kivRX7jY
 +3jwBcyXnG4F/mwb8Iyr69onT3vJFHs5mF5xZFkDhAmjEZsNsM5gg/xyaViG+1iX8DObuuJOfS
 ywEzJzjYWbz7TR4D2pxJtXcieqW1oIIbr2huJmvYOqV0ke3UsgzU9u17k8gRnF/UJ5B7GYN0VR
 4QfsxFs2GthEw7nQt1G/MBYI
IronPort-PHdr: =?us-ascii?q?9a23=3AP7KCgBWJAm41fFzz7iZ8HZjAYl3V8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYbBCBt8tkgFKBZ4jH8fUM07OQ7/m9Hz1dqs7Q+Fk5M7V0Hy?=
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
 =?us-ascii?q?iBPaPXq1CH+vgvI+6XaY4bpTnyN+Ip6OLpjX88yhchevyL3JIHdXbwL/1gLA?=
 =?us-ascii?q?3NY3vlksoHV3YDuAUWQuj7h1qLTXhYYHPkDIwm4TRuQqevBobORMiSxvS72z?=
 =?us-ascii?q?WqFZ5XLCgSD1mHC3DAc4SCRudJbSOKOYlmiDNSBuvpcJMoyRz77Fyy8LFgNO?=
 =?us-ascii?q?eBv3RA7ci5hvFo++3ekw0z/jVoDsOblluAVHxwgnhRGWdk0bt2+gp9xUyfl6?=
 =?us-ascii?q?lgg/lIU9dU4qABXgQ7MMvayOp3Q5D3Vxnad9iEAFChXp29AD43Q95wi98Dak?=
 =?us-ascii?q?pwAZOj2xbE2Sf5S6QNmemtA5o5urnZw2C3Is98z3jc06x0ilAtWMxnMWygm7?=
 =?us-ascii?q?468gnLHMjOiUrK372ye/E62yjAvHyG0XLIvExcV1toVr7ZWHkEekbMhd/n/Q?=
 =?us-ascii?q?XGTrmzGfEiMxNaj8mYJfIQOOfkhlhHWvrvfe/mTTjgwTWWAhCFjvOBd4OxPW?=
 =?us-ascii?q?USxzmbCVAElhBV9nGDZ0A4AW+6rmTSASYmHE/zY07q7eh1qW+qKy18hwCMYU?=
 =?us-ascii?q?p70rOp+xkTzfWCQvIX17gAtW8vsTJxVFq62tvXDZKHqUJkda5GZvs54VFaxS?=
 =?us-ascii?q?fcthRmeJu6IOEH5BZWcgh6uV/vywQiD4xBlcYwq3Z5hAF2KK+ezBZAb2bBgc?=
 =?us-ascii?q?C2YOCObDivukn0O/2zuBmWytud96YR5e5tpk7q50epGVE+tXR/09xFlXCb48?=
 =?us-ascii?q?avbkJaXJTvX0Iw7xU/qavdZ3x34orfz3pENaiyry+H3tMxH60i0BnqLLI9eO?=
 =?us-ascii?q?uUURT/FcEXHZ3kLeUhgV+BahMCIfAX8a8sJIWhbfTMi+a7ee1nmjyhl2FO5o?=
 =?us-ascii?q?twh1mU+R17TOrZhsxX+fyT0wqZWju5t2+P6Zimy6ZDYzxaXmekwHOiBIFKeu?=
 =?us-ascii?q?tzZYYOGSGlJMjljtN5z4XgXXJV7haqGk8G1cm1eBGTc02Yv0UY1EIZpmaikD?=
 =?us-ascii?q?e5yDo8mi8gr66W1ijDi+r4cx9PNmlOTWhkxVDiROr8x8gdR1StZhM1mQGN7l?=
 =?us-ascii?q?jhgaxaorlvamzSWVwOeDL5biljXqa2qruecptP5Zcv4kA1GKy3ZVGXTKK4og?=
 =?us-ascii?q?NPin+zWTEDnXZqKnfz4cWq1wZ3g2+cMntp+XfCcJo2xRjE+JrdXf5UznwNQy?=
 =?us-ascii?q?wr7FufTlW6IdSt+s2Z0pnZteXrHWeoXYdUWS3qy56Q8S66/XYsBgew1aPW+J?=
 =?us-ascii?q?WvAU0h3Cn32sM/Hz3Ptwr5a5L32r6SOvx8OE1pAkLsrs97Apo4lZE/zsJ1uz?=
 =?us-ascii?q?BSltCe+nwJln32ONNQ1PfldHQ6QjgP0oeEsjig41VqKzey/6y8U3ycxsV7YN?=
 =?us-ascii?q?zjPDES2yQg/4VPCb+Pqrteknkt+wfqnUfqefF42wwl574u5Xod2blbsxQ2iC?=
 =?us-ascii?q?GcBK0CWExZJTeqkA6HvYiz?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FhAwBDdbxefYpf+5RmHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQIFHgiWBawMECyyNJodfJZtgDwE7BAEBhEQCgisGOhMCAwEBAQMCBQE?=
 =?us-ascii?q?BAQQBAQECAQEBAwIBAQEBAhABARY6NGBTgUeBQSwJBgMBO4I7KQGDYgEBAQI?=
 =?us-ascii?q?BEig/BQsLRlcGEyKFXAUgpCYBgSg+AiMBPwEMgQWJfoE0inOBOIxWBoFBP4E?=
 =?us-ascii?q?RMwOCLC4+ikIEkRkBoWQHA4JNmDQdnUmvdSGBWH0IgyRNAQIBAgEMAQICAQE?=
 =?us-ascii?q?BAgEBCAEBAQGfBkMwNwIGCAEBAwmPRAEB?=
X-IPAS-Result: =?us-ascii?q?A0FhAwBDdbxefYpf+5RmHQEBAQEJARIBBQUBQIFHgiWBa?=
 =?us-ascii?q?wMECyyNJodfJZtgDwE7BAEBhEQCgisGOhMCAwEBAQMCBQEBAQQBAQECAQEBA?=
 =?us-ascii?q?wIBAQEBAhABARY6NGBTgUeBQSwJBgMBO4I7KQGDYgEBAQIBEig/BQsLRlcGE?=
 =?us-ascii?q?yKFXAUgpCYBgSg+AiMBPwEMgQWJfoE0inOBOIxWBoFBP4ERMwOCLC4+ikIEk?=
 =?us-ascii?q?RkBoWQHA4JNmDQdnUmvdSGBWH0IgyRNAQIBAgEMAQICAQEBAgEBCAEBAQGfB?=
 =?us-ascii?q?kMwNwIGCAEBAwmPRAEB?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141968372"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa3.hgst.iphmx.com with ESMTP; 14 May 2020 06:33:58 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992669AbgEMWdz7EnZt (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:33:55 +0200
Date:   Thu, 23 Apr 2020 01:10:12 +0100 (BST)
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
In-Reply-To: <20200422143258.1250960-1-jiaxun.yang@flygoat.com>
Message-ID: <alpine.LFD.2.21.2004230036480.851719@eddie.linux-mips.org>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com> <20200422143258.1250960-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:33:55 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH v5] MIPS: Truncate link address into 32bit for
 32bit kernel
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132333550.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:34:00.5913
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 408bc665-ea27-486f-5ddd-08d7f78dbb97
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.153.141;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa3.hgst.iphmx.com;PTR:esa3.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(42186006)(86362001)(6666004)(107886003)(8676002)(8936002)(7636003)(1096003)(26005)(336012)(7596003)(5660300002)(356005)(82310400002)(4326008)(6862004)(33440700001)(54906003)(34756004)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT037.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 408bc665-ea27-486f-5ddd-08d7f78dbb97
X-MS-TrafficTypeDiagnostic: SN6PR04MB4928:
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:34:00.3274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 408bc665-ea27-486f-5ddd-08d7f78dbb97
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.153.141];Helo=[esa3.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4928
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.8582528
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qH0emqJ8qivLQV22TmquxgnpEgm67f1Smw5P4WUdl5tWOk7JB5gy689WIkXa?=
 =?us-ascii?Q?EtWC+pSJhyPxmPy5oeFzWQYmc0/WBhCsygWqJ+/1va4TlBAopz2rgGB9iBg6?=
 =?us-ascii?Q?beq8ASb7PkpnU5JuDnTyRy+QmWnU/VbsuIqmM4PAbb8tOqg41nOtM/TAAQ7X?=
 =?us-ascii?Q?3JgkPqHjPcb74uteQoFPbL9tZwVhkt5FpoiANNCn1Ac73qCL3ZEiHJYaCopD?=
 =?us-ascii?Q?qXQihmG++f9MMlf5BMqUvv1EvgfjDJ9ur8hVuius+vE0c4x+yc78aocxbQaD?=
 =?us-ascii?Q?ObQW4ms+9tEDE3KmM+dJyMMBYiS1FE5qyZHowd5ckbmDvb5LP2LgsW1U42gh?=
 =?us-ascii?Q?Z9qbRGpNGYmSDH1+1rnxA2abS/uKSedWkBhszD/lQEdzDg2wb/grBYW4lEEd?=
 =?us-ascii?Q?aLAQExFasLl41vfqAR133NWeTb4bEy7pe29sDZIFCOuIxsDmdCG577/ArzwT?=
 =?us-ascii?Q?nEgxYcxo8speAMJXXLIKYoclC2+LmTtdo8qO2WMCkSEgbwWG/JiXIZsldFTf?=
 =?us-ascii?Q?Cm5ZY49moALHx4SWmY1vPiyTplbYre+qfYDODIupN8L6LS4PYqu40ybWKPv5?=
 =?us-ascii?Q?d+ogI0Vs1Wq87HTmkks0Buy25JCWeY/3G0WnDcUbyXRfG3UBqrrBL99hGlSw?=
 =?us-ascii?Q?euTO/RnzcGdD8iOGyPAsvSs4VN0mfe7CeonN2y9OsRFbASBhML6+l9yvxCF/?=
 =?us-ascii?Q?vzEB176K1T4h1CMYS94V7/VU3NcYAbg/z24sENFwoLnvo6Ofl8pDvBncPTqG?=
 =?us-ascii?Q?LyQJhelxPRCo8HahWh+S85JPynehEL9Wk/qtqxEhoXfz5CJR2VNiu/nhmL4j?=
 =?us-ascii?Q?n6byeKmuthOll6pkzW4KXqObiZbsSgT7LRIzp1ZsFerZD9A62V9LnSBc9o/j?=
 =?us-ascii?Q?A1Ob4k9pWoFuMi69qhxs6cjH+mO9TRiLwDSwHc1PXSr2GRSe/YiDhXrLpNwj?=
 =?us-ascii?Q?CsooPprTDo9oswwpucJtIRrEXSQ9RuZeH/7rVHzttpEu6lscopJoTmyzSKcs?=
 =?us-ascii?Q?ic5mBtFJuA17CGbJRnDwKxBIVKNULEHEJIyQ8jrGw774I8yu1p0a46+KlVDT?=
 =?us-ascii?Q?xVkkT8lIhaaAyZ/FT7dXVdakgRNZytWrjTvtSfE6Cu4Dc6Mww3g/B4UuTg1X?=
 =?us-ascii?Q?qYLnqEGcy5XlzO2kBj3Cl7cWIFG8VlpfMPnHD+K07efGGzf2Cau/rR5OUStY?=
 =?us-ascii?Q?PAMcyRhHRpdWwNyJCcSFwQYPPAyiLQcfBVJEszHFyZwYL1gj9WCv/rS2pZgI?=
 =?us-ascii?Q?Hf1c1izwKvEDOykvgbJw80mmvVgyRG7t1DPtQ32yiWIGf8pb7RHYYonbllu7?=
 =?us-ascii?Q?loQPqqkMJam7bc6meMEyP5OADRXtw3hJznkkDnBu1QVpyFm7W45FzuRasyMV?=
 =?us-ascii?Q?yYWwfOA=3D?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 22 Apr 2020, Jiaxun Yang wrote:

> Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>

 Hmm, that was for an earlier version of the patch, and reviews obviously 
do not automatically carry over to subsequent versions, as it cannot be 
claimed that they are as good in the reviewer's eyes as the actual version 
reviewed was.

> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index e1c44aed8156..68c0f22fefc0 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -288,12 +288,23 @@ ifdef CONFIG_64BIT
>    endif
>  endif
>  
> +# When linking a 32-bit executable the LLVM linker cannot cope with a
> +# 32-bit load address that has been sign-extended to 64 bits.  Simply
> +# remove the upper 32 bits then, as it is safe to do so with other
> +# linkers.
> +ifdef CONFIG_64BIT
> +	load-ld			= $(load-y)
> +else
> +	load-ld			= $(subst 0xffffffff,0x,$(load-y))
> +endif
> +
>  KBUILD_AFLAGS	+= $(cflags-y)
>  KBUILD_CFLAGS	+= $(cflags-y)
> -KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y)
> +KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y) -DVMLINUX_LINK_ADDRESS=$(load-ld)
>  KBUILD_CPPFLAGS += -DDATAOFFSET=$(if $(dataoffset-y),$(dataoffset-y),0)
>  
>  bootvars-y	= VMLINUX_LOAD_ADDRESS=$(load-y) \
> +		  VMLINUX_LINK_ADDRESS=$(load-ld) \
>  		  VMLINUX_ENTRY_ADDRESS=$(entry-y) \
>  		  PLATFORM="$(platform-y)" \
>  		  ITS_INPUTS="$(its-y)"

 Hmm, to be honest I find the nomenclature confusing: VMLINUX_LOAD_ADDRESS 
and VMLINUX_LINK_ADDRESS sound like synonyms to me and also look very 
similar, so I expect people will be confused and scratch their heads in 
the future.  Due to the obscurity of the problem I think there is little 
room for manoeuvre here really, but how about using LINKER_LOAD_ADDRESS 
for the new variable?

 Alternatively, have you made any attempt to verify if actually replacing 
the setting for VMLINUX_LOAD_ADDRESS would be safe?  Glancing over its use 
there do not appear to be many places.

  Maciej


