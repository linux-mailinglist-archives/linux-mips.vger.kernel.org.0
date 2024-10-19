Return-Path: <linux-mips+bounces-6155-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1A9A4BB4
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 09:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E973284A84
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 07:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFB61E0082;
	Sat, 19 Oct 2024 07:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me3cCNX8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28741DFE0F;
	Sat, 19 Oct 2024 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321866; cv=none; b=ibQTMeJNeaXNF/eLM0PLrFtW3S7CKzjzeqYneukA+4KUoLokwxr4D8N/2sc5dKWttmlH+Hm5qLIhS5IjoVZV2MgnyMvyd+kR58KsuX+cayvBpvUzLEAsCes3pgMCUO8lDtasLblDRzCySf/hZWInYHeg2IDrhldlzKtCRKAUPRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321866; c=relaxed/simple;
	bh=K0HzhA8alacM4aGMjW+d/bogSNMW+xZy6jmFTQZC5Xw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YaIenvX3DRH+VsoZ/kZ8wpJRA+hAG2idz9W67CNU1rUR41guxXo/whgPHZGI1ofcHSYzwcJoss/MuLTroJs6j44lb1cyJXaYI9LOYmRaJ4kVKjGmkEBO6vR0i/6RVhCnIw9ZP2ZYV/vwdVs1T3vJVxoORfyYszSQ6SJjwIpszHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Me3cCNX8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a3dc089d8so360862766b.3;
        Sat, 19 Oct 2024 00:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729321863; x=1729926663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAZgXuitpoye0Y0FrsnQrLaDYihSlv95JKJZ5ie56qU=;
        b=Me3cCNX87iHmzm+7Q8jpu04CLg1uUoFN9Fge5SfSkAsC2VP+N0weE6yU0+l2tNkbNY
         X7ZkoKiKg++MFu8b+TMJs0QcNv9ddwvI9lsd9bDTXdwVybMeBW/Hp2J8DjvWvLksRNQ9
         mMep7v6Y4upnX825Z3k02P2ed4kzfZYX9d8IGIK8IN3e2r7rQqJP04HNAOIvtU3HFfJ4
         UMYKhUVzqbczDiZPhDOw8Nc3H4aWn8omve6i535IvjntqOibbh+M9g4RL72iFOCyEEmo
         gYkOBYhBWC/oo8W7RusHwKd2SaiqR6jwKN3jvIn7NOpnY+T+7VqY7HvuLo+1l4/3tQ0Q
         iajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729321863; x=1729926663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAZgXuitpoye0Y0FrsnQrLaDYihSlv95JKJZ5ie56qU=;
        b=H42/6SEkbxM0OCvaqgIXCTRlwJFHVWgZB/v7eHKaliWsHwnK/izfn6AojllPa5w5kj
         P97Bz+7or4Xpd7w+1Etf4XR6lZ9W1+J4ZJxGgskVqQjc30kl+ZkWNcCFkMGx4tofUg6u
         /NJEs9VSGL55EeLhTCgvq3OPa0ypcWW++3XGCAdNex7WtOYstgJ4Pqk2yXokVhlchwIZ
         QiOP2iy5ZS8U3TtStkI7t/nsPgFg8TXUtm1aQJPBaVMNePFjK+OV8o/Sk6VUxdDybhh/
         Ky2xCoWMbOhHY1jJ8EJE+eIj7JJAu/ASYa6+zOCTQ0E8DyAoLssI73fuIKHuB/blUzcS
         L1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWJblsRhrxTdlX79dgXV3FufA4dgwg6OPHkMxVUXEWl/Vg92RMYwioHmuRU2XGIBZfoTRIXJy7zVdWQoqs=@vger.kernel.org, AJvYcCX3I4DdVLKoRbyT9sysOFGQI0q7tYMGatqpFl18JrtU+5Gm+V/d3Lg/CdXauiW6PD7nUZUoUtLvwFuzJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXLMIInusqhWowvgEfqFxHKeuvJxnRbuKzU29lGLRswcKtUGp
	LQIgDuPbHrCzwq0yVUXRO0ny1MKBgDYo5GeCmtvwzSpPxVCA4xut
X-Google-Smtp-Source: AGHT+IEybtMSJJTB1GlywNRQRpKklzRj1/3/mMkf52VBoXC32u7TNHFjKT71CJaNokZhu8eUiNJDKA==
X-Received: by 2002:a17:907:7211:b0:a99:55ab:b666 with SMTP id a640c23a62f3a-a9a69a80a16mr479865566b.34.1729321862735;
        Sat, 19 Oct 2024 00:11:02 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27841sm180566666b.192.2024.10.19.00.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:11:02 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
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
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v7 10/12] dt-bindings: mips: cpu: Add property for broken HCI information
Date: Sat, 19 Oct 2024 09:10:35 +0200
Message-Id: <20241019071037.145314-11-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241019071037.145314-1-arikalo@gmail.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gregory CLEMENT <gregory.clement@bootlin.com>

Some CM3.5 reports show that Hardware Cache Initialization is
complete, but in reality it's not the case. They also incorrectly
indicate that Hardware Cache Initialization is supported. This
optional property allows warning about this broken feature that cannot
be detected at runtime.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
---
 Documentation/devicetree/bindings/mips/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
index a85137add668..57e93c07ab1b 100644
--- a/Documentation/devicetree/bindings/mips/cpus.yaml
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -47,6 +47,12 @@ properties:
   clocks:
     maxItems: 1
 
+  cm3-l2-config-hci-broken:
+    type: boolean
+    description:
+      If present, indicates that the HCI (Hardware Cache Initialization)
+      information for the L2 cache in multi-cluster configuration is broken.
+
   device_type: true
 
 allOf:
-- 
2.25.1


