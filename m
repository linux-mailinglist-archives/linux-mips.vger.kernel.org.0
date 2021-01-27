Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CD4306545
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 21:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbhA0Uha (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 15:37:30 -0500
Received: from mail-eopbgr50094.outbound.protection.outlook.com ([40.107.5.94]:65020
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232987AbhA0UhX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 15:37:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQg35D5m7YXE596DRXqGBdBVUmR1rocubCJ/klLuUFUErHP/IAizpzOkXEGSyj+9NX7t5Gkp1PTeUzgD6IlJdvkvDqwVJrUNFMWOl1GLSkkLn1xoKQEKFzqP9i39wu/JUV78nCVgCdO1TdvGS+rFpeQ8VtAFMoJ6Abj5UhN7PGt8Vlm6KmYDMylibb5tRzip/AoqvsWinFsh3aC+mEt9QgVcpnkny1bc2NYeYKDb9vGIpymurEk6t7jes0gpsWXmN2P0TKyc241aJV5am907c7I4d+GZzZDtGks962lGDrBsmEpqV1gDw+AIrUvky0mXQgqud68cWF9+yKcmr9BXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhihKUSaFiOfu/Po6EFhpmEeUqLfLhBNOF3c6m/6qaU=;
 b=UqfvBLd26m1NOc3KdiQSYqCAfzY4ZmgaOsez9U3ZmJqWyT+819csDKwHgg3O1zhRBKkyQguzJhMaGKDucO2Vd8G6fS9XvhD5WXjVCZNdfrK7PLeuKahgKdNbkFIOmKhw0IQNO51Ahaj0IB0FaQmbm9cMjZdSWXjsSt/d6XqOZz3rYtSIBJJBRZYvchdOXQQtICh73sT8rK8gSeBJzltu8NVbvTenVCGYkzuNyKihypMUHgUbFKEnJQtR40pBhEKndesI9SqUqWfER5C9K6R9q4g8WLA5D/TsflyUvnuWlY40JfMkpEfbpy6hxRKOS85NceAKEG112HqMulwAOcpKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhihKUSaFiOfu/Po6EFhpmEeUqLfLhBNOF3c6m/6qaU=;
 b=H/kCBbHm0YWrPqEtrSXGeRpBIJITMzjgz8yxvm/RWXb5lN+rGSUXBpE0VoqGJJiLq+3Ka1t+vHsKwTF55KuZvVcMOauf+SYDiVDrOZpLibwiAMF/5G8tE93tgDSroKv2pY+VFIoj/oMsLNkGylC7QF55h4srhgyR1FnRr0jhugo=
Received: from DB6PR07CA0082.eurprd07.prod.outlook.com (2603:10a6:6:2b::20) by
 DB7PR07MB3947.eurprd07.prod.outlook.com (2603:10a6:5:11::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.11; Wed, 27 Jan 2021 20:36:34 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::56) by DB6PR07CA0082.outlook.office365.com
 (2603:10a6:6:2b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend
 Transport; Wed, 27 Jan 2021 20:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 27 Jan 2021 20:36:34 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 10RKaU56012891;
        Wed, 27 Jan 2021 20:36:30 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] MIPS: Octeon: Implement __smp_store_release()
Date:   Wed, 27 Jan 2021 21:36:22 +0100
Message-Id: <20210127203627.47510-2-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 869a0cb6-4be5-42cd-3a58-08d8c3033cf3
X-MS-TrafficTypeDiagnostic: DB7PR07MB3947:
X-Microsoft-Antispam-PRVS: <DB7PR07MB3947F4760413D959CCA40B7688BB0@DB7PR07MB3947.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:154;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LmrZp5bpVy8gD1xIcStJUfmQdpR4VKRWn8zVJ/phzm5m+Jt5reqfxINm8v7qAqfs/sUap+dRM+OVD41fZOFKd4NBOM0pQ+e6rsdOAOz1xOJCKJ1EjV+bRp4KBomSi7HhytdtrJ9aZ1tlOLHBNg7pUl4RDK9200dj8PdUFUs2kzGrJnHLYQB0ZIsPYL0uO/NyncBkqIixQpnRSRPXiW0qXHGhNxjzyRwpBgv6QhdUx9SpEQ9R8M66UpPkiHsJ3IMzrXLbI5u7M4yWSOgSH9ZLxTOfxwt+MyO8ydOw1xgretRpooknDF+LQs/IrvPA3N7F6vP7MoqdnBWW5JEAnjvj+5WwTP/otjWKwuHJaInsbB7fsNiFwajzuuaXnU3i0A2H6iydLdw9Bo+3WZEueNRPQauo7BWT3o2HyCwVrgolJy/j6UAFR49G0/YnPVPIfEm63bKmKhOC+6ZZIqv+z1dxzBr/yF5Uv2O6LZuQtUaZm/OvC28p5OZ9dX1IQbUtPejAyrn+jfcL4rZ2uuTtpf+94rVlwUuIEiZzIfBJfolHDr1tMzHl/QPyxn8/9Cm3Sp2OR9Rhfe4MJHKcKIJahEpfe7zhw4feI/W5YENnA4oPR/hyEX36GXVeKoKkVXB5xH59LyhGieN1A31Oh1wOxxPGdaq8B3qdaTRgQqYq++kpDtqxaHFnE4Wk8UzuIEQqtiigBtfLMCja30T2qGJoCB1/A==
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(46966006)(336012)(82310400003)(8936002)(5660300002)(47076005)(8676002)(70206006)(70586007)(1076003)(186003)(54906003)(966005)(2616005)(316002)(478600001)(82740400003)(356005)(4326008)(36756003)(26005)(86362001)(81166007)(2906002)(6666004)(83380400001)(36610700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 20:36:34.6757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 869a0cb6-4be5-42cd-3a58-08d8c3033cf3
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB3947
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

On Octeon smp_mb() translates to SYNC while wmb+rmb translates to SYNCW
only. This brings around 10% performance on tight uncontended spinlock
loops.

Refer to commit 500c2e1fdbcc ("MIPS: Optimize spinlocks.") and the link
below.

On 6-core Octeon machine:
sysbench --test=mutex --num-threads=64 --memory-scope=local run

w/o patch:	1.60s
with patch:	1.51s

Link: https://lore.kernel.org/lkml/5644D08D.4080206@caviumnetworks.com/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 arch/mips/include/asm/barrier.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrier.h
index 49ff172..24c3f2c 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -113,6 +113,15 @@ static inline void wmb(void)
 					    ".set arch=octeon\n\t"	\
 					    "syncw\n\t"			\
 					    ".set pop" : : : "memory")
+
+#define __smp_store_release(p, v)					\
+do {									\
+	compiletime_assert_atomic_type(*p);				\
+	__smp_wmb();							\
+	__smp_rmb();							\
+	WRITE_ONCE(*p, v);						\
+} while (0)
+
 #else
 #define smp_mb__before_llsc() smp_llsc_mb()
 #define __smp_mb__before_llsc() smp_llsc_mb()
-- 
2.10.2

