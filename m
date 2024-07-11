Return-Path: <linux-mips+bounces-4273-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5852592E229
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 10:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B670284D8F
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 08:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C5315575B;
	Thu, 11 Jul 2024 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anA296jV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3F2153581;
	Thu, 11 Jul 2024 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686427; cv=none; b=BXpqJBCtB8tKLKQeOTjOE/bUcZUKI5PsgrL/Cvw7JO30MP8bQv3THh5VTVudhKITZB4/P6Q6LAq5o+2Bjpj/9deLEYbDmTyOhgk67OUlldb2Hbq7wbKgPIUVeX9Ev78L2sm69hhQ2sQlDm2HJwEM9Jk+M4SQbi03goHPEg+6XhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686427; c=relaxed/simple;
	bh=YqXfpzlrn+tQ5pRH/5JSmt1daHU/VeJILheS7aM7wuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RETTNeTSXCZPShDLhq4u0Z5iIA4mo/wgpqPShNRNqwJkRwHmK4x6/sulGMS/0jjsjFNG5KTa2NfccqPTQjfpjfy4603+tcElzc5w8CUqo0mNvEdB2ovdW80iJwuAJwiybBLAnxQhMHq9b9FafJWudg15fb/COo6qkEaOxrkZoJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anA296jV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-367e50f71bbso454690f8f.2;
        Thu, 11 Jul 2024 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686424; x=1721291224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoGjIyylq/2U1UdDbKKzqWV3owFDbnfS+xDpWv/w24A=;
        b=anA296jVbphQTINDJ5o6T0LKaF20n8I8FxWIWxdzcfaSTEqBd4aKU4XYAZhBYkZbjE
         d2Hqv5EPHcinPFu83CUSK8ea62Z1juRwS7vYQoqYFRRTJrzgRT6/MdMS2uYoj48FqRwI
         R0Ys3Ldlcxf1iFMAqf4/ITA4Z5VnRDl3GyQ9XP7+43NT3JfadQqRMN6JCk1uyb7uwWIy
         0HE4jGLt4e+zoibzDwsPGFwcP/UwDMw5J7HAlNGJGyRbFgTHkVio2FwBp4Yd8zmxYxGf
         Esig8Wt/9pvNnaTuZI5w9YXQFyJ63hJkNC2HXGPa3+iA++VlzeIJE1CZhSnO1AfEcPzH
         etdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686424; x=1721291224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoGjIyylq/2U1UdDbKKzqWV3owFDbnfS+xDpWv/w24A=;
        b=BlhHrCZXgjcUK+9/phZvFq5kdjWvXnlqjrsZQspoD/tU5C1jFQ2ti10vvgBG6qSeFm
         aBJoWI6c0vNkuoe9E5ILaZbdlXmnFHJEMFjKRJ8lPkN1ZMR5KtxqQ3auX7NfegqqVB+D
         sjP8WWUB1Iii6gb/QMhBV416I7h+Vh5jU2slBeGoKn7zP2ktAF2kDQ0k/J121wJynOfj
         87Jozm7GoPaIUeyAPEy7sUv7FIMejTJeUsa5XJySXe7jXKO8hJ1Ot2y4+SU01Gdcrl6Y
         /0OvlLrzpasLJe/02PMSId9a2mGF8fJoXvxQe73NunyDXv5UtoRl3xyhKJ7hLcgXoTfD
         GAwA==
X-Forwarded-Encrypted: i=1; AJvYcCWz5oQoKjrhzjXNGxaJPqgdNuapZFTvC+aGdrixTpWMEm3WunL8ow6l3+5BGf0GQ4MjbjxQLfslWXAiwsn6gKGNAShjh6x2VO/AzPMM22jfKBpCmL1r6CNJT6srJKwx4k+TEpAwnUM9Ow==
X-Gm-Message-State: AOJu0YzzrcOa7bb3mCwMncqiWu3P+KSDwo33ZFzVDoRRTirFxgsQOtwv
	U9WWVtLoUmgSlGAs6tFFtw/mS6zn/UJbKjiG0xi3pCFX0zdfbc/w
X-Google-Smtp-Source: AGHT+IEm9yPJ1zLNIjg4u8xmCjz1g5S1kD7ahImT+qOHrp/AXsNNUzk/WyBwfj6wEUjb5sqFrfNgpg==
X-Received: by 2002:a5d:470a:0:b0:35f:d57:6e3f with SMTP id ffacd0b85a97d-367cea96613mr4931059f8f.31.1720686424057;
        Thu, 11 Jul 2024 01:27:04 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84712sm7134283f8f.33.2024.07.11.01.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:27:03 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
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
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v5 02/11] MIPS: GIC: Generate redirect block accessors
Date: Thu, 11 Jul 2024 10:26:47 +0200
Message-Id: <20240711082656.1889440-3-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711082656.1889440-1-arikalo@gmail.com>
References: <20240711082656.1889440-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

With CM 3.5 the "core-other" register block evolves into the "redirect"
register block, which is capable of accessing not only the core local
registers of other cores but also the shared/global registers of other
clusters.

This patch generates accessor functions for shared/global registers
accessed via the redirect block, with "redir_" inserted after "gic_" in
their names. For example the accessor function:

  read_gic_config()

...accesses the GIC_CONFIG register of the GIC in the local cluster.
With this patch a new function:

  read_gic_redir_config()

...is added which accesses the GIC_CONFIG register of the GIC in
whichever cluster the GCR_CL_REDIRECT register is configured to access.

