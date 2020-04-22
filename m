Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD0D1D221D
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgEMWgi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:36:38 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:62213 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgEMWgh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:36:37 -0400
IronPort-SDR: YeEA8IVBElCJfyjv4KdA5XDi/91iBYuY5MdgoMpZhENqQethg6VUX9KUWFu6EPN1599tIbVKXa
 61Sv4Uu4rviL+wXVcSNsxg6GYLvt7GZ9fPSwce1demDJNuEdLzFVTfAP40LUvsD3jxGPbB22QZ
 ef9J3jx2iidjr84nAfVsa+RRKI47D4Ql0jdouQZIEhB8NrWg5W/cbqI1rEJddF8bHK9WepjO+f
 pgEQwtu4RpB7PbzMvG1iNNGmR8ZCg8Y1rcgZTMTjE41gDXPKIZboZdeuehUKYexMSMeshaLY1/
 VzQ=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137621565"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:36:36 +0800
IronPort-SDR: GgmjffSaWk53IZVB4vI9i/ycbu5ZDse8/3h0QSBfiKWK40T+diatXBqBnidoyjkFsND6n1Broy
 20kPuqDlR9blPpUvt8NFOjOvDXSc5t9nw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:26:50 -0700
IronPort-SDR: 8WiAWgkxXm9fzMjnvX3pGMGm8nFHyBBFOppvM0DbPvE32doIyGS/tQasiVBViqHLwbhBH0opzx
 z3YEMxMV8THg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:36:36 -0700
