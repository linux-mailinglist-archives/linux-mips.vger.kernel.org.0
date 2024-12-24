Return-Path: <linux-mips+bounces-7183-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 016929FB9D4
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2024 07:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEA057A1742
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2024 06:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0E515575C;
	Tue, 24 Dec 2024 06:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="WpqUKQxn"
X-Original-To: linux-mips@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B432A14AD02;
	Tue, 24 Dec 2024 06:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735021511; cv=none; b=Xe5Bv6lMDgylcKRZS/jgpfCA62oZzJvUOGjLZ8k0wzOTEgnelPDkExBQhCgUnOTe7cnsDwWuhFjEyT52SLWSrAd8M0bY+rGlwjmr23nDkmBS21XU/itKC5qlROvapFVATth92P3eHhYluT7jiTaNTeKJDGn/R8BubpvUUIF0/QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735021511; c=relaxed/simple;
	bh=gI6L/dm3UYwCUEHYSc0gEFYXEyUSnVPicQ+haHeouoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IyXItFoy0l1epvaSrP238B2hw3LmJDhStHcO55aJO2GycotvMBgQ9SIcW+tVM9PcaGsQe0d1I54N8YgA2Nlriwp5fiVpk91Znf6SHX4zNPAj+1T3L+wqwxEFsmm8HdgZcrvGiqEP0+HINYs4FDn98gxf45sUYDYc4DA6WiuLRHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=WpqUKQxn; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1735021424;
	bh=D5RgOMTfMNG3T4lEn+2eXmIOePG2rUX9MJsUzZUqgOU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WpqUKQxnQhAsW8ypxgL7nS7znL7GlouXe7HYsUO04f9UpCUOwzfm3INNO78w1ny7X
	 Jl2TQYOKkmb3wraWW1P7T5KiMIIQNGUufSFAm2IsvK1W9EED40p6wWKVUQcViLHHx8
	 QllgubaTUz1a7TQNZvVFJ6E4lNM2eUCYqrW5k1Gk=
X-QQ-mid: bizesmtpip2t1735021382tlkpp7d
X-QQ-Originating-IP: fSCqsPsHjXsWYBOo7s1JGeDOqELBnx3Vqklc5JCP9Ak=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Dec 2024 14:23:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13834130958116600545
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	stable@vger.kernel.org
Cc: jiaxun.yang@flygoat.com,
	tsbogend@alpha.franken.de,
	rdunlap@infradead.org,
	bhelgaas@google.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guanwentao@uniontech.com,
	baimingcong@uniontech.com,
	revy@deepin.org,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH 6.1/6.6] MIPS: mipsregs: Set proper ISA level for virt extensions
Date: Tue, 24 Dec 2024 14:22:39 +0800
Message-ID: <38A42FE743EFB36A+20241224062239.19248-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M83iEva+1QDBEPKVtHMlTQVrvJNp8TWOJe1d06JElp0Ie0A0x+Rx4qXv
	jK9OfZ06rV1YpGswsaFxwZbpzCgb5mMx/ludi7x8fsQ8YMAbVd69d7FZ9xWT8TNHiopnvO1
	ft6x5b+sr3SKLGSl2gIa14nat1p4t6kxI0xz2L8Qhnjfx4UmUZvz+B+sERWRTjZLcm6nsJ6
	rpKpgoWEhEmKv1XJ7Rf82AWXa4OM/uEzjd75Dsc7leL08GWUXuQm323a6VwQd+0We7LcAOm
	foZj0sAiR67O12fBKJyNG1leAPPafABVqFRVRk/npsxEN8VQh4N0evCYCAR+06+cPmAzk99
	LJ92g9e30EL/hbiYuUYcfxPaxcwptMvYRKdflmqcbshD3wepWuLUo6zs3Ma8Ql+NkfAXUBp
	ACYrFoh/2fX0mUJOSK3hYDLsuDWQdOPwV4nGQ3UptxbaqWi4d6nWV5egvjaAokt59/cEtwn
	eOMiDp5AOj2c6CPpWywaNu+4tT7FB07fl7yWTGyIddpXew8drvieUd9VaF3h8iaX4Zb36/s
	lMfx7DSPTTYQgtPLlwtnvNNUbUpmBtvOa5qRrdNDKbPPlwf66WgH5Kvqv34cqxCKWxd+/n/
	qM7f32BWUCo+NPktGEv4EqGxrUarueIybS2OMjVbwRvPJtdCzwQtzmHdIQR9WXnk8ma7qXw
	+bUIKnOFOIbUxzKn8Dh7Cat/zqUlAosjgCPRxZqQAFb77wGJ5eb+AlfhJggzaZKW8q27ktK
	sqq/77fS8ldF8RgnvvmF3GzpujSXdayoFMzmSaKTSZPW63hEplfNr+baRRkEuIfxd45eCpr
	xljQmcaGPcBP1FzZsckp5L2q8Nn+ukmS0b0djCVOXlDxb0f7Vv4YR8R5V/+hwa+RybI6BJD
	FEg22ilyfAgMw/lsA2Wru+8jw0l2eApTatvtFCHH0m0KKPYTEMlarVJl22RUw19RZ+9mDkB
	E3tGvFZFfSMUdOIWxCsNiFckFO04qft2b4ZXWsNfzu1UZ6aSOm76XSW1VXZduABqxL0Ug58
	wwIvt+VouU09qVkVBk
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

