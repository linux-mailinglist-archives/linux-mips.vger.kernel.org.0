Return-Path: <linux-mips+bounces-476-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E098026DA
	for <lists+linux-mips@lfdr.de>; Sun,  3 Dec 2023 20:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF512280E25
	for <lists+linux-mips@lfdr.de>; Sun,  3 Dec 2023 19:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F7E1C6A5;
	Sun,  3 Dec 2023 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayk46Pql"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B10BB;
	Sun,  3 Dec 2023 11:33:19 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5d2d0661a8dso42510507b3.2;
        Sun, 03 Dec 2023 11:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701631998; x=1702236798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPrGoOeFU8KozQhYwT/36u1Qawb7qXzv6qzW2zIGltc=;
        b=ayk46PqlvudSLtBPT6YZusas6Uba82E3XyJd5F4m9ygfuOu3wHvZHXfS9UmQRvBXwy
         /BId5YfHrqaxpCCoYs5Ql6XKJMta5iDIAUccfcWZCse6EsxSTrSa5kKC+PpZr7NpB6Os
         LauuzvghQvhU3wTtbA4iDV9mCO8j+weJIB/Pogr4cE8mPY/BGvEyCd52PGIfUjqxV32S
         pwHZKddjqEfJLKjXwmgsDrglWiKhVAAR26Cxx4b1wXeTKNqVqbpr7nu7xTrvTdBtmlTm
         +vd7p05Ihe+LMb9E4QBG4d2okFOcJkv2u9LH+3bnA/icM7iTW6AFUXmxP52+woEqF8iz
         I/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701631998; x=1702236798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPrGoOeFU8KozQhYwT/36u1Qawb7qXzv6qzW2zIGltc=;
        b=a2EsffIPzdo7DYwd/L9L1tnnJ1B+tydAWVaQxVoglPKuQ1t9AO/nFZCwBxxjD15fso
         y2jCIBmpOTF0kc82svQGmX+bkVzq2nJrFj2Vr/j+rWyDYXHNUiqsn7h2tgBoSUiFeeCU
         HPWoK6rEcJS8e6uF4hqeoA8YX/NAPQy8DNvbbMeWk6wkJQVkJYbhQxNIPA/Fkl9BvRtX
         llxwrQhMyNS+8hwOUOmsK3A/GJrLGSlasP88gRHvSJotFKDCsR1glPDSWDMAOznP/CPk
         /Vjw3ySPDrMS2E0umMUFgpAEYrrX9GMDCFrZZpg4BJQL5u9NVIFP81eibYTHSFEkiBPY
         5ioQ==
X-Gm-Message-State: AOJu0YxhcW2ZF2mM3Z0wGokbAOVd3DnAEwGzRbs6a7dgaMNgfRIUyWvE
	vHlGSg68JstFhq0M6bEb9VA9Hv5xbe4MUg==
X-Google-Smtp-Source: AGHT+IFAp5m6uk4XQpTyLhPM7yoGZRWkgPn3E6eH/S2BHFx8qJnuW7oijoxKpTxlyZtVjohBf3IUnA==
X-Received: by 2002:a05:690c:3581:b0:5d8:a45e:3755 with SMTP id fr1-20020a05690c358100b005d8a45e3755mr205998ywb.11.1701631998236;
        Sun, 03 Dec 2023 11:33:18 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:cb98:c3e:57c:8191])
        by smtp.gmail.com with ESMTPSA id z14-20020a814c0e000000b005d14e254367sm2752210ywa.80.2023.12.03.11.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 11:33:17 -0800 (PST)
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
Subject: [PATCH v2 06/35] mips: sgi-ip30: rework heart_alloc_int()
Date: Sun,  3 Dec 2023 11:32:38 -0800
Message-Id: <20231203193307.542794-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203193307.542794-1-yury.norov@gmail.com>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231203193307.542794-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

heart_alloc_int() opencodes find_and_set_bit(). Switch it to using the
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


