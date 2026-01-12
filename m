Return-Path: <linux-mips+bounces-12878-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B86D15A82
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DD44304C919
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8515A310762;
	Mon, 12 Jan 2026 22:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0qE3PHQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pPfWKFvv"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14382D7DF8
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258152; cv=none; b=CatbZoJSytqeS43lUK4AcN5KjKbJixQf92BCgtyvXtm2R7KZNMsfzN3WNlI67me6eFiUBxdEZ3wPsfkLwfNv0WL/V7kkJ1C961wp/5uCNTfO8hFannCPQcijFEnZ6w8FLbgvy1Lj/mPAMWII/YkXOR4xoNYoe7R608aRF0j1jV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258152; c=relaxed/simple;
	bh=8IMXCPMTE7nWCwGw7DSN/szFjEIz9vzn9vkbLs++LAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T59rnTRRR4AiulTdoMSaEeN1fHLyNe+wC/LKi1S3H7W2YgrwR43y/gfN3iESrbtYmolZFNDTCmEAYCKCEYCXt4c0I+Pu7I8KeKFzEHXqWD26M9MJq8q8p4v5hc8CdsFAgyLjTXBYSqdN4iWQ8NE1mK6Maoww7W6IrEK1vCALmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0qE3PHQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pPfWKFvv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPbAFjft8aMjpLSNQcauX/qROUVfiz1VsQKyCz3BUAc=;
	b=Q0qE3PHQnbxVFDGOWBcIfh7Re/bxc7oMx1sDw8I9RKp+tU5mK0+YY5KaPlqkiGs8VTFtVz
	mdInkusjGw7d51IalywqnbuTKvFJPsiqQ6rU04Rl/IAjuOf5QblxUCxToz4LlQ5RVehNaR
	F1o3763hsv1lOHxoLXxCEWQh741/E8I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-UrA_jLIaP5-o1UZwppT0nQ-1; Mon, 12 Jan 2026 17:49:04 -0500
X-MC-Unique: UrA_jLIaP5-o1UZwppT0nQ-1
X-Mimecast-MFC-AGG-ID: UrA_jLIaP5-o1UZwppT0nQ_1768258143
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8887c0d3074so180613096d6.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258143; x=1768862943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPbAFjft8aMjpLSNQcauX/qROUVfiz1VsQKyCz3BUAc=;
        b=pPfWKFvvqJ7TjT0l6mM+ignyK7Ov0y+AIykx61uJEZ1ejadXZ/sYcYgJ61xwkfag0a
         CsQ8U60LlvHCGaq+QaAgK+AR/YKfNjtRux9Soq4OMjoxAq7Kp3pS7ED9QKQNiYuGeETP
         JNUs4qngcUlPlE7nEVb0aV3JifxtAIN1iHIOvfVgjLw8e5j6mm71EvE6wLqMFK2VRGVZ
         UIwjv0cxiAIzY+FCGPxBQc0SoSDqyMF/7RByodciJ1AZfnZhWsnyaGoXoNnZF+kOiqxp
         fre1UPHG26Xz8+Y9rv1BPWROyQi76tMaEK4Z3ZQOIexpOZtR6vWeaZq2zOljyJNcZQ2i
         X49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258143; x=1768862943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yPbAFjft8aMjpLSNQcauX/qROUVfiz1VsQKyCz3BUAc=;
        b=fyKFtmk0g3VCTch0bNcmXtqBpQy23VGzD/PXX0xde/D+pLQ0XfaUg6WyC/HnrxGHw6
         Gp3vFZvOg5MTSzEshyWCLT9zsglu3yjLee/BTXYbPG9iG97ZvsdFzK2LFIjGtXid5H8o
         OAKfYGrGi5nmrQn2kufzq2NrNlLI6vkPECU3a5DeoihU4m9Gu+wfdDAM9P5fD/fu8PND
         68LlaYYtf+Up5KYWUICJhFJmxZ160GLg650Sn4KQxv4Udo2A5CUdsfsLTOjYxDj9yf26
         xuh+fD2vxTTv7we1hKR4twQRAbqDunlYDPNCNePndQchjQDEoxF/p7FkQrjzDobQ7PzZ
         9vEw==
X-Gm-Message-State: AOJu0Yz3wtMzuePO4S9He7ucRB8EmM8nJ0kr5uv/bv8bzUxIsN6jwQjT
	wp012WPYYuJsvd/RRRzAMXJFP7KfWlTZxb4lYn4bnvhWJtuZseVx63MIKiakpPjsSwFkdmqy0+v
	lfWY9ml+GQhVrzozct2G7Dj8ev7A0z/WDm5oF+QUYXxFJaNFznqJ0lqXoNSE57Mg=
X-Gm-Gg: AY/fxX76TTjR+v2X2s9qG9uzZr3dfsD221vJS+YknEDqC3os/wxh6Rrf76xrwnlp2/i
	rn/NTNB32a9EEPHbl+3soXOpv5dvN0lOi5XbCgNTXh5x2eo3VLUI+A5xOtAH5wa2JUyV4DRXiOx
	phlR2qCrzcSbDQRRWoQByV2T+8Y9wWtF2ylY/usYkpdZPUGDEipvHouin08eqnZs3Jon+R04/ff
	B5DuZ0rbpSA84vTy0C0RGU4pkGVvpc7PDwBAvO9kvdNDZn1tTNQ8Saw7pOPNUlg7F2Ij4Dm8TSn
	4k/dzlU5KXH+wZAA8ULvNlH7bIcb2aJXdhjmtx/3m56ReCQwIYDAdSH5rhcLcChsCgXHlHdWYs+
	efBi8t5DFqlO0oDwHUCo216kpLHe4FxaW2o9GnhwZBcmQRLN1yw==
X-Received: by 2002:a05:6214:c62:b0:88a:35b0:aa8d with SMTP id 6a1803df08f44-890842b2608mr286072356d6.63.1768258143650;
        Mon, 12 Jan 2026 14:49:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJw0a5Pc9eHOYgh7o5mLlq4wOuDLH/LQCgLhENbsbMy6QXfNzs9IvoDmjS1XsoGwdRRF8ghA==
X-Received: by 2002:a05:6214:c62:b0:88a:35b0:aa8d with SMTP id 6a1803df08f44-890842b2608mr286072146d6.63.1768258143330;
        Mon, 12 Jan 2026 14:49:03 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:49:02 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:05 -0500
Subject: [PATCH v2 11/16] rtc: pic32: update include to use pic32.h from
 platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-11-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=8IMXCPMTE7nWCwGw7DSN/szFjEIz9vzn9vkbLs++LAs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7wj181NyHsScXbngQd5kdm31CZN+GQQO1Mnh/39w
 11Sr6e96ChlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAixZwM/8OFe9dUzNOQ+lvW
 1Zio2/m6Z73CxVf+sTaph5SCG93jljH8Lz20J7lrXuLHsCSx70ptzByv9xg4Rd7TPt5795t8Xup
 OBgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/rtc/rtc-pic32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index 52c11532bc3a3696359ca56349b42860aa90c966..3c7a38a4ac08eb0f5a44ae4e470c208a9d1dd599 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -15,8 +15,7 @@
 #include <linux/clk.h>
 #include <linux/rtc.h>
 #include <linux/bcd.h>
-
-#include <asm/mach-pic32/pic32.h>
+#include <linux/platform_data/pic32.h>
 
 #define PIC32_RTCCON		0x00
 #define PIC32_RTCCON_ON		BIT(15)

-- 
2.52.0


