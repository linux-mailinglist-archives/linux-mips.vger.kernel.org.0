Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868EA7E1D0C
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 10:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjKFJMs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 04:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjKFJMr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 04:12:47 -0500
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2090.outbound.protection.outlook.com [40.107.247.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF35AF
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 01:12:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4mrjXCtXx7Qny2/VgCJUq3mRjDcH3qYI8kQv0MpMyNcB7fFGnHKgxhIqyECHYOPyENGxa59nKty3rZIje28tmEkwg8JOhENJVHxWxLkGow41pYwyKIASXSlPI3AMLfQoFmL0DbcgtjWdGnSgekpIkU2rddlZ2+R7GFXJJhf/OP3SvjeFvH2PMr7yffZt5hTvLAJJoEW7KncyN8glH0+Bdzr2lPB2xKA/EK4QTmpDReqxNsjgxZ0VOO7+G3phOR2aVqYrky8EVSc9zvMoBVVz3jyql5GeId3t1Yx4+DeZYbftFaIYcaTPBMv3bB29wh4rWf2f1PVyKiHr/JKDtqreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGKRnJHtwY/+5OK/oGXhL4tS+6yAqF/5j2CEn4eWOow=;
 b=Q6TBk6zlDqewAZFHeV6LlFuXF0wubaBKfsxru5oyOgR6v37cvmrFLXV2eeZ2j3ghNBLaiR90Kh/FxuYexUWtjoSCpMg3duxmUca0DGWsmocaFj9mwSIGOEPeDuV7RBuPkN+GMURxW+6e/UabmVceCCh1MEglOpfSLihCrngDQawJTOZQ3WXBpE69bNX8qQBb1R7gSS7IYWu5mLo7S62sAFVE2Wg4SQF1Tr6O0CKMET0GDS/6tU9IAyJ6+9Z1NsdYGfJ1lJeGehescUOpisZOdkMUyeDbS9C8M2ljpJsGcYJx06FSwW2rbAOroC9nkBK/Cv43ZAZl25alv+dg3ep/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGKRnJHtwY/+5OK/oGXhL4tS+6yAqF/5j2CEn4eWOow=;
 b=dr4P2iAiuf4Ju3Zn6n1/0qBBL369nXJ29umbEib6IZJoBba6OnenjmzzdeO5vYVqFN/Zg+P5OSJKhaQ2KKqZ8CkfkyyyBDDOpFYftATzgC+Y9fv3SJePRmzjBMi4qC4bheC0io1mYSWca9+rxh6rrxXzU7XNi7RdPnkRHWM4hGnH70J0+FpRTxt0CngddgziCubqP6Txq8lUN+PTr+DyCam/c1i/ObPaERTwvKDKK8CykB8ApQlYc9u/M1tc0ifVW160l0y8CHphFRW3cHarzQFMk72R0OFO6ZOMtHQHSQWM3WSBlK3cl79ThxIkO6ChUqTk68z81v/hR42O1MPYKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM7PR07MB6705.eurprd07.prod.outlook.com (2603:10a6:20b:1a2::10)
 by AS4PR07MB8435.eurprd07.prod.outlook.com (2603:10a6:20b:4e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 09:12:41 +0000
Received: from AM7PR07MB6705.eurprd07.prod.outlook.com
 ([fe80::bd44:ff70:6237:b6ea]) by AM7PR07MB6705.eurprd07.prod.outlook.com
 ([fe80::bd44:ff70:6237:b6ea%4]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 09:12:41 +0000
From:   Stefan Wiehler <stefan.wiehler@nokia.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Stefan Wiehler <stefan.wiehler@nokia.com>
Subject: [PATCH] mips/smp: Call rcu_cpu_starting() earlier
Date:   Mon,  6 Nov 2023 09:51:40 +0100
Message-Id: <20231106085140.58254-1-stefan.wiehler@nokia.com>
X-Mailer: git-send-email 2.31.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::20) To AM7PR07MB6705.eurprd07.prod.outlook.com
 (2603:10a6:20b:1a2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR07MB6705:EE_|AS4PR07MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 4032d988-36f7-4dc0-e53c-08dbdea887af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aurnCOjt79+w6Z+iILP5YV+5MQsKSijGiTiFidD01X37yV8Bu1JNWNipsw7ehXCvHbtDppPpm1b/HE7PA09PV/UPZeZuRCHBalGcSbfgVAsUYP9EtCxBQ2AUexkl49QZeO4rq+zXak5laAfRKwQa821P0llgg3ERI4DOlM3xpbhrL05+YfZSW/JYa3+RWAAegmcgBmbUxw5oV9Vh5hojdT422hNS+mClYjt5p2j5LRLPODCsugdfoopZI8xX29/eVc2q09P6G2djKCUg+W1ub6ty79xHYUMMUINyCcHdWua8UHZyjKKNah9UP8cHwxWKpZWFYpTzAZ5msz2i25fltxsVykaOwg+D+ibd4A8JQI1UpEEMwCx3F2WgUmNPaKFTTvDm/ErQkuMSn2Bg5vpZCI1Q2kh8PBkcFTSXfVMxbsIF5NohBuMbs0abe/TEBD7HqvEC8wEc+c9bNlVSqlgonqC9gnqWS+84ugtnL7jI+Cwm1I2w5dnJaYKKA+jZCYkNKfVYByolJW0XvIDyFHIn7UG7nTW5naXw0EOo3OaUBNAm+HgdT+GJ+IRNqJsdZ/Q5tQyn9FeVQD8U8s+BHCnFye7a9bOVvw3hL/Lshs/OgzKEWujkGRrYCUvq0AC4zyMSNgJDjcb7FiAegwEd7hmiED+FQDO6jr1uhUCEYUJ75TuE2V8+VO6pavwhewpAdV5tzTBQbgV64ZZCXIkDwGiEhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6705.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(41300700001)(44832011)(6512007)(52116002)(6506007)(2616005)(6486002)(83380400001)(8676002)(4326008)(8936002)(2906002)(5660300002)(26005)(1076003)(6916009)(66476007)(316002)(66556008)(66946007)(82960400001)(86362001)(38100700002)(107886003)(36756003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a3pBQC964YVFU2BM5vnXi9vQvGPa0spQ94SsBMzKmdJeScDN4ECIjaqhpYKU?=
 =?us-ascii?Q?LDMlvaETaGUgpVZrgBFPl4LId8JXtuiXeyXwxyOiXjtHrfAX0mL0sm/HYHXA?=
 =?us-ascii?Q?2A0QNFi5b8XgfQnmd97Rg6rfh0npzdePpayf2aRj0Kmo9MlPpF/WHkEqN5bc?=
 =?us-ascii?Q?vj4ShqOy89tQOXmEk9AdcVyjTTAfIgdgLw2YkfUz9AOT9HuWvvI0YkHwGDGs?=
 =?us-ascii?Q?Tt3yPuV2kVVqJU6dKCgWkz5kXpzX6AjKiSaxG9ULEt2V3p3GFsv66CRnEvyB?=
 =?us-ascii?Q?gHSYhRjSwODrnlICLpxaEOOvVVSLW2iYp7RT9Inmj/ZpsavlM43pkwgkthUT?=
 =?us-ascii?Q?A3GwwU1eW+b6wmmAshkcsiN6bioy5fMIca0b2SuFwB4U1EkBt6W5tENH7YaO?=
 =?us-ascii?Q?K/f3U8FhQRmErQ++evcQF/PO5bereaPnDzmZ3TBKGtsi4ErUqh0HbPtDrzCa?=
 =?us-ascii?Q?pddYgDEe8F6Vgjchd/WZoAGZj5jIvLfDeQgkOj6ysE/FBbycTvovqjALJqkd?=
 =?us-ascii?Q?Jlsw/oKGFRFtDrYWSqaVwI8yVJF5F0DnwlTdjZLo7gG5lC8uNVb5LAeq9g8A?=
 =?us-ascii?Q?ywbucFDQaxd5L42zBvWcyb8si+YeiLVJe/yZpF9KisiEgzIKWTG2SRZMhurk?=
 =?us-ascii?Q?9rkA6qS14xoSO4abWr2rRaQy01XjUGDCZSmwzJbCjV+rRmxei6JEgseQz9Qr?=
 =?us-ascii?Q?dV0v6oyWfbYJceNxZGBBZVn9E5uAlEkZJz78Nvgpd3Mz4vF8RNETF85HUhz/?=
 =?us-ascii?Q?ebI/O7Ny/TpOQissI4TVbO2VNLW6g8y4Ev0Dlh8CyRu5HUKOb7MAY0zpUMgY?=
 =?us-ascii?Q?6eVxsvAUxLO74sy99xaaaYVgPf6uOBrO30/VlAtxc8l9BdXyyRLhWb6bQzoY?=
 =?us-ascii?Q?eWwzp+bnEU/bNYM7wRTZZ06CKOO9adSPv1D0suCJfjsxQzAUrLk4hHxl0tBV?=
 =?us-ascii?Q?+KBf4wSbNg0rwGmcQ7dxwocUzNGS+wORuQUYeg//SkNn39qOLsFslSG2Byqn?=
 =?us-ascii?Q?ucVDGaEInyFH4JvVqbYRklFK9PdZkKFL+AOUcy1tuzItWFnmVz8GoCODRb8G?=
 =?us-ascii?Q?UK36yLjawkh0Wb6b/Dpc4nRO17Go8QkMpS31LD1RHcVQR+aVvE0oDZHKJqX3?=
 =?us-ascii?Q?TOh365kbcvMWjvIOAWkWLvV4xRZCqdIsQfqQ+oA3TOfBYla/z6Jdo5kLRolt?=
 =?us-ascii?Q?nGRZdgb5dN+IaunIDxfk308dugm8KXbDqiLZhmJn0pbrBgMNTIaSLIgZqYk8?=
 =?us-ascii?Q?9Q//SRBqtkLGNWDJoyG93dVJJD8NAy6+Oyr5Al8Kk1xomTlzmPvohJXLBn4r?=
 =?us-ascii?Q?hklqm+8BxZYh7N5b77jUKD7trZyv2iKw/NOleLMj70EL6lO5XlF1j2/FDlt0?=
 =?us-ascii?Q?xIJQC1+pP5n3MxoFSDZYZ+pepbeZII1Gg4gisyDSUkh/GOwnkSeRtrhYSDyo?=
 =?us-ascii?Q?Vp7rv0SXOK3+1tMXvKcr8GEUim3/E//Fad5RY+kfvrDjP3SuG1H96GDX7oSn?=
 =?us-ascii?Q?TaizVGQvZ7o7QqGOGIdFsbL+fulXEorvlaFCLEmMiy2JgBL0BVnxrYkuTGEj?=
 =?us-ascii?Q?IczPDEE17tRHl41B4CuIyUTLpOlbO/VDWKCncP602wkTLQo/W6OV6yug6lnO?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4032d988-36f7-4dc0-e53c-08dbdea887af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6705.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 09:12:41.7187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdR3LfJbfdvfPTBG7rO3h8+eSUCOPO96nb5a2lqkNg2OxqQXnbDYIxZtxwSHhOjtvld6U2SXvW1BcGY+2e2vlXwGMpIuOLaAZoQspCHjLkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR07MB8435
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

rcu_cpu_starting() must be called before clockevents_register_device() to avoid
the following lockdep splat triggered by calling list_add() when
CONFIG_PROVE_RCU_LIST=y:

  WARNING: suspicious RCU usage
  ...
  -----------------------------
  kernel/locking/lockdep.c:3680 RCU-list traversed in non-reader section!!

  other info that might help us debug this:

  RCU used illegally from offline CPU!
  rcu_scheduler_active = 1, debug_locks = 1
  no locks held by swapper/1/0.
  ...
  Call Trace:
  [<ffffffff8012a434>] show_stack+0x64/0x158
  [<ffffffff80a93d98>] dump_stack_lvl+0x90/0xc4
  [<ffffffff801c9e9c>] __lock_acquire+0x1404/0x2940
  [<ffffffff801cbf3c>] lock_acquire+0x14c/0x448
  [<ffffffff80aa4260>] _raw_spin_lock_irqsave+0x50/0x88
  [<ffffffff8021e0c8>] clockevents_register_device+0x60/0x1e8
  [<ffffffff80130ff0>] r4k_clockevent_init+0x220/0x3a0
  [<ffffffff801339d0>] start_secondary+0x50/0x3b8

raw_smp_processor_id() is required in order to avoid calling into lockdep
before RCU has declared the CPU to be watched for readers.

See also commit 29368e093921 ("x86/smpboot:  Move rcu_cpu_starting() earlier"),
commit de5d9dae150c ("s390/smp: move rcu_cpu_starting() earlier") and commit
99f070b62322 ("powerpc/smp: Call rcu_cpu_starting() earlier").

Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
---
 arch/mips/kernel/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 8fbef537fb88..81f6c4f8fbc1 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -351,10 +351,11 @@ early_initcall(mips_smp_ipi_init);
  */
 asmlinkage void start_secondary(void)
 {
-	unsigned int cpu;
+	unsigned int cpu = raw_smp_processor_id();
 
 	cpu_probe();
 	per_cpu_trap_init(false);
+	rcu_cpu_starting(cpu);
 	mips_clockevent_init();
 	mp_ops->init_secondary();
 	cpu_report();
@@ -366,7 +367,6 @@ asmlinkage void start_secondary(void)
 	 */
 
 	calibrate_delay();
-	cpu = smp_processor_id();
 	cpu_data[cpu].udelay_val = loops_per_jiffy;
 
 	set_cpu_sibling_map(cpu);
-- 
2.31.0

