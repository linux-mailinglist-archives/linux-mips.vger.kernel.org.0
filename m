Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1ED3A205
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 22:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbfFHUsp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 16:48:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44623 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfFHUso (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Jun 2019 16:48:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id b17so5394913wrq.11
        for <linux-mips@vger.kernel.org>; Sat, 08 Jun 2019 13:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aoxEMTXRyZdBW4b695q86IBvL71gam3jAF4D6e1oWYk=;
        b=c8TvX61Vizh4NM6ZoXVmRU9s6nI/2g6nO3vb76K/l03Tl5OrExY3ge8z9uQb9VOWw7
         wcUWMNQT3uxtUcsEuB22tce14SCwZuSh01sT6ZMjAaHmY5fFx/qbgTIAW3UgS+TF/gra
         7RHdqwqNxaJOFtOuFh7CrZayFR576YfbsDE9jEEzX5GVSf8+JyoKy2MKD71TQ+kdLecW
         PjFZ7WXu8wwjafUBprUUaMC8gH2XwrnX8MOszR1Yv+6l1Pqj5wtHVEO6gwwfCk8/2x2Q
         vw7hbJNFO2mMEzq0OO24bAz3yr8CoGRlgAiuqc+GezYXq4F6mSziqI5ld407IRR4asPy
         ENhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aoxEMTXRyZdBW4b695q86IBvL71gam3jAF4D6e1oWYk=;
        b=Txcwwy+W3j/r7ClZJ/B34NtKZkuk1QTQUyF0/aZDVthQMNs+CCuwcIMWllzFrl3Av2
         FI1Z6c95+Ezjxmgmm+L2+QZOTQXRiEEj/tbKfNYzsnB/7S3PmTcgYKHss/mtAdTPW9Eh
         WzqYSl6VQQFcyHd5B8hu2PSm8UXIZYR/atGDXI90uaiv0eNqrpumw1OyUnF0my8jr0sL
         DKsJ8DslRdrHp31Nf55RsIUM68ZmKu7JMcx3ZyxnMUUS+ZnbSIiCx38ou+Z6tWInZ+R7
         fS0bAE9vasbQSMe65a0smAXdU2eK/4qlszEw36vWJYwVycMtYDDYQy01qI8otfUycEFq
         Xc5g==
X-Gm-Message-State: APjAAAXBp2g+krG10oi98QZVwFVV+/LGO4JI7o7rr/yuVO6b/DxFB4ll
        BPVLJHIhKr3jy69BzBGjhEE=
X-Google-Smtp-Source: APXvYqxxtwgU7Ux7lKkMb2sAx8m9aremOqEvUTaNznM7Ug0pFPHWdrojJhYW4xVECXdNva+oh6dB+g==
X-Received: by 2002:a5d:424f:: with SMTP id s15mr10316924wrr.37.1560026923189;
        Sat, 08 Jun 2019 13:48:43 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-359a-8d64-e90a-f663.ip6.tmcz.cz. [2001:1ae9:ff1:f191:359a:8d64:e90a:f663])
        by smtp.gmail.com with ESMTPSA id f204sm4986394wme.18.2019.06.08.13.48.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 13:48:42 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v1 2/7] MIPS: lantiq: Change variables to the same type as the source
Date:   Sat,  8 Jun 2019 22:48:05 +0200
Message-Id: <799e71c36228ff077087e2b4545a5e5275e53729.1560024463.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560024463.git.petrcvekcz@gmail.com>
References: <cover.1560024463.git.petrcvekcz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Petr Cvek <petrcvekcz@gmail.com>

A structure irq_data, irq_desc_get_irq() and irq_linear_revmap() use
a different type than defined in the lantiq ICU driver, which is using
signed integers. The substracted result should never be negative nor is
tested for that situation. Change it to unsigned.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index fb3e1cc2cf6b..ef946eb41439 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -77,8 +77,8 @@ int ltq_eiu_get_irq(int exin)
 
 void ltq_disable_irq(struct irq_data *d)
 {
-	int offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
-	int im = offset / INT_NUM_IM_OFFSET;
+	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
+	unsigned long im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
 	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IM0_IER) & ~BIT(offset),
@@ -87,8 +87,8 @@ void ltq_disable_irq(struct irq_data *d)
 
 void ltq_mask_and_ack_irq(struct irq_data *d)
 {
-	int offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
-	int im = offset / INT_NUM_IM_OFFSET;
+	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
+	unsigned long im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
 	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IM0_IER) & ~BIT(offset),
@@ -98,8 +98,8 @@ void ltq_mask_and_ack_irq(struct irq_data *d)
 
 static void ltq_ack_irq(struct irq_data *d)
 {
-	int offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
-	int im = offset / INT_NUM_IM_OFFSET;
+	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
+	unsigned long im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
 	ltq_icu_w32(im, BIT(offset), LTQ_ICU_IM0_ISR);
@@ -107,8 +107,8 @@ static void ltq_ack_irq(struct irq_data *d)
 
 void ltq_enable_irq(struct irq_data *d)
 {
-	int offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
-	int im = offset / INT_NUM_IM_OFFSET;
+	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
+	unsigned long im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
 	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IM0_IER) | BIT(offset),
@@ -224,9 +224,9 @@ static struct irq_chip ltq_eiu_type = {
 
 static void ltq_hw_irq_handler(struct irq_desc *desc)
 {
-	int module = irq_desc_get_irq(desc) - 2;
+	unsigned int module = irq_desc_get_irq(desc) - 2;
 	u32 irq;
-	int hwirq;
+	irq_hw_number_t hwirq;
 
 	irq = ltq_icu_r32(module, LTQ_ICU_IM0_IOSR);
 	if (irq == 0)
-- 
2.21.0

