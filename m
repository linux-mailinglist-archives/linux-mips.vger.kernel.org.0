Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C0D1BF46B
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 11:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgD3JqS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 05:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726378AbgD3JqR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 05:46:17 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF89C035494
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 02:46:17 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a5so488568pjh.2
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 02:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CTt5H+Vwa9WUOjKrN6qswPx3z9qFSnqWEK6z5ltCdRs=;
        b=NGskzXV/RDqKsXnzPHN1vXIadru7scqSGQ7RNlOOs4DkarCtAYJ6xdJRRImkWzVG27
         NOYCxUWKC+4/6DbWLw16U2A7Es+ChARBFrNEidFyzcrH1+xqVJJl5vNWsV+eyxaoumWR
         112rh4K51rqSuAcdOOdAmMRWsAftXuH09H9FDYGWbp3bzgOAgWcf18Q7WkgRGPBJN48U
         0q/hrHujLcT69AEae4qHerY3addQnbqNlkffjzUVSj36wQPjaa/wTaLsVeU/zLeWn3If
         NcLIMmUJoRNrEyK8q+FNbJFPPdwDaN1cyH3uMMlMbDx54x1gyabSzotAzJlajguwjnZ2
         39/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=CTt5H+Vwa9WUOjKrN6qswPx3z9qFSnqWEK6z5ltCdRs=;
        b=stUUMOqofslBoMmSGlxoVntDUoMEn0exKtmS5axblPSIlTu12SuPOB7MykZaKglWh+
         9ASb1nOA63e0DmnQjeSTKZNw6y7Oa+CV99xxKEnkMYyTTREwUZ4zMtV0lpXEtqYSfhnp
         SZTFsuF2zCgxGrdxu4Jyif5Y0Q22qMIyVwajVQtGqu0s7hEI8EvUERzO85I1yMo65VSc
         j6rxOQsGSYwklme1WLOaxwRuK6r1stV+Zft1FJVyiRG5XLUqeb0GYTPv6z1EdWY3La4+
         obZNM9ZvqxRVYnXwRFcKsvrQ8PsgSoi7tc2pif1emM5Uu4nX2xFdgrOP/wNqoWs7dYQp
         /Xrg==
X-Gm-Message-State: AGi0PuYWhWqH52U4rV/mNDeS/skXM1MDia14VCQrCrk3VSfalgBDcFi4
        9A4pDCYC2c796YM8rJo/qE4=
X-Google-Smtp-Source: APiQypJczV0wfAN/3satBSm2UObmWVEr1WffvUbvDBBE+/Sq6b6hKlGmKbk15j8hwv8PSAtQJfdlpA==
X-Received: by 2002:a17:902:562:: with SMTP id 89mr2760053plf.249.1588239977443;
        Thu, 30 Apr 2020 02:46:17 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id a99sm1317377pje.35.2020.04.30.02.46.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 02:46:17 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V3 2/2] MIPS: perf: Use 'fallthrough' pseudo keyword
Date:   Thu, 30 Apr 2020 17:45:17 +0800
Message-Id: <1588239917-23054-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1588239917-23054-1-git-send-email-chenhc@lemote.com>
References: <1588239917-23054-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 294f69e662d1570703e9 ("compiler_attributes.h: Add 'fallthrough'
pseudo keyword for switch/case use") introduce a 'fallthrough' pseudo
keyword and it is the preferred format. In my previous perf patch the
checkpatch.pl script has warned me about this. But to keep consistency
I still use /* fall through */ there, and in this patch all of them in
perf_event_mipsxx.c has been updated to use the new format.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/perf_event_mipsxx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index d1e8147..3abc4ac 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -852,7 +852,7 @@ static void loongson3_reset_counters(void *arg)
 		mipspmu.write_counter(3, 0);
 		mipsxx_pmu_write_control(3, 575<<5);
 		mipspmu.write_counter(3, 0);
-		/* fall through */
+		fallthrough;
 	case 3:
 		mipsxx_pmu_write_control(2, 0);
 		mipspmu.write_counter(2, 0);
@@ -868,7 +868,7 @@ static void loongson3_reset_counters(void *arg)
 		mipspmu.write_counter(2, 0);
 		mipsxx_pmu_write_control(2, 575<<5);
 		mipspmu.write_counter(2, 0);
-		/* fall through */
+		fallthrough;
 	case 2:
 		mipsxx_pmu_write_control(1, 0);
 		mipspmu.write_counter(1, 0);
@@ -884,7 +884,7 @@ static void loongson3_reset_counters(void *arg)
 		mipspmu.write_counter(1, 0);
 		mipsxx_pmu_write_control(1, 575<<5);
 		mipspmu.write_counter(1, 0);
-		/* fall through */
+		fallthrough;
 	case 1:
 		mipsxx_pmu_write_control(0, 0);
 		mipspmu.write_counter(0, 0);
@@ -900,7 +900,7 @@ static void loongson3_reset_counters(void *arg)
 		mipspmu.write_counter(0, 0);
 		mipsxx_pmu_write_control(0, 575<<5);
 		mipspmu.write_counter(0, 0);
-		/* fall through */
+		fallthrough;
 	}
 }
 
@@ -917,19 +917,19 @@ static void reset_counters(void *arg)
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
-		/* fall through */
+		fallthrough;
 	}
 }
 
-- 
2.7.0

