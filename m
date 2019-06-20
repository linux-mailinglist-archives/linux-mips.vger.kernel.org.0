Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 858934DCD1
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 23:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfFTVj1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 17:39:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34907 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfFTVj0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jun 2019 17:39:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id m3so4528871wrv.2
        for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2019 14:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aoxEMTXRyZdBW4b695q86IBvL71gam3jAF4D6e1oWYk=;
        b=npw55f+ATcn6mfPxVcEVb2eOu5sTVShGqtID0EYa5ifUEqucGxmsZYAI/xvfLgibf/
         nWff/Odeku9OVz5QRfQaTcUONulf+9Og4zBpqm7WyS3vKCJek0FUxap2ToZEvU9pA3i9
         DdLtieqrR0E3QXK+pMvoq9xg0QeeSL2upahwvya06YHUJrJROtTSB7xb1uc87EVqV+hf
         kmHA16gT3hZgeg7NuXCRIcTN6NybC5XYoqp+Q2wuRYLa5NCHbD3RdALNJzRDXYRHGviW
         ZkxBKP+aP3cD67eMFYdlVrFIjkqLqCLQ56ry1CeIr0QZ0I9/WnWI53MCnhb3qBHEq2vI
         dBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aoxEMTXRyZdBW4b695q86IBvL71gam3jAF4D6e1oWYk=;
        b=CuI3fRzrTuqOfbwwf44has8lnfkpDjrpDT2cEpStbYfkWM/MoBvS4C8qyKZ6CJuPqo
         8I3qo7lDpKtwy8uHEo7M5UOAbWyE5sNYYOZW+Yv5LOw39UJLDKfSRA/iObqdLsuceeA2
         S7Tms/kBjDuwvW5Etn3dd6dreRpZkt9o4VqdB0ZK/4PD5+YNYH+WFBWsOOmcZHlk+FYJ
         xfNfjTfnAi5gWKJQVPHjwgfE9EAEphUVM0nyFPDiVNxWNf5WsWnq2q9zBm6fdehjjlLB
         3UQcKmDszevpMGPCEfa84qmGXd4IQBoC6H1fKVYhBo3GP2law1h4Eb+36TgEh8cRKdXb
         TXBA==
X-Gm-Message-State: APjAAAVclYk3Y/iZ5pj6jbRDE+udL5jVT6A34kCWeeEZ3TzZF7ziatWc
        g2esb9ycVIHjWixaCnts7me02dXE
X-Google-Smtp-Source: APXvYqwnqWLBKxor2zNDz1OVCipLWIoOFPUlgwTBwdTPBMZQvkXyztHMgGfSVTdjpJenW2DYphijNQ==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr45563754wro.162.1561066765557;
        Thu, 20 Jun 2019 14:39:25 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-ecaa-d74f-d492-3738.ip6.tmcz.cz. [2001:1ae9:ff1:f191:ecaa:d74f:d492:3738])
        by smtp.gmail.com with ESMTPSA id j4sm575426wrx.57.2019.06.20.14.39.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 14:39:25 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v2 2/7] MIPS: lantiq: Change variables to the same type as the source
Date:   Thu, 20 Jun 2019 23:39:34 +0200
Message-Id: <bf6dd033516c90636f75595c12b1f3c0a3331d28.1561065843.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561065843.git.petrcvekcz@gmail.com>
References: <cover.1561065843.git.petrcvekcz@gmail.com>
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

