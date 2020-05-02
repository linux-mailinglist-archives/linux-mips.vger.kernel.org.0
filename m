Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED4D1C2486
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 12:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgEBKqa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 06:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726654AbgEBKq1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 06:46:27 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA33C061A0C
        for <linux-mips@vger.kernel.org>; Sat,  2 May 2020 03:46:27 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id p25so2849916pfn.11
        for <linux-mips@vger.kernel.org>; Sat, 02 May 2020 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=S/Mp6vXs81Jnk5ImKapqiCf8814Ik89Kt+fT53xJTEQ=;
        b=BtXx3rRe5VOqDo4tAykcTFoaP2KRhKOHP+UXaXPwIptEEGmDzGRMHhIFzqEuHz8rKo
         wIpVx2MP25+SHPL+8lDSh60x9YdALlE6W/87nn5ipa8+BwL1wkLNVsj3X9X8Vy8m8QeK
         9Bj6yHDffMyQsdxllD7bLLmYEYahGeytElElH1c8Auy0/nkD258J9lcb7kAvnwLIYExq
         f+luk0dD42edCvtInY4/94aig6sFGq5F+m0+VlBIgnq5QXlJHJavLJ/r6Wm5fn3KzAJT
         sMc2iWry/tuZELRO+eO8ZYmd16/u6P8qMZlpleGR59/M+QotQ85A0xf2IqE+u2zwR1xw
         zb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=S/Mp6vXs81Jnk5ImKapqiCf8814Ik89Kt+fT53xJTEQ=;
        b=fW+Nmf4qyrXiz1/OjUxObeoGSMU4gdrmjcCyUbft+F1PUzhBUMHt5BP8FFBj0ho+ZF
         pwZUx7R1f0irMNRLG3QHqzYapZvExW2/r+foQ4gaU+fRWNaZUQOemRWMdXH93mxnTURE
         rw4G9bMtwwuNzda8iBKhOuw0D5ew7aoIy5LlVaWnrAxoVJtUz6Rb3eVsfauoPPopZiuV
         l91wj8sZtw4l7V6gh8BXw5ibLFuyR+Iwitjr5suqOiA6/KYoGE5jvGC1eVqzbiAOnS66
         lCqojBjDqkNOVn2Me/8j3RLvj2QYE0VgZIDyriUPEwMAtutFHmrMhNcJcRV/gTF1hV+S
         qhPw==
X-Gm-Message-State: AGi0PuZAKXh13/D6e5hwSGk/ygrOg0WcgUw296xb6lsPdplsSfW4uqRp
        NOUv8B+YBl2e2U+NAyR1WWA=
X-Google-Smtp-Source: APiQypJM2aEJihMi+NvkEFmY76CXAFE7UV95S8qT5RRLRru09U0/QqyvjkAjpfPm6y57MpWLHwBpKw==
X-Received: by 2002:a63:dc41:: with SMTP id f1mr8495427pgj.348.1588416386793;
        Sat, 02 May 2020 03:46:26 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id d12sm1921316pjx.1.2020.05.02.03.46.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 May 2020 03:46:26 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2] MIPS: perf: Remove unnecessary "fallthrough" pseudo keywords
Date:   Sat,  2 May 2020 18:46:24 +0800
Message-Id: <1588416384-18200-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The last branch of switch-case doesn't need a "fallthrough" pseudo
keyword, and it will cause errors when building a kernel with -Werror:

   arch/mips/kernel/perf_event_mipsxx.c: In function 'reset_counters':
   include/linux/compiler_attributes.h:200:41: error: attribute 'fallthrough' not preceding a case label or default label [-Werror]
     200 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
>> arch/mips/kernel/perf_event_mipsxx.c:932:3: note: in expansion of macro 'fallthrough'
     932 |   fallthrough;
         |   ^~~~~~~~~~~
   arch/mips/kernel/perf_event_mipsxx.c: In function 'loongson3_reset_counters':
   include/linux/compiler_attributes.h:200:41: error: attribute 'fallthrough' not preceding a case label or default label [-Werror]
     200 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   arch/mips/kernel/perf_event_mipsxx.c:903:3: note: in expansion of macro 'fallthrough'
     903 |   fallthrough;
         |   ^~~~~~~~~~~
   cc1: all warnings being treated as errors

Fix it by removing unnecessary "fallthrough" pseudo keywords.

Fixes: e9dfbaaeef1c9fe ("MIPS: perf: Add hardware perf events support for new Loongson-3")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/perf_event_mipsxx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index a14974c..710b2c7 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -900,7 +900,7 @@ static void loongson3_reset_counters(void *arg)
 		mipspmu.write_counter(0, 0);
 		mipsxx_pmu_write_control(0, 575<<5);
 		mipspmu.write_counter(0, 0);
-		fallthrough;
+		break;
 	}
 }
 
@@ -929,7 +928,7 @@ static void reset_counters(void *arg)
 	case 1:
 		mipsxx_pmu_write_control(0, 0);
 		mipspmu.write_counter(0, 0);
-		fallthrough;
+		break;
 	}
 }
 
-- 
2.7.0

