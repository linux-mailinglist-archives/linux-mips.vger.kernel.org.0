Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B554B306543
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 21:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbhA0Uh0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 15:37:26 -0500
Received: from mail-db8eur05on2104.outbound.protection.outlook.com ([40.107.20.104]:22368
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232973AbhA0UhW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 15:37:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA4X445DrhqyiQyg0fpZLeJwGdpT4F5KsYADtLpufIJkwg+JxYke5vlTWKVWif2AQ4RbrSOaQVshGVU5JpSNLM5h1pxooYf2kyQEdyRkWr0b7zg0DEn1q/jNh01+hOc+lqlLSaomH5o3zHx2KToits1PwDNuRBv92LAwTny90I/5iUYClYjMHy+AzMKnFMWADwkX9EQjetYa6LbBX4yIK3lWHL3AbO/6HFgH2hqXC8VaEnP7uwR/om2HkGClxDLqfigjuomWxTm+WeAlGYPxApVo9EwOqeqQ7mGSTMHcnwO+/huLxjIpfMjFvHzLITeFjob+tTiYXW0SQW+Rr2cJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erRHtwvKGpJ4wisYoVWjX+2Bv+ZLsI7q/gr2VPRD6oM=;
 b=SHjc1y9HWlpaque96YPCZ/gL6Qfg2Ib7bFWdYU4CRh/N6IVBUowtP9vFfDycITk93nIw7hsDgFtgLoPVJSu8Sp32p1dG4gB19cR8p3TmxSiLfuyrgY5C0jLsgLtaO0k/KJ5odaRBz1B7kqWYm7CUM73gCMdb/IxTnXMScZw7+J/2oOxX6DheZt3Yknm3CgrR9FrgjLv+oe05cLBS6hyXPa2RU7jRyCiwHIisuDphPMfKwokb6TL0jrZu+bJaBcOTg/0ryjTxuPHx0m7VnrNtqbYP3kQv+eFv0lpkOr6VfnG/XligDUnbvCx/7z5OSV5qYI36zbQKkfS+iktrQEenJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erRHtwvKGpJ4wisYoVWjX+2Bv+ZLsI7q/gr2VPRD6oM=;
 b=kQ2mjBBPAeVI27VJS7v4An2HSYGGQSXOWh3Sl0x1B7VH8OT3GaDq5Zgb2q03wVojhq3lir/cqo25vYnUE3rLr3FLWWwUfnjW7rf5HHfLARFX/ejwzBO/MiTLDEt1vle1mF2sXvDRJ0D/sl1Gq29lLn2p7E8kLfEb172JLDq9FBE=
Received: from DB6PR0301CA0090.eurprd03.prod.outlook.com (2603:10a6:6:30::37)
 by VI1PR07MB6319.eurprd07.prod.outlook.com (2603:10a6:800:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5; Wed, 27 Jan
 2021 20:36:34 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::63) by DB6PR0301CA0090.outlook.office365.com
 (2603:10a6:6:30::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Wed, 27 Jan 2021 20:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 27 Jan 2021 20:36:34 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 10RKaU5A012891;
        Wed, 27 Jan 2021 20:36:32 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] MIPS: Provide {atomic_}xchg_relaxed()
Date:   Wed, 27 Jan 2021 21:36:26 +0100
Message-Id: <20210127203627.47510-6-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 282db76a-c421-4522-87e8-08d8c3033cd6
X-MS-TrafficTypeDiagnostic: VI1PR07MB6319:
X-Microsoft-Antispam-PRVS: <VI1PR07MB6319E28581E15DD7A2958E4188BB0@VI1PR07MB6319.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dhe8qmhJLrsVUbMOZiYZJjkhPWwFV3yxGFRBO5KX9W4pCNabUxDdAebTfgMv2NZ7TEPxMoLNivoV3KyYwRaXOjV9rYfkPfXgDShv1fZyWlpgOaw8phhVaVGMsstHI+XoHEqw3uY/c8CsOL/WoYg+gPL7aRIhfrO1JdzX15UVaX6TtShYMzz6CQhU//NV8l3YYQCPQn/6Z7tbtxZhUzxJpK3KPXp6zeuC0F2zQvQzVjVw53Rm2fnB/TLjVuPsIHpN1R4dOWoMCDBcBfSwhtcusEDw7EWx2gmNftB+Vi80xsBbVPXNP1h7AWw2fTXjkIQn+IlT4h1AcMticRowYpvvZ6aYXXgkUPE7Liqe7Bl5CwuZvoT6ols2cKaLBi9QaI7D1COR2+EwETTSrTqkVGSF/RHtpM7bcyZiTd0ecitdI6ctTQMfECXBlBLcUYVqS9Fokth5kVKh7l1IjxPKB/liaxlJgQ9uzYum0wjKZ9Wb+Jbpqsild6S4xuUgq4QDKURBrzAyZVP6QdC6rWcYXMIzq7hD217JS/xJXho1mctXzYPB7AUSdvSxsjQNlZ4E/qTcV1HBl8r9wHziG5MH4wjFVCrjguXWJfoXU78go0K7G9cME+knE618l19wW+Mv5k6x
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(46966006)(82310400003)(6666004)(83380400001)(8936002)(5660300002)(86362001)(186003)(36756003)(2616005)(26005)(356005)(4326008)(478600001)(70206006)(82740400003)(8676002)(81166007)(316002)(47076005)(336012)(2906002)(54906003)(1076003)(70586007)(36610700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 20:36:34.4957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 282db76a-c421-4522-87e8-08d8c3033cd6
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6319
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

This has the effect of removing one redundant SYNCW from
queued_spin_lock_slowpath() on Octeon.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 arch/mips/include/asm/atomic.h  | 2 ++
 arch/mips/include/asm/cmpxchg.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index a4e5116..3b0f54b 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -266,5 +266,7 @@ ATOMIC_SIP_OP(atomic64, s64, dsubu, lld, scd)
 
 #define atomic_cmpxchg_relaxed(v, o, n) \
 	(cmpxchg_relaxed(&((v)->counter), (o), (n)))
+#define atomic_xchg_relaxed(v, new) \
+	(xchg_relaxed(&((v)->counter), (new)))
 
 #endif /* _ASM_ATOMIC_H */
diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index 620f01a..7830d81 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -110,6 +110,10 @@ unsigned long __xchg(volatile void *ptr, unsigned long x, int size)
 	__res;								\
 })
 
+#define xchg_relaxed(ptr, x)						\
+	((__typeof__(*(ptr)))						\
+		__xchg((ptr), (unsigned long)(x), sizeof(*(ptr))))
+
 #define __cmpxchg_asm(ld, st, m, old, new)				\
 ({									\
 	__typeof(*(m)) __ret;						\
-- 
2.10.2

