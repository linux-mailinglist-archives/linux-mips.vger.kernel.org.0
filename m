Return-Path: <linux-mips+bounces-12802-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D2D0B5D1
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A317830A7936
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DAF364E93;
	Fri,  9 Jan 2026 16:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dl9Tf/fw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uMwjU8C+"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C640364029
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976959; cv=none; b=aESCZoxTyE8bD50o3XrEmhsWMNfXaiKpZ5sHak+cPqrFg+oYWPkUdmyTd0nBIQYZrKYA8lqNGyZPgfURr6olNAmdoNneCnnfw5qikIu2j1oZaaOR/JNDlPyLw363Nux7+1znKj2Fcs985+ThE/0f5TFqInK1LGbY4QhFJ4awsXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976959; c=relaxed/simple;
	bh=DRbOK5RwsYU6XFWfVMOEiIAoh+ZHNz8ulaOIBWnK4J8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=torK+HlAz3W1JBJairl4r6d7ZPJIiry+Po8joGleQ+DEMFmpVnAP7i5p2ShYE6yyhu9nSueR9lnlwFdrmsk15uHlPG0gCi14A6mJ7r5P7LLxiZBo52XT2sYnISLBYMP8Nv2cyJe64etsV4IQDnoYANjouv7+RufUr8ht0eORnBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dl9Tf/fw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uMwjU8C+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5x7D+IP18D3heNoU5HsOr8RG106ujJD8y+92pAU9sY=;
	b=Dl9Tf/fw2Nb5FtZkG7Lm8qUsuQAXJa1hDAA2TBvsGtlARKlNp6TGT1+mwdSpYXwoYgJpKn
	LoUXwdEIsrOXQ3/JlXtA2XJ2weNLvhvwvXDpbez5PA6odj1mmuKzqTSpAU/wgtpa+uAc1s
	LDEfFUFS1wRLlXnJvn6mWVfqx02gsYI=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-Qysa1JYcP8aj7C8gwfqQVw-1; Fri, 09 Jan 2026 11:42:28 -0500
X-MC-Unique: Qysa1JYcP8aj7C8gwfqQVw-1
X-Mimecast-MFC-AGG-ID: Qysa1JYcP8aj7C8gwfqQVw_1767976948
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f5e6c2110so4730268241.2
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976948; x=1768581748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5x7D+IP18D3heNoU5HsOr8RG106ujJD8y+92pAU9sY=;
        b=uMwjU8C+16BPh4N1VLTS9eN2xV60i3dxADDjtm6M2+WKXsGi4gmCDXBQ3wZLohXkHY
         Xg58aM8k30lEfIf2ybDkFldy0LVvBzRNPu1LJVCldDYcFABnZU+LpkKve3Wl0e6UQiwl
         OnKaUrApwKM4Quse1D2sJ/iD4UeoSXARAqNcTB27Wv3jRRFG0ZjAjnWn+IpZCS994PeG
         1Q6hbQXf4Vl7/0f+N3U4+AmTJD1B4DdiIPSoz+WZXe6D/AohzgoV6pp8590tH2j2UXbt
         TuwIhmWs3dRPNjBSVmoUjFchVMoMQC68UNn4OnZ6ad9EhDQepgaXQNL+7PIPvGp5kYu0
         iYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976948; x=1768581748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+5x7D+IP18D3heNoU5HsOr8RG106ujJD8y+92pAU9sY=;
        b=EJ7h9cbTjNidZhWbMkdOXVDCThy1JdUjmeQqLWxDn5XrKZu2SYLC7hBP49mG3QaHo9
         xAyj5JY9zuuQ9L9QwBzpfLN6KRN2vULq2uYc0rV3TrwtWJjcmzljgOnZQQtyjLWvKKQ7
         egUL4Kn+7hBFcHAIRkxO1GZApsVQ5MGlGRw3LttY3NniNtuVvp5DTfd3eyfFrCAgYVHq
         nLtOsr2wpvYfLuFNpxHR2dHVVMR6dtqy7y7kZ/RPQxSvsALmKU0nyam9pk0cL3f2Qcn/
         bziZVYV3sAYOsqeRrRT7ibvS7UqtcwVjzfjUudXQf8f/USGqe/b5+ipMxc7ikiSerDdY
         Q2uw==
X-Gm-Message-State: AOJu0YykW7c4ok/XbjFYpsqUbW7Cam1oeSzMCz+fJZE5986nVGjQ1oEx
	bxQHXST7CY823ZSWg/vS1e8CVKLHOU6aS4fFjnW/vmnozVEYh2cDFZSawY5WU6kbkCv7ahpwYwD
	KdIbQQRuiYoaEExrSRyG8j+TwEXsm8bgE5jzDjvc1vbWsH2c4KB1X/B3VXi7QPuM=
X-Gm-Gg: AY/fxX6OPin9l2JobVgQmlBGMxpVQsHE+OD/P5ua81IJ6Qp4l7dky25I2EMI/9ZFv/h
	k2Mkqg+xvP2aECSaI8sAC7X4HXr/DCdpUWHdk4+uvVOQW/I86svHl4XBm0GXKFcdo5de7V7lWb6
	px9Ox4ejWPYzsg98ofRm2CzGCUH36EHrpSerQUR0Y3QrPJ5qsIqBU3r398VAdv8PHkLt23utqdx
	ENYvlYM8v9MclHeW6nd8GGl51JvmfkEIXWxWD5T1F8iEIjjnYYhHR70+8ZKAcqS6U0MYPwPCtUD
	/18nvUGLoAf/a3YlBe537xO/iIHyt9FkTz0KrttGigwzieU9gPIKPzMSvVBqcA+eoxdVnVfypoi
	xNuIVvA+GWbszdHplVCLC8z+2q/IJ8D+Y965M1UYIQIBnYmnI
X-Received: by 2002:a05:6122:221d:b0:563:4416:a0aa with SMTP id 71dfb90a1353d-56347ffba03mr3750460e0c.21.1767976947742;
        Fri, 09 Jan 2026 08:42:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVEDN+tqrnIiLABY/j988WSa2acdIYRDjShsirXH/cCw81AeqGpIol7AsEzjoFpyT0Ef8DGw==
X-Received: by 2002:a05:6122:221d:b0:563:4416:a0aa with SMTP id 71dfb90a1353d-56347ffba03mr3750447e0c.21.1767976947337;
        Fri, 09 Jan 2026 08:42:27 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:23 -0500
Subject: [PATCH 10/13] watchdog: pic32-dmt: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-10-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=DRbOK5RwsYU6XFWfVMOEiIAoh+ZHNz8ulaOIBWnK4J8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y+2zXNcVTUzg+3666TtbEcXHJXX3XQxW3T6vfstE
 a9vRxXM6yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiM/4w/NNQdL82c8kJX4H9
 K/JabnCZcCw3kJdrmFM1qaUnJcDy8g6G/0Vr31n/55PV4mT4YpK1k03/fZDpu+9dH2+sTGhconr
 8MQcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/pic32-dmt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/pic32-dmt.c b/drivers/watchdog/pic32-dmt.c
index ab0682492c85ad63160bb7da61cc74336698a4e9..12e3a8f63589862e3ed674ffb71ee4798755e56f 100644
--- a/drivers/watchdog/pic32-dmt.c
+++ b/drivers/watchdog/pic32-dmt.c
@@ -12,12 +12,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/watchdog.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 /* Deadman Timer Regs */
 #define DMTCON_REG	0x00
 #define DMTPRECLR_REG	0x10

-- 
2.52.0


