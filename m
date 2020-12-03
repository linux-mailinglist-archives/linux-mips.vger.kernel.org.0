Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4126F2CD595
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 13:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgLCMho (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 07:37:44 -0500
Received: from mail-vi1eur05on2118.outbound.protection.outlook.com ([40.107.21.118]:10400
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726213AbgLCMhn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Dec 2020 07:37:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPgiSHYtfVfTKay/oR9IWHMdHOCfMpyAzYoPDalvmIDCoteaEtlBDVdDXBm3jKZT2Ydoa7B2NAL397W3ifBonNpxXgT+8WboarF59Lvk9OinccxzPb0Oc4zjJAm/EVGl4Gwe0mnKtC0ekeuruzZNpagyB3vWQkUe1XoOPDXlPqXwjhsVaIpBw2zd69w5X0xHabEivlqhGZpfVei3xIDhu9JBuzZM//V8zn/GDRDJBNyJ0+fH42q12DZDHt1rGPwmAL8HaoL+PmwUX+vZHPvfY6nLJlwtZXaVfcutMiG0PyZ4oWrOCNaoVpkVYmMKGzFdJ9/A1E9QsvR21LFJEnd1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP9jzzqpk1JQGqDlt3rZZPy49Icix8ZFTlGbWwU7vZQ=;
 b=NpsZKJ8a75EszlmCp3ecyuMPMi2uznBeNc1xElza3BrFC9cYPN4u9NlpgteMbexkfBJNraeWBCiEeDoLjU+QintIqL8jIgAp+XBhr6gvBvGfFkk93cPmNQ6lLt3HlIwbmUFt/cSwZi4yP9z+Jyfz65AQ6I1f1l9xAL2dkKLlunZAoHFkyrK5u0HUJiQCbrNPz/67poVSLkuY7IsFprmCTQ6O2kqYzpnUQDdW5138fekXrJAyfeiWRL6fpS8w52P36GUlVE1j4fV7P/XKXFhWXS/vW65z6z5Jt7UeslS13hC0wz+8DXdMANosuKA2SLBblVd6UDxcdWC0WPlmiK5WzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=flygoat.com smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP9jzzqpk1JQGqDlt3rZZPy49Icix8ZFTlGbWwU7vZQ=;
 b=lUy9zxZxDM7szKnUDlfg2iM/ZOjv6lgwr3meAqVEEVclITzRBq7R8JcrRe+6eNPAXeGbVTGMXFaMglCBRqVj81BmSPYoLzmFU1xEyP8EKfsK19P8m17Lzn20GEHt2keH2S2/XDmZTPfN+HHzid77KIRzBrtAlKZ7wONzRVLUz3g=
Received: from AS8PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:20b:313::32)
 by VI1PR07MB6495.eurprd07.prod.outlook.com (2603:10a6:800:181::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.14; Thu, 3 Dec
 2020 12:36:55 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::ce) by AS8PR04CA0087.outlook.office365.com
 (2603:10a6:20b:313::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 12:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; flygoat.com; dkim=none (message not signed)
 header.d=none;flygoat.com; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:36:55 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 0B3CaqBI025448;
        Thu, 3 Dec 2020 12:36:52 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     linux-mips@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Leonid Rosenboim <lrosenboim@caviumnetworks.com>,
        Corey Minyard <cminyard@mvista.com>,
        linux-kernel@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Jinyang He <hejinyang@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: Don't round up kernel sections size for memblock_add()
Date:   Thu,  3 Dec 2020 13:36:48 +0100
Message-Id: <20201203123649.44046-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 40d0b287-4fa3-41d6-8790-08d897881ea4
X-MS-TrafficTypeDiagnostic: VI1PR07MB6495:
X-Microsoft-Antispam-PRVS: <VI1PR07MB6495E45B72314DA0ECDD254D88F20@VI1PR07MB6495.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4aFgzc21o3E1dK52Cf3RSyc79VgsNgStYYxZrxObnmeSXlfyZCKRJkyR6oSsbOOiGqXQY9J3AmSxEFnJYqTwz4eAV6gHGedu8dRtbvAHSvdeYswjUeBRQWtUxOHfiKhrUmS9e9vKg331woIvVQUxuTr/UDXFwxB4If9Nu2VKhfa6BvJv+IMQ0bVISeAlrDR5YnFn1zHlOs3kDoqcMWDxp0PnXnJgaEYF2Z0RJBszeSt2C24O1A/TpqYUeRW0+n4m4jlo2t6scsq/1YIHxgA7dBl+5OQHvHtoPnkkESPEBhJqvDkAqD1yfWoiQkbxAGtxi1ygNKE4JJT4z42UeiDwbYaFVl6o4QwNY3X0XVaBC1kGyuZBT8Dhpfyhc+uUvQuvHku3/9DwFO3tJcMo3kxew==
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(8676002)(82310400003)(36756003)(356005)(5660300002)(70586007)(6666004)(70206006)(83380400001)(86362001)(2906002)(478600001)(6916009)(186003)(4326008)(26005)(316002)(54906003)(336012)(7416002)(47076004)(1076003)(82740400003)(81166007)(8936002)(2616005);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 12:36:55.7721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d0b287-4fa3-41d6-8790-08d897881ea4
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6495
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Linux doesn't own the memory immediately after the kernel image. On Octeon
bootloader places a shared structure right close after the kernel _end,
refer to "struct cvmx_bootinfo *octeon_bootinfo" in cavium-octeon/setup.c.

If check_kernel_sections_mem() rounds the PFNs up, first memblock_alloc()
inside early_init_dt_alloc_memory_arch() <= device_tree_init() returns
memory block overlapping with the above octeon_bootinfo structure, which
is being overwritten afterwards.

Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 arch/mips/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ca579de..9d11f68 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -498,8 +498,8 @@ static void __init request_crashkernel(struct resource *res)
 
 static void __init check_kernel_sections_mem(void)
 {
-	phys_addr_t start = PFN_PHYS(PFN_DOWN(__pa_symbol(&_text)));
-	phys_addr_t size = PFN_PHYS(PFN_UP(__pa_symbol(&_end))) - start;
+	phys_addr_t start = __pa_symbol(&_text);
+	phys_addr_t size = __pa_symbol(&_end) - start;
 
 	if (!memblock_is_region_memory(start, size)) {
 		pr_info("Kernel sections are not in the memory maps\n");
-- 
2.10.2

