Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F396306542
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 21:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbhA0UhZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 15:37:25 -0500
Received: from mail-eopbgr150090.outbound.protection.outlook.com ([40.107.15.90]:29088
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232972AbhA0UhW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 15:37:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSB6Dkk+vYx8TmdHHp4ie3236eld5qZgZOCncuLzwzS5g2F4aqW1jxwuhtxB4KX2FmDKyscPXeFRKE6flYRkXHsRoxc1++w0eDXONWLmDxo0Kb+J1n27LFaEJSUYfxEnnfOPwElK4OGdsFFE/3UfBT+9o2v0FAFoXWhAhFpTHllBQfRGwUh+WU5pJA4/8I9jSxO0FmyNwQ53fPnOd78rROFsODQoi+YnfuiepqsWAtwvQ8ehQQ89AJgTHLhwmlKKVcH3YZW3vT1BAlTYRnh9bEchuaAy7e0hAzFLhVYF7OMoKlVgPQCqIrP8Cm/s/ryhdhLj+YTOdhCEQnF1TiqGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv5sxBfY+E03ThtPYiZDyZSqf6P6M9iWhyNQlTHrAIc=;
 b=oecoGLMyAxptkYNXRiFz/icl0el2QnVxz6PewtFIlcX9kB2YDoLIvMgSkru7CQIweBaOb0far16fgche0C7KxePw69LYnsnEzpwXT8crdY41iBqlxH2VOnlg7+C1F2VuJJRpkeY4vzBbyPehXztjfBZx0BZfDH9TlkhmXjG+2kd1jM/olPj5WStJt/CdCx45sRIwUe2PWSEmR9wdYZ3OZ5R9x9Wb8WcVpmOd6ZMKeqVgG9ln3oKAeWTPsfijZQ8RFCLzW/WO9W9DYnF1dNmay4YcEH4QWYs2pejNChtZ+i4aDmdolf7RQoZyUDCB7/m18IsEDJXAqm8qEjwixuqLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv5sxBfY+E03ThtPYiZDyZSqf6P6M9iWhyNQlTHrAIc=;
 b=U8FsWakgrowyQtA/4xxP55IaK4+3CpP7jIVcExXeITo+A65wnuUB+N8YErK9R6KUMy1OdwHWmRsG2auOEnVfJKYaudz6edeG7ROZ6/hbLchNsoP8lPOzCXBll0K4Z+PFH+mNVA7WnT/GGyqr/FZkX4ePTofqjeocj6Pd3J1aoD8=
Received: from DB6PR0301CA0077.eurprd03.prod.outlook.com (2603:10a6:6:30::24)
 by AM6PR07MB4104.eurprd07.prod.outlook.com (2603:10a6:209:32::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5; Wed, 27 Jan
 2021 20:36:33 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::4e) by DB6PR0301CA0077.outlook.office365.com
 (2603:10a6:6:30::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Wed, 27 Jan 2021 20:36:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 27 Jan 2021 20:36:33 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 10RKaU58012891;
        Wed, 27 Jan 2021 20:36:31 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] MIPS: Octeon: qspinlock: Flush write buffer
Date:   Wed, 27 Jan 2021 21:36:24 +0100
Message-Id: <20210127203627.47510-4-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aa150b75-3079-4491-a426-08d8c3033c50
X-MS-TrafficTypeDiagnostic: AM6PR07MB4104:
X-Microsoft-Antispam-PRVS: <AM6PR07MB41046BB960BD377B9DE131DF88BB0@AM6PR07MB4104.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zpVYX7PRjqP2UeSHoRahVgmeFwnDJn5D7hb71GhHE/4x6R3mybqa/8lcnv5b65JVRaJHXXz609sEFMa6RLZnT/ZBiHHYnycHbULHtYB4cHrSz3gsWm3oEhy5aB4iuzmBqbTzor97+7i7v+iH8W4cJrqk+k2jMKNbifAfZfWIy1juau7BZmQVz7StJF85Fi1sWu9E8odAxkOUVtCxvVQ6ix1BdGcIcgfNBz6RgXWsAhiI/65gprkNbgnVtT1Y05gnWBX/DXO3htsP+JubpomspyDZT74M8SMIKeSRJnelQK2TV4+PFErN2wStABCMUFIZ1DRkMfPyTstiEmr9zyXZaGEsv/flZgTQGn/bO+zsxveYTBVDgEEMojRNYYQGmzO659VTNtBPnFrKwmN604dx4D3tI47BLM9tH5btKMiJ60misu55s3SQiQ6dki3jQZtJb94neI3T8Mx3T10+VKkEZbbCmu+niXPuTZx4b6S0knvW6hoIG1qxheS3p3Si7wrs8Pc7h8OQ82HeHgvXtjYCTyYq5A+7uPsXvRfUo/BL4ZAhf6FN0ZBWxg3PM+PzJPcy+braHJ8c5qDuWcscgapdcDzOafFyPCJt8o9OG6MSZfiGbwHDCd0FMcqmwgw3EMZ
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966006)(2616005)(26005)(81166007)(4744005)(82310400003)(36756003)(4326008)(8936002)(336012)(356005)(186003)(2906002)(83380400001)(70206006)(5660300002)(82740400003)(478600001)(6666004)(70586007)(86362001)(47076005)(54906003)(1076003)(316002)(8676002)(36610700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 20:36:33.6197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa150b75-3079-4491-a426-08d8c3033c50
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4104
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Flushing the write buffer brings aroung 10% performace on the tight
uncontended spinlock loops on Octeon. Refer to commit 500c2e1fdbcc
("MIPS: Optimize spinlocks.").

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 arch/mips/include/asm/spinlock.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
index 8a88eb2..0a707f3 100644
--- a/arch/mips/include/asm/spinlock.h
+++ b/arch/mips/include/asm/spinlock.h
@@ -24,6 +24,9 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
 	/* This could be optimised with ARCH_HAS_MMIOWB */
 	mmiowb();
 	smp_store_release(&lock->locked, 0);
+#ifdef CONFIG_CPU_CAVIUM_OCTEON
+	nudge_writes();
+#endif
 }
 
 #include <asm/qspinlock.h>
-- 
2.10.2