[ Upstream commit a640d6762a7d404644201ebf6d2a078e8dc84f97 ]

c994a3ec7ecc ("MIPS: set mips32r5 for virt extensions") setted
some instructions in virt extensions to ISA level mips32r5.

However TLB related vz instructions was leftover, also this
shouldn't be done to a R5 or R6 kernel buid.

Reorg macros to set ISA level as needed when _ASM_SET_VIRT
is called.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/include/asm/mipsregs.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 2d53704d9f24..e959a6b1a325 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -2078,7 +2078,14 @@ do {									\
 		_ASM_INSN_IF_MIPS(0x4200000c)				\
 		_ASM_INSN32_IF_MM(0x0000517c)
 #else	/* !TOOLCHAIN_SUPPORTS_VIRT */
-#define _ASM_SET_VIRT ".set\tvirt\n\t"
+#if MIPS_ISA_REV >= 5
+#define _ASM_SET_VIRT_ISA
+#elif defined(CONFIG_64BIT)
+#define _ASM_SET_VIRT_ISA ".set\tmips64r5\n\t"
+#else
+#define _ASM_SET_VIRT_ISA ".set\tmips32r5\n\t"
+#endif
+#define _ASM_SET_VIRT _ASM_SET_VIRT_ISA ".set\tvirt\n\t"
 #define _ASM_SET_MFGC0	_ASM_SET_VIRT
 #define _ASM_SET_DMFGC0	_ASM_SET_VIRT
 #define _ASM_SET_MTGC0	_ASM_SET_VIRT
@@ -2099,7 +2106,6 @@ do {									\
 ({ int __res;								\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
-		".set\tmips32r5\n\t"					\
 		_ASM_SET_MFGC0						\
 		"mfgc0\t%0, " #source ", %1\n\t"			\
 		_ASM_UNSET_MFGC0					\
@@ -2113,7 +2119,6 @@ do {									\
 ({ unsigned long long __res;						\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
-		".set\tmips64r5\n\t"					\
 		_ASM_SET_DMFGC0						\
 		"dmfgc0\t%0, " #source ", %1\n\t"			\
 		_ASM_UNSET_DMFGC0					\
@@ -2127,7 +2132,6 @@ do {									\
 do {									\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
-		".set\tmips32r5\n\t"					\
 		_ASM_SET_MTGC0						\
 		"mtgc0\t%z0, " #register ", %1\n\t"			\
 		_ASM_UNSET_MTGC0					\
@@ -2140,7 +2144,6 @@ do {									\
 do {									\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
-		".set\tmips64r5\n\t"					\
 		_ASM_SET_DMTGC0						\
 		"dmtgc0\t%z0, " #register ", %1\n\t"			\
 		_ASM_UNSET_DMTGC0					\
-- 
2.47.1


