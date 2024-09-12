Return-Path: <linux-mips+bounces-5541-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A57E897659E
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 11:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D78B91C218C0
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 09:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEA619F428;
	Thu, 12 Sep 2024 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFw37+lk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778CD19F412;
	Thu, 12 Sep 2024 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133463; cv=none; b=tGpPbfxzpIFBxYG0b9IQqf1IZ3yzq4cORRzW5PtbBhNT881LWkVj356GIbu0gdGtM4Wl/QXwghwBLSwkcSXQ2eVukCwphlHSvMnCum/5yGrHIMCq08tBRzKlJ37TERjWvCybOTgtUj6T9PhPfo/Ph+boukZtSNuBBp8B7hX1gag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133463; c=relaxed/simple;
	bh=6v8h21BYHwmBn6z3r5CIfCo7toAhvHcTjG+vWOZBQCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eEtJTpaDWi3zi4Bh9vt7jSXNtFVqVfZLUWMB3OLKLBnRnABOCkys/HC2B+CfexY8tpVKdk/oXwsbO/jQUExo61ydZbyS5P6yf9Su0vD5H/Cq4lSn7XoSHEhHZR6ImfJG61PJX6sVJTGzeUEUzaghJEyKuYv0R9+zMF7Z61J9ZqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFw37+lk; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso829705e87.2;
        Thu, 12 Sep 2024 02:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133459; x=1726738259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ajgv0hB3TeKXEQwcY+X8KT/8Qpdg4uMdZRkO0EFzzv0=;
        b=IFw37+lklsAZZ2OdoVqR2/bXtkgB+n5aGAMdHF2PLsmub9WNV7mnWjxY99WpuXTpao
         oRiv4uWTpkZRYdYS/AUavU8HM7PRqKqjAOR3EiWJskNduR13EukgH6k6xBHwQmY1evRW
         hkAM9v9Vf0PBwTB8d1vK5oFVH+wqzzR/q3/4M+pR1rzXNbbFPMpTHbbx0lUXHjoUwwfy
         xgbUwpc/XVDsXB+clUtVylrEtxGB3lQkT/fNawkvCxJdDy7HuzMCzZnKVj5n6Wg4GDGM
         az7UYWm0ON3znOQ1CyguuKi4xqvJ9krSsXfeeKQKS/xCQRzJ8/fAMEzVHd4BJC3jV57l
         DNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133459; x=1726738259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ajgv0hB3TeKXEQwcY+X8KT/8Qpdg4uMdZRkO0EFzzv0=;
        b=WbVYYeuncNUt2dwD3d08mdKBFBtVKFXlkgn0QEDHVut97exjtGE1WRgqSOL/aP4RX+
         pSL5lYOdser9Fvh6vTUE1BJCa+hopZDjms9DKPXH+VZlXxRSlTuE38n73IsH/5VJ1kus
         rYX3ty3wiymGUa8rmhqT/xDGBKO4wecQmjBtTjayYiPWszdF4TnoMC458AucZbVwxVcQ
         CtXksAHpbWWQu6CCwaSTuIJvxo6j5NVYOVmqBn7skIU6keLV4KNGkl3CJKpk/YK+Scs7
         SyASdk8M9KNtVWO7nw6zlQ3JnqNc1CeXsmlO1XOFZt6+LlggQaYcWSFjlSPIOedgYekm
         JZnA==
X-Forwarded-Encrypted: i=1; AJvYcCU78tZXYUmrx0LHP8Z3Z5VUxapUO1O5u+flPbEuuJ+eDPV3SVAfMJi74Y2p2lwb+A8qWvq4Tf9M5RKCjA==@vger.kernel.org, AJvYcCXac76BBEW9z9wBz1OM6xOfWJNfOl4/O2uw4cO0A97ut5BZckOcCUE6KOaUbFum+9CmckSJHU7lEXDUKHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuXRVo5gDLMn8n1ud+fvxmQMwJS+MjHyMai19uM4hJvjZf3pFt
	9ST3iCheHVWhBNPCja0ANJKZhbWxbtjJlkd1K8KHbbg1BcMJ2nZl
X-Google-Smtp-Source: AGHT+IHDYnW78bOUZS4nhLcuxJll9/+0I9MSg/om/F296GkVTANK4fS4HTz7sKENbHh6UUayiXU6zA==
X-Received: by 2002:a05:6512:ac4:b0:535:6935:7869 with SMTP id 2adb3069b0e04-53678ff5ec3mr1164147e87.55.1726133459051;
        Thu, 12 Sep 2024 02:30:59 -0700 (PDT)
Received: from localhost.localdomain ([212.200.182.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm76688225e9.1.2024.09.12.02.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:30:58 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v6 2/9] irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()
Date: Thu, 12 Sep 2024 11:30:44 +0200
Message-Id: <20240912093051.452172-3-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912093051.452172-1-arikalo@gmail.com>
References: <20240912093051.452172-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

Use CM's GCR_CL_REDIRECT register to access registers in remote clusters,
so users of gic_with_each_online_cpu() gain support for multi-cluster with
no further changes.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/irqchip/irq-mips-gic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 6c7a7d2f0438..29bdfdce2123 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -88,6 +88,12 @@ static int __gic_with_next_online_cpu(int prev)
 	return cpu;
 }
 
+static inline void gic_unlock_cluster(void)
+{
+	if (mips_cps_multicluster_cpus())
+		mips_cm_unlock_other();
+}
+
 /**
  * for_each_online_cpu_gic() - Iterate over online CPUs, access local registers
  * @cpu: An integer variable to hold the current CPU number
@@ -102,6 +108,7 @@ static int __gic_with_next_online_cpu(int prev)
 	guard(raw_spinlock_irqsave)(gic_lock);		\
 	for ((cpu) = __gic_with_next_online_cpu(-1);	\
 	     (cpu) < nr_cpu_ids;			\
+	     gic_unlock_cluster(),			\
 	     (cpu) = __gic_with_next_online_cpu(cpu))
 
 static void gic_clear_pcpu_masks(unsigned int intr)
-- 
2.25.1


