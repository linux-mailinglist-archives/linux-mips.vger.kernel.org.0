Return-Path: <linux-mips+bounces-14758-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFGkHV+rFWpuXgcAu9opvQ
	(envelope-from <linux-mips+bounces-14758-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:17:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD15D7489
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5A563004628
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25336358375;
	Tue, 26 May 2026 14:17:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021113.outbound.protection.outlook.com [52.101.100.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10F3B9935;
	Tue, 26 May 2026 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805021; cv=fail; b=kmLu0i3uw02r5siglTiEEoqvVG//GnXXHX86rqRwTTl+v18dB1wDzIUf47vj3sDxU0SOXJu4sE33sZMVlXDmCwsMytusdYEPr64OVi5v//am7dexyvf4IGq9ThgM9FoVgba57zA0u9ToYtIDwr65VU8Y4EfjaYn9EUfgB6MyWxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805021; c=relaxed/simple;
	bh=MBb3U5CFC60BBWiTzIeUcfUhiIMuW43DWBl6VqOIBSg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=h6QQUIVPo5t4nvYwMWnjpaoVbK7pm4Kb+o9Cf1hQgGitpR1Zej/HyNS1Ufo4WBeNyRuX9E62GptzzvfZRIerNm3UOjYdzRz6TInMKHR/P6DA42ydAKzyv3+3MclpNk5W2Ua+RA5qHMS5tfRCtADx6KsPkw6YtCgIMKB1HWEAurc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfKbov8pI7bFBirYBw2GBR5MZrb1OD99GylAyfmQNhbDOoUy/rDtrQ/FE4aMuBQMUl5fQ6p3MiUVulrMMHUIRqhE+G4ttMomKmOEBIb6OOugHKDiOu3oKhR6b+yuImosgezn7qBttR87MrnSHW9YthgMJIsEVVGrG2V/VFwwa7IrIh3s5lLbPsfCXsiGavqreT8Fbgv9b0rUpk1Afm8cQ8A06aS/nneDfcx61vbnV4TNz0ezhfRxIkdrllARxseL68t/txNiYzCFJ3APVSwcsJeAdOabqezfjYCm4sJ2eMIJdGTGmblQGea5jqj3nhC+X+ssk6vBSgXhiFK04ISgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=nBDa/5SbGHLSAlGuUeIBoKC5b2PxGYwiokzhqLKwOJM=;
 b=KrcbcM6TdjEZSATDlkaD4njeDbWYjVE6dX9VhysVcmNHMVeCRQXP2dj1I4Vp+mcD++IRIZMX0BxGAu6z+21eKlhIqkCeeGJVlhguznSy8CGFflcniKQMf1MUg6U0b6ypgF21C9uq8xWaq0Q+CULnMIU8cUJ7B2vY15+1Gtqumrl3RoebH1bu/rv7JO/LNYOfOHo9CSVZU51F5AIE1TxQDXK83HuaFlsYen6/un8pZOff4jIfYiA0vU529/kVOFZTo7XxerMR3Yrj/Ck9UHl1Ut9wvHNes/CIM0bu3Cg5AEQ820D/lofcO3bu/EJJQ8M1RKHmi3T4tjmSuY/b+pNFQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO8P123MB7942.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 14:16:55 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 14:16:55 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tsbogend@alpha.franken.de
Cc: paul@paul-moore.com,
	ralf@mips.com,
	atomlin@atomlin.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mips: sched: Fix CPUMASK_OFFSTACK memory corruption
Date: Tue, 26 May 2026 10:16:51 -0400
Message-ID: <20260526141651.773306-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0730.namprd03.prod.outlook.com
 (2603:10b6:408:110::15) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO8P123MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1dd1c7-3747-449e-e3e3-08debb3170ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|3023799007|6133799003|5023799004;
X-Microsoft-Antispam-Message-Info:
	2nusgQ9ncuyBaOBhhsCHcO8YLG6zEv4wmrxpldEshNkwrApvdywns8iqiALECGUUACaaJX1IKmJG0JL0iD4SReIfb9+OUOHmgzZyBtrN/f7asGFi/AEPvYiIe64jCHmQ3hoeapklBfomXW5Z35I/NGzsgIpFVERIwyCGbpRPX8o6ErgFoA9zNDT0QRH9nYhcliqZBMzhQzzimY+C+xCoMTM0Ift4UYiSAGfYhxL19W36scnrpLt/yQIldIF8KukwqF21z5whHxhctcT5Ti+VJl+2FsviI1fTYJQbEYrvv92FTZdZjgIj2xHPnNzB9L3fnleDwH3SJ9x4l3EwD7W4DK+tzV8cMY/ox5AO2ed4nXEgX9zRwl/G7T1mMHbipOB6LkhfhyU5VS/VVj8Xg2DulH3pLbH8yLkyzzGO6YyypjebmbgCvKWaoMSe7AoYtSEa2CmhGnWvuWHy6AGih548xV6qOVMX0HYifB9/T+wxGtN6fQ2fkHOn5iPC1Mm7R12Qr6vmyPij8uHNX8Q81CJrQqGPhPrRSkogIbV+ZoiDGrtRSRFy71DfCMZGJXc5iCX8R53QKQCR0irm542s5NTE8WoM3Vk3q7ido7Zqge88NFjs3RDikiQqBHn5rM4g2oz+oGMAPHMey8124uACBxNt+ic1EWx+R3CtnRYzSKuPkplFjMmG1deN+tKLad2E1F47
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(3023799007)(6133799003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8FnnBJjUcQSO/6D+ROPQxp/Z1xyUONGM7k0Qd2L2IHBt6pKy9UviFcX3r4u1?=
 =?us-ascii?Q?XXIg2CvdTvjlwnenmIvsheYFl2T8jkLPAsw7L6tZgi/oWFz+ImMXs4L1dwe6?=
 =?us-ascii?Q?h5Pp9ZBPhjnzTso4rtEBe3U98PbQb4ooxygkR8Zqon490FgHCKeyU17Yc8xx?=
 =?us-ascii?Q?Ko+LX1/Ue9MV4c1YpvIBC5IH2p2WvI33iBV2nSsKZ1m73hhHm4tmIfXOmQJh?=
 =?us-ascii?Q?8fcpFCtbAh6b6EAoSz9Lc6rEU85J8/Ituh9/mZCbPv96yasAQACt7KSdtgFk?=
 =?us-ascii?Q?0jvV81+02m9KT+9ZCQZcmenU2A38Jt00mfcQsdXZPQfyxfeUoJ6W+5wOmavB?=
 =?us-ascii?Q?Lrs5UofAwJKlAGlVThH5sUoM6T8la5Nvo77bm2ZpvZM7sewOcJNW5cFAFaFS?=
 =?us-ascii?Q?dbzNfS6sPtZfdNGb3z+OgEKYs5xKQfoYXPM9RmBCva4g+GPfKU0c1mMH66Jh?=
 =?us-ascii?Q?KuX7HsNohVtw9xEJ37FALB72QDvRpj2+32zZ/h0DLu/HnpRv1Dbo3V1X5mBn?=
 =?us-ascii?Q?C78ZJj306LIZPC9VMrGkekB2Jr3/7+jCjDg4/Bc4jPiPUIV3QBmag4Yd91fi?=
 =?us-ascii?Q?UocgSDdv2bK9L3PT6JhNYij0U2DTreYIAzcVKQdPvWkGFtHRakI+MYF2dcNJ?=
 =?us-ascii?Q?UNg9qxVWuaLRpG5VUc0PNWPtwGkdS9wrTjfPkUbT12fekHS5iBNoOCXZpZqZ?=
 =?us-ascii?Q?7M6dSq47AlOVE8pehQkXSPJyHxmRqCCHQ0kmXNTbHNahXPZY4JCv8AEu0Otn?=
 =?us-ascii?Q?vIXF1B/ke53B70BAVkTesSJwHsG0ntk466kaZjSWGBHbq3caaE+I33SPk6sF?=
 =?us-ascii?Q?E3+K5M6r/3Lr2Pw/wgIlH62YHC1KiflSfbj9kU2lVXVHmZSFZaQ/DEQkJ5y5?=
 =?us-ascii?Q?+7bxwUWEglztOKlYzpB+D32npYsYOX17jNNDmeNRLTDG+kksJ7vXd2/kSWnQ?=
 =?us-ascii?Q?KdmlX72v6Lx+o8cX0VxT72HLAMHlao8nD1tTUY4lEKXacJueev/OO+JzWM3S?=
 =?us-ascii?Q?FtaBz+pABo0Mh2Q2iFPyf8oD43yahR30jKi1O41G6mGW0RqkOCCQIY60Co5D?=
 =?us-ascii?Q?a4frlN03qAMj9QgyvArLQ8lZr2xha0eBBfqIgqSWeMnmjJJ4jG53A5E8gKXs?=
 =?us-ascii?Q?zOPSiAWLID1xEzFNU13gauOfKvohXjlX3DiuNjC/KXWOziKayU6FfeT6YK0r?=
 =?us-ascii?Q?iChoVPOvRWDqtx5Z79WfRU3jaCbpjd2Csk7wXwkrfy922zwOUFn4zYIxPi3F?=
 =?us-ascii?Q?3jfsXv+It85/EhQv1buRwEFHsuYZ/E9OogMKJkFtC5+MxmtKEBhHcyrFgYZy?=
 =?us-ascii?Q?ShVBAVR/K/2UNMi8/S/cOXF4c4AfV4UDGIEKv5Kxt27Voe0HrGr2aePqY32A?=
 =?us-ascii?Q?JELkex9WTcnFG+FHlEuk63jQf976jcWqbsEw9iQKCZptYmTPqhzXYiZgoKCT?=
 =?us-ascii?Q?h0bg1ZtYeXHNYaPrSskM2rJ1McncdP4E6+QFYpOptRi/+e8gZhiQOywOK6cB?=
 =?us-ascii?Q?6wntX9EriW0wwmigzf4mSrZZZ2T0nIkcH5tyoKYNMbdtXNf5pEcBNj+thmI+?=
 =?us-ascii?Q?DksHjIlyCPSqN/iRPcvYneS+uWqw8UESR9e6d3tn7WPu31DKrF2uE6Pro03b?=
 =?us-ascii?Q?O3oaAEm80G18AbdPc/VdrzW3kzqiG4kMjM1OcZxGnG9BIBUNNBrjXspdlmit?=
 =?us-ascii?Q?KX8qSBLbp7kkn4FaYALxMATMAiUX2zTCuSFOmr1Qe2Xn/vvZMSnP+kIkNodj?=
 =?us-ascii?Q?+jrvCgzLFw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1dd1c7-3747-449e-e3e3-08debb3170ab
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 14:16:55.4274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aeBQ3pZCb/sKqBPCxswbVSjDkgp53lI4vLYW7HYlmKEzfa30K5fDtGwJJqNhnG1DwjS+eRr8rwOgFjlvbwuyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7942
X-Spamd-Result: default: False [2.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14758-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[atomlin.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atomlin@atomlin.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.979];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,atomlin.com:mid,atomlin.com:email]
X-Rspamd-Queue-Id: 17CD15D7489
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch addresses a critical memory management flaw. When
CONFIG_CPUMASK_OFFSTACK is enabled, cpumask_var_t is a pointer.
Consequently, sizeof(new_mask) evaluates to the pointer size, causing
copy_from_user() to clobber the mask pointer. Furthermore, the old
logic performed copy_from_user() before allocating the mask.

Fix this by allocating new_mask first. To handle variable-sized user
masks correctly, use cpumask_size() to truncate overly large user masks
or pad undersized masks with zeros before copying the data directly into
the allocated buffer.

Fixes: 295cbf6d63165 ("[MIPS] Move FPU affinity code into separate file.")
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
Changes since v2 [1]:
 - Dropped patch 1. This is to be addressed by the cgroup cpuset
   maintainer (Waiman Long)

 - Dropped patch 3. Will be submitted as a separate patch (Paul Moore)

Changes since v1 [2]:
 - Reordered the allocation and user-copy of new_mask in the MIPS
   architecture's mipsmt_sys_sched_setaffinity() to occur before the
   LSM hook is invoked. This ensures the security modules evaluate a fully
   populated mask rather than uninitialised memory, while cleanly handling
   error unwinding

 - Updated cpuset_can_fork() to pass the destination cpuset's effective CPU
   mask instead of NULL

[1]: https://lore.kernel.org/lkml/20260509213803.968464-1-atomlin@atomlin.com/
[2]: https://lore.kernel.org/lkml/20260509164847.939294-1-atomlin@atomlin.com/
---
 arch/mips/kernel/mips-mt-fpaff.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/mips/kernel/mips-mt-fpaff.c b/arch/mips/kernel/mips-mt-fpaff.c
index 10172fc4f627..4fead87d2f43 100644
--- a/arch/mips/kernel/mips-mt-fpaff.c
+++ b/arch/mips/kernel/mips-mt-fpaff.c
@@ -71,11 +71,16 @@ asmlinkage long mipsmt_sys_sched_setaffinity(pid_t pid, unsigned int len,
 	struct task_struct *p;
 	int retval;
 
-	if (len < sizeof(new_mask))
-		return -EINVAL;
-
-	if (copy_from_user(&new_mask, user_mask_ptr, sizeof(new_mask)))
-		return -EFAULT;
+	if (!alloc_cpumask_var(&new_mask, GFP_KERNEL))
+		return -ENOMEM;
+	if (len < cpumask_size())
+		cpumask_clear(new_mask);
+	else if (len > cpumask_size())
+		len = cpumask_size();
+	if (copy_from_user(new_mask, user_mask_ptr, len)) {
+		retval = -EFAULT;
+		goto out_free_new_mask;
+	}
 
 	cpus_read_lock();
 	rcu_read_lock();
@@ -84,7 +89,8 @@ asmlinkage long mipsmt_sys_sched_setaffinity(pid_t pid, unsigned int len,
 	if (!p) {
 		rcu_read_unlock();
 		cpus_read_unlock();
-		return -ESRCH;
+		retval = -ESRCH;
+		goto out_free_new_mask;
 	}
 
 	/* Prevent p going away */
@@ -95,13 +101,9 @@ asmlinkage long mipsmt_sys_sched_setaffinity(pid_t pid, unsigned int len,
 		retval = -ENOMEM;
 		goto out_put_task;
 	}
-	if (!alloc_cpumask_var(&new_mask, GFP_KERNEL)) {
-		retval = -ENOMEM;
-		goto out_free_cpus_allowed;
-	}
 	if (!alloc_cpumask_var(&effective_mask, GFP_KERNEL)) {
 		retval = -ENOMEM;
-		goto out_free_new_mask;
+		goto out_free_cpus_allowed;
 	}
 	if (!check_same_owner(p) && !capable(CAP_SYS_NICE)) {
 		retval = -EPERM;
@@ -142,13 +144,13 @@ asmlinkage long mipsmt_sys_sched_setaffinity(pid_t pid, unsigned int len,
 	}
 out_unlock:
 	free_cpumask_var(effective_mask);
-out_free_new_mask:
-	free_cpumask_var(new_mask);
 out_free_cpus_allowed:
 	free_cpumask_var(cpus_allowed);
 out_put_task:
 	put_task_struct(p);
 	cpus_read_unlock();
+out_free_new_mask:
+	free_cpumask_var(new_mask);
 	return retval;
 }
 

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.51.0


