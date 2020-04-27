Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B1C1D2222
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbgEMWhr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:37:47 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:20913 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgEMWhq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:37:46 -0400
IronPort-SDR: V5ykAIPPoiHZiKg93T4kAy86McJcfgSS+TOnQ8Ja0McSE+RvYl8WNWjWoT7LjZ0fMfxoK4An+T
 D4ZKkjlCASVmuAcd/wkqHLVq22UE5J5fPIQ82zjyLED/gg1Puf7K8jZjPBLZ1+gmzGm76RMkaF
 WgIp68qatX/WMBuqGJ2AHLy66I2bU0NK9LgSNPMXSyqz5l6TVX+OiU9WZDWgzPgduLirjj/a9h
 MNjUcoiC/NaCRy+kFonHoHgjTKxBmtkHdAV0v0QFtzlNfxjAaKEgjX5khvGXE0/TIsP0cReRPB
 jFM=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141968597"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:37:46 +0800
IronPort-SDR: vyzlqF156OoLL/tEbPQAHSEJ1IDbNUAItI2PGJMYL/0Tx+1+IG4PWzl9m3uRSqYxr106zi0ybY
 aRCNzL6dqMUWMt629vN+hmQg9QcSLSNfQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:27:59 -0700
IronPort-SDR: RKMADEH+PuSaVOKs1mn/QDrsgRkgH1ayVVMaFwdwaPn21VW6zDheCTeGbZA8nSoIeyeoJgAfQv
 BF1lY5q1bdGQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:37:45 -0700
