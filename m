Return-Path: <linux-mips+bounces-3798-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C71910FCF
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 20:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF5231C242DD
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37D41BD035;
	Thu, 20 Jun 2024 17:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDMLBjzZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422E1BD029;
	Thu, 20 Jun 2024 17:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906247; cv=none; b=LdQuBoRguNNGtaP69X3d3kYE3N++luyvDuwXHe2L07eoPl3U1joo4JHRM2s/467imaJsLhzv/h7IgC8E0s/S76vAmgEN3uf1Wji59L7f8bRoIj+R6s5y6Danup/67lJbvEFTckSCOADNXIesIPjWuPArtho+ttcOP3u2YLFut2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906247; c=relaxed/simple;
	bh=I8E4t6KyeRkVK0XRtHQ/iGfj4wklBzc3eMAZGHg/dHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qU5SudiyuSHDY62JDf9fnO4CJiexRHzTaSW0CRIDh++x2Amf3NKzkvCErdd2EO0fBR9Rtxc+2dCO1Ip2TTnJD237TTbydzdm/kPP3V+CTrxBtn22RJ4fxtHlI6x9lFmqRNS0IsaUKROpHQ1xTrgVgchzkZRyLHd2SINSCBGrtS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDMLBjzZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-704313fa830so1019065b3a.3;
        Thu, 20 Jun 2024 10:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906246; x=1719511046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYUrMJ63QpynCjnizoXrh5ONbtIqYlUBJ6H7w/nSvAY=;
        b=XDMLBjzZ8Sge7JK00GtL7l057jBIPzHXubhP5UyU4AjxxahLd0yyrtPpfFk6hKnDVF
         EsYEXfxwWcJ95vUUqWXYp/41KbVRxiX29+pm6Kbi1yAL4Mi4qX+sUawk1hCbmBlbmKA0
         RFMqaumM4meyRNSM/LS+l8C2QOiI0D8Ppa8r/zDwrFNJdOiRiIFmwUuHCQrqiemR6Nbt
         Cq3CPQzJP2lOU3bNNvDZtm0XlCDdXS22gdMYy4wf/rsvFRg9ZOnNUIWA79r3A8Fs0NVH
         NQawEchgnkO0lhqRkSQpoB6Qrr9b707Qo9BoChIk+1iQsGiMBqgnG4pSSL2oOd2l2s0T
         LHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906246; x=1719511046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYUrMJ63QpynCjnizoXrh5ONbtIqYlUBJ6H7w/nSvAY=;
        b=frhqFCBSGpBAkF56K/xnPtHYQPWZjhsAsK0IlIa6YSP848KFWJnxEIReyQ1IR+4cu9
         st6nw4E0CioiI+Nj5MkbqhhByyWsg93ssv7HtdFQMPGkDl0NyrZA257FVa4VO13lBRRr
         gMl83pHsW3fdaxNAklM1qg68yMKR/KD9wtzqFJfxH9uGOgC5vPVcCEYx5rB0X5PA79nS
         NY8fhE5c1YPoQ56Y9vWtJNtEDCPcBdN3ti0czIQF8QMUYnYOk6nTfl7j2lLFPKbdjrMz
         UC8Mx+PZpANnGw2nU7kLcwCutJFoHlcQyR6bGJFJcnhJpdar2AWMKbDFynhBj0pTptV8
         qfEg==
X-Forwarded-Encrypted: i=1; AJvYcCWEiSOg+d266YxE1tTX4jpdRJYAU4HOnygdSPSQROwJ4vLXZ538G3vaoCTaT4p9xYyy2QR3W9U7IMnhWOE5eGfOowieY0ovKSWV6w==
X-Gm-Message-State: AOJu0YwwFnfPgaNy7SwRLIP4cD5uwP6S0YmHn20ApzPbDqSn/FXJfyU+
	0nGnfMrwMsrpFcdJy7RT4MJ6Qan7yPrnLvv9GsAQTOId9n0OG5EN2chbsfFHiwg=
X-Google-Smtp-Source: AGHT+IG0aUolJNs5TqVDOYzchwzf39ZB9KCQwKk1Wxr/VlXlAuIN0072V2NcOb8Lz9Wo4da6XcV69A==
X-Received: by 2002:aa7:8b0f:0:b0:705:d9e3:6179 with SMTP id d2e1a72fcca58-7062bf98e16mr5100552b3a.26.1718906245736;
        Thu, 20 Jun 2024 10:57:25 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc967356sm12643957b3a.63.2024.06.20.10.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:25 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v4 06/40] mips: sgi-ip30: optimize heart_alloc_int() by using find_and_set_bit()
Date: Thu, 20 Jun 2024 10:56:29 -0700
Message-ID: <20240620175703.605111-7-yury.norov@gmail.com>
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

heart_alloc_int() opencodes find_and_set_bit(). Simplify it by using the
dedicated function, and make a nice one-liner.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/mips/sgi-ip30/ip30-irq.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/mips/sgi-ip30/ip30-irq.c b/arch/mips/sgi-ip30/ip30-irq.c
index 423c32cb66ed..a70e7af93643 100644
--- a/arch/mips/sgi-ip30/ip30-irq.c
+++ b/arch/mips/sgi-ip30/ip30-irq.c
@@ -2,6 +2,7 @@
 /*
  * ip30-irq.c: Highlevel interrupt handling for IP30 architecture.
  */
+#include <linux/find_atomic.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -28,17 +29,9 @@ static DEFINE_PER_CPU(unsigned long, irq_enable_mask);
 
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
2.43.0


