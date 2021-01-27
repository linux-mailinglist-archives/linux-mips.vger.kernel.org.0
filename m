Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90779306547
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 21:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbhA0Uhf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 15:37:35 -0500
Received: from mail-db8eur05on2104.outbound.protection.outlook.com ([40.107.20.104]:61504
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233034AbhA0UhZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 15:37:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fa1Nunt/tagweIL666iENRZVgv15W0cb13cmj8iS+6VzC0J2H9IWAM7RejH+XJ4IcXGxy657WIN2iAFNkKwNOpGMUIaLV8riz5mqUip4sf+TeJpRycGCHAer6YsecPUFUp+0pY0IlBGIYAjrMX/RqxWJNuNqi63o/ibSPVc35JEXn6EmT/9kTUhPBgw8COx7EGUdSWCfdofzOLSlPsHJ9h+U8iVOpBGW0G9NyoSc4j+r8L42zv+Ld1N3By3SnhYNf7XPdmHn68Ymu23tGIysdBvJ2+c9RhsI8myaooC+ddO/ZmBkm/vyjPTftMxWIY4FdjkMZrTf3a2IrwYBOJ8YGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E6q0iZUlrLJAN2FP1h8BU3gkn+HjMa0LqC7mjF6k+8=;
 b=JzaztCu1oOUxijHUpuUMqOjBQ5oNeyU+Dc/1bKM9YM9843XY1xLpE1urtkOCX/khXhCSieus55DkedGzIvR7UpJaAihCA7FcgK6OuPX0onoixQ6Pd6f+JdkH1220xtYSqiQlGAXz/B0KTwsAasQ7gwkSMbjkSN9tS9KKEvQ23Fynp5v/ls/yjuQZLhAxiXU5roKVujJoU0SX2sGA2A/uPAuWemkQQfzdCf6Ru+0umPrCp6JwzDHUSTxWDDM27JLgjvRN1gq1UIVAV3GgPLy4hSddHK/lQfluWqx0JllQpo27is5Epprq7Xe1539eBx9ZFH0RF42tTSKSXasRSAqRkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E6q0iZUlrLJAN2FP1h8BU3gkn+HjMa0LqC7mjF6k+8=;
 b=ktmJNKEvmjgmq+JEaMZXn1mVfI0/dNVtmcO+gxFGByxUB+zEAyoEmb8I9kArGDHjiMM8trBugiwl3+1bCmklWeld9poBxWBBwZgROcwp2CPNp1IQllkmYx3qXlT/RyBwBCyl499lXijMelrKtGhavMvfHsaBls15Gct0a571wbI=
Received: from DB9PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:10:1d9::7)
 by VI1PR07MB6286.eurprd07.prod.outlook.com (2603:10a6:800:134::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.13; Wed, 27 Jan
 2021 20:36:35 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::f) by DB9PR02CA0002.outlook.office365.com
 (2603:10a6:10:1d9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Wed, 27 Jan 2021 20:36:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 27 Jan 2021 20:36:35 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 10RKaU57012891;
        Wed, 27 Jan 2021 20:36:31 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] MIPS: Implement atomic_cmpxchg_relaxed()
Date:   Wed, 27 Jan 2021 21:36:23 +0100
Message-Id: <20210127203627.47510-3-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7209ce51-a3b7-43f6-7ea7-08d8c3033d2c
X-MS-TrafficTypeDiagnostic: VI1PR07MB6286:
X-Microsoft-Antispam-PRVS: <VI1PR07MB62863B32DE5CA47B6E5CAB6B88BB0@VI1PR07MB6286.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ur5BaJb3AaFmNF0idcAGCcx9o+ueBySN9bA3sDDjk/g3oKCr06Otth20kLlx2dtlLPEgw0I2mqg2mNlCGTnykHNcVzOKWLvWULBVIep6oa1hsJYouY8Yy+d8jByLDCGE8tY7vdVt5tj2D/nte0hyF4D2Bm9hgdHjXbRtNalSWbTdCDinWhF7gXNL2MdrvvC6CWeIvvROUvrjK2D4Cwo8fJf8vq9mpM2yiIK3pRyzYT2GEC71GUy2lT/0BFZEZC/QQgATM2sqN9SHsCJYgNQBxY+PCrKD6eYOQ2OsaSpYtPCgjkFq5hMOtalzJI4EjhHVl9f35Ld53CL/tBBaVfjweUEFDsGln3ST+G82E5TNkv6WL4ZfWzbxePg761xQ9x4M4pPt6iIFes0S6CtdLEgQoqZHZOfh0MnkldDIGVGXNzXz9+gkkzw47VentKtMqFIbgXRup0s2OwD/AMN4uLyfoQ7TYrlrr+RnYhSJucAJ9OmLXzG5G9THLmnh49+q8hGk1fDMVFFIKDPS9Bf593FGBTac8IAcUQbtnnaaG2LDKfLEUIgz2B1HsOkcuHWrTbwdtuz4eaVm1LgLT4sRR1lywgJY0LIzrTEmW5XpB928H/dsuKSsDomY13UKVLP9KP6l
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(46966006)(86362001)(82740400003)(70586007)(5660300002)(4326008)(1076003)(478600001)(83380400001)(2616005)(82310400003)(356005)(81166007)(47076005)(6666004)(54906003)(2906002)(36756003)(8676002)(26005)(336012)(186003)(316002)(8936002)(70206006)(36610700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 20:36:35.0580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7209ce51-a3b7-43f6-7ea7-08d8c3033d2c
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6286
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

This will save one SYNCW on Octeon and improve tight
uncontended spinlock loop performance by 17%.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 arch/mips/include/asm/atomic.h  | 3 +++
 arch/mips/include/asm/cmpxchg.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index f904084..a4e5116 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -264,4 +264,7 @@ ATOMIC_SIP_OP(atomic64, s64, dsubu, lld, scd)
 
 #undef ATOMIC_SIP_OP
 
+#define atomic_cmpxchg_relaxed(v, o, n) \
+	(cmpxchg_relaxed(&((v)->counter), (o), (n)))
+
 #endif /* _ASM_ATOMIC_H */
diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index 5b0b3a6..620f01a 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -182,6 +182,8 @@ unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 			  (unsigned long)(__typeof__(*(ptr)))(new),	\
 			  sizeof(*(ptr))))
 
+#define cmpxchg_relaxed		cmpxchg_local
+
 #define cmpxchg(ptr, old, new)						\
 ({									\
 	__typeof__(*(ptr)) __res;					\
-- 
2.10.2

