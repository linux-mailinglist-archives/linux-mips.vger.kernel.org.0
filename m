Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15368180F29
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 06:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgCKFGv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 01:06:51 -0400
Received: from smtprelay0027.hostedemail.com ([216.40.44.27]:42604 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727184AbgCKFGu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 01:06:50 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id EC692181D330D;
        Wed, 11 Mar 2020 05:06:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:541:800:960:967:973:982:988:989:1260:1311:1314:1345:1359:1437:1515:1534:1543:1711:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3865:3866:3867:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4605:5007:6261:8660:9025:9592:10004:10848:11026:11473:11657:11658:11914:12043:12048:12296:12297:12438:12555:12679:12895:12986:13148:13230:13894:14096:14181:14394:14721:21080:21433:21627:21811:21939:30045:30054:30055,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: earth44_1e21c7c654313
X-Filterd-Recvd-Size: 4150
Received: from joe-laptop.perches.com (unknown [47.151.143.254])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Wed, 11 Mar 2020 05:06:46 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH -next 004/491] PERFORMANCE EVENTS SUBSYSTEM: Use fallthrough;
Date:   Tue, 10 Mar 2020 21:51:18 -0700
Message-Id: <73d22360c5c665fd7f480a209ae46807dfb07bbe.1583896348.git.joe@perches.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1583896344.git.joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert the various uses of fallthrough comments to fallthrough;

Done via script
Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/mips/kernel/perf_event_mipsxx.c | 6 +++---
 arch/x86/events/intel/core.c         | 7 +++----
 arch/x86/events/intel/lbr.c          | 2 +-
 kernel/events/core.c                 | 3 +--
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 128fc9..484948 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -790,15 +790,15 @@ static void reset_counters(void *arg)
 	case 4:
 		mipsxx_pmu_write_control(3, 0);
 		mipspmu.write_counter(3, 0);
-		/* fall through */
+		fallthrough;
 	case 3:
 		mipsxx_pmu_write_control(2, 0);
 		mipspmu.write_counter(2, 0);
-		/* fall through */
+		fallthrough;
 	case 2:
 		mipsxx_pmu_write_control(1, 0);
 		mipspmu.write_counter(1, 0);
-		/* fall through */
+		fallthrough;
 	case 1:
 		mipsxx_pmu_write_control(0, 0);
 		mipspmu.write_counter(0, 0);
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 332954..8cd3bb 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4637,8 +4637,7 @@ __init int intel_pmu_init(void)
 
 	case INTEL_FAM6_CORE2_MEROM:
 		x86_add_quirk(intel_clovertown_quirk);
-		/* fall through */
-
+		fallthrough;
 	case INTEL_FAM6_CORE2_MEROM_L:
 	case INTEL_FAM6_CORE2_PENRYN:
 	case INTEL_FAM6_CORE2_DUNNINGTON:
@@ -5017,7 +5016,7 @@ __init int intel_pmu_init(void)
 
 	case INTEL_FAM6_SKYLAKE_X:
 		pmem = true;
-		/* fall through */
+		fallthrough;
 	case INTEL_FAM6_SKYLAKE_L:
 	case INTEL_FAM6_SKYLAKE:
 	case INTEL_FAM6_KABYLAKE_L:
@@ -5069,7 +5068,7 @@ __init int intel_pmu_init(void)
 	case INTEL_FAM6_ICELAKE_X:
 	case INTEL_FAM6_ICELAKE_D:
 		pmem = true;
-		/* fall through */
+		fallthrough;
 	case INTEL_FAM6_ICELAKE_L:
 	case INTEL_FAM6_ICELAKE:
 	case INTEL_FAM6_TIGERLAKE_L:
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index 65113b1..2e2c6fb 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -967,7 +967,7 @@ static int branch_type(unsigned long from, unsigned long to, int abort)
 			ret = X86_BR_ZERO_CALL;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	case 0x9a: /* call far absolute */
 		ret = X86_BR_CALL;
 		break;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 6a47c3..7a8ed4d5 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9762,8 +9762,7 @@ perf_event_parse_addr_filter(struct perf_event *event, char *fstr,
 		case IF_SRC_KERNELADDR:
 		case IF_SRC_KERNEL:
 			kernel = 1;
-			/* fall through */
-
+			fallthrough;
 		case IF_SRC_FILEADDR:
 		case IF_SRC_FILE:
 			if (state != IF_STATE_SOURCE)
-- 
2.24.0

