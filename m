Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0596330654A
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 21:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbhA0Uhp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 15:37:45 -0500
Received: from mail-eopbgr80100.outbound.protection.outlook.com ([40.107.8.100]:56424
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232992AbhA0UhX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 15:37:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBoCbqB9QkPC+pdC+xVfRHsKazZTg0qxBXNBFDU3LKNHt/uzGFfWslD7maGOjE5oSZS4yDUOHPObRP6RJ2oepEKq297aGrummRD3xvWm4I2KvS91kHts243yhufgS0NJzvQcNjZqHJRH44jMvB8S5g6gLVJzoGzp2pDL5aOS1Ajd5BwK4EErNVMSOnr5taqp550cS6RVpsj7wM8xQw1GRofbkKkATSOwsqkGY+QudttRCvS+IlmAVGUpc4+Dx6pzW3uXujUr5mKHEouP9SN8ejDj29b6VPJ1obo/j3Kg0cM3KK7JP2LlGZb1n3z5oZJh+5ieaVouhNfgQVqG2Kzg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D1W29JTAFMesqByebVBoGJ8/uFpWAMR2iZtmsgr0s8=;
 b=UO+U2LKisbTfS8vNMAX7YYtnAzjV0xVN6ZVlD7L18NQBaCzTNds3t+mi8gRI3M1OoElC/CYmcc21IP3oIeG3MdJclt4CA9CNJy3LiVp78nrqcBYcfEPE9ml+yHibWy3CsueSgtj59Lg/xP6nCtjyqQlUmmZJoYbsb5HygDB56uxc7KcCgvRXyfTFdoGBj3MQNdOfilJu6I5Ufg2A3BAjvZoXWD/18Y7BnFz0ZYTOnS2MAwxSDsOu70yeWnECMAOYvwCwGK2G6IR2km0ZarXMz2G+a5vPdGYFIjMZX+cwzS1SqGP6K1ItjSgKNXD1MJeYHnB9Ocb87jziX9wZCrEyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D1W29JTAFMesqByebVBoGJ8/uFpWAMR2iZtmsgr0s8=;
 b=AyMGVm7tjP8rRDtuYZ9DjSwgWm0UJLtSSY+AojzGwg0/uDVGT0Vs4vDJTx34mef2Xi2gge5rESUOvYwTG2mN6wYoSXq1GixP/aF2J3iWYpSt0NjKvsWuZWgwf9/iB0ISkGB0oU4evhwTSR/UPliB1LAUKKxjXgf4ii9e1J1PTpw=
Received: from DB6PR07CA0168.eurprd07.prod.outlook.com (2603:10a6:6:43::22) by
 VI1PR07MB5039.eurprd07.prod.outlook.com (2603:10a6:803:9a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.10; Wed, 27 Jan 2021 20:36:32 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::18) by DB6PR07CA0168.outlook.office365.com
 (2603:10a6:6:43::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5 via Frontend
 Transport; Wed, 27 Jan 2021 20:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 27 Jan 2021 20:36:32 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 10RKaU55012891;
        Wed, 27 Jan 2021 20:36:30 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] MIPS: qspinlock: Try to reduce reduce the spinlock regression
Date:   Wed, 27 Jan 2021 21:36:21 +0100
Message-Id: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 798d0dd8-d0af-43cd-0014-08d8c3033b6b
X-MS-TrafficTypeDiagnostic: VI1PR07MB5039:
X-Microsoft-Antispam-PRVS: <VI1PR07MB5039FC3F6013348D7D39C8D888BB0@VI1PR07MB5039.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YW5K02wIbYLPcuIDFF1f1kfBkZMKIO71X4J1NLv7XfUKsgUIEecwEt3krxxmvy8Ip2lGbYD2zt/pmHWJ7+cP5W+RasAjkk64cv1zIvM9fCywDkQPNJKkneByf8sTunQdLXi0sgeld7sm2uuiUWi+9S011IoXqkZ6Xg1jU7pv4xDV6EAT0zW2lfShrrOVnh5jVMHAy41hRReMW+vWUOq/yswjyfgX+e1YALz0KPvUL432BbXMUp63VHk1M7HPOf5m5BFBXIhxkt72Y/vwLBWRRaZiDpIBTE4m3cWY9bn47eCee0fFSNUkITvE5E7A2ULzTnhSI2lsdv9HqrgvhHRUdTkjn23Bf4sa7HyIKKJLyURX+0+e9wlsy4XeQ5Ed+FJsc39Y+R/fxQ4KP+JuJhecXFBGPvYi6T2MKqSfwq5QAOAe2StKbVWe5t+EWevnllQHjg1PnqVyKatmXGfO5iCwOTehSbfzC9BFgc3P7ZTKYmPCd+ZUTmBDtQ2lwWzWgcHdPH5Ahy3gznt0Z/fRf/nRxtn/TBzOhCryKmaP9PDQfLIO5iKBrCbGsgpcSByTqJMXd1Adwk6xzYz452ByPs+LD3tMdXbowz2YMwIbL3U1jV5nNcNJdlWFVH5VhTxTmJV1rmGGZuPIRYt1FV+3kgxx6q4/PiUoqo1LNVjShhHJWFHi67xJDlN1Otlmob807LfowP7tLXq5beGXf3cFrJs1Ng==
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(46966006)(82310400003)(86362001)(2906002)(478600001)(6666004)(8936002)(966005)(4326008)(8676002)(316002)(70206006)(70586007)(2616005)(81166007)(356005)(47076005)(1076003)(82740400003)(26005)(186003)(36756003)(83380400001)(5660300002)(54906003)(336012)(36610700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 20:36:32.1151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798d0dd8-d0af-43cd-0014-08d8c3033b6b
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5039
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

The switch to qspinlock brought a massive regression in spinlocks on
Octeon. Even after applying this series (and a patch in the
ARCH-independent code [1]) tight contended (6 cores, 1 thread per core)
spinlock loop is still 50% slower as previous ticket-based implementation.

This series implements some optimizations and has been tested on a 6-core
Octeon machine.

[1] Link: https://lkml.org/lkml/2021/1/27/1137

Alexander Sverdlin (6):
  MIPS: Octeon: Implement __smp_store_release()
  MIPS: Implement atomic_cmpxchg_relaxed()
  MIPS: Octeon: qspinlock: Flush write buffer
  MIPS: Octeon: qspinlock: Exclude mmiowb()
  MIPS: Provide {atomic_}xchg_relaxed()
  MIPS: cmpxchg: Use cmpxchg_local() for {cmp_}xchg_small()

 arch/mips/include/asm/atomic.h   | 5 +++++
 arch/mips/include/asm/barrier.h  | 9 +++++++++
 arch/mips/include/asm/cmpxchg.h  | 6 ++++++
 arch/mips/include/asm/spinlock.h | 5 +++++
 arch/mips/kernel/cmpxchg.c       | 4 ++--
 5 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.10.2

