Return-Path: <linux-mips+bounces-498-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ACC8031E6
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4BA11F20FBE
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A0422F1E;
	Mon,  4 Dec 2023 11:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io8rgrO6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A61F22EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390ECC433AD;
	Mon,  4 Dec 2023 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691072;
	bh=XNLXB9C9iANjifHx1nMXhDMMAGyy9Qfh4bqOEZ796KI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Io8rgrO6IONkw5FdvdLvBhvUKSNRrK/QWiQKGpgJoqXoJ2squCFeHfzLDaPf5HICZ
	 rD9evFe+7fhYFUQaycqFh8VadEs4JStBSUlWWWqassmTEO6MSgKXM+dwEdx7uXiptY
	 RTAnjkW6LDKYBrBMbD/58lMlFjzJoKI6XuaTVSkeZQjdWhp9kr39JM3MrUdHFVaC1e
	 iSnR1WlI3slJkVH9RrM0x6A2jWJUvXDb59se3p+pdjIbsG0KsGjzc1VR7f11gTmr2O
	 sks6Gmbxyo6bC9WjO+u7rKWdDXN6t3f5T3iypVlVcWHModGPt1+Ohlf5oLej1fIQxV
	 j+ATqkXkHK/Gw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 17/20] mips: suspend: include linux/suspend.h as needed
Date: Mon,  4 Dec 2023 12:57:07 +0100
Message-Id: <20231204115710.2247097-18-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A couple of functions are defined by the architecture and declared in
linux/suspend.h, but mips is lacking the corresponding #include statement
before the definition:

arch/mips/power/cpu.c:16:6: warning: no previous prototype for 'save_processor_state' [-Wmissing-prototypes]
arch/mips/power/cpu.c:26:6: warning: no previous prototype for 'restore_processor_state' [-Wmissing-prototypes]
arch/mips/power/cpu.c:36:5: warning: no previous prototype for 'pfn_is_nosave' [-Wmissing-prototypes]
arch/mips/power/hibernate.c:6:5: warning: no previous prototype for 'swsusp_arch_resume' [-Wmissing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/power/cpu.c       | 1 +
 arch/mips/power/hibernate.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/power/cpu.c b/arch/mips/power/cpu.c
index a15e29dfc7b3..d8ef7778e535 100644
--- a/arch/mips/power/cpu.c
+++ b/arch/mips/power/cpu.c
@@ -6,6 +6,7 @@
  * Author: Hu Hongbing <huhb@lemote.com>
  *	   Wu Zhangjin <wuzhangjin@gmail.com>
  */
+#include <linux/suspend.h>
 #include <asm/sections.h>
 #include <asm/fpu.h>
 #include <asm/dsp.h>
diff --git a/arch/mips/power/hibernate.c b/arch/mips/power/hibernate.c
index 94ab17c3c49d..192879e76c85 100644
--- a/arch/mips/power/hibernate.c
+++ b/arch/mips/power/hibernate.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/suspend.h>
 #include <asm/tlbflush.h>
 
 extern int restore_image(void);
-- 
2.39.2