X-Received: from DM6PR04MB3993.namprd04.prod.outlook.com (2603:10b6:a03:60::16)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BYAPR07CA0039.NAMPRD07.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:34:01 +0000
X-Received: from BN7PR06CA0047.namprd06.prod.outlook.com (2603:10b6:408:34::24)
 by DM6PR04MB3993.namprd04.prod.outlook.com (2603:10b6:5:ae::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Wed, 13 May
 2020 22:34:00 +0000
X-Received: from BN3NAM04FT022.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::1f) by BN7PR06CA0047.outlook.office365.com
 (2603:10b6:408:34::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Wed, 13 May 2020 22:34:00 +0000
Authentication-Results: spf=none (sender IP is 216.71.153.141)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa3.hgst.iphmx.com (216.71.153.141) by
 BN3NAM04FT022.mail.protection.outlook.com (10.152.92.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:33:59 +0000
Authentication-Results-Original: esa3.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: uhe/zc8TKAhcm3vBtT664jbW6g1U0KRC5/I51WOqeXa522cy7LwdFDNs0vzbgTEZ+VCniNpiYm
 lh8HAkwTTkNmgoZmoYwVtn/b2hOC2MrN3VVjBVuZQk9ToxGXb+ZIE1ybvifP+zkwsvtAkXuOWh
 U7AD2C5xf1sqYPRBQSKJsCMgDfSZONtSV61lI7rL0O/OP7sK3jagRNApC/pkGAo6Lg7dkA8Uo3
 bRCG8A5hgFYUeUBlxji2TcmNHIEkvK3fsAd3F5vTyYnhGdJJMop37/pUm6TV0oifC0pTZ3DmHC
 /6F++0vQJwKcLW1OQLUkY45Q
IronPort-PHdr: =?us-ascii?q?9a23=3AtJnC8BCyvXjOr5g6fHEKUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSPT/psbcNUDSrc9gkEXOFd2Cra4d1qyH7uu4CCQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagYb5+NhG7oAXeusUKhYZpN7o8xA?=
 =?us-ascii?q?bOrnZUYepd2HlmJUiUnxby58ew+IBs/iFNsP8/9MBOTLv3cb0gQbNXEDopPW?=
 =?us-ascii?q?Y15Nb2tRbYVguA+mEcUmQNnRVWBQXO8Qz3UY3wsiv+sep9xTWaMMjrRr06RT?=
 =?us-ascii?q?iu86FmQwLzhSwZKzA27n3Yis1ojKJavh2hoQB/w5XJa42RLfZyY7/Rcc8fSW?=
 =?us-ascii?q?dHQ81fVTFOApmkYoUBD+QPI/tWoIv+qVsAohSxGRKhBP/zxjNUmnP6wbE23/?=
 =?us-ascii?q?onHArb3AIgBdUOsHHModn7M6kdS/y6zKjWwjXBcvhZ2S3x45XUfBAmoPCNXa?=
 =?us-ascii?q?5/ccnQyUUhCgjIiVCQppb5MDOP0eQAqGyb7+tmVeKyhG8rsgRxojm3xsc3kI?=
 =?us-ascii?q?XJgZgVyl/d+Ch/3Y06KsG2RlRhbt64DJtfqTuaN41uT84iQGxluyU3xLIHtJ?=
 =?us-ascii?q?O/YiUH1YkrygDcZvKHbYWF4g7uWfqPLTtlmX5odq6yiwiv/EauxeDxV8e53E?=
 =?us-ascii?q?tKoCdGj9XBsG0G2R/L6sWfV/dw8USs1SyR2w3T9+1IO0Q5mKrBJ5I8zLM9lZ?=
 =?us-ascii?q?weulnZECDsgkX5lqqWe10k+ue27+TnZa3rqYOCN49vkA3+NqUumsqiAeU3Kw?=
 =?us-ascii?q?QOWmmb+fyn1LH5+k35WrpKguU3kqnfrp/aOdwWqrO2DgJWyIov9RayAyq83N?=
 =?us-ascii?q?kcnXQLNk9JdRyEgoTxPlHBOvH4DfOxg1S2lzdrwujLPrj7DZrRNHjDl6zsfb?=
 =?us-ascii?q?J8605a1QoywslT55dVCrEZO/L/QEjxtMbXDhMhKQy73/7nCMlh1oMZQW+PB7?=
 =?us-ascii?q?WWP7/IsV+P/e8uLfSDa5MPtDnhLPgl4q2msXhsu1gGfbSglbgWbnmiErwyIF?=
 =?us-ascii?q?ica3PEjdoHDWAN+A0kQ7q5pkeFVGsZQn+5Xq8+rg59QLihH5bIRYHnyOiE1S?=
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
 =?us-ascii?q?0TgJ6YqGEfn1D0N9FKgPOsXD82XTcOhuXtzk3g0UxnIGiOwtunBHGcxNZxIt?=
 =?us-ascii?q?y7enhQ3TgyvZgTVfWkqYdclC4wmWKW6ALcZf8nxmUW1+Bo7H8cnvFMvQs11W?=
 =?us-ascii?q?OaGL9ARUQ=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0HOAABDdbxefYpf+5RmHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQIE2BQELAYIkgWsDBAuNUodfJZtgDwE7BAEBhEQCgisGOQYOAgMBAQE?=
 =?us-ascii?q?DAgUBAQEEAQEBAgEBAQMCAQEBAQIQAQEWOjRgU4FHgUEsCQYDATuCOykBg2I?=
 =?us-ascii?q?BAQECARIoPwULCw44VwY1hVwFIKQmAYEoPgIjAT8BDIEFiX6BNIpzgTgBjFU?=
 =?us-ascii?q?GgUE/gUQDgiwuPoogIgSyfgcDgk2YNB2CTAGafK90IoFYfQiDJUwBAgECAQw?=
 =?us-ascii?q?BAgIBAQECAQEIAQEBAZ8GQ2cCBggBAQMJj0QBAQ?=
X-IPAS-Result: =?us-ascii?q?A0HOAABDdbxefYpf+5RmHQEBAQEJARIBBQUBQIE2BQELA?=
 =?us-ascii?q?YIkgWsDBAuNUodfJZtgDwE7BAEBhEQCgisGOQYOAgMBAQEDAgUBAQEEAQEBA?=
 =?us-ascii?q?gEBAQMCAQEBAQIQAQEWOjRgU4FHgUEsCQYDATuCOykBg2IBAQECARIoPwULC?=
 =?us-ascii?q?w44VwY1hVwFIKQmAYEoPgIjAT8BDIEFiX6BNIpzgTgBjFUGgUE/gUQDgiwuP?=
 =?us-ascii?q?oogIgSyfgcDgk2YNB2CTAGafK90IoFYfQiDJUwBAgECAQwBAgIBAQECAQEIA?=
 =?us-ascii?q?QEBAZ8GQ2cCBggBAQMJj0QBAQ?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141968369"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa3.hgst.iphmx.com with ESMTP; 14 May 2020 06:33:57 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991633AbgEMWdzbDykz (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:33:55 +0200
Date:   Wed, 22 Apr 2020 18:14:54 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Joshua Kinard <kumba@gentoo.org>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] Add missing ifdefs to SGI Platform files for IP22,
 IP32
In-Reply-To: <69f0ba65-161c-744a-42c0-c8bb435cce3c@gentoo.org>
Message-ID: <alpine.LFD.2.21.2004221813180.851719@eddie.linux-mips.org>
References: <87be6e36-04de-684b-0361-91de9ce2c731@gentoo.org> <20200416163051.GA24457@alpha.franken.de> <f4c06481-7fa3-d84c-5aa9-f991daef058c@gentoo.org> <20200420072257.GE4627@alpha.franken.de> <69f0ba65-161c-744a-42c0-c8bb435cce3c@gentoo.org>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:33:49 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH] Add missing ifdefs to SGI Platform files for
 IP22, IP32
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132333490.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:33:59.6856
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 21502f82-7d03-4631-032e-08d7f78dbb0d
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.153.141;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa3.hgst.iphmx.com;PTR:esa3.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(42186006)(5660300002)(7596003)(8676002)(107886003)(7636003)(4744005)(34756004)(33440700001)(4326008)(356005)(8936002)(1096003)(6862004)(336012)(26005)(82310400002)(86362001)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT022.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 21502f82-7d03-4631-032e-08d7f78dbb0d
X-MS-TrafficTypeDiagnostic: DM6PR04MB3993:
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:33:59.4217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21502f82-7d03-4631-032e-08d7f78dbb0d
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.153.141];Helo=[esa3.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3993
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.8650667
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zLINO+Pt4r6VlTbbvvV/kPnqFWzZ6GVvZi/CsvdkOm6JE2HgN+DD3HigNcv4?=
 =?us-ascii?Q?40+7xfJ2xzoiDyMi0feU/DWGvmufy8RJDeaAgH8UD/43YLwDIWMIJVjJl32F?=
 =?us-ascii?Q?eqn9rog+YK+IeWFaCny1+MkhJ4koQKoMpmKbqrKvRuT4iaDnRoYseoOp1Xh2?=
 =?us-ascii?Q?f6whASz+oY491PrEPg5CxPMa9E8jlV2i0OFhe92KTFYRSICm+PTtlMMy1Vzj?=
 =?us-ascii?Q?GJGIgy+506eH83YP5A5RMTBTmBTGh9zsFP/7XSzlvGb3UTObvS256rqh7d4b?=
 =?us-ascii?Q?J9bVW2ICAuo9BK3asVCeoHQhXqNacQFwWL8V6PnDHALojLCsS6NB4i6Fv2Ys?=
 =?us-ascii?Q?JhuKwNulASRB8SLXm6FPurSaubU/+SkqPWbF+VGifppodIiUy2V8g301tgRS?=
 =?us-ascii?Q?M86AznKXadEXg4NHudP2OklTur6oO+osCN1HsmKyXe1qA55OBkSecqB/U23h?=
 =?us-ascii?Q?WYU2EVuNYgR4aKUO/Ia+gaDt4h15fMgNUvKP1gUP6LN05wrWFutbYNDLBHmg?=
 =?us-ascii?Q?E+1w8otL9OlcqsqtpHOVWmMXIimnrJOGtCDRUoD7tAWsvGHxiX3xdzPRsr/6?=
 =?us-ascii?Q?HzkD6k4RDVvdVqhkbviQOGyHhtR7rV3F14K64HTs9g1UXG4Elt3lAnkIhVTF?=
 =?us-ascii?Q?yNVyeOncgzY2Ws4v2Ebda412PTtGy1c8Y631sCmi3djAjoUS5dNn5T42qf6h?=
 =?us-ascii?Q?gbBOhQfIRQqKfxFGNBD9mIok5iiLRWuTLNL6ZK5XAE90pnzuVjhXDejPMmaO?=
 =?us-ascii?Q?TohcrqkQlDaaAfcwrAI4CkNa/ZwsgU/Tc7QSR/A8ezVTXZPgN4WMntCRNf0r?=
 =?us-ascii?Q?ak1eaxAAIIjqSPKuZp/7BCbAaE5qQn/pooXlfEjTluJwPsNTzKNd/DdH94C+?=
 =?us-ascii?Q?CqPnXaOUxdwVekNvoy043xOvo+vCgIGb5N7vKjfl8b6hNxmEzdSvgf3tr0Sl?=
 =?us-ascii?Q?czrHAw7v6WQmG0fNEhF/RUVPwB31fM0LcuzrnW0zoNOwa9nllF3Se7ntED40?=
 =?us-ascii?Q?//HmmBR72fggtcJlXq97fCYOc+4IGparUwausLYE/5RsMFEfxo606wckdKk8?=
 =?us-ascii?Q?aAamsjS53INaio7DRk1+hClbQ1YK9qGfHMxTtlNNTfVw9G6bk/H/mR5KfGWi?=
 =?us-ascii?Q?o7MCe4UskOB7mPWMLwL9GaFfnitjj/+f5/abjnnDz/vou0jTNpvtgY+ioSxQ?=
 =?us-ascii?Q?+Y7+kWGkbsyfEmZsnPUbAkD6aGUJutrILT0WLQ=3D=3D?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 21 Apr 2020, Joshua Kinard wrote:

> It also means I basically found another ICE in gcc, completely by accident.
>  I wouldn't be surprised if no one has looked at the -mr10k-cache-barrier
> code paths in gcc since the code was added years ago.  Not sure how I am
> going to report that one to gcc upstream...

 If it used to work, but does not anymore, then you can try bisecting GCC.  

  Maciej