X-Received: from DM6PR04MB4905.namprd04.prod.outlook.com (2603:10b6:a03:217::23)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BY3PR04CA0018.NAMPRD04.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:34:04 +0000
X-Received: from BN6PR19CA0089.namprd19.prod.outlook.com (2603:10b6:404:133::27)
 by DM6PR04MB4905.namprd04.prod.outlook.com (2603:10b6:5:15::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30; Wed, 13 May
 2020 22:34:03 +0000
X-Received: from BN3NAM04FT055.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::fa) by BN6PR19CA0089.outlook.office365.com
 (2603:10b6:404:133::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24 via Frontend
 Transport; Wed, 13 May 2020 22:34:03 +0000
Authentication-Results: spf=none (sender IP is 216.71.153.141)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa3.hgst.iphmx.com (216.71.153.141) by
 BN3NAM04FT055.mail.protection.outlook.com (10.152.93.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:34:02 +0000
Authentication-Results-Original: esa3.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: MBSG9vhaTCBDyFhws5Q1P6ceaiH5VwEep+BRTeeDWXmdtg9PjFMd5DmLEdHuSBJME0agn9EyGi
 i+lk11PE4F+FbwvpUy8RoTm2WiOrVt4mD4O7YzZQf+EgU8k5HCPFUfF4acXldCojd7rha9uwol
 nxRLM89bYjhHB9U+6NnwWUX4CiBAPBoJ1tYTC9uWalbvkBr3EoshjToh5fQ0EmrnIv0CE9SigR
 8qkWo9J7bIdGabaWk9IuCT6DvYNlfLvrQqjn+Bg7MCmkJPB8p8bLXvBrycZGypv+7+slAmTqUP
 VX89xP76wj4blq+WyCF/PED1
IronPort-PHdr: =?us-ascii?q?9a23=3AVN7VGBfjziyPtnsw881ij9QVlGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxcS/Zx7h7PlgxGXEQZ/co6odzbaP7uaxBCdYsN6oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vLBi6twHcu8kZjYd+Lqs61w?=
 =?us-ascii?q?fErGZPd+lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q6VAADspL2?=
 =?us-ascii?q?466svrtQLeTQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUj?=
 =?us-ascii?q?ms86tnVBnlgzocOjUn7G/YlNB/jKNDoBKguRN/xZLUYJqIP/Z6Z6/RYM8WSX?=
 =?us-ascii?q?ZEUstXSidPAJ6zb5EXAuQPPehWsZTzqFkNoxuwCgajGPjiyiNUinPqwaE2z/?=
 =?us-ascii?q?gtHR/A0Qc9H9wOqnPUrNDtOascVu661rXHzTTdYPNUxDzy6JLEeQ09r/GLXL?=
 =?us-ascii?q?NxcdbeyUouFw/Lk16dronlMCmJ2eQXtGiW9O5gVeOpi246pAB9uz2vxsY0io?=
 =?us-ascii?q?nSnI4VzUrE9SpgzYszONa3R1J1b8S+H5tMqyGVKZF2QsU6Tmxouys3yb4Lt5?=
 =?us-ascii?q?G6cSUO1pkq2gPTZuKEfoaI/B/uVPqcLCtmiH54Zb6yiQq//Va9x+PyWcS50V?=
 =?us-ascii?q?hHojdFnNTPq3wA0QHY5MufSvZl40us1jWC2xrN5uxEPEw4j67WJp47zrItmJ?=
 =?us-ascii?q?ceskLOFTLslkrslq+ZbEAk9/Co6+v5ZrXmoYeROJNqigHlKKguns2/AeIlMg?=
 =?us-ascii?q?kBRmSb/OW81KX4/UHjR7VKlPI2nrHYsJDcO8sbura0DxJa34sg8RqzETer3M?=
 =?us-ascii?q?kCkXQDLF9JYg+LgobqNl3WJfD3F/a/g1CikDdxwPDGO6XsApDXIXffirfheq?=
 =?us-ascii?q?1w60pdyAo10NBe6ItYCrQAIPLrQU/9rtvYDgU2MwCs2eboFM191p8CWWKIGq?=
 =?us-ascii?q?KZNbndvkOS5uIoOOSNapIatyrnJ/c54P7uiCxxpVhIW6C13ZIRIFu4F/JtLk?=
 =?us-ascii?q?GdZmCk1tEIDWoBvgM4R+HujFqYeTFWbne2Gak742doJpihCNKJY4mmgbGDlB?=
 =?us-ascii?q?j9VqdRdHFNCVHGWSPtfo6eXN8IaSSPMopkkyQfE7+7RNlyhlmVqAbmxu8/fa?=
 =?us-ascii?q?Lv8SoCuMemjYAtvbeBvAwu9TFyE8WW2n2MSGcxpG4TWjsqx/kh+R5w0V7Yl6?=
 =?us-ascii?q?h3mOAeFMRT4uMPWQA/ZtbQzO1/Xtb1XA+JPtKEU02vTdjuBzYtBskwzNkDbw?=
 =?us-ascii?q?c1G9irgh3ZmSv/BbgTmu/DH4Q6p4Tb2XW5PMNh0zDD3aglgUMhR55KPGa8gY?=
 =?us-ascii?q?Z79g7OF8vMkl2C0aGwevdUxzbDoUGEy2fGp0RESEhwXKHCCGgYfVfTpM/l61?=
 =?us-ascii?q?nqRKG1T7AmNBZRjMuDMrAMbcfm1A8UfvroNdXAbm70oF+eX0fSlJWLaoeiO2?=
 =?us-ascii?q?gG1X6bCEcfj0YS5XaDJU41ASLz62TZRCdjE17ieQvl7PV+pXWnT0Q10xDvDQ?=
 =?us-ascii?q?Up1ry7/QQQjOCdTPVb16wNuSMooTF5VFin2NeeB92FrgtnNKJSKdY0601A/W?=
 =?us-ascii?q?bYsRFte5mhN7skgUQRMmEV9wvv2xhxFoRcgJ0vpXIuwhB1LPHQ21dAejWEmJ?=
 =?us-ascii?q?Hob+SLei+ooUnpOvOQgwqOg7P0su8V5f81qkvuplSkDUN5tXVoyMUT0mOc44?=
 =?us-ascii?q?WMBw0XAveTGg468QZ3o7bCb2wz/YTRgDdpOKKutRfG2tQ0FK4gyw67OdBFP+?=
 =?us-ascii?q?nXcW26W91fHMWoJOEwzhKsZxkeO8hW9agpL4ajduOdnqmxM6wz1CLjhmNB7o?=
 =?us-ascii?q?dn10uK/CcpUfbG6JEDx+DBhFm9WjzxjUmsvoXMoa4fPWBAOG25xGCkCZVYPe?=
 =?us-ascii?q?tycp0XT2a2I8ingN55gsylXXkQ71OlC14ckMa0ZRqfaUD81gxMxCF16TSmny?=
 =?us-ascii?q?W/1Tl9jzAuqOKWwiXPx+3ocBdPNHRMQSFuilLlII78iN5/PgDgdw8yiB6s/l?=
 =?us-ascii?q?r33YBQur85K2jVXFcNeinuNCdlSKTx/ruObshT6Y855CVaVOPvBDLSArX5oh?=
 =?us-ascii?q?Ycz2biBz4HmGB9LWzz/MSk2UUh2DHVNnt4oXvHdNslyAzWv5rcSuVNmDseRC?=
 =?us-ascii?q?xozzLQAwvZXZHh8NOKmpPEqu37WXimU8gZdCDg14SosCq9+H0vBBynhLa0gN?=
 =?us-ascii?q?KtQm1YmWfrksJnUynFtkO2eo7wy6GzKv5qZGFjGkS678t8B5E7l4oon9cXw3?=
 =?us-ascii?q?dQ1fD3tTIX1Gz0N9tcw6f3anEAECUTzenS5gz0gRAxHjey34v8E06l7I5hat?=
 =?us-ascii?q?29ODtE0TwmqcRLDrqEqblFhTAzpUC3/1qIMKpN2wwFwP5r00Y0xuQAuQ4j1C?=
 =?us-ascii?q?KYW+5AGUheIDypkhWQ9Ja5tqoFPGs=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0HOAABDdbxefYpf+5RmHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQIE2BQELAYIkgWsDBAuNUodfJYEBml8PATsEAQGERAKCKwY5Bg4CAwE?=
 =?us-ascii?q?BAQMCBQEBAQQBAQECAQEBAwIBAQEBAhABARY6NGBTgUeBQSwJBgMBO4I7KQG?=
 =?us-ascii?q?DYgEBAQIBEig/EAsOOFcGNYVcBSCkJgGBKD4CIwE/AQyBBYl+gTSKc4E4AYx?=
 =?us-ascii?q?VBoFBP4ERMwOCJTU+ikIEjkKCV4lamAsHA4JNjiCKFB2dSa90IoFYfQiDJUw?=
 =?us-ascii?q?BAgECAQwBAgIBAQECAQEIAQEBAZ8GQ2cCBggBAQMJj0QBAQ?=
X-IPAS-Result: =?us-ascii?q?A0HOAABDdbxefYpf+5RmHQEBAQEJARIBBQUBQIE2BQELA?=
 =?us-ascii?q?YIkgWsDBAuNUodfJYEBml8PATsEAQGERAKCKwY5Bg4CAwEBAQMCBQEBAQQBA?=
 =?us-ascii?q?QECAQEBAwIBAQEBAhABARY6NGBTgUeBQSwJBgMBO4I7KQGDYgEBAQIBEig/E?=
 =?us-ascii?q?AsOOFcGNYVcBSCkJgGBKD4CIwE/AQyBBYl+gTSKc4E4AYxVBoFBP4ERMwOCJ?=
 =?us-ascii?q?TU+ikIEjkKCV4lamAsHA4JNjiCKFB2dSa90IoFYfQiDJUwBAgECAQwBAgIBA?=
 =?us-ascii?q?QECAQEIAQEBAZ8GQ2cCBggBAQMJj0QBAQ?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141968379"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa3.hgst.iphmx.com with ESMTP; 14 May 2020 06:34:01 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994953AbgEMWd4fDP9c (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:33:56 +0200
Date:   Mon, 27 Apr 2020 17:22:53 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
In-Reply-To: <20200427020830.GA260@Ryzen-7-3700X.localdomain>
Message-ID: <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org>
References: <20200419202128.20571-1-natechancellor@gmail.com> <20200423171807.29713-1-natechancellor@gmail.com> <20200423171807.29713-3-natechancellor@gmail.com> <20200426162737.GA9322@alpha.franken.de> <20200427020830.GA260@Ryzen-7-3700X.localdomain>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:33:56 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to
 link VDSO
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132333561.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:34:02.8964
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 3d837747-3c20-4bcf-f41d-08d7f78dbcf6
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.153.141;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa3.hgst.iphmx.com;PTR:esa3.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(356005)(33440700001)(54906003)(82310400002)(42186006)(86362001)(6666004)(34756004)(7596003)(7636003)(336012)(107886003)(4744005)(6862004)(1096003)(8676002)(26005)(5660300002)(8936002)(4326008)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT055.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 3d837747-3c20-4bcf-f41d-08d7f78dbcf6
X-MS-TrafficTypeDiagnostic: DM6PR04MB4905:
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:34:02.6329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d837747-3c20-4bcf-f41d-08d7f78dbcf6
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.153.141];Helo=[esa3.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4905
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.1967884
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gWEjU9gioRgq0RGX6Q9U7q9PNAK5CP6SBwXSXrkIsDtmKaOIqBXmTIvs4MbQ?=
 =?us-ascii?Q?MKAMKATrUMa/NMLkBxM4MIhZFtqveZGrxUY6jHYv1zEg30BLTQrk6/Dfub1g?=
 =?us-ascii?Q?75TUSFHMKhcjtEon09cISLfoIlSflOTFp180+DvPBbp9NsF6FCcTQeWJMU7J?=
 =?us-ascii?Q?EFo6SmPwqqm21CHYUqDtAmg3NODjua4GZVdErtJN3+WtcNN1XP1iaCz4tLh9?=
 =?us-ascii?Q?rXuEeb3D6uEHG0n/UYibCw2qs724zyfd/3WmihQJawuF8kozMEESEGoz05kk?=
 =?us-ascii?Q?cUNEpyQwvLZ1afregS7HgVLKtGKR6jjij04eQbBh7dIxVKMSUB9XEHFkA+p6?=
 =?us-ascii?Q?3ZSHQOsNFEv7a5wPW/0Ns0/wVpnjGUUtX88Hyrpic6eYE0OhtMk/D5LyutWj?=
 =?us-ascii?Q?LjJB+mT+aVZFJIfZ7qgLkChVELSKzdW5RUjItT/tSPzWKq35bEvlITvk66uq?=
 =?us-ascii?Q?+rvqIHlswcTeaWu1UbXvGznlOwB3L4M01XdRduts+tw1IZ0Fy7WDB9528ggm?=
 =?us-ascii?Q?0LnCB4C1j4iBVK2S8HnO/P8WLUpC+QOASWQvF2/eN8aCVW9oNZyFlzH8BaKr?=
 =?us-ascii?Q?soOFHpABPhTw6L1OARu3l+TMCwfisEIOVPoG8jmjp859JUGCpLmdZ1HN7z0/?=
 =?us-ascii?Q?txjLLMoPxPxAfbocE4gpfnHJ2GuWXaK5pivt8bJPTTryvMZJHrH0GlBfSwzF?=
 =?us-ascii?Q?EhLgnQkGB8JTPF4Cc/pLIA+djJiW6Qdsli0MaboirWq5LL5G6Nv6oMqAJWRH?=
 =?us-ascii?Q?yUMMZx7a+SKyc2SSs9O4oVcGMJE45j6yC1G8wj/kd7XerFtCCytqL2wwO4SL?=
 =?us-ascii?Q?21Pxetkp6aR0yIJsV2YkWppe2wwTjYuGsaCi+4yKVONMPpzLEdRKvkWrkYYm?=
 =?us-ascii?Q?1Ft2B/KZckod+05zO/p2cLMhzwMYgpd7o7vDLWfzyz2pzuyAZ//3C1YRQ+Pp?=
 =?us-ascii?Q?HR6F8UGzngY5vA0/VJybR/sBvnCAAQp5enEwtaivlzQ1OYklnvaRqmwpMcSl?=
 =?us-ascii?Q?n+KJjY237tXn85WReWooRBZafSpA9Kc3t9FobqfiLRTI/qZ4RTxsw1ndqSgB?=
 =?us-ascii?Q?546b9rkjXBd1XMlSgHF2umP/bqG/AgWwrKHrZpFyXPx4aI6XKyYIslquvS1B?=
 =?us-ascii?Q?/V1DlSW85xoXIVykxYqHG2ZroDlXfnTRZXbOqDNe44FMWNFhz+aQEGDGMS64?=
 =?us-ascii?Q?NbPR/GI0RmEnhuo1zvvdXr2psiiBgftcy8Ld1z1FtXaGy+oPg4WHq/GGf55P?=
 =?us-ascii?Q?owegN+ISpBis0LQZXYYaHZIaSsnbtt4h/EE/11bYj+ByNcr8Emp5aqBweZ5A?=
 =?us-ascii?Q?4kzLTubuCFgwjVKq3eoFQcbkEgQwxonD2HeftNgr4i1ApMmKueeoUM9hNeg8?=
 =?us-ascii?Q?mlYn4zA=3D?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 26 Apr 2020, Nathan Chancellor wrote:

> > this causes build errors for me when (cross) compiling a big endian target:
> > 
> > target is little endian
> > mips64-linux-gnu-ld: arch/mips/vdso/elf.o: endianness incompatible with that of the selected emulation
> > mips64-linux-gnu-ld: failed to merge target specific data of file arch/mips/vdso/elf.o
> 
> Thanks for the report. I will look into it tomorrow and hopefully have a
> v4 by then.

 Can you actually record in the change description what the difference in 
the relevant link command is, as shown where `V=1' has been used with 
`make' invocation?

 Actually running `diff -bu' on the whole `V=1' build log obtained without 
and with your proposed change applied and ensuring there are no unwanted 
changes elsewhere will be a good measure of the correctness of your patch. 
You may have to prepare to be patient and run with `-j1' to make sure any 
`make' parallelism does not interfere with the order of commands printed.

  Maciej


