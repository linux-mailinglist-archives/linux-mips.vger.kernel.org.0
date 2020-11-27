Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F8E2C63A3
	for <lists+linux-mips@lfdr.de>; Fri, 27 Nov 2020 12:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgK0LON (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Nov 2020 06:14:13 -0500
Received: from mail-eopbgr30129.outbound.protection.outlook.com ([40.107.3.129]:4581
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725616AbgK0LOM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Nov 2020 06:14:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwNMq7erSwi/uLospLRlvO5yuw1RXu+eSf4EObQQZ+HrCRVEmZCkLucOwFCP9zrrGywqJzE47AdP7WovcsVMD+VePCMPDHkBUSIWlH+YVpRoc3pvcXOqJPrMyfwTuY8WH6yoREwONmMcqvLQTeSUZXFsKpIdALD7IFaMxZEj0bCJbGJI0JAfiL86EF5srPMUh7FTYdLKYU0DyXlbrY9u6wNcETmcj7VONhvhK6nyiJuCuhNrPDbFsN9wo3zVLh9k9uH8p3Vmrif/JxMfH5M/nkSYgucBr7E1ueWzmrZPPIH03uAgChRK0w36eeU2wYdPzVgWwGxoHFoTkqP1mYjlVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mFy9oYGqiepVVzIGg3OFdE29xvjij7+C4k6WYYPnXA=;
 b=H+8Gyox5LZhVLtascqLqDgvR3rBsLCI8leUKqAmo0lQ2O9tCDWZedilCH8hMWJ1kVbBbPnrUiUq++uMD89ihjzD6KRwYA1apnvsWfpA7egdjEYQ0iKqPyWmlc7PSVCPvp5wFrD2LJhOhngvug1miXtMs5tmm+j0qYBVU3HLrx6cTPfKqlb4CbfLZlQfsXc8NLbxgO/CTaXqTNMFxziaRA7Mhdi08bEdMB3lJL+vO/jqSF3GFPmXyEFWp5DfWVx6hJbDhvOCT+mdgUnk6Mln6L8SFeO8GHYX7TurS+hqrxT/0mu22M6ebiwC2lHnUd1Y21fxT5u4sRhOPWlDckjfZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mFy9oYGqiepVVzIGg3OFdE29xvjij7+C4k6WYYPnXA=;
 b=RerATvIo4cDmuszf3+PBXDeRcOMcLqMZaTSTArEQf2+YiIni9btnbYnXGe765EW1PEqsyHS0GjDcv010B1DxNl3xW5v7rIBgPhrB0DPkltiF/oPtY0eqOYT/WHF3aLZ2GhR930YnsvPfj7jZW0PWzxPhpey8WaReuaPk3dgWjuA=
Received: from AM5PR0202CA0018.eurprd02.prod.outlook.com
 (2603:10a6:203:69::28) by VI1PR0702MB3645.eurprd07.prod.outlook.com
 (2603:10a6:803:3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.9; Fri, 27 Nov
 2020 11:14:06 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::dd) by AM5PR0202CA0018.outlook.office365.com
 (2603:10a6:203:69::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Fri, 27 Nov 2020 11:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Fri, 27 Nov 2020 11:14:05 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 0ARBE3cT024928;
        Fri, 27 Nov 2020 11:14:04 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Octeon: irq: Alloc desc before configuring IRQ
Date:   Fri, 27 Nov 2020 12:13:55 +0100
Message-Id: <20201127111355.28601-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f28176fd-c565-47a2-72c8-08d892c58de7
X-MS-TrafficTypeDiagnostic: VI1PR0702MB3645:
X-Microsoft-Antispam-PRVS: <VI1PR0702MB3645CC25CAD2FDBABDC71CFF88F80@VI1PR0702MB3645.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gpEElMXkFf4ItT/tuNz2F9jDhAn3179fke30wBvKnvykbc9Wwdlc/Dg503ksK47rOQqmgNbYo1tsziwbf1+3jnyo0Gb2IoKNZcW35zOHhhr2jS2lBxBX9IwMKfd3nHUH2q6d1fVuuuSpLuUEyWikq0aNIQtbgZDJir6b1sHUj1KxL4QINYYQ1/61+QoK9ImuIzf5lc6DPKo/ByrU5HKoFIySIal3s2tnY2JJyN2EgOM3Imp8L8ts/jOY1h2cAjHEIWdsVhnlk47fgI4xOORvXkh18j5fMsuDgZ2iHLo7GN9b439I1iPhEyeolpHrVyLa37dx1e0Pyz/QqH2yywnVHAj5gmO9AULQyPIAac35JBAWppdYgOIJCwOe1qX3UTNz49KQ0AkqKXzqMwfY55sMhw==
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966005)(4326008)(5660300002)(478600001)(36756003)(8676002)(186003)(47076004)(26005)(86362001)(8936002)(2906002)(82740400003)(54906003)(356005)(6666004)(336012)(70206006)(82310400003)(2616005)(83380400001)(70586007)(81166007)(1076003)(45080400002)(316002)(6916009);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 11:14:05.9303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f28176fd-c565-47a2-72c8-08d892c58de7
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0702MB3645
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Allocate the IRQ descriptors where necessary before configuring them via
irq_set_chip_and_handler(). Fixes the following soft lockup:

watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [modprobe:72]
Modules linked in:
irq event stamp: 33288
hardirqs last  enabled at (33287): [<ffffffff8012e680>] restore_partial+0x74/0x150
hardirqs last disabled at (33288): [<ffffffff8012e9e8>] handle_int+0x128/0x178
softirqs last  enabled at (33284): [<ffffffff80859c4c>] __do_softirq+0x5c4/0x6d0
softirqs last disabled at (33279): [<ffffffff80164018>] irq_exit+0xe8/0xf0
CPU: 5 PID: 72 Comm: modprobe Not tainted 4.19.80-... #1
$ 0   : 0000000000000000 0000000000000001 0000000000000003 8000000002bdc640
$ 4   : 0000000000000000 0000000000000000 0000000000000000 0000000000000000
$ 8   : 0000000000000001 0000000000000001 0000000000000000 ffffffff803076cc
$12   : 0000000000000000 0000000000000000 ffffffff817f0000 0000000008000000
$16   : ffffffff80a96d10 ffffffff80a90000 8000000002c41780 8000000002c41788
$20   : 0000000000000001 ffffffff8013b248 800000008ef28080 ffffffff80bb8700
$24   : 0000000003bf0000 ffffffff802d0610
$28   : 800000008ef20000 800000008ef23bd0 0000000000000006 ffffffff8020d6f8
Hi    : 0000000000000160
Lo    : 0000000000000014
epc   : ffffffff8020d72c smp_call_function_many+0x2f4/0x370
ra    : ffffffff8020d6f8 smp_call_function_many+0x2c0/0x370
Status: 10008ce3 KX SX UX KERNEL EXL IE
Cause : 40808000 (ExcCode 00)
PrId  : 000d900a (Cavium Octeon II)
CPU: 5 PID: 72 Comm: modprobe Not tainted 4.19.80-... #1
Stack : ffffffff80ab0000 00000051801c0da0 0000000010000ce0 5e70a8a65518aeac
        5e70a8a65518aeac 0000000000000000 800000008e0cfb48 ffffffff81820000
        800000008e0cfad4 00000000f0ce6f64 0000000000000001 0000000000000000
        ffffffff801ccfb8 0000000000000000 0000000000000000 ffffffff817f0000
        800000008531d840 ffffffff80a90000 fffe000000000000 0000000000000000
        ffffffff80b20000 ffffffffffffffff ffffffff80bb3980 ffffffff80bb3980
        ffffffff80a90000 00000000fffffffe ffffffff8057a760 0000000000000028
        ffffffff80c50028 800000008ef20000 800000008e0cfb40 ffffffff80b20000
        ffffffff80835d6c 0000000000000000 800000008e0cfc78 5e70a8a65518aeac
        ffffffff80a9dbf7 ffffffff80835c2c ffffffff801357a4 ffffffff809bdd50
        ...
Call Trace:
[<ffffffff801357a4>] show_stack+0x9c/0x130
[<ffffffff80835d6c>] dump_stack+0xdc/0x140
[<ffffffff8023d490>] watchdog_timer_fn+0x3e8/0x478
[<ffffffff801f43e4>] __hrtimer_run_queues+0x18c/0x6d8
[<ffffffff801f507c>] hrtimer_interrupt+0x104/0x2e8
[<ffffffff801391a8>] c0_compare_interrupt+0x60/0x90
[<ffffffff801d0fcc>] __handle_irq_event_percpu+0xb4/0x4a0
[<ffffffff801d13ec>] handle_irq_event_percpu+0x34/0x90
[<ffffffff801d6b24>] handle_percpu_irq+0x9c/0xe0
[<ffffffff801d01f4>] generic_handle_irq+0x34/0x50
[<ffffffff80859678>] do_IRQ+0x18/0x28
[<ffffffff80107548>] plat_irq_dispatch+0x90/0x128
[<ffffffff8012ea2c>] handle_int+0x16c/0x178
[<ffffffff8020d72c>] smp_call_function_many+0x2f4/0x370
[<ffffffff8020d7e8>] smp_call_function+0x40/0xa0
[<ffffffff8013bc1c>] flush_tlb_mm+0x44/0x140
[<ffffffff802d50b0>] tlb_flush_mmu+0x38/0x90
[<ffffffff802d5154>] arch_tlb_finish_mmu+0x4c/0x88
[<ffffffff802d52bc>] tlb_finish_mmu+0x24/0x50
[<ffffffff802e0c54>] exit_mmap+0x11c/0x1b8
[<ffffffff80157bb4>] mmput+0x84/0x138
[<ffffffff80160ad4>] do_exit+0x314/0xc88
[<ffffffff801628e0>] do_group_exit+0x48/0xb0
[<ffffffff80162958>] __wake_up_parent+0x0/0x18

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 arch/mips/cavium-octeon/octeon-irq.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index a19f69e..0bccd15 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1505,10 +1505,20 @@ static int __init octeon_irq_init_ciu(
 			goto err;
 	}
 
+	r = irq_alloc_desc_at(OCTEON_IRQ_MBOX0, -1);
+	if (r < 0) {
+		pr_err("Failed to allocate desc for %s\n", "OCTEON_IRQ_MBOX0");
+		goto err;
+	}
 	r = octeon_irq_set_ciu_mapping(
 		OCTEON_IRQ_MBOX0, 0, 32, 0, chip_mbox, handle_percpu_irq);
 	if (r)
 		goto err;
+	r = irq_alloc_desc_at(OCTEON_IRQ_MBOX1, -1);
+	if (r < 0) {
+		pr_err("Failed to allocate desc for %s\n", "OCTEON_IRQ_MBOX1");
+		goto err;
+	}
 	r = octeon_irq_set_ciu_mapping(
 		OCTEON_IRQ_MBOX1, 0, 33, 0, chip_mbox, handle_percpu_irq);
 	if (r)
@@ -1546,6 +1556,11 @@ static int __init octeon_irq_init_ciu(
 	if (r)
 		goto err;
 
+	r = irq_alloc_descs(OCTEON_IRQ_WDOG0, OCTEON_IRQ_WDOG0, 16, -1);
+	if (r < 0) {
+		pr_err("Failed to allocate desc for %s\n", "OCTEON_IRQ_WDOGx");
+		goto err;
+	}
 	/* CIU_1 */
 	for (i = 0; i < 16; i++) {
 		r = octeon_irq_set_ciu_mapping(
-- 
2.10.2

