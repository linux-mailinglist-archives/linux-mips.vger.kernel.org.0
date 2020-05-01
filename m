Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A28121D2234
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgEMWmC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:42:02 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:35216 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWmB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:42:01 -0400
IronPort-SDR: Qy4RqdlooKrOHp7E/j+diSulcDTcYaAyDSMZ0MRjOQS2oqDuJOrEpCTPHdUCbaQfshfH916vJs
 rS+KtzTifB7pejGDW/rnTvn1tRQSrnR+4icGWXQREHzqNq1b9ES8s8wdCUWv80+1dCtp/0tNMR
 6c7qdmdWhNGvrFjTGdX7ZljiWkwf0vKKUlPXwXykaWfPfSDBFOx+w6LZ+XbGhKU/i6p6Ty3LPe
 +pOmx2I4Q4XgImmpZIKUZFmrYt3K3+ZnGkcIJYzZels8t7fgCRPi5Qjtpj9yO0AehJPTJ4Y+xe
 Kwc=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="246571480"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:41:59 +0800
IronPort-SDR: jBw96uS6vQOqXQJeX5nf4iIMPEApATeD+dtskipvjE7zNiPKs2t3KGj+A+du0jwo655N3PHIl8
 IlwPC8dckQLst6jOubbtBhnHamTOgD0yc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:32:13 -0700
IronPort-SDR: P5RRtv70HnK9fac3G+A/uMo3inFi1lxxKwlWFFLIdY2PlMy6oZiC+/i8Zy1/IOu1NCqBOr+mwZ
 haIQ5FLK5ZVg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:41:59 -0700
