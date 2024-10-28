Return-Path: <linux-mips+bounces-6513-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A79B387A
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04BB81C22545
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398C01DFD9E;
	Mon, 28 Oct 2024 17:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRtgT8iq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84921DF98E;
	Mon, 28 Oct 2024 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138387; cv=none; b=Q6VtZu8n/PRX+lHbnDZLfeq/vSro9CWkexrD7D4MbZKmRGqpDQ2SXye2soWgnzV0iYK3pMvqykCwHF8f/b4JRoEO2C8aHGdDbpeG7fyRxP77vCb93HFW+9KFhn4PtRjolI0PIZY4e73rnm8PQyOie1Vs+OKDmugXhbJfaVSSGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138387; c=relaxed/simple;
	bh=u6vvKO6ochcmouGVbVlP93MlD8ggXFRsMmANCvVfLCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q99O6C9bonWTLs4VILaUdIhvqeuxe3igt1U0P8ZUA6edA/cGHLEwF6SPtHQN35w+LnJGwZWVL5y+izfwINCPnmkxICI+zMJKSgaQyoe6c7mEzovpPZ6ztpv0Z2s3PmFm7ZJpUKp/1hQHgcGKZUeOwrIS1hivYUOWJbERkXrLlaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRtgT8iq; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a99ebb390a5so1039887066b.1;
        Mon, 28 Oct 2024 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138383; x=1730743183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRX466fP4uw99H0/bcfPFf3v++c0P8v6HBEx3du66O8=;
        b=PRtgT8iqh9XWULEojznF7jDKWeDUylGLNus55NxD2tzTDCqtrNTvL83v4NPiNUBkL8
         V0Q989QFPd2YF47GdH/w7aqHnZ8/Z0aehu1iOMOK12rAs8aKBdW857HiWU9+gld5GSjW
         QoczYjvZwcrtumpB3mULiEv885YcxqFTpJjHgdyvUqf3ngsJdC1qdlp+c6YEVEmh/fXc
         dsHpunjNVXRIWg9gCbjIYau01+HkI6OG6oe1nqbcz2Okccs1x/3xapSao98qJPZql5tb
         IajFuyIDsiBm/xt/zIzUi/DVueN7eAJ85JzPNECkW4S8VK9UvtCekV+DWmVUhw1DYXf4
         WRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138383; x=1730743183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRX466fP4uw99H0/bcfPFf3v++c0P8v6HBEx3du66O8=;
        b=vjn+jMBgAgpkqEWAcERMXBPyWxatrxbaFv7hqinWQwHVhKwuYSD1YF5laQhmonhwuL
         JRhUbfanNSvBs2pG4IOzss8HPJgdMPH1ureEQU0PBmQ6TeUmpJZItc7+TGGBKziwVsTZ
         JJIQK8OEantSDLRsyvtSSllRuomTmkDsNCGr+RQqdIp6MiHtBe1q8zAklVTy8Riry7CZ
         GXUgP58Tu6fBDZD3TGsCtYB29+sTL55+bteoHWbH6ovDGFCWdM0zdJIgHmld5zwXo0Ww
         cPboG+ig2E7MmU0kPhBunKopuctV6+J5agJPEXKK/OIEZhQbwwXFbt7+IPzjlfAf3Kh+
         fkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlK0JqfgLtAOGppqpA6nP19qIzyo8A2kMgXrcS/giEoQ/qPrxvbvI30INFlUjvA/hX7teYBeflgo+5HbSx@vger.kernel.org, AJvYcCWf0Uv9VToDsbiNA1msWYCV2l2QTvqKIxfyjx5UJqpNMUdr144KtU/T8cLLxr/orQSjwAeNAb3fvCCmPg==@vger.kernel.org, AJvYcCXAAq8K6MDzwspZ/ARR5vPa6c4uTxN2Zems4/gBFQaQ2jhciP56A3Zr4mUBC3XSPLaF/5gPIcE9SXs6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3VQF5fbIY/Za0SkP70KesrN2hUlYe0oXpBYnj63IMt7sPGTX
	3tR+WxAokDYffHKQaHq9ITxLDGmDvYHbzanwYINwt2Ut75EM2AcL
X-Google-Smtp-Source: AGHT+IEOK7cSDa5E6xpn6lKVUU6dFZoleezY5QuGa3zJzk33nx+xsdhMG009sH1i/o6gzfQwQ3WZOA==
X-Received: by 2002:a17:907:3d91:b0:a91:1699:f8eb with SMTP id a640c23a62f3a-a9e22ae20f7mr39162966b.28.1730138383015;
        Mon, 28 Oct 2024 10:59:43 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:42 -0700 (PDT)
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
Subject: [PATCH v8 02/13] irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()
Date: Mon, 28 Oct 2024 18:59:24 +0100
Message-Id: <20241028175935.51250-3-arikalo@gmail.com>
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

From: Paul Burton <paulburton@kernel.org>

Use CM's GCR_CL_REDIRECT register to access registers in remote clusters,
so users of gic_with_each_online_cpu() gain support for multi-cluster with
no further changes.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
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