This mirrors the similar redirect block accessors already provided for
the CM & CPC.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/include/asm/mips-gic.h | 50 ++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/arch/mips/include/asm/mips-gic.h b/arch/mips/include/asm/mips-gic.h
index 084cac1c5ea2..fd9da5e3beaa 100644
--- a/arch/mips/include/asm/mips-gic.h
+++ b/arch/mips/include/asm/mips-gic.h
@@ -28,11 +28,13 @@ extern void __iomem *mips_gic_base;
 
 /* For read-only shared registers */
 #define GIC_ACCESSOR_RO(sz, off, name)					\
-	CPS_ACCESSOR_RO(gic, sz, MIPS_GIC_SHARED_OFS + off, name)
+	CPS_ACCESSOR_RO(gic, sz, MIPS_GIC_SHARED_OFS + off, name)	\
+	CPS_ACCESSOR_RO(gic, sz, MIPS_GIC_REDIR_OFS + off, redir_##name)
 
 /* For read-write shared registers */
 #define GIC_ACCESSOR_RW(sz, off, name)					\
-	CPS_ACCESSOR_RW(gic, sz, MIPS_GIC_SHARED_OFS + off, name)
+	CPS_ACCESSOR_RW(gic, sz, MIPS_GIC_SHARED_OFS + off, name)	\
+	CPS_ACCESSOR_RW(gic, sz, MIPS_GIC_REDIR_OFS + off, redir_##name)
 
 /* For read-only local registers */
 #define GIC_VX_ACCESSOR_RO(sz, off, name)				\
@@ -45,7 +47,7 @@ extern void __iomem *mips_gic_base;
 	CPS_ACCESSOR_RW(gic, sz, MIPS_GIC_REDIR_OFS + off, vo_##name)
 
 /* For read-only shared per-interrupt registers */
-#define GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)			\
+#define _GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)		\
 static inline void __iomem *addr_gic_##name(unsigned int intr)		\
 {									\
 	return mips_gic_base + (off) + (intr * (stride));		\
@@ -58,8 +60,8 @@ static inline unsigned int read_gic_##name(unsigned int intr)		\
 }
 
 /* For read-write shared per-interrupt registers */
-#define GIC_ACCESSOR_RW_INTR_REG(sz, off, stride, name)			\
-	GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)			\
+#define _GIC_ACCESSOR_RW_INTR_REG(sz, off, stride, name)		\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)		\
 									\
 static inline void write_gic_##name(unsigned int intr,			\
 				    unsigned int val)			\
@@ -68,22 +70,30 @@ static inline void write_gic_##name(unsigned int intr,			\
 	__raw_writel(val, addr_gic_##name(intr));			\
 }
 
+#define GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)			\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)		\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off, stride, redir_##name)
+
+#define GIC_ACCESSOR_RW_INTR_REG(sz, off, stride, name)			\
+	_GIC_ACCESSOR_RW_INTR_REG(sz, off, stride, name)		\
+	_GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off, stride, redir_##name)
+
 /* For read-only local per-interrupt registers */
 #define GIC_VX_ACCESSOR_RO_INTR_REG(sz, off, stride, name)		\
-	GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_LOCAL_OFS + off,		\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_LOCAL_OFS + off,		\
 				 stride, vl_##name)			\
-	GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off,		\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off,		\
 				 stride, vo_##name)
 
 /* For read-write local per-interrupt registers */
 #define GIC_VX_ACCESSOR_RW_INTR_REG(sz, off, stride, name)		\
-	GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_LOCAL_OFS + off,		\
+	_GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_LOCAL_OFS + off,		\
 				 stride, vl_##name)			\
-	GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off,		\
+	_GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off,		\
 				 stride, vo_##name)
 
 /* For read-only shared bit-per-interrupt registers */
-#define GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
+#define _GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
 static inline void __iomem *addr_gic_##name(void)			\
 {									\
 	return mips_gic_base + (off);					\
@@ -106,8 +116,8 @@ static inline unsigned int read_gic_##name(unsigned int intr)		\
 }
 
 /* For read-write shared bit-per-interrupt registers */
-#define GIC_ACCESSOR_RW_INTR_BIT(off, name)				\
-	GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
+#define _GIC_ACCESSOR_RW_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
 									\
 static inline void write_gic_##name(unsigned int intr)			\
 {									\
@@ -146,6 +156,14 @@ static inline void change_gic_##name(unsigned int intr,			\
 	}								\
 }
 
+#define GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RO_INTR_BIT(MIPS_GIC_REDIR_OFS + off, redir_##name)
+
+#define GIC_ACCESSOR_RW_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RW_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RW_INTR_BIT(MIPS_GIC_REDIR_OFS + off, redir_##name)
+
 /* For read-only local bit-per-interrupt registers */
 #define GIC_VX_ACCESSOR_RO_INTR_BIT(sz, off, name)			\
 	GIC_ACCESSOR_RO_INTR_BIT(sz, MIPS_GIC_LOCAL_OFS + off,		\
@@ -155,10 +173,10 @@ static inline void change_gic_##name(unsigned int intr,			\
 
 /* For read-write local bit-per-interrupt registers */
 #define GIC_VX_ACCESSOR_RW_INTR_BIT(sz, off, name)			\
-	GIC_ACCESSOR_RW_INTR_BIT(sz, MIPS_GIC_LOCAL_OFS + off,		\
-				 vl_##name)				\
-	GIC_ACCESSOR_RW_INTR_BIT(sz, MIPS_GIC_REDIR_OFS + off,		\
-				 vo_##name)
+	_GIC_ACCESSOR_RW_INTR_BIT(sz, MIPS_GIC_LOCAL_OFS + off,		\
+				  vl_##name)				\
+	_GIC_ACCESSOR_RW_INTR_BIT(sz, MIPS_GIC_REDIR_OFS + off,		\
+				  vo_##name)
 
 /* GIC_SH_CONFIG - Information about the GIC configuration */
 GIC_ACCESSOR_RW(32, 0x000, config)
-- 
2.25.1


