Return-Path: <linux-mips+bounces-12803-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1069D0B5D4
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A76230407EF
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965CE364E9B;
	Fri,  9 Jan 2026 16:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWdl+UWm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qdT2WcNa"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D4364E95
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976959; cv=none; b=QPt/E2yBFm0cEpHMFpwBrNSloi2YDahgq9u5+a/FM98OnbFueJwaWln2t0tnuZbxm66RsLilU/SAIBh94BtrFahzUoPNRmi0wabaYXV2tbTYNskJxCJrZK/GIR+Uvlty1dhRr8Yg6FynlDKMvxZssUMyG/gHZq1y8mBS4O1a0sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976959; c=relaxed/simple;
	bh=2qjQra2EFD3Y/w4pfPSWGJZIKlGX3lfdWrzzclhHb+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VgFxj31EpIeCOV2r2QIaic2nSrS1UbLR29L2inYGmZhAJxqx/hwb1rmRBxYgTt22GOMWhyj17VGWls6mbd4kFbo4oY93x/m+BziaWMne+S0ifoQlfKEnWF5zcZVZpSdRqIprFGTGVSR0qu/xt305CTxfOnxiV2u977qYP52n+eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWdl+UWm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qdT2WcNa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VAn+XKuQ47D8yqbQ/yZIHjXY5+WjSACZGHAy4LHu/3Y=;
	b=BWdl+UWmWUDINq4x0C7Cv4sVyCoCIkut+Ium7UpBV0IztZ3OwjuiZDScZMyfIdxI7b2rBh
	h6gahE4nBJPtd5sfEWovH2iL0po1vroEbgykZwKhkD/WmxR2EBNfHbSScskBPJ2wjFEzIX
	QYQZF1lYQ+lhXyJnuUvZIFmdoKZCGq4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-AICkti9PNP2e_IsydyIBzQ-1; Fri, 09 Jan 2026 11:42:32 -0500
X-MC-Unique: AICkti9PNP2e_IsydyIBzQ-1
X-Mimecast-MFC-AGG-ID: AICkti9PNP2e_IsydyIBzQ_1767976952
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56366d9ed8dso607125e0c.0
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976952; x=1768581752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAn+XKuQ47D8yqbQ/yZIHjXY5+WjSACZGHAy4LHu/3Y=;
        b=qdT2WcNakaH3vxmudHPdextYLdAL4xeQhFgbDmLd0cFirltMMS6DQ3ZNGZbu96it7u
         TYFfvqvFXhCPh4lvHkh2BqQs0+QKs9g594a2TlSayUuwK2PZxvtX/ufgZQrdtgqxAM6v
         oOAdiWLZh4YLqKWMN4lXvivDKBf275W6tv3GtLilA8sZpicaIc7J3wUtRHNi4SdT+AJo
         m/LhWvrGRIqf5tg5g/0u4lHBobFOAGGouYcPdXtMqBQEKe0BN//JVgeinTKAVHK9Y56o
         MvunDN0a7t5gXN+Q+SogszObQ7DkhFbQdszOv93hFSysau+iTNDAGcy3lZjCAwHPRgwC
         nD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976952; x=1768581752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VAn+XKuQ47D8yqbQ/yZIHjXY5+WjSACZGHAy4LHu/3Y=;
        b=XVW//x5Xv3vu+fxk518514KdAkfO2xT/oHa3Vs41bXdy5kJAkbUyERJ0vZ+zbaRS5u
         xtGKiSLgQAtYTSAIqZwEPe+NBitBG1GKn2HVDu6vwp0DFaYV0E/xbHsI8aApoUKKbSDu
         I/XOjaNEbsOCwj5M0MuJNepDQuXhCs5f9oBnX8QYQuOj2gOVVLejalBJdFgbkFUE+cva
         /VrZ/tP3glosMcMvVDVIPlIdd3XLnDLYWS4767a2Hi4BSEqXG3FZ5ZuJ9kMc78hqRSjL
         F0Wz1J40KBwlpjKI6JL+zGNgNRX9F81VuLA7ZQ1BDgYQFaXsC3PsSsHUxDR3iURLezPl
         s78A==
X-Gm-Message-State: AOJu0YyOz8OUWJJWfTI75lFtjwhx7p/3HsFyKcF5cpbba4u7gBEKOHsZ
	XfGZSqRbIdd/ugfPyLkElfdMrap3+A7LUUMK8L97hsChydFbwaowMzX36MiOxUPneCMwXb0h0MZ
	2hKEivXBHKi+izHuo3OAfNeKvo1m/+522wEphFLMdMT2LnRbhg4FJNbZ0x6biEsw=
X-Gm-Gg: AY/fxX4BR7EdzCkL07c3GWG/z6KAn27ohi0Rq7V63Io1YHTFpgc9imc7fayRN/xSFGh
	m4HvhO5xK4Rmx3fNTLPGL4tVB9HlO5ak5PQPCi0MZFHbcZFhP2SoeRtlJl40vCTcyyWShRRig1P
	jHorKXOVQ8/xdyd8mbUvNsnL4MLp5ycV8MVCtjh/0e7mMyOgGlKuMKDcer0ZrfoNv8CVgqoG8Q3
	HbjedMqCIaaYpcHwCodn+aYqK0EEC2Qo1PumvwLt+XcD4rEpueQU2bimslVF6993R6Yne3xA9r9
	q4jcxXZ46sZTpwZcxp0B3JE6HWLAy7YQttp8Cu0MFUvWUoUIXmP4CUk/Bd/AHqTssy4dlUFL0Fm
	xDEE75dEsH/g0NFR0Dz0l/Umv9j+VEuOMdQLSnJh044uE/fXR
X-Received: by 2002:a05:6122:9001:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-56347c2dd4bmr3914797e0c.3.1767976951897;
        Fri, 09 Jan 2026 08:42:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKIttTOylcFmdXlFSY6YzzA98a4l4SwTeUyaxFjkv8WhPZktN4h7/RtAemrct0fT9ia7xpgQ==
X-Received: by 2002:a05:6122:9001:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-56347c2dd4bmr3914788e0c.3.1767976951556;
        Fri, 09 Jan 2026 08:42:31 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:31 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:24 -0500
Subject: [PATCH 11/13] watchdog: pic32-wdt: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-11-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=2qjQra2EFD3Y/w4pfPSWGJZIKlGX3lfdWrzzclhHb+w=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y9+31s+d2larE9y08S5P9K8HjPskYpyOcj6vTT1+
 OFpDXtbOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiI/0xGhpZw7ujW1+/2t7Ed
 KjT7Z/fu6V8upSbJiV23Z/yKWKIv+oXhv/eSsE2PH8w/crRk9Xt99aLOu6oiFu6dK/7yr64Pevn
 5MS8A
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
 drivers/watchdog/pic32-wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/pic32-wdt.c b/drivers/watchdog/pic32-wdt.c
index 1d282de312ef1bd683529088fc88456983e8efb9..2e7186b85194645d40f32e69f198514fca83b601 100644
--- a/drivers/watchdog/pic32-wdt.c
+++ b/drivers/watchdog/pic32-wdt.c
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
 /* Watchdog Timer Registers */
 #define WDTCON_REG		0x00
 

-- 
2.52.0