X-Received: from BYAPR04MB4728.namprd04.prod.outlook.com (2603:10b6:a03:40::20)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BYAPR04CA0007.NAMPRD04.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:35:10 +0000
X-Received: from BN3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:400::22) by
 BYAPR04MB4728.namprd04.prod.outlook.com (2603:10b6:a03:5f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.26; Wed, 13 May 2020 22:35:09 +0000
X-Received: from BN3NAM04FT044.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:400:0:cafe::f) by BN3PR05CA0012.outlook.office365.com
 (2603:10b6:400::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.12 via Frontend
 Transport; Wed, 13 May 2020 22:35:09 +0000
Authentication-Results: spf=none (sender IP is 216.71.154.42)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa4.hgst.iphmx.com (216.71.154.42) by
 BN3NAM04FT044.mail.protection.outlook.com (10.152.93.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:35:07 +0000
Authentication-Results-Original: esa4.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: VKdNUsGxxlBnYSMkrkthT5YFDwIJEb1IuGLxkPoE43HXKz6i+J841FkdNc3twTNp4M57xkaqjT
 pG6YgBJFs9PGudEageyoi7e+pf0Al9SK8sfWYH3V0Aucjz6AwtF2wgxYPeCiUcGBWIIa03wDo4
 5vYrIt9CsBSZwjd1fLDTjKt9Yxp+9ZtCTLLJwY/v16wVZbpOCNsC89VAnmXyMRKZ/J3wAZY4rA
 YlQ46PEuVDHOO3ONE/Qdp9bZu/ns5lRGr6w7Q50HxanpGGde8HNu/3qRy3bIAZ3D/SRDC52M9x
 Nl7pCYcuSznCml52wbld3Foz
IronPort-PHdr: =?us-ascii?q?9a23=3AFG2ydxfzL+g4b4zVmkUEqwKllGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxcS+ZB7h7PlgxGXEQZ/co6odzbaP7uaxBCdYsN6oizMrSNR0TR?=
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
 =?us-ascii?q?KZNbndvkOS5uIoOOSNapIatyrnJ/c54P7uiCxxpVhIXbSg1pIWIFu4E/Iud0?=
 =?us-ascii?q?6ZbHzsif8FHGINogd4R+vv3g6sSzlWMjyXVqk96zNzN8TuN4DRV4uugfbJiC?=
 =?us-ascii?q?KyFYdRTmRHDE2cVHLpb57CXO0DPnHBavR9myAJAODyA7Qq0guj4Uqjk+I9dL?=
 =?us-ascii?q?j95zEYuJT/1dN8++zUk1QI+CdpC9iGij/VHWxvlz9ORzAtwOZ+uUx42hGI1q?=
 =?us-ascii?q?0ry/BbFNkG4fRPX096MJPH1OV1Bpj0XR6JZdaGTluqA52mDDg9Q8h3wooIZE?=
 =?us-ascii?q?BwSJ25lh6W+S2sDvcOkqCTQpk986bSxX/0csN0wGzB/K0giUQ2B85OLXbggb?=
 =?us-ascii?q?RwpEDIH4CctUKfmu6xcLgEmi7A8GDW1W2VoERRSxJ9S43OQ2tZYkrQsMS840?=
 =?us-ascii?q?LaVPmpE7t+aFl7xMWPK7VHZpjStXscFa2xHtPYbirxlny5WVCIyaiQKovye2?=
 =?us-ascii?q?ANmi7aDRpMlQdb5nuAOQUkTi68v2LTCiBvHlPzciaOuaF/rn28VEo90wCNaQ?=
 =?us-ascii?q?VoybO0/hcfgfHURekU2/oIvyIoqjM8G1j12tvdEd2oowtnYbUZZNIl+xFAz2?=
 =?us-ascii?q?2Y0m41dp2sIqZ+h0IPJgF+vkfgzRJyWc1Llcknqm9vzRIncP7IlgkcLnXJgN?=
 =?us-ascii?q?apYe2ETwu6tAqiYKPXxFzEhduN8/tJ6PsjtxPipAGsBgwp9HA0trsdm3aa+J?=
 =?us-ascii?q?jOCxIfFJzrVUNivR1zrKvdSi084Z7EkHhtKbLytSXNkYFMZqNt2lO7ctFTPb?=
 =?us-ascii?q?nRXgr7GNcdL8yvLvE63l2odglCO/pdvv18L4atcP2I37SuNeBrkWe9lWpw54?=
 =?us-ascii?q?Z5wxvWpRBxQePJwZsJhsqg8FDfBmXai1Gs+oD6gokYIzEdBXb5yDDkAZ4Xba?=
 =?us-ascii?q?p3L84NDi+1Lsu7y882joPxW3Ne6F+oBk8Xva3hMRuUYVvn2ARM1EMR6XW5kC?=
 =?us-ascii?q?q8xjZwnnkntK2alCDJxu3jclIANAspDCF6ikzwJIGvk90AdEO2dE4tlR249Q?=
 =?us-ascii?q?P/xrBA4qNlICibQEtFeTT3M3A3Uqa0sennAYYH45cpvCNLFeWkNAnGGvin/k?=
 =?us-ascii?q?Jcgn6lRjAOl3ghejqnu4v0hUl3k2vBanZ8t2afeNlwwAeZ79vZFpszlnILQj?=
 =?us-ascii?q?d1jT7PCx2yJd6sqJ+RnpzZtci6VmS8RthWcDHwi4Sau2HogA8iSQ36hP21lt?=
 =?us-ascii?q?D9REIi1jTn0tBxSSjShB3iec/v1qKnIadif1FzQljm5IApf+M22pt1j5YW13?=
 =?us-ascii?q?8Ag5yT9ndSin/9BtJd3bOnPSg9AAUTytuQ2zDLnUhqL3aH3YX8DyvPxspnes?=
 =?us-ascii?q?n/Z2IOwWQ69c8YUP7JvowBpjN8px+DlSyUYfV5mW1Fm/Aw8zgegucUqE8ozz?=
 =?us-ascii?q?2GRLcIEhsAMA=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FfAwC0dbxefYpf+5RmHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQIFHgiWBawMEC41Sh2Alm2APATsEAQGERAKCKwY6EwIDAQEBAwIFAQE?=
 =?us-ascii?q?BBAEBAQIBAQEDAgEBAQECEAEBFjo0YFOBR4FBLAkGAwE7gjspAYNiAQEBAgE?=
 =?us-ascii?q?SKD8QC0ZXBjWFXAUgpCYBgSg+AiMBPwEMgQWJfoE0inKBOIxWBoFBP4ERMwO?=
 =?us-ascii?q?CWj6EEoYwBJEZAaFkBwOCTZg0HYJdiGySAK91IYFYfQiDJUwBAgECAQwBAgI?=
 =?us-ascii?q?BAQECAQEIAQEBAZ8GQ2cCBggBAQMJj0QBAQ?=
X-IPAS-Result: =?us-ascii?q?A0FfAwC0dbxefYpf+5RmHQEBAQEJARIBBQUBQIFHgiWBa?=
 =?us-ascii?q?wMEC41Sh2Alm2APATsEAQGERAKCKwY6EwIDAQEBAwIFAQEBBAEBAQIBAQEDA?=
 =?us-ascii?q?gEBAQECEAEBFjo0YFOBR4FBLAkGAwE7gjspAYNiAQEBAgESKD8QC0ZXBjWFX?=
 =?us-ascii?q?AUgpCYBgSg+AiMBPwEMgQWJfoE0inKBOIxWBoFBP4ERMwOCWj6EEoYwBJEZA?=
 =?us-ascii?q?aFkBwOCTZg0HYJdiGySAK91IYFYfQiDJUwBAgECAQwBAgIBAQECAQEIAQEBA?=
 =?us-ascii?q?Z8GQ2cCBggBAQMJj0QBAQ?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137621450"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa4.hgst.iphmx.com with ESMTP; 14 May 2020 06:34:56 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991633AbgEMWeyetWBN (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:34:54 +0200
Date:   Fri, 1 May 2020 01:44:32 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Huacai Chen <chenhc@lemote.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
In-Reply-To: <CAAhV-H6KWnzwB-p6aOL+L_ZXiYsMyzN1MbXeeeTYpimg7jG73w@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2005010117200.851719@eddie.linux-mips.org>
References: <1588153121-28507-1-git-send-email-chenhc@lemote.com> <20200429183305.GB21234@alpha.franken.de> <CAAhV-H6KWnzwB-p6aOL+L_ZXiYsMyzN1MbXeeeTYpimg7jG73w@mail.gmail.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:34:47 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH 1/2] MIPS: Loongson-3: Enable COP2 usage in
 kernel
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132334470.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:35:08.1335
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 67dd61d0-79bb-4779-5877-08d7f78de3d9
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.154.42;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa4.hgst.iphmx.com;PTR:esa4.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(54906003)(107886003)(4326008)(26005)(86362001)(42186006)(6862004)(1096003)(8676002)(7596003)(82310400002)(6666004)(33440700001)(8936002)(356005)(336012)(34756004)(7636003)(5660300002)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT044.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 67dd61d0-79bb-4779-5877-08d7f78de3d9
X-MS-TrafficTypeDiagnostic: BYAPR04MB4728:
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:35:07.8887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67dd61d0-79bb-4779-5877-08d7f78de3d9
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.154.42];Helo=[esa4.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4728
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.8224446
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oPtiCvO0p9o+sYHENFIDJZD22wF0GAwPh05GhdOTkEgwJJfnmnlGR6wg5xrc?=
 =?us-ascii?Q?tSOuqeTjCW2wiT38h8AaOfS7RLz67M/itlyhSiWlotC9QpTbWubv2UtFahWB?=
 =?us-ascii?Q?k7gSpo6dSq+ELvGhzmQ4HUhP1AF6dp7zGYq/5QPfpbRmILmPs3NXGq0tkZ+G?=
 =?us-ascii?Q?DS19+vHFSFVt+0xc4/2QvRnb7Vd0fJ0ldTRS1qbhS9DEctk76bSuryZOvJ/2?=
 =?us-ascii?Q?ICXLw2jcOgcBAkqMLFsJV1QYqZzN5QPHswSRn1bPF3u0f0zsVBFCAj8m0bBO?=
 =?us-ascii?Q?WfdnOmfIITygiPa3t7stgElDOBnk7+YjktPIQG/iTJnwwb/pYWO+EpuQnD4W?=
 =?us-ascii?Q?vZ0k4h7hDUguEZNAAtTtxXMOX+IjM3cpCWq8YGqeLYFU2Rw4S1Wb5/xkW07K?=
 =?us-ascii?Q?rF8QQhfHVlrvAcey0Bd7KFpZbUG5bGF0TehXwQv316BbkEUFz0CtxVLEGmey?=
 =?us-ascii?Q?GP85xyoKlNb9p9Gmg1N36fwLhf/vl1fR2flPXn0iRbVQEAj2YkA25j0tjQik?=
 =?us-ascii?Q?o0PVfDP3qoILrmNLLLKnDW5X5m+LQtXZDeWr7SDey3r6vsK9qSVChwqdBPqx?=
 =?us-ascii?Q?6cuMurvnJvddSKRToIzAeLzCkCtATfR8iPg32R3xHzLowyb/ATcpGyuNZDHC?=
 =?us-ascii?Q?jVc2zd+DJ/FGwoAzelYZngW2W8eAcc23DdFW1vt1KvWt86Supy5OgqvU1B9B?=
 =?us-ascii?Q?yPk8Bzz3LbACCwfB6MSStyeUCHrmOdWuYE67q2lWW1VpBgKlHe1ZZG+3hzN6?=
 =?us-ascii?Q?iHwXqVesf3hnpLM9OaDuF81vtNZYesKyt6dr897YWSTThgPpue0jx+92tZke?=
 =?us-ascii?Q?n+KgDRqcrhIYqbcAIHNm1Ey38bPHB0Rvcx6fl1o82AGI7cBvvhh8JhTQuSFo?=
 =?us-ascii?Q?bWKopz4ZA3bWF3g9bHgw8nNtZUUosnuf0iutYnmKhZ2B3QSzbZapMidk6846?=
 =?us-ascii?Q?daW6qansk0tl897anYFtePSRrseWRIy5zaINGFsHV+MQfDAutTdRKz3zqTSK?=
 =?us-ascii?Q?3weJIg76+ufCimtdTwd9y5p1Et0WHLjHGKTxVREhB7HhzGjC8EhNT22jcYUi?=
 =?us-ascii?Q?0sgYgxS3muLaDEkz6s6bqv/5hzD2XdR9z5e2dqgPflb2VXEwooVoHJa1FXcd?=
 =?us-ascii?Q?aizDoZ6aQ008W2MEoUobR9P4+GDNU01qdEFaEDova7jaa4v1aTE6+Q4a1GFZ?=
 =?us-ascii?Q?Fv5FF5QW0jkZhQ3YVgxwQ7P9iY/lhptq1CPesPbB/7YnivN1NgiTjsxMeElt?=
 =?us-ascii?Q?20QtcrGXNKtUF6B56FfieQXPpblsOEmr3naHuyKeHahH2TZzH+7b8ErKmQaa?=
 =?us-ascii?Q?e4rQ5KX2+/0WQ14p+kVwQI5XfJRpfQWv+hOWOayoK9qc/5w5Ol4M7RSE2CGM?=
 =?us-ascii?Q?b+N+Npc=3D?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 30 Apr 2020, Huacai Chen wrote:

> > > diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> > > index ce40fbf..0f71540 100644
> > > --- a/arch/mips/include/asm/mipsregs.h
> > > +++ b/arch/mips/include/asm/mipsregs.h
> > > @@ -386,6 +386,7 @@
> > >  #define ST0_CU1                      0x20000000
> > >  #define ST0_CU2                      0x40000000
> > >  #define ST0_CU3                      0x80000000
> > > +#define ST0_MM                       0x40000000      /* Loongson-3 naming */
> >
> > please use ST0_CU2, so everybody understands it's COO2
> I see that there is already an alias  ST0_XX for ST0_CU3, and I think
> use a ST0_MM for ST0_CU2 is more meaningful in some places (at least
> in traps.c where ST0_XX is also used). If there are places only used
> to describe the CU Mask (such as in stackframe.h), I will use ST0_CU2.

 Well ST0_XX is not an alias, because the bit has a different meaning that 
has nothing to do with CP3.  It just happens to share the bit position in 
CP0.Status with ST0_CU3.  Yes, ST0_XX is misplaced and misnamed as it 
applies to R10k processors only, but it is our legacy from the old days of 
chaos and some three processor types supported.  This is similar to say 
ST0_ERL vs ST0_IEP, which also share the bit position in CP0.Status, but 
have different meanings each.

 All this could have been cleaned up (e.g. s/ST0_XX/R10K_ST0_XX/) if 
someone had the incentive; I occasionally had and poked at these macros, 
but apparently missed this one and a couple of other ones.  Maybe on some 
rainy autumn evening...

 However ST0_MM does enable CP2, even if a specific implementation, making 
it no different from ST0_CU2 really.

  Maciej


