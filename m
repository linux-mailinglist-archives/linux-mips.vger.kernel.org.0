Return-Path: <linux-mips+bounces-3799-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFC291102A
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 20:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 220F02885C1
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D06A1CF3E6;
	Thu, 20 Jun 2024 17:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6JVWD60"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B285A1CF3CC;
	Thu, 20 Jun 2024 17:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906327; cv=none; b=SqfLvwd/P2sSBzAw6ulV3hFcCAjeNN3n85GxfDjFfM6ERNTyWdcnN26XNq/fvSnPpEvN4KKkgJE+IbB0FssIl56Jz79VdDBOJeG6H5gYgfYUwFXQZNFjugDkG1KPp5kikKKeGMummwBKIWEc/U8rnjiFJbxUnWiNlgVaj+x2KwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906327; c=relaxed/simple;
	bh=9VKEeJ2Bp6V9P0lgAXpETIbdOrUySYRDJ0KU4G9h1Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMEDoiS61B9SMww9uI4dCQmbUvVoBLJ3H9fydcocjQGByQkcynC9miMoqyYlwI8fNuheYgpVb5F4LTjivNCtnclGkFfccFN82iRImotxzNeyKtJ7t0y9XcyBByzqw3+pPNWV03Wv/5OZMHAopg5Cw1GOYlJv31kysRG8Nib2yuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6JVWD60; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70635466708so1164614b3a.1;
        Thu, 20 Jun 2024 10:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906325; x=1719511125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDKUwH++JfbwJqOinFdI5jqclRMQl0q8xEbU2EXAI2M=;
        b=C6JVWD601Os/HscPNlyGaztA/eeiPlWbKxPoioONwFNHRIQNVIRjgU+JPzZKMx/NIc
         e9l75IKK3kQOFedyktCQMOzzfT00/2Bh3X5mZOFIBT0trs9caJ7Qo2dCnJRpZDUD3Mtn
         damjcwNbHMdF9JCcLK7VvUu+s8jQde+sy4h++kpKU5Gabj1Y6Z4DCfbIIcXTHCvLuvf8
         aycleffGJWTZsGLI/OU7zXmFQPOtnK5Mtr3pxockDvD5W3ow8kb/Opy/WRfYdFpi1FeO
         QzRPKbU/FFsJdpWUGbNVrSl33T1cn2niE6yAzbDuuxVjSvgn0LjSSF8ceFrA7TTjKZgD
         oFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906325; x=1719511125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDKUwH++JfbwJqOinFdI5jqclRMQl0q8xEbU2EXAI2M=;
        b=wTU8pZsEVOfTac+/+5jZXGLh5QIziiQaRN/zVVBC7K8Xhwa0jLvCDY3yyIVC2JKBqD
         TZaapBnsKmBZErfOO8SbZ3Ia+IpVjFUiQx5gOQvz/nkcx/Edbq647S7skBNQYupCMJrF
         Ypb7dHtk0B7QLcZkKCpowdM/cZ4kwLZ9StE1/K/PwS8BHk7wB7t/rOyr2sestfugNVCo
         lJgpiYetz+z/Cg7lqGF1fWwh/4PbBj8Sb0m/va9l2HwcnmV8fv/VgNNkEDqGoQxyYoBb
         /777S6gGthHYmHjdciPNrgCR9o5qAJbFkA0driN8JVFX5/R4H00b8bMdhQTwNKfTYZpk
         q8HA==
X-Forwarded-Encrypted: i=1; AJvYcCWMnGyDL4asTQ5fSxv3K3omzlqNMICi9O3bp0uwu6cT+ne6DQmcCrMVxiKwmlFLv6vOkmymV8EZDhKv0dgBfGvcYq1kkBcr66JuIA==
X-Gm-Message-State: AOJu0YyiXzuQD25xLIZ4xF+jbkJKcnQ15oniseaU2QGhnMD/FWcqXtKR
	qzP3FpRISsn6xSSuEs4R5qVp0X8v0Hcw3r9rL/tXO2sfK2rdAXYjqx0x9wNbql4=
X-Google-Smtp-Source: AGHT+IGQBqThGaLy+ssIXPNfXK0T9Cj9jN1FEARMt7HY6rnbCm2HHwjb8BD1YqPuoPyBGgsGk3h3kw==
X-Received: by 2002:a05:6a00:124f:b0:706:3ba3:a192 with SMTP id d2e1a72fcca58-7063ba3a6c5mr4518454b3a.22.1718906324947;
        Thu, 20 Jun 2024 10:58:44 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc920a4bsm12630837b3a.21.2024.06.20.10.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:44 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Yury Norov <yury.norov@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-mips@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v4 34/40] MIPS: sgi-ip27: optimize alloc_level()
Date: Thu, 20 Jun 2024 10:56:57 -0700
Message-ID: <20240620175703.605111-35-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
References: <20240620175703.605111-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify alloc_level by using a dedicated atomic find() API, and make
it a nice one-liner wrappers.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/mips/sgi-ip27/ip27-irq.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
index 00e63e9ef61d..fc29252860a3 100644
--- a/arch/mips/sgi-ip27/ip27-irq.c
+++ b/arch/mips/sgi-ip27/ip27-irq.c
@@ -13,6 +13,7 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/bitops.h>
+#include <linux/find_atomic.h>
 #include <linux/sched.h>
 
 #include <asm/io.h>
@@ -36,17 +37,9 @@ static DEFINE_PER_CPU(unsigned long [2], irq_enable_mask);
 
 static inline int alloc_level(void)
 {
-	int level;
+	int level = find_and_set_bit(hub_irq_map, IP27_HUB_IRQ_COUNT);
 
-again:
-	level = find_first_zero_bit(hub_irq_map, IP27_HUB_IRQ_COUNT);
-	if (level >= IP27_HUB_IRQ_COUNT)
-		return -ENOSPC;
-
-	if (test_and_set_bit(level, hub_irq_map))
-		goto again;
-
-	return level;
+	return level < IP27_HUB_IRQ_COUNT ? level : -ENOSPC;
 }
 
 static void enable_hub_irq(struct irq_data *d)
-- 
2.43.0


