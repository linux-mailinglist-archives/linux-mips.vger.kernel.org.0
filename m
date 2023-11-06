Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9927E2115
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 13:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjKFMQK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 07:16:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjKFMQJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 07:16:09 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2111.outbound.protection.outlook.com [40.107.14.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F27DB7
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 04:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYet057N+FH6cevfDQJgOV74gSLw/Y4UY+tRpX0N16QKahmvgWXumcnyTtetgHBMlUlVNRnXC4ZuztA7vTpADgUIZY36wqfDV3W5pM+Xcqm5oQp4Was7Iv4ek8hDTGTZsM/9JIQ3/ag6qHLkczGeChdSPWCX2ZlZv0bSV1x863y5Djvrgn7HzZ5c0lddZ+WzvIWbbmtxiDriKuZsVSoZun3lUeH/Sm5ueFkiqVKLpz1MGLUOko7rHPqdYALZt/QYjnGETzdIaYFC9doGVbZ2x5Z47Je8tanJiqZSYvJY2NG866p9IovwBpbzjI0O0Agrve8iN83y4DWR5wP11lrCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iSWh3TuD6fd8F+iMFFjKGHKyd+m0vUNeUA3qHSA0wU=;
 b=XrqK5gJuipsw6vrol55pZK7RU88qz3RXStDFeRhtU2hg0z27ntVQ+CaSs7PKQfHFYAgik1fIeC8ZU7dNaQ/w/Kqxy0Qco7Ke65iM99PGgLWoAY8KySh+0D5aIvWOKH4yBUjKl6RMA07Jye+0BNo94ZLBERKJCxy0bA48EtbGQ03YPScv8GqEB8l+iSFIZFpFUxknuAEdj5U1aEVxd1cVnS2s3H361oP49/joahAWsU2874QcJiBfCaj6EVIMGVB6XY9F51W7aha24YmlEKShdmgpzQtIBtro4OAH9hm3qcd9xtLa1V9QN8m9w3v4PRwbsuIZoytxGfwgAuerc/9khA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iSWh3TuD6fd8F+iMFFjKGHKyd+m0vUNeUA3qHSA0wU=;
 b=gJJPqcgf5MegPXFgf065e05h1MVP0oCZdOdtZt7mj09fDOPOvlozr9dx3HdJQb50bEoDCTpcbhybJcD/NsJZAZ0BX0nWB469iQ9B/Hk473/WXPbFDiOXgI/ME16tjp660/TKbyLQL+D45x+1LaRytc/kqXhVj2IGHKSQHVugkTvzy0YP/DpZGREQKB4H/xHY2LedU8I/yxiXV1TlLu1MyW2luPznpic1zLSNwyvwemNUjZiyYeJV/rUvSF5J/uzRJBJJw7V54tRfQLUoKmWuBnuIgl/OXPfZWauAMSNXu9CwO9TkoK6sBnVyQu9EwjBXFcyApNVkg4c1BZ0DEno/dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM7PR07MB6705.eurprd07.prod.outlook.com (2603:10a6:20b:1a2::10)
 by DU0PR07MB9089.eurprd07.prod.outlook.com (2603:10a6:10:40a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 12:16:02 +0000
Received: from AM7PR07MB6705.eurprd07.prod.outlook.com
 ([fe80::bd44:ff70:6237:b6ea]) by AM7PR07MB6705.eurprd07.prod.outlook.com
 ([fe80::bd44:ff70:6237:b6ea%4]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 12:16:01 +0000
From:   Stefan Wiehler <stefan.wiehler@nokia.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Stefan Wiehler <stefan.wiehler@nokia.com>
Subject: [PATCH v2] mips/smp: Call rcutree_report_cpu_starting() earlier
Date:   Mon,  6 Nov 2023 13:12:07 +0100
Message-Id: <20231106121206.62650-1-stefan.wiehler@nokia.com>
X-Mailer: git-send-email 2.31.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::10) To AM7PR07MB6705.eurprd07.prod.outlook.com
 (2603:10a6:20b:1a2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR07MB6705:EE_|DU0PR07MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c13c17-dc33-4fd7-1f5d-08dbdec22405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DdJwNst24pWJ6M1DGwuNUeCFNjFVCVJGWnLq5XPmhSP3DsKeP7i0JBAY5iVtO+ojV9nh/+me+PJoR+k2Zev4bT5t7WCQ8Tjma6dLQN9Q/X21yHXW2CVQFn/KtM5Gy1XdbyiXEOZDNAWvguFJtBSe8mHkrH948jhhBzN5olC10PNJId3ZOHC2mM6QU3rt7F6UDsfqLOU9TRfH6F73plA7TsZcVu26pHC239zDiHrAMo/mMU3Wkrdjf/O5f7zxzVQLGWiHQSOj7rLHevKHU3wXVg8pmzRbKyGEq0TqaWca1ZkWWxybYldjqyItZNiRh6+TvYEJwIOUUCH21qoXcu1ELZ+X/SQpm6OvPOFWPqPiOws6kzqVML9uRN/bnI0gMk1zmujZ6mDuxg5osiayMq5slYtweOHlu4EWYXq+41Djy/K1RWM3vW+Zl4vmi/2vjqPrOht2dSu/94bpe/skVZv5/wgZda2OwkGpOdE3UvGQAyK9nCcnaRZKChd6C+b+CCjAL+xfosOvSNXahThiagW8p1VdvsqT7Wc6LCvgFh2ZV9WCW+aTv5yiV7Wh5ivx9+GeARFtnQkf+xAlH3N47lhsmVbaQrMR5Liry7sDaXQ4T6NZpe7jG4++xRjYvdCS8W04AcvLC+lWRCZLRtDSiUOSrCpp9/ZkwY+gueOvVoLeUS7EZFEkpvd9iD2IqF0OJqJPVpj+Doz0a66k0KmNycD5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6705.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(230273577357003)(230173577357003)(1800799009)(186009)(64100799003)(451199024)(2906002)(8676002)(41300700001)(6916009)(478600001)(316002)(66476007)(66556008)(1076003)(38100700002)(8936002)(66946007)(4326008)(36756003)(38350700005)(6486002)(5660300002)(44832011)(86362001)(83380400001)(82960400001)(2616005)(107886003)(6506007)(26005)(52116002)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T/2xACWAEFj5IsuIoSIXVvwPAZi3FU/jF+2AXWhTZVFPmpOKkzhonlcl/OA3?=
 =?us-ascii?Q?UZT+9y37nCQuvZFgCnkMomAq/FzFty5aY7BbJ7SeT61YshJLjGJg9Zq0lcfZ?=
 =?us-ascii?Q?F03ReJppWcfoRp1B1vMeDjRvnKsTM1f30Lh5QK8xYwcgblFoeGTe+tuaoK6b?=
 =?us-ascii?Q?sHHypp9ecBhUa7tmpDGGjy4I73H8nlqoV3epDL/DFrvd8uqxYdofJbdlnpp5?=
 =?us-ascii?Q?FktdvOBoZ9jnyF7C956364KxSu8L9HDvM8UD73BRQrSJrozeI8ru9XfjdZfI?=
 =?us-ascii?Q?fJTa59LiYs4gpqbAJGMBk3WjLdn9UnAs/A1rQfe2q5Qdss7PeRqaxxKEqXq3?=
 =?us-ascii?Q?QgnWb4c2st7Qy4+0yBhGf3eyTpJ4PESFBYE3mvIKoL6toPmT0vUBZ7cKb1uk?=
 =?us-ascii?Q?LeHsLGDN3ioYe7VCnF4cQtwowwAm5rjcLa8LRwybdy237JxT68GvwcWF05Iv?=
 =?us-ascii?Q?f6LB5HQJ5MoMoNhHAW6Ei0GcuphOhzMQAv+wbs5555QBCRIyxOPmLoq3xLuO?=
 =?us-ascii?Q?pfs5DKkMUVBzael2bLV5gzmwGezkiv8LgyWajPpGClYkR2VOZVZ4G9rDCcNS?=
 =?us-ascii?Q?oQ6kWxhF4/ghwjql2uIlPmTvPCtdjHPCfG9pOuFXMoXix9N/+MhGwgSikKmV?=
 =?us-ascii?Q?FM7CMC7cJlFPHCOu125wUKMtAwEsAyvw+9uf/FWL5f6h50/uVNOTBVfvSVaN?=
 =?us-ascii?Q?St8Nf8jslfyF4lUb6dCGjkYjcAwU4hfBx96uqzzG+fy1gJXt8soKtY+ItulJ?=
 =?us-ascii?Q?u5c0pDo2oVTC8+ecF48DrC3qTj/TJalLSWXo6QgqJZ+UzIYnuEuOJpUyGGte?=
 =?us-ascii?Q?qeNllL8Bct9JUVM3PACzHTHhYtNWftNiKZOvqj5NqMJH3tZNE2eJYot909k1?=
 =?us-ascii?Q?Sjz7i1+9ImdtGgNpPBSFr6SB7hO36D1/5wXDT7/xl+yQHfR2OjI0hVo++7AI?=
 =?us-ascii?Q?DMVXHSTuVUDyc5kQ+66pCV3i2LvXFQX7sJmGuYfclPfKL4r9YSrkCSdesD+s?=
 =?us-ascii?Q?SvtUOzQXTq9PNNUA2sXPji4XpT9ybitcHq1QhsAtLHNnbhIORtGFKNp4D5Vf?=
 =?us-ascii?Q?8A7DYMmdNgk7WbI1jlafs3+rXIbY571hOBpjQVZg5ECmVCjNQV1+rizHp29t?=
 =?us-ascii?Q?a2j/fBqAdkTXBXHgRWDkPIRGY2Lfnujv6q+7eh97qnaLJn40iBKaIDWM5iLR?=
 =?us-ascii?Q?kMfr/TnrtqbQMdH9/wt/XvFsg/BkkNaU+voGRXTYWaA3uvSLMsuKsY/0evgp?=
 =?us-ascii?Q?/BnBVElhcomZSmy6KkuZczjimPcVm2mNnbqAx03FD6E0fRq4BDyzdDKbBHNY?=
 =?us-ascii?Q?r44FcwJcXkUmRCY1wSjZGZLs/4KpHrmW5yssmGpZghB4cYw7nd8IAr+RD4Js?=
 =?us-ascii?Q?eIiWGn1mOs+/idLRyfONS/ML+aCjfcuPPi6vKbz+Da+GJ710iDE1h1kOtoS2?=
 =?us-ascii?Q?Y0/UHtpgVyMEG8thTzfhOj1IGDgLDO4xC5ObbvjAJElyW9sUTg5vVWxOdVLb?=
 =?us-ascii?Q?25PYdNyyPqUiDidzEogYjZrUJq2Wl4Zg2F6P07QxzpaaA7ZNsIOoOI9acuhf?=
 =?us-ascii?Q?n0EEDTlXgoJIMKf4lHud+zB5UPaC83hWn87F5NHu1AGr6pSh1y3FC7oQwc4R?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c13c17-dc33-4fd7-1f5d-08dbdec22405
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6705.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 12:16:01.4091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiU1r7d3h11E+WpOi860Er/vlmbKm5AEYy7KIvhLeS77+d76K2xulTRmv0RkfN9tDA2gbxnDqyLMY1mYPuRDZ4INRLsahkR5QdZcMlBjGVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB9089
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

rcutree_report_cpu_starting() must be called before
clockevents_register_device() to avoid the following lockdep splat triggered by
calling list_add() when CONFIG_PROVE_RCU_LIST=y:

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
- Rename rcu_cpu_starting() to rcutree_report_cpu_starting() due to commit
448e9f34d91d ("rcu: Standardize explicit CPU-hotplug calls")
---
 arch/mips/kernel/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 8fbef537fb88..82e2e051b416 100644
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
+	rcutree_report_cpu_starting(cpu);
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

