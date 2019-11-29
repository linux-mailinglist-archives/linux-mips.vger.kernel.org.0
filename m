Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9A410D463
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 11:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfK2Ku6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 05:50:58 -0500
Received: from foss.arm.com ([217.140.110.172]:46030 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbfK2Ku6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 Nov 2019 05:50:58 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A2051FB;
        Fri, 29 Nov 2019 02:50:58 -0800 (PST)
Received: from [10.37.10.52] (unknown [10.37.10.52])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 315A23F52E;
        Fri, 29 Nov 2019 02:50:56 -0800 (PST)
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Maarten ter Huurne <maarten@treewalker.org>,
        mips-creator-ci20-dev@googlegroups.com,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com>
 <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com>
 <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com>
 <4807842.gtHLO0kk0V@hyperion>
 <01D75E67-EC2E-4C74-B9BB-752773C481A9@goldelico.com>
 <20191128150721.GA20142@alpha.franken.de>
 <4F75970F-81DA-4727-8ADC-17CF6D77829B@goldelico.com>
 <04b509b4-b1ef-3bcb-433e-8eed5772288f@arm.com>
 <BF04DB35-9DBA-4297-8FCA-BB422A56DFEC@goldelico.com>
 <9ee8cbab-0655-f4d5-6699-fbe34fbe4d60@arm.com>
Message-ID: <183faf2b-247b-7a1f-a45c-4ae6bbff4320@arm.com>
Date:   Fri, 29 Nov 2019 10:53:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9ee8cbab-0655-f4d5-6699-fbe34fbe4d60@arm.com>
Content-Type: multipart/mixed;
 boundary="------------B6767A12C8E3216B1F5C5EE3"
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a multi-part message in MIME format.
--------------B6767A12C8E3216B1F5C5EE3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Nikolaus,

On 11/29/19 8:57 AM, Vincenzo Frascino wrote:
> On 11/28/19 4:47 PM, H. Nikolaus Schaller wrote:
>> Well, it does not immediately compile because CONFIG_MIPS_CLOCK_VSYSCALL is not
>> set and can not be configured by normal means:
>>
>> Error:
>>
>> /Volumes/CaseSensitive/master/lib/vdso/gettimeofday.c: In function '__cvdso_gettimeofday':
>> /Volumes/CaseSensitive/master/lib/vdso/gettimeofday.c:152:4: error: implicit declaration of function 'gettimeofday_fallback' [-Werror=implicit-function-declaration]
>>     return gettimeofday_fallback(tv, tz);
> 
> Oops, I just realized that I had other changes not committed that's why it does
> not build for you directly. Sometimes I get so excited for fixing a problem that
> I forget bits and peaces :) Sorry about that.
> 
> I am happy to hear that this sorts out the issue though. I will send out a new
> series to test.
> 

Could you please try the patch in attachment? It should be all this time.

Thanks!

-- 
Regards,
Vincenzo

--------------B6767A12C8E3216B1F5C5EE3
Content-Type: text/x-patch;
 name="0001-mips32-gettimeofday-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mips32-gettimeofday-fix.patch"

From 6ee7d583444f7edb1b5b8e834253b34efe4ff257 Mon Sep 17 00:00:00 2001
From: Vincenzo Frascino <vinfra01@e120585-lin.cambridge.arm.com>
Date: Fri, 29 Nov 2019 10:01:18 +0000
Subject: [PATCH] mips32 gettimeofday fix

Signed-off-by: Vincenzo Frascino <vinfra01@e120585-lin.cambridge.arm.com>
---
 arch/mips/include/asm/vdso/gettimeofday.h | 13 -------------
 arch/mips/vdso/vgettimeofday.c            | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index b08825531e9f..0ae9b4cbc153 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -26,8 +26,6 @@
 
 #define __VDSO_USE_SYSCALL		ULLONG_MAX
 
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
 static __always_inline long gettimeofday_fallback(
 				struct __kernel_old_timeval *_tv,
 				struct timezone *_tz)
@@ -48,17 +46,6 @@ static __always_inline long gettimeofday_fallback(
 	return error ? -ret : ret;
 }
 
-#else
-
-static __always_inline long gettimeofday_fallback(
-				struct __kernel_old_timeval *_tv,
-				struct timezone *_tz)
-{
-	return -1;
-}
-
-#endif
-
 static __always_inline long clock_gettime_fallback(
 					clockid_t _clkid,
 					struct __kernel_timespec *_ts)
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 6ebdc37c89fc..6b83b6376a4b 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -17,12 +17,22 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime32(clock, ts);
 }
 
+#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
+
+/*
+ * This is behind the ifdef so that we don't provide the symbol when there's no
+ * possibility of there being a usable clocksource, because there's nothing we
+ * can do without it. When libc fails the symbol lookup it should fall back on
+ * the standard syscall path.
+ */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
+#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
+
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
@@ -43,12 +53,22 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime(clock, ts);
 }
 
+#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
+
+/*
+ * This is behind the ifdef so that we don't provide the symbol when there's no
+ * possibility of there being a usable clocksource, because there's nothing we
+ * can do without it. When libc fails the symbol lookup it should fall back on
+ * the standard syscall path.
+ */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
+#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
+
 int __vdso_clock_getres(clockid_t clock_id,
 			struct __kernel_timespec *res)
 {
-- 
2.24.0


--------------B6767A12C8E3216B1F5C5EE3--
