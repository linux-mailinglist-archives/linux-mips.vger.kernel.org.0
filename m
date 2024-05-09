Return-Path: <linux-mips+bounces-3195-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A821E8C17E4
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 22:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 492A61F2224E
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 20:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C68785C6F;
	Thu,  9 May 2024 20:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUNKQap1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F085264;
	Thu,  9 May 2024 20:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287690; cv=none; b=p9aFaPiiA7mhdcxa3TSPR1oflFa8TmqwbUhy1AiUNc8n+JQ4IMNQOZ7OY0WdWgR7yD/I51lpnAEmGuBkr5Lehf2gc7L+EQ/mKMylRfd0kZ9/luUSDcVLafCjfpTw8IU8chYoNx7DNvzNXW52kjK5N1sv/FUnCgxvrpSzfxJairE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287690; c=relaxed/simple;
	bh=yxOj5YfSwj2DTCNzCutbgmJ5WuKiiT3kbxTl71R4Wu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbzrkwahbbCQa5RFCY3DbLyL1hEdH61vVRiAJB/JwPLVkCZL7E8/Wfbw40JYpfEoZAfPWnQTYTbbt8J7oQFkeSAZTX4Q6cbIsRzqshhdIj3bxIUhhvDKxfnzbIPXNOPfIZhkevwjZJDKhJRqmQSa1WXXWXKqVqU908pZ5/ZuFTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUNKQap1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3504f34a086so124023f8f.1;
        Thu, 09 May 2024 13:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715287687; x=1715892487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrwA2vIrlWfZjdips+U6g09WGPgGGcS7uLLAmHynIVM=;
        b=iUNKQap1Aa10dPNN79LVaKNnBoCMrqCSaSYgREGfufDqrRxbZUrn9SjGGpDd+OJmuy
         LrO+Pviiw+XBFXuvH7L02gt4OnNyUwfVbNrGzkfYJddp1HvutmqjpegdK+Eau0/CNE1W
         CrRPsy5WS3zEdLbsXd4eNaT1pU+I9mWG3yEdrMjmcgoHbypaktDNfq7kjmOzKuRWyNPa
         1JGXABMjzMEdPeSpsliCV2DuZlAeBwL8hILY+dfhRb5x84vZVfDTK7nkhVtTjCn8ExgD
         +n9gJhCbOQIMXxKno6mamXsubRHJtoyHTRKra14UEPq9upQiEmAzHj29VS/GH2GuxbmQ
         IElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287687; x=1715892487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrwA2vIrlWfZjdips+U6g09WGPgGGcS7uLLAmHynIVM=;
        b=aWvrUmGHUhNLHMMPNOrE9bNq5B3tYUf8tyvYzUXnSdZYOMhec0/b/iviD6nY68QVWV
         6Mk/jNO7BRtyih3Sv0ECEu9GTF9Qb4DPCimIZXQk9T0AeLiwfanY/tzD348dI9aPQaMX
         qMLxqK8KHemwjXmTToRMd9CZevdOopFrOobCC3mPk5KqzZEuBnIvbzqoWpZLTLMd30q4
         gts0+xAFJo5CwRDDo+2gop98t/O7yeNQAa6Y+Nor112vyp0GXt7vzdmuYJcJ37LQp2tu
         vAqAhRZJPqxOf2IeY0Wp5Rpdj2drBqJTdn7AZ4QQS2/jvx0uhETK3o0mHFhPwmVcQakt
         dM1A==
X-Forwarded-Encrypted: i=1; AJvYcCXdbe+QQcS9s+dyJE4gclTuIViVoVA9Man3VK49ZnsvtjsBT+C2H5BVGuK9C9zDk1Vlw9zhTZ3YaUuHTBzGc4lipJnwfUX9FUSwFGgJIvHXPwRIPd7BtMIM0f02hG/ZhPtfLJMPUC/47magDJTzdg7DUXw7Vl4ywsN6afLPyEBqY2YyYpg=
X-Gm-Message-State: AOJu0Yzd0FK0WkL7qCvNWRtqrkdJ7IRzxcCwKQmW8hocqV9NRt549qmL
	RU62s2ZSBEfijuGKdxt38YXicNaLpdl72Z/DfjHY0FHcg4DANkwX
X-Google-Smtp-Source: AGHT+IEqtNhXsWIapaiDKzX2IStHjSrOkOX+lqNW4IjUlE6Fw44bR12Dv2O0hQP7GdekuJ9XPwPVyA==
X-Received: by 2002:adf:eb12:0:b0:347:9bec:9ba3 with SMTP id ffacd0b85a97d-3504aa64997mr464045f8f.66.1715287687547;
        Thu, 09 May 2024 13:48:07 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502bbbbf08sm2588185f8f.96.2024.05.09.13.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 13:48:07 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Daniel=20Gonz=C3=A1lez=20Cabanelas?= <dgcbueu@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v4 4/4] mips: bmips: enable RAC on BMIPS4350
Date: Thu,  9 May 2024 22:47:48 +0200
Message-ID: <20240509204750.1538-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509204750.1538-1-ansuelsmth@gmail.com>
References: <20240509204750.1538-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Daniel González Cabanelas <dgcbueu@gmail.com>

The data RAC is left disabled by the bootloader in some SoCs, at least in
the core it boots from.
Enabling this feature increases the performance up to +30% depending on the
task.

Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
[ rework code and reduce code duplication ]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/kernel/smp-bmips.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 20e2fb10022d..52324738cbb3 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -626,6 +626,23 @@ void bmips_cpu_setup(void)
 		__raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
 		break;
 
+	case CPU_BMIPS4350:
+		u32 rac_addr = BMIPS_RAC_CONFIG_1;
+
+		if (!(read_c0_brcm_cmt_local() & (1 << 31)))
+			rac_addr = BMIPS_RAC_CONFIG;
+
+		/* Enable data RAC */
+		cfg = __raw_readl(cbr + rac_addr);
+		__raw_writel(cfg | 0xf, cbr + rac_addr);
+		__raw_readl(cbr + rac_addr);
+
+		/* Flush stale data out of the readahead cache */
+		cfg = __raw_readl(cbr + BMIPS_RAC_CONFIG);
+		__raw_writel(cfg | 0x100, cbr + BMIPS_RAC_CONFIG);
+		__raw_readl(cbr + BMIPS_RAC_CONFIG);
+		break;
+
 	case CPU_BMIPS4380:
 		/* CBG workaround for early BMIPS4380 CPUs */
 		switch (read_c0_prid()) {
-- 
2.43.0


