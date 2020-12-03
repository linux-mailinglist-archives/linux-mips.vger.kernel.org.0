Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925542CD598
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 13:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgLCMht (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 07:37:49 -0500
Received: from mail-eopbgr10123.outbound.protection.outlook.com ([40.107.1.123]:18353
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726213AbgLCMht (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Dec 2020 07:37:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEqD+CzfsquzVg9enHQRowPrVeWmv+NyThFJubszIA5NJG2Rig1JJPgcIVE99cyoQY4I1nhaHwpTkVE5uHZwF4OPn5xz6tTB4Y8e1c5nuIrNcxi2qh+nucHTEUmYUT6ZEEwQYxG4rRdUHUA+Dt2tiHGNPxRs5MLiwC5KqN8NqKWcAVyIkRGXtX2jA1MDeAD+Abnwo+oEKOjdh7yEvbu8rHSDvoEh/fbU/hyVlKvEQgrWEvrFTzMHs1E9QTShju/h3G8C3VITSR4SdnYLUD5KKZTb88lJCruaxO16lv5cNH0cOhYNhwilgRywtfYSvarZ+JE9lS0oBBDXxWM6cuahXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzIQuwWslMU0ZV6rw1ddYa7K1OEcS1ZO696QI5alaVE=;
 b=Jk4SKNYG1ScJPiXRl/nAg7abVKJZL1MIHDxdEll1nSM8s5uAGOBgerwRYTQ2P6rSEt4heG7P4PZ6OQ74mltFgGrCS0/ZAoquwpaMU2L56xfSp3Fchv05j/RGDesXt62qh06l01vuF1WhjhehpBk/V1IfJw0pPlIJ+p2ycvc+7v77LIRCcRmL8S8Tl3kHOJw7RxtP7e7Gg1ed7rHO6dskk0eQNOk9N8AzvPTeByrQ1oxmL/yeQKM16UBBvsfNSmZwWq3e32KglhH86eZIWBUUkc+2NId+xDc1Kwe1BpxhDrndd7OLnsjPkOCgeQUk5hwve999MGmgYiFqS9mOyv8HtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=flygoat.com smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzIQuwWslMU0ZV6rw1ddYa7K1OEcS1ZO696QI5alaVE=;
 b=yZKqrTG4PEH8vxbcAaiShoI9jg3y4aBlznlio0kR15uOg6d4JM7lf/cRhuDVa5IaHxIrKpH3HmYQlt1jkZodJOPzosJ7MAJJ4178DXYemvRNDflNCHIuEWFVZ5jdvegEAdFtQcGLX2ePCMSg7/lCjbyLgKDeKHTlN6zu8gPSdm0=
Received: from AM6P193CA0089.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::30)
 by DB6PR07MB4440.eurprd07.prod.outlook.com (2603:10a6:6:53::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9; Thu, 3 Dec
 2020 12:37:00 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::38) by AM6P193CA0089.outlook.office365.com
 (2603:10a6:209:88::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 12:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; flygoat.com; dkim=none (message not signed)
 header.d=none;flygoat.com; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:36:59 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 0B3CaqBJ025448;
        Thu, 3 Dec 2020 12:36:57 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Leonid Rosenboim <lrosenboim@caviumnetworks.com>,
        Corey Minyard <cminyard@mvista.com>,
        linux-kernel@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Jinyang He <hejinyang@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] MIPS: OCTEON: Don't add kernel sections into memblock allocator
Date:   Thu,  3 Dec 2020 13:36:49 +0100
Message-Id: <20201203123649.44046-2-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20201203123649.44046-1-alexander.sverdlin@nokia.com>
References: <20201203123649.44046-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ff648952-5bd6-4006-616d-08d897882129
X-MS-TrafficTypeDiagnostic: DB6PR07MB4440:
X-Microsoft-Antispam-PRVS: <DB6PR07MB444016E7ECD2417BE241181088F20@DB6PR07MB4440.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mj1kRJf+bm/WL7iBZMf7lMJWx76hmCdpYvtN9Ok8wvhwQfFqzmck5JPguWlZSx9TEJA3Tct7C25bQPNVQXgiWsUOHVJiGdk4dtSvRMVbjVC1vEBD378qWMyr4iFqrcfi70RP3/srlKcXK4XwzmZv/VC+n1c/YQc7ev0xo6jL68ph7/Ja38w6GBQpR6iF39W0CqrewTWrGM9oeSpduV8SEkMrVeky0B/r/MU5ebE37bQxdwa6pa0RyogaWxOn5i+FTJTwBm4hOcZSdBKpYQ2woM1B8PNJ62gTui3cOJmLy+64u4I4iLyoxQz9qIFQwTPfGeYJ5laI0G7+CY6fB7doV/r+bLOBrKASyFWBmdEvIjiDeWXZ0p49LFBxxSloTjytuzAo+KB2CJF7+qW4l54BrA==
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966005)(70206006)(2906002)(26005)(8936002)(86362001)(8676002)(6666004)(6916009)(83380400001)(7416002)(47076004)(82740400003)(316002)(356005)(70586007)(54906003)(478600001)(81166007)(2616005)(336012)(5660300002)(82310400003)(4326008)(36756003)(186003)(1076003);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 12:36:59.9931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff648952-5bd6-4006-616d-08d897882129
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR07MB4440
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Because check_kernel_sections_mem() does exactly this for all platforms.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 arch/mips/cavium-octeon/setup.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index d051a8a..34cef11 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1013,8 +1013,6 @@ void __init plat_mem_setup(void)
 	uint64_t crashk_end;
 #ifndef CONFIG_CRASH_DUMP
 	int64_t memory;
-	uint64_t kernel_start;
-	uint64_t kernel_size;
 #endif
 
 	total = 0;
@@ -1152,13 +1150,6 @@ void __init plat_mem_setup(void)
 		}
 	}
 	cvmx_bootmem_unlock();
-	/* Add the memory region for the kernel. */
-	kernel_start = (unsigned long) _text;
-	kernel_size = _end - _text;
-
-	/* Adjust for physical offset. */
-	kernel_start &= ~0xffffffff80000000ULL;
-	memblock_add(kernel_start, kernel_size);
 #endif /* CONFIG_CRASH_DUMP */
 
 #ifdef CONFIG_CAVIUM_RESERVE32
-- 
2.10.2

