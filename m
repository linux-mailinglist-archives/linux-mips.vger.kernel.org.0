Return-Path: <linux-mips+bounces-5654-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22098667D
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 20:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FE7AB23C22
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 18:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013851422D4;
	Wed, 25 Sep 2024 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDBKK1FP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3713E02A;
	Wed, 25 Sep 2024 18:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727289875; cv=none; b=H3F8iWU4ZXrqQhQsmgf3qVpLcslE3V48crsSgxfPnmxDi90dLG8IgNdGzcny6McOZ3PpeXCBpG7HpOywi13bMiy6aDE8/N2zVLiCTkcLyEX6LL4NC6C8iylijbtC7vCL/IK9H+SCYBMUG3i50YxZhRLZwxzP1p1Wp7ERM+Tg9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727289875; c=relaxed/simple;
	bh=ADO07XGKECGoynsWKnh252VX1qxyGAY2oQQkRjwl08A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tN1p8D/IsXBPnutkyKwyd7LC1wDeGNd1KASzkZQpvgpAhp3eqjHlGzlkSwVLKcacw4mNStIqsHPSNzZikMZMzQEnYMTnITOOEQqI3mhGZ9o+EzCEXmXwLH4gJvIt8fSDYuPYEa17YQBt2P5o5U2cNRkGjlw1gNJduL5U6ef4/GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDBKK1FP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5367ae52a01so195187e87.3;
        Wed, 25 Sep 2024 11:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727289872; x=1727894672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oanfMXUWAS3rE5D3kJe0C7yPK8rPOqfisEZTGKiqOnY=;
        b=ZDBKK1FPgJ0X6E+1V45j6PFYEWN2U4SGkMpJfFl/22z2lMsw1ywf8TCv9OnqkgFWdK
         g1AOuQPfmlcBm6PotiDNSnHIkEWYP71AYzxMKMyiZMztShI6dqG64gbDOAaomLDXJVUf
         q7/2fXSLGeqaJ4zG0jjZ7IsKc9mKGNMJLojojQKV8W+HkOOuiMAKzwX1Hzf0hDrW5s95
         rmPh4KfQIxwSQ5hWvvhTrXcfgwU+9hd9WGCyYxfJtpkLRpdbMt56mOVbbrg9HBDJmydi
         m1sarTgiaOqvxP2hUH9KnRapD9E5u6F6VfIK3Dq5z5OTM22bvdMsgTKyRaMP4wLXtyKv
         gwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727289872; x=1727894672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oanfMXUWAS3rE5D3kJe0C7yPK8rPOqfisEZTGKiqOnY=;
        b=bjJSL/xUFMiO1DxiWYzYR1MGv9yAiofNqE+g6CcrN3SMV5MyOxFyVvbvIMpkJjHaL5
         wuAWzKvxs8WBd0khJEUU2kGcdiHLZ0bnUy04kt2YCKOTZZGPqujTvPoTC+0miBBEOcng
         V9yrsxbsnkFtW6Um7S5jeQg3FIdYcW9pAG7hw7ujo1lvGkasj1yNfTtbmCeZ9bCRtbss
         NrMIVeuMqwfQREOishc7jf9+8js4q+bmloGQeNbL9zp7uRRUfuSUZdg8gTj6PoDcakA/
         5doHQ99QMvfoGfiChRLFP/QbV2LM0ir0ZfZQpqf5raUrLeJHmfgH+AUCCUWQ4Hr/R8D4
         dmUw==
X-Forwarded-Encrypted: i=1; AJvYcCWQB/sHpc3jCoWQ6HGdXdhf2q+DsoK/nAkE7oAVE9fQHebmYt/4jPpD8xB9e7qeTgPl86GvX7zLoTPMZzo=@vger.kernel.org, AJvYcCXpA5RYi+kTyi304rh56n0t6EKqIvbBeGvo0iBgqold8f0ezBeVqAsD3jezsJ8AqrYxnsTEpLkm2k0OSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKZUe6XxS/eFsffgY0cZPtokjv7tQ2zweMwhDWqp1Z1BUBMXnD
	5dTgkHlbQ58g69LDc24GWAqoejFEEYrOz0W8nooZE3KSsY+U0fl5
X-Google-Smtp-Source: AGHT+IFDbT2q7R32g3Mp6m4Xb0XAxjQP3JACgEHc46fVQ3G3BsTq7fibxzTmqS73ZTofna/7+v8AZA==
X-Received: by 2002:a05:6512:68c:b0:533:4820:275a with SMTP id 2adb3069b0e04-538775678fcmr2311661e87.52.1727289872088;
        Wed, 25 Sep 2024 11:44:32 -0700 (PDT)
Received: from KILLINGMACHINE.itotolink.net ([46.188.27.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8640a63sm588747e87.156.2024.09.25.11.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 11:44:30 -0700 (PDT)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	alexandre.belloni@bootlin.com,
	gregory.clement@bootlin.com,
	lars.povlsen@microchip.com,
	UNGLinuxDriver@microchip.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH 2/2] irqchip/ocelot: Comment sticky register clearing code
Date: Wed, 25 Sep 2024 21:44:16 +0300
Message-Id: <20240925184416.54204-3-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240925184416.54204-1-matsievskiysv@gmail.com>
References: <20240925184416.54204-1-matsievskiysv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comment to the sticky register clearing code.

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/irqchip/irq-mscc-ocelot.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-mscc-ocelot.c b/drivers/irqchip/irq-mscc-ocelot.c
index c19ab379e8c5..3dc745b14caf 100644
--- a/drivers/irqchip/irq-mscc-ocelot.c
+++ b/drivers/irqchip/irq-mscc-ocelot.c
@@ -84,6 +84,12 @@ static void ocelot_irq_unmask(struct irq_data *data)
 	u32 val;
 
 	irq_gc_lock(gc);
+	/*
+	 * Clear sticky bits for edge mode interrupts.
+	 * Serval has only one trigger register replication, but the adjacent
+	 * register is always read as zero, so there's no need to handle this
+	 * case separately.
+	 */
 	val = irq_reg_readl(gc, ICPU_CFG_INTR_INTR_TRIGGER(p, 0)) |
 		irq_reg_readl(gc, ICPU_CFG_INTR_INTR_TRIGGER(p, 1));
 	if (!(val & mask))
-- 
2.39.2


