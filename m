Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1E1306548
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 21:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbhA0Uhh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 15:37:37 -0500
Received: from mail-eopbgr80115.outbound.protection.outlook.com ([40.107.8.115]:6023
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233007AbhA0UhZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 15:37:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmYsFyStjzw+k3b+H5aC5KqxWB7/FpijtI4Rfg/kXWxJtUQvPBQZHEq9aU+YGmOHOEFSYdNl0dJu4f/UtYU012bpEmKf4wHOxclCRMzJ2ZANqEo09K4aiOxYcCm3/otd5DFNrp0Xzd6sPSzE6nP97PsMvVn1P3fGhHDhd3LzTEnPhSOtUhJaJuy3RJWVDJcCq7IuwFVx3XfzmY/L/KZjHbFGSnOWgCFjVAtrK+cco96LOAf06Xnl6VssFyRHBR15fq22h5qRjS/ek1f/OmfOYabIcLh0fZisKbFTjtODn+2GPaimNSDfyx18VJoJpZgRu/w/Zwv1TphdGmJfWb39fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0VF7CIkSqajuP5A/wIiq5v1lQ7dOtJa9PN+eZYq9Tw=;
 b=DHjJaLmDr/m/Vq0yKat+elxoGlPMtUvDO7w8ymR+8BlKwrC74W69vodQZsM/NcQYvO6HkmG373jMEGYGAUIaCiVUxRGNgDDaDKulG+LsB8gIJbzwkeoFvzIC3oQZIx1HYQ7R1Us6WbUz6r10SBWA1N17GULWWHY9unCNNf5T1EZoGn2VscLKY0imfCoRfH5wPmx4E3W5CvKlLKzJ1sa42igP4lxV5D86XrLaQwT+ypuvelo6yZmcqqtM0b6ldL5ymG38qG5GXbMX2HMHuyKhhDPiD5HXI8IvO+tcJUKDv3XB+yTmAnyZb/vP0L41ovWq2FZu5sRWN0JvJssz0+oEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0VF7CIkSqajuP5A/wIiq5v1lQ7dOtJa9PN+eZYq9Tw=;
 b=gJIX1DjK2OF7U3XsEm8aqFjrCz1Vc/IEVV1Lonz5VQcAyA3hm8qLGsd4KUfjXgzFoRkbnwFOKy6rxu5Cr70qOi8wUS/kuIpqc9ObTmLtiHMXNhEQ7L4tfEgTBURSID8umCpFg3XCjtwiz2lPKk27Svjd7wf8IEzsXMqqkaxO/Pw=
Received: from DU2PR04CA0097.eurprd04.prod.outlook.com (2603:10a6:10:230::12)
 by VI1PR0701MB2351.eurprd07.prod.outlook.com (2603:10a6:800:6b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7; Wed, 27 Jan
 2021 20:36:36 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::ee) by DU2PR04CA0097.outlook.office365.com
 (2603:10a6:10:230::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Wed, 27 Jan 2021 20:36:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 27 Jan 2021 20:36:34 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 10RKaU5B012891;
        Wed, 27 Jan 2021 20:36:33 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] MIPS: cmpxchg: Use cmpxchg_local() for {cmp_}xchg_small()
Date:   Wed, 27 Jan 2021 21:36:27 +0100
Message-Id: <20210127203627.47510-7-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1bfb8e9a-2deb-455f-1f96-08d8c3033d21
X-MS-TrafficTypeDiagnostic: VI1PR0701MB2351:
X-Microsoft-Antispam-PRVS: <VI1PR0701MB2351B913CDEA05532EBFB7B188BB0@VI1PR0701MB2351.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gY7BMeMCLB/HwkDiHJrWfKPhPVV7yJZfndL+Ffcn0PTrr25EcynO/rhNeJvnRJ8WIfBxaheq+rqtzUhijQZTPNlJPXwx/D6l42H6nPjYICzns2rCB1ppR4oloWtet7wyJrrCMI8AUJ8gJpBSRS5oDZ5WHzHOKKmWisuQOpzRehwG22XxlZFvN1WuMNVasYrmQ2gCR1N3NBlZtmchc6EjLsKsbSUq2SREQgOH3ajqIyXsvWQQnsja3boVJLlf8U1NnqUzknvi1gZZOcpizfR0QJg8p602tXsmZfRvvVl2g8AKJbfGZQnJX9LRZwl5W5zKHKaBs3qgcIMM5l4Q+fY/x4r57YucfKWp43GSMv41v4IwtRCZYQxiHqGYgniC22zq2s+3zX/9z7RtgExuLy4i5CoPF9RQjvkcKiBhZDT+raUFPSDAIprjCMHzm2dHiItSiF9qjSIkpfcpR4VJLeBHJIpNnpC8a8SMFPJBz/F7Rhu25NHWc7nHOsNcKB5Q5Hh8a9SLHuuJyv1sDn/t5Xeu9BiM30O3vca7IaR2TYoyAnvKvZURGD4aNv6R8HzPyb1Yorjn9NIsrdZf1L2H7aJvzqJNLyhaX77nbgwMZD3uMiHAbIfZcLt8LEWfBZszWPv8qKmfW9IldTAgw4qWJ9SNOg==
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(46966006)(2616005)(2906002)(54906003)(478600001)(26005)(316002)(8676002)(4326008)(36756003)(86362001)(47076005)(186003)(1076003)(70206006)(6666004)(336012)(8936002)(82740400003)(82310400003)(70586007)(83380400001)(356005)(81166007)(5660300002)(133343001)(36610700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 20:36:34.9854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfb8e9a-2deb-455f-1f96-08d8c3033d21
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2351
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

It makes no sense to fold smp_mb__before_llsc()/smp_llsc_mb() again and
again, leave only one barrier pair in the outer function.

This removes one SYNCW from __xchg_small() and brings around 10%
performance improvement in a tight spinlock loop with 6 threads on a 6 core
Octeon.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 arch/mips/kernel/cmpxchg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cmpxchg.c b/arch/mips/kernel/cmpxchg.c
index 89107de..122e85f 100644
--- a/arch/mips/kernel/cmpxchg.c
+++ b/arch/mips/kernel/cmpxchg.c
@@ -41,7 +41,7 @@ unsigned long __xchg_small(volatile void *ptr, unsigned long val, unsigned int s
 	do {
 		old32 = load32;
 		new32 = (load32 & ~mask) | (val << shift);
-		load32 = cmpxchg(ptr32, old32, new32);
+		load32 = cmpxchg_local(ptr32, old32, new32);
 	} while (load32 != old32);
 
 	return (load32 & mask) >> shift;
@@ -97,7 +97,7 @@ unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
 		 */
 		old32 = (load32 & ~mask) | (old << shift);
 		new32 = (load32 & ~mask) | (new << shift);
-		load32 = cmpxchg(ptr32, old32, new32);
+		load32 = cmpxchg_local(ptr32, old32, new32);
 		if (load32 == old32)
 			return old;
 	}
-- 
2.10.2

