Return-Path: <linux-mips+bounces-6147-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 881FD9A4BA5
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 09:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14E181F23125
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 07:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D311DE3C1;
	Sat, 19 Oct 2024 07:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY8OQaYn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3671DD877;
	Sat, 19 Oct 2024 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321848; cv=none; b=JLim4/uVORKUNVvMRj+3z2YprqfyXefwlttkWWg9nTW3goH18creLjwtLZeqh77kFNbNXwhX51uAbt67RmRkhGOe9d6rB9FC2qE1jcdijoActaDY1Eh6YBRyVgWeg/2TxYTO4T5iJImXvHHv+x7hzEoNHuMS4b+f9Dg+e9LJZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321848; c=relaxed/simple;
	bh=6v8h21BYHwmBn6z3r5CIfCo7toAhvHcTjG+vWOZBQCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YebUoAtZ4xrPKzIA0u+THwNiagiCag5oNTb+UZGyJMaEjJZJRN18z0oruKjOPVBtgX7Gg55+FH8S0DsgVnmabwLNdehiUMRC6rM4XK4eb79I7+buTz2/bagOzXkA8Imd+tw2Hz98808DkHgaXvCDpu1mhE4HxouoLkSwda+LHKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY8OQaYn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a99c0beaaa2so454208366b.1;
        Sat, 19 Oct 2024 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729321845; x=1729926645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ajgv0hB3TeKXEQwcY+X8KT/8Qpdg4uMdZRkO0EFzzv0=;
        b=lY8OQaYni/7Xu7o7aq3gJYKGRh/yTIyaMcB5ggYxQVIGG8q7Pxlihlz56dCq50kEbr
         Tucfzb51o0ZWmIUhGjsdmx6BjPb/yVW5nzGakjuIh1ilItU+O0ZDgRBTFuQjt1/jv/Qv
         2YLGCZ66VaBnlevemFa+McE7c90SuQHwI8xl8v0GRYpbnpppunPJRgxo5t+ISpDMCxAi
         zWw16ltM/15G2UJa+JcbqdOdeMEH6i7YjNFm4T7GCMO+ED2s5iaeDkn9RskWPEYeoHd8
         GWpJeOYF6IWW9ey04fuhhedvNPTUW1rNAMmuOsYlwS49tHQcHQjUdhy/wNrD0psRvXza
         aIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729321845; x=1729926645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ajgv0hB3TeKXEQwcY+X8KT/8Qpdg4uMdZRkO0EFzzv0=;
        b=FUx3pZ5rxacu7joXFJbvECIsF932UlEUEW2uq1JF5we/vN6R/f+r5Jd9HtDT/NwaWl
         1adbhIlBKow8cYYyoT6oHRuAhJVGz13nh6VoCigjpxjWM9UyeyAdhZ41SKUMFKbiXDhU
         qWdij5tELrEfmj3pNVQj0Xwp+JezhmU/JcBhUqftCfQ55UNJYFAyMBhQbh5pbasi5SCh
         +hrPJlvHEKUDp6fMVPfpEd29UFjhK+xJuIaT1nkUCTCvPktAJ3yXApeXQEtoeTMZp7fH
         p48AvE1P6eZgkLMtz/MSAWZqpupYpekc85L8xGy06FZVlKxVictPEMQbh4+8XO4N3R3a
         il4A==
X-Forwarded-Encrypted: i=1; AJvYcCUbK4HLJmTDBZ3y+8v8b7R33eMFHUGIkyV37FESm4QUF4pKkDiBjwdzK19ve9XitwDazda2M9m78gQC1Lo=@vger.kernel.org, AJvYcCV32mVY2s4DNFeaWe/lmF1TEHDH0z+WrjxCgg3fZb5k3NcvRBgWv7bvX789rS73eFqxb19OQmFnmSFYLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuLwIN46gh3lTcdnONrPyTqJFD9fjBUljICKUarzlGnhkgVty3
	2FzND7gVThLPAzI3Oc/jRgPZpJ7S7L/PcXMogR92oZb7eFlcFhQE
X-Google-Smtp-Source: AGHT+IGGc93RTo7IldCL3Qbu2wG7N4h7g2lsoXcBox+qzN6GKNJ9wQWn0rCnWc9xm+ek8GG2Z56yqw==
X-Received: by 2002:a17:907:60ca:b0:a9a:daa:ef3c with SMTP id a640c23a62f3a-a9a69a7b429mr479551166b.14.1729321844743;
        Sat, 19 Oct 2024 00:10:44 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27841sm180566666b.192.2024.10.19.00.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:10:44 -0700 (PDT)
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
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v7 02/12] irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()
Date: Sat, 19 Oct 2024 09:10:27 +0200
Message-Id: <20241019071037.145314-3-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241019071037.145314-1-arikalo@gmail.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
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


