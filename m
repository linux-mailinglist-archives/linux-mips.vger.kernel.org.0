Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E770D30654C
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 21:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbhA0Uh4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 15:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233273AbhA0Uhh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Jan 2021 15:37:37 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0701.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::701])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A53AC061573;
        Wed, 27 Jan 2021 12:36:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmRyNoZPIATE6iGF11uRQ+I7Trnktjxqz149JvvXoA4I8mcshViftsVrA97KP1bH93XfOVmF/jXv8hV/p6oftLOItyw9apAMgemDSpNyrkQ05oLg+vKj1GNXr9F8lkn8wja+BydMOgrBHu1iir6nIvi1vA7kGyWhY1fibu382bJG4zNiV09JLJYqaVQ6pLIj7YpRtzZyIrr3jjKnXzr9dAi6h8HmwW0FaRRJkod2Zj8olm+O/VYIpLWe47vOP0sj5jL3AR6HceTALZoiki7MXxtOSyhFcNB2kQtJMonaGz7FpNGWnmZEG/kk+YKxebRTmCOYBIhoWBEGgG64r56K8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NshxQjnJpvYF38or6xGSO+XGc2LUDRde2ZP9K65eUqY=;
 b=HUqb9zQ6qTXCaXDoDcW8aUnfkkKQu06LJThSsfqdbxh38JcOhFdrnUo7SrjrA455Pbqmjqrp/sine0TagZOaW+Didlqhqdak1I/gelTpETYHUXnykPZ3D7c6q3tDfSuIoDxt/+VebwuJe9BJ2hRJCRCrcmE3d7hEdFY4VEZlemGq6Ii2BDokT9L+Oy2KA90NoRZrc5R1ToqQUZqDVRm+BN6bCN9U/lNvKyHX4oOnwx5RjSZLbYVdohwWxRyqMl70R9JQU7gBsHijywfZa6s5/FK5FJJXnseZvUg/wVvR/3Tdtdm8gcPSHBRFDQmO7iaEFDrCfWDJLuPIuAAcL/YrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NshxQjnJpvYF38or6xGSO+XGc2LUDRde2ZP9K65eUqY=;
 b=gR1w+YEbBF0miXk85GA2kLPwrKL507nzuQNdRllWXTM1rWTQH1nSxya6ZevaDO30fd1hSGlDzPoHiK1AhNNif/LSHzQZUJ3PLICcjGGUus0WBF2UzMMj7ym8+8aLuQezXEbgdKhSAJtZO8tNTrnwdnJ6aVa1i8OzEBJSbSwM+1s=
Received: from DU2PR04CA0142.eurprd04.prod.outlook.com (2603:10a6:10:231::27)
 by HE1PR0701MB2762.eurprd07.prod.outlook.com (2603:10a6:3:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.6; Wed, 27 Jan
 2021 20:36:34 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::bb) by DU2PR04CA0142.outlook.office365.com
 (2603:10a6:10:231::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Wed, 27 Jan 2021 20:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 27 Jan 2021 20:36:34 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 10RKaU59012891;
        Wed, 27 Jan 2021 20:36:32 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] MIPS: Octeon: qspinlock: Exclude mmiowb()
Date:   Wed, 27 Jan 2021 21:36:25 +0100
Message-Id: <20210127203627.47510-5-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8a9629a6-88ea-4acf-29e2-08d8c3033c9b
X-MS-TrafficTypeDiagnostic: HE1PR0701MB2762:
X-Microsoft-Antispam-PRVS: <HE1PR0701MB2762077833E39FCC39C28BDA88BB0@HE1PR0701MB2762.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Wb4STMAi9rmI9koGnUY3UZacoMw2dgzY+i63Lxz29Z+wkIJ/yrnhHZZOsSMHZUPk/ILKz48aSOvW5JVcJj99xhY+QhEM+rpCPKU7/2/0B5Qct6w9ZCDbGUpHOmq6lA2+VPz319ABEHn4dLgoY+O25Lbme4VdEvT/JfV3fiRrHdfZ+Xxbp3CO9RdH88sBgC1q6UcNc0VHxeP8pIhorvOByrSI3Se5z9F9plgWGdM9CDGfzu7J1XzhzllPi8CtoSHoVQxnFh2RT4lkExpHQmfdqAHRY2bnY6GsFVjkC1dT3wCtMlfrNmtLtkxN1uCPDstPJVhs8p/LS3iVFZEWsjNep1DWqLRDFhBwpzVWYLDy3j5KScvPRmeVMZxhgv/mucuedCbaVYWdeKSMK3MfcHHHlPBWcs5kUHVlHDlhyOsHuYwGqP5abC1Afi6zQrD1sTq38AgSRuVu6T+16gvdNcGoUEbanfE9HF8kTFkthJkyNRoesZ57Pv3O8cFSYj7IwkLFBkQrgaLMFBrn19xP4L1iskbBNY8qGaZFmoMhFxZJCjFvwZlNOUm0TNgw34NJNUSyuh28Ne7XSvx/sPw0zAoY1yE5NlHFsEuPw/lRHu5xmLYIbagAfXnyqhGbiRskWSD
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(46966006)(1076003)(82740400003)(8936002)(5660300002)(70586007)(356005)(4744005)(54906003)(47076005)(6666004)(36756003)(2906002)(83380400001)(81166007)(26005)(86362001)(186003)(2616005)(70206006)(82310400003)(316002)(478600001)(336012)(4326008)(8676002)(36610700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 20:36:34.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9629a6-88ea-4acf-29e2-08d8c3033c9b
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0701MB2762
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

On Octeon mmiowb() is SYNCW, which is already contained in
smp_store_release(). Removing superfluous barrier brings around 10%
performance on uncontended tight spinlock loops.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 arch/mips/include/asm/spinlock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
index 0a707f3..fbe97b4 100644
--- a/arch/mips/include/asm/spinlock.h
+++ b/arch/mips/include/asm/spinlock.h
@@ -21,8 +21,10 @@
  */
 static inline void queued_spin_unlock(struct qspinlock *lock)
 {
+#ifndef CONFIG_CPU_CAVIUM_OCTEON
 	/* This could be optimised with ARCH_HAS_MMIOWB */
 	mmiowb();
+#endif
 	smp_store_release(&lock->locked, 0);
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
 	nudge_writes();
-- 
2.10.2

