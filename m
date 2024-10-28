Return-Path: <linux-mips+bounces-6521-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A259B3898
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF5628582B
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C90B1E104A;
	Mon, 28 Oct 2024 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQkuq3h2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660B1E0DEF;
	Mon, 28 Oct 2024 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138403; cv=none; b=Wl2uO3MIvKXBKhQ1WM8fbHmB5cSVSDcuQKT1gX4STt6LrqT4hf566M5iHLjlrJGgpaTgy984j96Dy8Q1neemAPqURRhgTijS0KJt+3xjKXzQZbcdy6PsoCKYBFMfwN/cGOZS3I2dZG6Fia2Cc2VU6OVbtHxzG6ubaRRpyAWztIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138403; c=relaxed/simple;
	bh=rS0N/3KIrMgeRTv6NPz2ZD31BGLzdZCfMlctjmDcBHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EWRJ5bXEcMEUywS6pOoKCH5BXaaXV+gijx+xFW+V2LABdY+aGBnIc/w7myrS0S439Fcun8han1j8lHqQ4Uq5NHUi5MJ8h5YvkCl4WdaKd15iNACOKoHv668MCpeeLHXhz1pQbyj09Ld1GjBqRaFGYlqh9NxsQVNDYjxQCvzz+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQkuq3h2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cbb719839eso4345746a12.2;
        Mon, 28 Oct 2024 11:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138399; x=1730743199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHycpaE7Vy70YH+3wi7D/PPKiZa8yZVDKmv2FNPd7q8=;
        b=fQkuq3h2g+LxCveKmcTA5V7hu2YfkxXS3TxseDOL0bxSPBEZGC7Ak6BYNPUMAVHPkI
         9vgbA0BLcqwVVbfwrUT9BHjhGIzgr5qwbP2BxxxQEzEEH0QUzNnDqqj1NJ3Il4CmqxRL
         TL31+sL6SoTN8Vaxj9o4WwisKQkzISID0iMQw+NuXbJlye8m0ydXHmYKBUuXrVulnAGq
         hyldy47LLPwam1KgjJi4CE13oRjCX+XNFt07CAAEYeRsMPOq5IbLPl6LOD5AiY09s0xd
         6Wukh9pn06thFNsGdSklfylPstaoNOC4TEdrzEfoO4p5P7bALp63k6oUvkQjdWssgiyX
         CzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138399; x=1730743199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHycpaE7Vy70YH+3wi7D/PPKiZa8yZVDKmv2FNPd7q8=;
        b=MAtkx0iNvtsFV0Wh/mqJIyZypY2fIeQf9+nkziR7PUGMXn0sU2oZOPOfn16vPzvg5y
         f5+D4SkjhyKA47QBmgz0feWS4HnnxBAohsFcckvPB41ymUvDFkVfxN6DuuClNR4JTaCW
         II6biZVf2HRvMx4LmRb8G0Ewa+4KzI8ybM1zhVXYMDb0pebP5xw1lx0mFU7WZQBfqoAa
         5i+BA0akWsTllOES23QRnSdzAbZIM4PECCHKC88aFwGTn842eeCsnMFR15Q9082pz/cR
         0cqVkSpSh+vZheui/blisOrtLZ2HALWmnuUrYPQopk9hHfjrgzEVyUm6d3MhbXGUz9XE
         PY0g==
X-Forwarded-Encrypted: i=1; AJvYcCVyokoKd5CU00a8Ew9brbdpzAHPrba0cJBRcxVnfHnkkJiJkEl6CuBAPNc/SHLKogF2+Uh933lmoqwl7Q==@vger.kernel.org, AJvYcCW6TSfqqv8NAPVW/4cTf8u4fpip5+cN5x9UT0FVAjzZrosdDedqnfGdkAPEZ6P9UlJq+a0YkcqyU7Hp@vger.kernel.org, AJvYcCWA5EtoRnCm62B6nuTd7NdYJ37ErtxEw8iSwT6O9kFGdxdwrvotzHtYBtPmJNSh2Pa+5tu1lghvGWs3paJ3@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUW12JoX2huILuEOgu6+A8YWzvsr1XmvJZzqGW0ZB8oW5XGhY
	QVZDPmXN+qVTEEeGh1eaKHKBo+nxHYbqFmdNX0tghDaOabOPgvnf
X-Google-Smtp-Source: AGHT+IFS31eKhtPRXSznANdPJXdFgnfjzo4LzQPOkHa4E4uNuYZrMxJvWY4hb9slKmh/+HVD1uKd1Q==
X-Received: by 2002:a17:907:9486:b0:a99:f975:9fb8 with SMTP id a640c23a62f3a-a9de632ea47mr770978166b.53.1730138398883;
        Mon, 28 Oct 2024 10:59:58 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:58 -0700 (PDT)
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
Subject: [PATCH v8 10/13] dt-bindings: mips: cpu: Add property for broken HCI information
Date: Mon, 28 Oct 2024 18:59:32 +0100
Message-Id: <20241028175935.51250-11-arikalo@gmail.com>
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

From: Gregory CLEMENT <gregory.clement@bootlin.com>

Some CM3.5 reports show that Hardware Cache Initialization is
complete, but in reality it's not the case. They also incorrectly
indicate that Hardware Cache Initialization is supported. This
optional property allows warning about this broken feature that cannot
be detected at runtime.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
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


