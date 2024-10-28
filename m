Return-Path: <linux-mips+bounces-6514-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE99B387E
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31FB4284142
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E69E1DFE0E;
	Mon, 28 Oct 2024 17:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMCSP6Ny"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CA11DFD90;
	Mon, 28 Oct 2024 17:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138389; cv=none; b=N+F8eX5EbZlTXBsSYFMabIcNMOsdhSdJYAzwnd3fROD0o0syrM6V66Fotg1KiDEtcaYVqtatKCGhIXVc6Md1yrywm1yVEz0eGwCJzTmZlWOHl/t2jHTtRpYqPrxlQ2EbSlb+wXgR6B/eCRdA2vMeKI/V/WuToMRvPU/uhACBPgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138389; c=relaxed/simple;
	bh=OL3VID4hY2eu8UwEYOyDoL2nQ3kOIwJbWponl9rfmWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M72c3vMRM2F+8u3dnrkNY5JAoD2qjFNw9IPenDGRD0jZXLYnAb0jPsJFnKWthoy5Bsi25nN5cZmHbW8KMZASrWxwh1hQJRA8AruPam5h8rPi+QR5KBpjqqAZSFy0sV0RS1nt3XzC1qY/5OtUo9boCx9EQF+kUM4sfP6EnuS0Wqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMCSP6Ny; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso9038843a12.3;
        Mon, 28 Oct 2024 10:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138385; x=1730743185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZMIvPMuWtT6vOInn7H8aGGpvxbD/cbeLjklWeSSNdg=;
        b=bMCSP6NyIXGOzdcn0Pa2FWRAmMmueUTJylF7YCsz1oaQeHAuEyBtySAHuc6qoJ8/nD
         Z9cN9CPkSQnJLw31iHXsWpQsjsA/0DQZBwbkC+90diJRfVrbBOaMhalXpnsquH5fqjTo
         5LX1dnWDO8ZCyOdyh/KZM4fbxgQmX1uZhECtCIQmHxf+2NT+srA81C4qA959kzXMbThB
         pA5G5Jx72f8lKa8xmCBqZB+xZvl2Mi7k6qroCfUwBcQPC3SX7fnR4pqaGvvjoOJrSgC4
         AF5tjNXq0tjeF1pee1ILGCEcsFepVdVJzpv7MybrNUjB5BocP5C1JeuQ5bDxQbmeFaRO
         wvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138385; x=1730743185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZMIvPMuWtT6vOInn7H8aGGpvxbD/cbeLjklWeSSNdg=;
        b=hAOcDGUFWl4Yw23JA2Vd2ExblFJzq58ErVpPjXoR0g4AB5hWwJ5dV1a3ujPGO2Ytqf
         5ObjgUejuyTBeNVy9C6w3eDjeNqp4dUhDSTqSmTXvCWltSkV+sldsgUrkKJ1aoAG8Y1Y
         4QyTvhTOc4mI6QnRCEWrklNIsQrVnWdMX7sIVNO/Vkyf/cTJQd41GdqFz/vX9tl90uMh
         n36YwTRM663Hjqgyzc/QCFb8q9Irm7pCv/kdoIZdhhQhDI6G9rvpHmLysjcBuvBPw9Sa
         we5CvCDj8CAIzC6JL6OuP2wu6tk6c+diZATUngDdmO8PC9HDp6QE5QI5Z/5hANyTsuqJ
         HHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIbWTEXvyytxHnSaAJ8MEXwQ0b2CHV7tP4N8zyFXUSl+1hd/dx1TdqzTs/xyv/eZvlxNYsbIDxjErQ4wKX@vger.kernel.org, AJvYcCWOLPhP58Duzd+dxB0NYCpvdQiQURyDnd14HtoQiDgNyi6WyQVjB2yLorRDNUa4iIPbT7BkNCfSyCOy@vger.kernel.org, AJvYcCXFT44m6oG2l5zOAOBNR1IaoKqU6zBB9bXiI5bGOhn80tIuQEQvQQs12YwNqdj8QDyFdusuTv/S8BUm2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEP6opBrdVkQ4RQXpmJm+8X2iJ6tMtadLDoG2AjrYAXD3pDCwa
	UOiVskcIKypplYtkPIyvjvPTj+kYQdgSOZMolnOAaRf5H6KUQa/L
X-Google-Smtp-Source: AGHT+IHpsQwEdo/tU6Dy2HQo/rMxHtRL5C3XUuHugh6QQB+BIaQOId+pkyGUl2FLu2N6qetqW5+KRQ==
X-Received: by 2002:a17:907:9444:b0:a9a:558:3929 with SMTP id a640c23a62f3a-a9de615f94emr856744066b.48.1730138384966;
        Mon, 28 Oct 2024 10:59:44 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:44 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
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
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v8 03/13] irqchip/mips-gic: Setup defaults in each cluster
Date: Mon, 28 Oct 2024 18:59:25 +0100
Message-Id: <20241028175935.51250-4-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028175935.51250-1-arikalo@gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao-ying Fu <cfu@wavecomp.com>

In multi-cluster MIPS I6500 systems, there is a GIC per cluster.
The default shared interrupt setup configured in gic_of_init() will only
apply to the GIC in the cluster containing the boot CPU, leaving the GICs
of other clusters unconfigured.

Similarly configure other clusters.

Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/irqchip/irq-mips-gic.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 29bdfdce2123..d93a076620c7 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -764,7 +764,7 @@ static int gic_cpu_startup(unsigned int cpu)
 static int __init gic_of_init(struct device_node *node,
 			      struct device_node *parent)
 {
-	unsigned int cpu_vec, i, gicconfig;
+	unsigned int cpu_vec, i, gicconfig, cl, nclusters;
 	unsigned long reserved;
 	phys_addr_t gic_base;
 	struct resource res;
@@ -845,11 +845,29 @@ static int __init gic_of_init(struct device_node *node,
 
 	board_bind_eic_interrupt = &gic_bind_eic_interrupt;
 
-	/* Setup defaults */
-	for (i = 0; i < gic_shared_intrs; i++) {
-		change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
-		change_gic_trig(i, GIC_TRIG_LEVEL);
-		write_gic_rmask(i);
+	/*
+	 * Initialise each cluster's GIC shared registers to sane default
+	 * values.
+	 * Otherwise, the IPI set up will be erased if we move code
+	 * to gic_cpu_startup for each cpu.
+	 */
+	nclusters = mips_cps_numclusters();
+	for (cl = 0; cl < nclusters; cl++) {
+		if (cl == cpu_cluster(&current_cpu_data)) {
+			for (i = 0; i < gic_shared_intrs; i++) {
+				change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
+				change_gic_trig(i, GIC_TRIG_LEVEL);
+				write_gic_rmask(i);
+			}
+		} else {
+			mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+			for (i = 0; i < gic_shared_intrs; i++) {
+				change_gic_redir_pol(i, GIC_POL_ACTIVE_HIGH);
+				change_gic_redir_trig(i, GIC_TRIG_LEVEL);
+				write_gic_redir_rmask(i);
+			}
+			mips_cm_unlock_other();
+		}
 	}
 
 	return cpuhp_setup_state(CPUHP_AP_IRQ_MIPS_GIC_STARTING,
-- 
2.25.1


