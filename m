Return-Path: <linux-mips+bounces-2783-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10E8A7CF0
	for <lists+linux-mips@lfdr.de>; Wed, 17 Apr 2024 09:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC1BAB20F31
	for <lists+linux-mips@lfdr.de>; Wed, 17 Apr 2024 07:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D31C524CA;
	Wed, 17 Apr 2024 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNENXekw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A1040850
	for <linux-mips@vger.kernel.org>; Wed, 17 Apr 2024 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713338316; cv=none; b=SnxJ2Ia9pL+m0sf7ZeQrj+2ONwnY9tPWs8eCkSKnkdHYbRBl+APlAl4zaMwef/nqDn27nmXaN6gI4GDd85DyAugc1e45fGdd9zHA1+y0vcmhdZwQ2dHxuPvJs+/Vj7hlRXQwebwHiExB4lDaa1Y1Jr7de+wxJ36pn2pmEDfTQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713338316; c=relaxed/simple;
	bh=TB/D7fxuc2FU5nX9qCx8WdK9WcTt68q6+ZnoUCYowms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PZ9+2MhYMcud3uTjNg7aGTzCkXkJaH79YtlQaGvDXrfws+yvbxlC1pzCVcaoZMVIn4hMB+YeUYkjmVYAkdXQIQe3FfGmBnPyUiqER2Dekr1SbCoaXmKJ71Pdp9Cg8Z9UsIkKx6sB1ERFrNRJrU0F2IKZ3gGZNb7Et18He5qqOo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNENXekw; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e6acb39d4so6962567a12.1
        for <linux-mips@vger.kernel.org>; Wed, 17 Apr 2024 00:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713338313; x=1713943113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXRXAl2kT0MfE33bwRwOz2wnLwcGRTRbDdp7T707wv4=;
        b=DNENXekwnLT5TKE2Mq213H454PZXL0eFlYpJxgPRlFcMInxZW5USDcea/hgvEwpAPY
         2pMZyTxcm+mIxnunPOAZwBD4d+AgXxPe88+xonTwE1V4Qza7zn7BEvQO31tYM/nV9AUH
         VxSRLxm3fhiUXm9uI9YgewzYZfnkj8Vro/PQTKVFoGe5NkhC5KILMcM/M7PhxdXNciYE
         Qw6K9EHFtlMn10T53RUphpx4+kc998aEWWbkPg9M/XEG3IDdGLJjgd7SsnUhICVHIU76
         PzYN/80+S4D8PCnKxmW5gwZZFSAsH6PW2WYsdxaxSGUNuB7QFcOTlYIjzy9CSw22d4Dz
         ugyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713338313; x=1713943113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXRXAl2kT0MfE33bwRwOz2wnLwcGRTRbDdp7T707wv4=;
        b=ZlJB0WQtqzO0lK8LRO+R+3ITyX6ZcGAeCYQKn6BFulMOBAwnPIKwS0Q9mTvsgbgv1F
         f7N0Hlhw35CbF7ugsct3oA4kRhDtyHoKdB/XxEEMvU8gNNPkQmoUGAxLcHdj+2g7DHV0
         IPBkQxfzzTgWkI/Y2/sR0z0DZCpYzXAtQoz2Bj/MK6JjUgIORZHitXUgkqaC+24Sf+KD
         bE4n7gruZ8mT+yu1sKiwQlHuMdv6bEFZpcPiNfdv2nsk9gr3QgyB99JM9YBnL8qFVBy8
         DrB5/1Vl29w5Y6iyPuk7LeLcYSi9so32CRMbp0XlsNQDJZhpoAuh3u34eJpAJjrl/5a0
         93EA==
X-Forwarded-Encrypted: i=1; AJvYcCXgrNd5ZgA/Ulmk3bE0BtnB4XuzWvQjFwQveLy6/sI3KT0/CunpbkBwWYxYHoUvI9r0cCFH7UJjuCN5MFW9Sp6PuS/nGYI5I0pQZg==
X-Gm-Message-State: AOJu0YzNFFMz98lWBSNWQnbzg6Lx6jUtHpzu6Uk4V7zDRqiB3EHzO238
	KhKeF6JUmddV5/fEqtK/oU6h3xq9VAJBfZfVCIwQX4oJmbefV1MGGxdf+gparmY=
X-Google-Smtp-Source: AGHT+IFb5WMv4oCbmxuwzYidrVHp+49PZjeH5slEBNxA63Q77qrpQ02X+jgTmzDsvqvQBGPhDs6AFw==
X-Received: by 2002:a17:906:4ad8:b0:a55:57cd:1ccb with SMTP id u24-20020a1709064ad800b00a5557cd1ccbmr569843ejt.19.1713338312611;
        Wed, 17 Apr 2024 00:18:32 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.201.23])
        by smtp.gmail.com with ESMTPSA id gc22-20020a170906c8d600b00a534000d525sm3011114ejb.158.2024.04.17.00.18.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Apr 2024 00:18:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH] MIPS: SGI-IP30: Use bitmap API when iterating over bitmap
Date: Wed, 17 Apr 2024 09:18:29 +0200
Message-ID: <20240417071830.47703-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do not open-code bitmap_set(). Besides, <linux/bitmap.h> API
allows architecture specific optimizations, so prefer it.

Use the HEART_NUM_IRQS definition to express the end of the
HEART bitmap.

Inspired-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 arch/mips/sgi-ip30/ip30-irq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/sgi-ip30/ip30-irq.c b/arch/mips/sgi-ip30/ip30-irq.c
index 423c32cb66ed..bdafff076191 100644
--- a/arch/mips/sgi-ip30/ip30-irq.c
+++ b/arch/mips/sgi-ip30/ip30-irq.c
@@ -264,7 +264,6 @@ void __init arch_init_irq(void)
 	struct irq_domain *domain;
 	struct fwnode_handle *fn;
 	unsigned long *mask;
-	int i;
 
 	mips_cpu_irq_init();
 
@@ -300,8 +299,7 @@ void __init arch_init_irq(void)
 	set_bit(HEART_L3_INT_TIMER, heart_irq_map);
 
 	/* Reserve the error interrupts (#51 to #63). */
-	for (i = HEART_L4_INT_XWID_ERR_9; i <= HEART_L4_INT_HEART_EXCP; i++)
-		set_bit(i, heart_irq_map);
+	bitmap_set(heart_irq_map, HEART_L4_INT_XWID_ERR_9, HEART_NUM_IRQS);
 
 	fn = irq_domain_alloc_named_fwnode("HEART");
 	WARN_ON(fn == NULL);
-- 
2.41.0


