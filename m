Return-Path: <linux-mips+bounces-680-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FBB80E1C6
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 03:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8466282757
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 02:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E7315ACC;
	Tue, 12 Dec 2023 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8xtZAqn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEA3B5;
	Mon, 11 Dec 2023 18:28:05 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5e1a2253045so6489357b3.2;
        Mon, 11 Dec 2023 18:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702348084; x=1702952884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Tx1ZYksYJvVzuOD+JQP20UpTW3NnHVR2BOmbC32l24=;
        b=a8xtZAqnpZmxgaldmGbl8zDfw4wGIe4uHry2UiKo2zru/lOtfdVstM7hB700pxlKYW
         3H9Ia6HB7n2jiNIZ9mB2RKeNktz8q/qFk3RxdklUxh2VVT2y7b/VF1CmOlFPxRncWnPH
         mHJj4OzALSXwXiHojrjyXNZyucPR+I0BTZfzqu+mx6TonaYZy6nryn2P3WA/Qjs6J/Bn
         sYOCyoXCweuD2oVc1tcP6LcK8ixwdpMswad98wl4m/inTvYQBQKV/c5lpqH1sNWcS2HV
         ydziDWwQIP440jviJbloUYBEzZr3WW9bEqIbIjoje1Qgch+n4+MzzHKmFTaQYrupfJns
         tDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348084; x=1702952884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Tx1ZYksYJvVzuOD+JQP20UpTW3NnHVR2BOmbC32l24=;
        b=eaXO6BQrUfnzhHbI9TNw3NjZ9fa+jOcvyvSrcfl7XaoqE5JAvp/ekqPqDf6r7w8akp
         Pm7bTSJ8t2VGmwdaw2+A+T3VnlwMOch23OvaQ2ffMEYjg3B1SbkZTOsVVQ7xib2sGa5Z
         l4eWFsVEUreJYymF5Bb1arUK1uRQytsh8xQYqeOW3zBJJwdBsOu6tX7UOWNmYOEYcdSE
         gb8KG9V9Db3KBnjapl8e9SX/Mz9XodDdFqCRc2eWmbPupsQdPwx6uzcgUndRkETC6tSU
         7vtVY5hs0SicVxxdAXWpxuNH9P2NQaIyLfY2X9K49cWCubkDxyV+CaGnW6Nw3W01NZKh
         g8iA==
X-Gm-Message-State: AOJu0YyPOsDtzqPgeWM/1mbCI60hPoU7rpsff9db+KKFjjtY2XGBRsik
	bqpfyOqDp2yGdn45TgxhqCAY2U8mxLcKaw==
X-Google-Smtp-Source: AGHT+IFbwgCjyr+symSCwmcMVav+/mrWq62DYtu0MzRNEMdwEGE9s7dNj9rtNAhSKnWPycQvxu7lTQ==
X-Received: by 2002:a0d:cc8e:0:b0:5d3:8400:ba9 with SMTP id o136-20020a0dcc8e000000b005d384000ba9mr4160559ywd.48.1702348084007;
        Mon, 11 Dec 2023 18:28:04 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:38aa:1c88:df05:9b73])
        by smtp.gmail.com with ESMTPSA id k7-20020a0dc807000000b0059a34cfa2a5sm3422328ywd.67.2023.12.11.18.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:28:03 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Yury Norov <yury.norov@gmail.com>,
	linux-mips@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v3 06/35] mips: sgi-ip30: optimize heart_alloc_int() by using find_and_set_bit()
Date: Mon, 11 Dec 2023 18:27:20 -0800
Message-Id: <20231212022749.625238-7-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212022749.625238-1-yury.norov@gmail.com>
References: <20231212022749.625238-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

heart_alloc_int() opencodes find_and_set_bit(). Simplify it by using the
dedicated function, and make an nice one-liner.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/mips/sgi-ip30/ip30-irq.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/mips/sgi-ip30/ip30-irq.c b/arch/mips/sgi-ip30/ip30-irq.c
index 423c32cb66ed..3c4d4e947817 100644
--- a/arch/mips/sgi-ip30/ip30-irq.c
+++ b/arch/mips/sgi-ip30/ip30-irq.c
@@ -28,17 +28,9 @@ static DEFINE_PER_CPU(unsigned long, irq_enable_mask);
 
 static inline int heart_alloc_int(void)
 {
-	int bit;
+	int bit = find_and_set_bit(heart_irq_map, HEART_NUM_IRQS);
 
-again:
-	bit = find_first_zero_bit(heart_irq_map, HEART_NUM_IRQS);
-	if (bit >= HEART_NUM_IRQS)
-		return -ENOSPC;
-
-	if (test_and_set_bit(bit, heart_irq_map))
-		goto again;
-
-	return bit;
+	return bit < HEART_NUM_IRQS ? bit : -ENOSPC;
 }
 
 static void ip30_error_irq(struct irq_desc *desc)
-- 
2.40.1


