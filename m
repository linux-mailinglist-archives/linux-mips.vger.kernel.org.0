Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3034F110F
	for <lists+linux-mips@lfdr.de>; Mon,  4 Apr 2022 10:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbiDDIid (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Apr 2022 04:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiDDIid (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Apr 2022 04:38:33 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2111.outbound.protection.outlook.com [40.107.20.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D131F60E
        for <linux-mips@vger.kernel.org>; Mon,  4 Apr 2022 01:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTWqck7CGKSPURFiMkJD1YuDYuGaqU5o0wAlitPIsesT9cWftatFEmCFm6b4fUf1VNDEoUmiU6iaouYuP8htDQX9usx6U9n2qFcl1No7F++ekEIEFYMU8Vy5jy9usg60DhF/3lu6QIJsZeZSPpGho0ep0/cuqcA8h6NU/9dAwVSDxHA0ioDMY0DZbxrJnlIgHc6Zs6mInmoNPxumE5scq/pn08N6w1tp4dvk9epovCN6UtxspzLZc8dSHI1B3TYTOv10Jtrh/xcAdL0L4WJ/kbLozy/XxhOO/MN+2HLuE3anMnN57iBZsUGDL4sEYbi6zG2De0ET7jkkNCMQFrG2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuOXVpWml/EveXkWLqtXeNZ24RGijJgNnKP+PRI7BX0=;
 b=H6MV64nQHAJLpZxpKW2ganDNursy06+UlzgbQ8WS9iXSrQrKRyfjNFnKZDrorMlMqE5yLX7MUC7u+t9zXU1YdeUBdYr7d/ZGU3sMU+ClfmPs802F46hcpSgUWX5XvesoXREPtOimuCTLeoA3qh7nHVeNtEv1VD8TvB5s+OdMvbrk8GDwYXQjk6Mv4HAMdvxL5aY7WZVZB48n4t0fi8/7XDUvzYspxhJEjhQbTtlC3gByIiXNFcTwUJE6/SBMtkdVANBkIfzUpAV2vX3dOO/WKGCIU8y8x9thIcJCAz3b3rqpaqbdo/JFXYSORTM61hzjggk5QsXk7/ZVlj7rHdggHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuOXVpWml/EveXkWLqtXeNZ24RGijJgNnKP+PRI7BX0=;
 b=ARXSZ02JxA7FPLN2mZFnBt98zjjWwhLjEJk1G6oiwYF2e1MjxYFCexqJQ5R5FyVgPSpQmygrRf/WG+HALWs623Z23HdUTvhcDCg6OykMlNRNSBogXMnXiXWwXbC/dmWhH+BoSgM6TmVSEglKfKlqyqCpgSMmw4PGr4P6vIw7T5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from VI1PR0701MB3005.eurprd07.prod.outlook.com
 (2603:10a6:800:87::19) by DB7PR07MB4732.eurprd07.prod.outlook.com
 (2603:10a6:5:31::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.16; Mon, 4 Apr
 2022 08:36:35 +0000
Received: from VI1PR0701MB3005.eurprd07.prod.outlook.com
 ([fe80::e453:b545:128f:90a8]) by VI1PR0701MB3005.eurprd07.prod.outlook.com
 ([fe80::e453:b545:128f:90a8%6]) with mapi id 15.20.5144.016; Mon, 4 Apr 2022
 08:36:34 +0000
To:     linux-mips@vger.kernel.org
From:   Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
Subject: [PATCH] mips: vdso: Allow passing build path options
Message-ID: <23e2afda-630a-f6fc-e211-a464b29496f4@nokia.com>
Date:   Mon, 4 Apr 2022 10:36:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR05CA0358.eurprd05.prod.outlook.com
 (2603:10a6:7:94::17) To VI1PR0701MB3005.eurprd07.prod.outlook.com
 (2603:10a6:800:87::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4edcc7bf-54a1-45eb-8945-08da16163a13
X-MS-TrafficTypeDiagnostic: DB7PR07MB4732:EE_
X-Microsoft-Antispam-PRVS: <DB7PR07MB47320C2EF7412613089EA04BFFE59@DB7PR07MB4732.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ii/+SpYN3ksTH1KkEfNXZyrS7BD2ftOqMZhZmaeY4MtR/j5iJYZMhrd4ZnI5FjFAA1MWHzRaFmiBWryHL/2ocDwH5o+WO+BjLASSGBjt/Hiq4VeDxZ4ZpwBjVYLBNvljLPpiuRu6tgWkOn5Ot5Z1fNwpFxLAKHSOo+3Rpzquo7D6GXftfX25nF8ZUZgtdUFyAC9OpxZc2rSEmle3WT+Jl7o4NzfYKs7QauBA0LptC3k1JVktCd3Ib1jtAR4rnxcAekU2otzffhqIHKH7t7t+dgF2WcDCQl+0259ySdfbjGqU5gWNIvs2DsHw6s91Uo37Hx6slEJs6YclLmXKa/nbPFjfh8YX6CxYQyGUvbOZZXkaNMkpCP8p/t3JLAUSMdIsTVivLJczp3JmPv8V29ozai7t3PpEFQcSUkBxhBaJs+ncXqeoRcKccTHY4tO62iL2e7HMWhlldNJumO7u0dFjaF91HThcWmatVwzdP6QCeSrkLwaycrBcijdSbmxNur84/fbox1WwNBoUBjSsbCIz5jpPm6GgcepfIfuLEhYvzGWCS7t8UN11cUElHjiDmKgfY1Vv42SizFEf7xSVxdJGXYL8MW6O0myIgBYOJJbEG3ro7VpRwPdhXI2WoEDes3Hy8m0DZD6IiSmzNY7dPo5Du2rmwQj5jmsBOWdr6BVPZ1syVdvifBWf0yOzAxrMfzGvgvhnn6Mw3BebSn+MLt14gwdKAaxTHvh9Rfy8A/F7Yf3D5yzOIpmUcWnjrKcGT2Wd7eg9SDXLg4PBGF9ybYthmkcDneoNCVVVKCYKrE+NsCsVVVQvO/goWmqIMKfM0slT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0701MB3005.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(2616005)(26005)(186003)(6506007)(52116002)(2906002)(6512007)(38100700002)(38350700002)(6486002)(36756003)(8936002)(82960400001)(316002)(31696002)(86362001)(6916009)(83380400001)(508600001)(5660300002)(31686004)(8676002)(66556008)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZJdS9tc0h5dkkvMERwNTI0a2czWVc3UmJGYmdHbGZXZ3pNV0V2VjdTaXJx?=
 =?utf-8?B?M2FwUmtsMTNsV0xOaDZBQmhkYzUyWmt5cmp2R0ROYTJGaWxSUkdZY1E5b1FB?=
 =?utf-8?B?a1NrcnR0ajRkS1pnQlhBL0I4YmQzWTNsWG4rcGZsQmNaeE1tcklqRWoxTWNO?=
 =?utf-8?B?SnBCbUNHWVJaSWtyTWNMZy95a2R6alk4d2p3V0FLWDdmaENwZVBabVJWWWk4?=
 =?utf-8?B?N0tGRXhCNjJ5WGJud1hLeDduL21CTldmRGk0N3BPSlN0VGs4ZEtqTU8wYm8y?=
 =?utf-8?B?SXpGWG1rU2VReDhzSWtWZ0lPU0ExT0NHZndSYU5hTFpCY0g2aHRkNGF0YWRC?=
 =?utf-8?B?QnlhNDVhVmJWYzgxN0t0Y05yMDVpZkpISnoyUmFzd1M0bnIwNEpuOThlTStD?=
 =?utf-8?B?R0tFekFwQ2xJRDFmZDV5dXFiTkxjL0szWTJNUkcxUG9JdDBDUGozUzdkdC9j?=
 =?utf-8?B?RXdBYjhvd1I0dVYyMUdqSnVEWXU1bWUzMlN6MG0zMXJQQ2o1VE8xZ2ZheWk2?=
 =?utf-8?B?emp0QzhaNENKR0RackFVUU1kUllTdnRpNGFqQ29mWkExcmFhMkVNZjJwdDhB?=
 =?utf-8?B?MnkwRk9EampDYmdKaEFhT2RyTUFRVGhtR2wvNDYxVEl1YjJ3eU1VOTdyYnJT?=
 =?utf-8?B?T3lWL2RFcGlaVkptblF5UEhtVG5JQllsR2NoanlhdDhic3kxeGpIbTl3bGFH?=
 =?utf-8?B?ZGNlNjZKYUtZdW5oZE5vNkFOOEp1MklreVdDRWM0WG5GbGNlVjNRRTEyaDlL?=
 =?utf-8?B?M2NzWkdJVlAwNnZycDcyUGhUbUVlWkFNN1g4M1ZHMWNmRE5Wbkt3SmxzaEM0?=
 =?utf-8?B?TUcxNUlZWE9zaFY2NktEYktiZWJ1bStLRFAwYjFjYlZ0Y3BDbkdWeHMxcitY?=
 =?utf-8?B?Y1ErS2N5TmRXakF5T1ZiZDZOUmd0b2ExMWQreTNZZHh6OGRUNGZEeE4vUkQy?=
 =?utf-8?B?dlRLcUFVRHpIcFNKakc5eTdkMGh3b2thdS96bTZ4WThNbUJCdi9QOXBBcW1n?=
 =?utf-8?B?TkdQWTNibzVyOVVsdi9PM2hZbk92QWNEYjljS0toSHdxUFRvQVNsUEZmK1Yz?=
 =?utf-8?B?VWN2T3FqTWV2d1V5Z1lzMU1DK3Vsc1hyb1pUV2NtMmxmaVhLc211ZE9pWXIr?=
 =?utf-8?B?ZVlhY2pqcTFreFhFNVBMSll4SWFsQk1iM1Y3Y2VGZk9hR2dZbGNJWlNIbWpM?=
 =?utf-8?B?Z0hFam0wazJxUjJmZ2NIcVB3STdSaGFxY2M4VXZJY3oyU0dQM2VWdTRkSTha?=
 =?utf-8?B?QWlSVzdGM2pRMWtmY1JIOTZIaitzV3gyZHhOTUcyYS9HcGxGcnB0ZW1yTzBZ?=
 =?utf-8?B?ZHRTZVVuYm1CQXFwaE80RVhueXJ5bU1OTk1xcnlueEVrWjczU1pydTRQM1pX?=
 =?utf-8?B?WVZ3QUFyNDgxWkkxdnBkMkFoT3Z4UzJpUW1DVEdXRml5OC9VOWwxUlFBczlH?=
 =?utf-8?B?YWtUUGlmcWgweDlTbWVwRU16UjZZQWVVcmFWelhvYjVnM1B5NlZsdjgzRlAw?=
 =?utf-8?B?bERIcUtrT2VSSkJuRWlxMHI1OENuOE1QVzg5YlRLaEM5WDkyNFM2OTBJdTdt?=
 =?utf-8?B?ZDNsNG1neU93ZFplUjhzZnhjOXBHVWVRQWVMVFkxK0tsUHR0eEU3blVrK0s0?=
 =?utf-8?B?b1VKSld3Y3FVNlFyd1NBaUJBbkxyNy9qdjdSUFlSTm5PRm9JaHg1QjZzWDJn?=
 =?utf-8?B?clhZNStEOXdiOXlEK1c5STVoTmRVaUU2Tmowd3NRc25pWGpicStUT3FTeW9Y?=
 =?utf-8?B?RVdJb1ZRcjNVN3lWdjYvNGhxa0dqNk9KSzB3emgwUnBrYVIvMDBTMUFodzlx?=
 =?utf-8?B?WkNLZTZOeHQ0TFl4VjhXYUIrRWVNakZZMEVrV1FLVGF2dkw1QzZBaHY2VGtT?=
 =?utf-8?B?UVZLS1lFUkp3UVpRT3lQWC9sbEMwM3VzMDBoVnFDTHc0SlJkTHYxeUM0ZnJV?=
 =?utf-8?B?RGkvb29XM0lIOTUxaTdpQmVmbStNem5tOFJISm11MkhNR3lFb0w3UUdBMEdq?=
 =?utf-8?B?UFR6K2RHN1Bsd0cyZyt2Y0Zpc2ZKRitWcUVYZ0lUN3czc2lwaGRlclI5T0RX?=
 =?utf-8?B?T2sxa2pxd0N4MWY5ZWI3aXdzKzBwcXNBREJ4Zzg2LzBscGMyQTRHUzE1a1g4?=
 =?utf-8?B?MUU3alc5d3ovNldoNlpaRHhLZ0RmS2hpYmFMRnZhWHE2MnhzV1JRRUNsZEE1?=
 =?utf-8?B?TGsvWGxvSkc5Uk5VazI1ZmdyR0dIVVpaL2grR0VmZUFyUmZscU9ZcXVxVEtF?=
 =?utf-8?B?L3pXWElTbzRGOVI4WlhJZlNQVmFybUNYUDFzNGlFUGRScG85RlFJSFBMSncx?=
 =?utf-8?B?RXZWWkUzVmZ1ZWVEK0djZzFKSTVEUVlBTlRCR2JWSFVNdGtxTXZ5NkV4SFZY?=
 =?utf-8?Q?4/yo26Br2v8U1glGTsDWBkcqrkgJBl0PQaRyIL/JyhZff?=
X-MS-Exchange-AntiSpam-MessageData-1: L+jT9aunAyyHYg==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edcc7bf-54a1-45eb-8945-08da16163a13
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0701MB3005.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 08:36:34.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ED1aQ1hL8oGxGOxIX/3NwZYA716g3E5JuFV1tcJezSet0AEf5gJ2UcyRWn8OXN3ZmdIRp44ToZ/PnAkn9bbmWW/xruEHop+rkQZoOP1Ew4+ac6FhIYG7dgW0dgtRb8b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB4732
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

vdso image is not reproducible in different build directories as build
path defines vdso image contents via .notes, build ID. Build ID is
hashed across all sections (prior stripping), debug sections included.
With debug sections containing build paths, hash is impacted. Finally
vmlinux is not reproducible as it will differ in vdso_data.

For users wanting reproducible builds, irrespective of build path, it
is unwanted behavior. Issue is sorted out by passing related options
via KAFLAGS, KCFLAGS, however due to mips' picking out specific/subset
options, these are not getting passed through.

Allow related option to be taken if user specified them.

Signed-off-by: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
---
 arch/mips/vdso/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index f72658b3a53f..b8296ef2bfcf 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -35,8 +35,12 @@ cflags-vdso := $(ccflags-vdso) \
 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
 	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
-	$(call cc-option, -fno-asynchronous-unwind-tables)
+	$(call cc-option, -fno-asynchronous-unwind-tables) \
+	$(filter -ffile-prefix-map%,$(KBUILD_CFLAGS)) \
+	$(filter -fmacro-prefix-map%,$(KBUILD_CFLAGS)) \
+	$(filter -fdebug-prefix-map%,$(KBUILD_CFLAGS))
 aflags-vdso := $(ccflags-vdso) \
+	$(filter --debug-prefix-map%,$(KBUILD_AFLAGS)) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
 
 ifneq ($(c-gettimeofday-y),)
-- 
2.26.0
