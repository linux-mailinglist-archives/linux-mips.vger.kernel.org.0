Return-Path: <linux-mips+bounces-3250-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 853178C36AE
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 15:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11CB11F21F3B
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 13:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F4E405E6;
	Sun, 12 May 2024 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9Q+hvH1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E31F28E17;
	Sun, 12 May 2024 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715520330; cv=none; b=ea61avFJaSipmV3KIrV4ul9WTLdZdrMlj1dc0hPcYjmnW1aZ+5NkQNhUMA3FA58lfE4DmvtMM5tFnk+44XEVFnG195aPk0/SQsDUjk2NukdxKiKD78GWM4m5QRGv1y75BRd0uQMfATtxyC2Q7B1dI+KolSQZE+SkSnbv2uOKE3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715520330; c=relaxed/simple;
	bh=y5X0OWXz5ws3bAHMfoYFwbP2pMMbDn947glAeZm8OpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZGZwBJyTVxHKMxzXODUoLXJ8NyPuy/eIp8IjgMnUVN1MXTRpZ4QsYQlccIAm7kWjbRwvxDHTLyoCa6r3+0czgjZ/6saUGUQCRQjGXDgc38x+RC0+3Y6a02/oOF4JGUD0IfmZygHsG4rwRRdyNcmwa48YA/xQs5x4WNjNt42oeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9Q+hvH1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34db6a299b2so2838581f8f.3;
        Sun, 12 May 2024 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715520327; x=1716125127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G276tR2DWdT7pXfSzU9VYLXPeNqUlLbGdFn/8pm75Rk=;
        b=A9Q+hvH1F8+WLk5zIzY8u4izwu3X1eNDxHp/xcDPz8hR/R08hbeQk5NLTBgCXuwKwP
         t0vUajJrEC5UBtdLk3DbUWENSNxs8ZNuJVB2MmEiU8+woAas5nTlDR5uHlMdOk5db4MI
         n8MbNMR4iXEvO92XIlb5kEByOeeLazkUMyEvx79m4xJZbHzktUCYp2C1wlmr2Uzsi0tq
         /qComxJJubY+XRZs05CNdvy2UoLoW589scNsmuYM27YVRlt1erP5nHdv1icwkrc8Xnwk
         6oBLieVoC0fEHAsdagoYsFv7OLI6FjF1Ixx7xcZgVQlC3qVl5Lf/AhR4NuhzlfyLXNAc
         4VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715520327; x=1716125127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G276tR2DWdT7pXfSzU9VYLXPeNqUlLbGdFn/8pm75Rk=;
        b=lrMPZ++O2f7+ejKQ4Oa4s1rqSLARLhEAb2JKT3s5huby29vspFKYFqpiul5+xyg8uX
         G/l4vCz4gE9umAxowYsEOHq81AY2mCpG1e0PK4JZlEIjcjflXhsKEpfLQKqvM+rxkX6y
         NWRz64lsyYIXrHEDhIsvg3o18KIrnFpLyIqMCoQO5q7WuQ9mMHtbMWbBN/rVZ0u5Etpv
         RgwN7Vgo9k21R+B1zahD5Yo/9LQp4l93+YTfO7FTXtbfIByxIxcB1Y9FyuyiX/dBoA1E
         KBEp35GZJIsc1bfmZfqQ6cmFBQYNWLoSSWksfKL7NYQNa/XV7gjaIdAlTMqKgPUFb0Ux
         16LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx4y4L1Y6+hx+QA4AVVQQEqJnc/+kEIpVEVSvmkubKjM9mQXF5gTfQBBDXadzvbGm/TUh6W6IHj9Kyns4yy3a97vqT1CPVz4T2r8QaO/4V7tnycSxRevw472y/0zAmZLB93WnYJDsLBdsyRWmbShIFNOQdWxHScepAQaFNZA2JfzNYVrU=
X-Gm-Message-State: AOJu0Yytq/GCNEceJ2w1Rw/UobsUn2fSYwS+LqZ7hYJGiDlrd5S/r1Dr
	FsBosLPLPGjLAAhocMILdBxVdpPhczixnG4yWtwtyZpQITqvZWhK
X-Google-Smtp-Source: AGHT+IHaRa+50aW0QoXfeIsR7gOwM/NZ4VO3b3Q2yRKNI3581ioshqLDSInjVS7DgPP8P6zle6v7ZQ==
X-Received: by 2002:adf:e851:0:b0:34d:9fc2:4a81 with SMTP id ffacd0b85a97d-3504a61c5c6mr5321553f8f.5.1715520327427;
        Sun, 12 May 2024 06:25:27 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502b79bd09sm8822468f8f.14.2024.05.12.06.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 06:25:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Saravana Kannan <saravanak@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Baoquan He <bhe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Bauer <mail@david-bauer.net>,
	Liviu Dudau <liviu@dudau.co.uk>,
	Serge Semin <fancer.lancer@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 3/4] of: add support for bootargs-append chosen property
Date: Sun, 12 May 2024 15:25:10 +0200
Message-ID: <20240512132513.2831-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240512132513.2831-1-ansuelsmth@gmail.com>
References: <20240512132513.2831-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for bootargs-append chosen property.

The bootargs-append can be used to append additional kernel arguments
to the bootargs property. This can be useful in the context of a
bootargs overridden by the bootloader that contains correct that but
the kernel require additional one to be correctly setup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/fdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 253315421591..cc99958872e4 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1080,6 +1080,9 @@ int __init early_init_dt_scan_chosen(char *cmdline)
 		p = of_get_flat_dt_prop(node, "bootargs", &l);
 	if (p != NULL && l > 0)
 		strscpy(cmdline, p, min(l, COMMAND_LINE_SIZE));
+	p = of_get_flat_dt_prop(node, "bootargs-append", &l);
+	if (p != NULL && l > 0)
+		strlcat(cmdline, p, min_t(int, strlen(cmdline) + l, COMMAND_LINE_SIZE));
 
 handle_cmdline:
 	/*
-- 
2.43.0


