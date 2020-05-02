Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6C61C231D
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 06:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgEBEz0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 00:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726058AbgEBEz0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 00:55:26 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E41BC061A0C
        for <linux-mips@vger.kernel.org>; Fri,  1 May 2020 21:55:26 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n16so5556887pgb.7
        for <linux-mips@vger.kernel.org>; Fri, 01 May 2020 21:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=uc7tZVoxlUfdt5PgXoEqJ4CpEui+YJt3bneMNtBURe4=;
        b=Xo8QQmk6OeRgtABKidQ8tG7zqUZWHVjsjkoiipxP9sIdMSVIcVcF7W82hKwHL6wGhE
         Zl0Ot/sA5Hx50ImVmQnHiDxUMimWxBVzNbPkSjfUfj3NXY2ni1jVrEZCf7MW0ydaSi4m
         EQv/G3YOPfulsj/A+bHgAr9koYacGaa6CzUwocN8BpSI6Sr2RyN2P0M5MweV85qL5TJW
         F63oTMaifOkvP2hYhFh/WEf5NNdg7dZR+XIyj47IC9zvisFhwwqfR1EKZdiCtsdTW7L1
         8fWJn4DitJcHHnf2bW5g0wBkgIsfuPXCe61uhzCHh47XQTcjJ/QtWhvBwNFh2Qi6s9Gf
         ukzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=uc7tZVoxlUfdt5PgXoEqJ4CpEui+YJt3bneMNtBURe4=;
        b=DDsZqHLx440ewS0j3+3rD3ZF6p12OapCe8GXbUuSgcBH8utKXa9k4fjkv3zKzbK7N6
         j3fdWfREkMOfW6Uam5kADt6uKgBD6/gTL3r3ATIpOfAI/pWxHG6WPKPquEpmr4UT26kC
         ZTcP/Fh0mA2vXAZ4LsIbTMPZp/HMV2QYgqn1YUeXxKQKw/ywwZuYL3N49d+pcUBXnHj0
         Htia5LAmMQ6EthBtA9HYE3hPo6jiiw45LzU3MeUIuM6QNFNnmh5AMhDn551PFVa5AZ54
         KiFtA0jx9TRhjxb/B/z90ToBakebnrFAony/lxh/OMcm/yw8p2CmgHjJ72cmdwXbu/82
         7Myg==
X-Gm-Message-State: AGi0PubpwHFqfStPb2d+H77DQda/E0V9HQ1acuhrriVXvxqO493ef2Pj
        vmMSLb7vGHaYd9KOhnVieyE=
X-Google-Smtp-Source: APiQypKINOfXFVvh8TiE1Ttt8UHdA2LGogvucWGs8+B1d/cRY0RxPOn8SwDHUn1RRCs5bmX5zrgq4g==
X-Received: by 2002:a63:1759:: with SMTP id 25mr6327331pgx.417.1588395325685;
        Fri, 01 May 2020 21:55:25 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id m6sm1049047pjo.5.2020.05.01.21.55.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 May 2020 21:55:25 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: perf: Remove unnecessary "fallthrough" pseudo keywords
Date:   Sat,  2 May 2020 12:55:26 +0800
Message-Id: <1588395326-5351-1-git-send-email-chenhc@lemote.com>
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

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/perf_event_mipsxx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index a14974c..710b2c7 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -900,7 +900,6 @@ static void loongson3_reset_counters(void *arg)
 		mipspmu.write_counter(0, 0);
 		mipsxx_pmu_write_control(0, 575<<5);
 		mipspmu.write_counter(0, 0);
-		fallthrough;
 	}
 }
 
@@ -929,7 +928,6 @@ static void reset_counters(void *arg)
 	case 1:
 		mipsxx_pmu_write_control(0, 0);
 		mipspmu.write_counter(0, 0);
-		fallthrough;
 	}
 }
 
-- 
2.7.0

