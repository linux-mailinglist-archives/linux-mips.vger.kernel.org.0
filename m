Return-Path: <linux-mips+bounces-4930-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB0955E32
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2024 19:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44209B21041
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2024 17:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3150E15A873;
	Sun, 18 Aug 2024 17:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtPKZwPz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B09C156646
	for <linux-mips@vger.kernel.org>; Sun, 18 Aug 2024 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002224; cv=none; b=ClABJFz1m6WbEjj7I10hzHdS/5mWHx1tFII9+h1X6W5GQKcDhhxnnwv0f7i0ErFYJPxflAB/RaAZTgfALldh0DGyhMIJ3eopMArYVZrpnOjOn0ACOmqnl3ahF0us9cnYYHQERhMUvbv/98SOI6lkRIooJQuawXmem/mDYZMNaxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002224; c=relaxed/simple;
	bh=RYClEsujtW4S94dyvDLYYanO3sNFLNhXP2WVnH+jFRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+rMUS3LCZ/5uIbjMKPXeZ3au5SFjlI1CxFHAXXgO+9mFQ28dS1ERZy2j0dR1/d/yQXwAZ3UoUjCegH7nZRJ4Xhq8K7S0A83jMN7Czw3HriSFlCdLNGhdZr3BuCcem4CQEPRny9luvf7GSn14cOjh96WTRyYfN3wCjmp2v7NR8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtPKZwPz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso27022975e9.0
        for <linux-mips@vger.kernel.org>; Sun, 18 Aug 2024 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002221; x=1724607021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiRlsM6vBlOVTpadv+7qxVZ/+NvHjXgHFTSiZbF3Lk0=;
        b=mtPKZwPzZeVt5FwqSoxw54qKVefPFMi1Zr9JAvTNIXyR3VaTbXQGzi7oAUPdhsnibu
         TGWZbpEafNdhYqmDmPVegXUJYez9KTbLlUaaXRaGlOqIUptYa67Vijtt8wWMZ+n5x/QV
         rcSV3db2gl/XAlP4D0JOaFgAoWvUdp6YC6E8ecBLDWjvPj4lhFnhUqsOCwDujqmmi7b+
         GOO03dha7sgF7VW4VMWl+r2uSPKVj7V1nWymYdr1XOXH5lkGxYh9A/qjfzSuAp2HGwE0
         qZTshDNPvjt8Dorn7WnvZCN8yt4D2EB2TwYDILephmEXGWKdPyf4Jwm2zqOtMDOtO2ku
         jQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002221; x=1724607021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiRlsM6vBlOVTpadv+7qxVZ/+NvHjXgHFTSiZbF3Lk0=;
        b=n2eD2v38DOtT3f765KgcFQ68yWxNRb/7zJIAr9vBc9FuD8B/AAp5C7aNLWYB5bEDF5
         T1hWKrh5j0y3d1qNgzIdPHqiPviXULa+xY7S/WQH/PP9/PhsSL2oPo+DXn3LqcMfi9nI
         jq8gK1++bMKb8oCJAaw9OlW1qSFBsLGWpoKEp9pmX6EVFuk9qUv/3yFj5+yt1O5xWFdS
         2qVPOQ/blxHck5QiP1J0BFRItbOpR7xND+3GJPDMB3zuS9w50z7P79A2gDLK2nJmEjvu
         ql8b4gQtN5XEqzHmGQd5t513lboY7wdqziOYKPXA1HG+HLdk6BUKejqs7BxYok+o0Gym
         27eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq6lMgAd9LAZhE369WArCmeAlUzz3mOiOrN7fgG03p3MYMpCaGLcbSZ+GWU6p1h2MmOPm1MgcrhE4/ELt5k3ynEaDrHETaejEO1g==
X-Gm-Message-State: AOJu0YzYIVaXpI30epmgkgkhqVzq16zxVTnKuaPpgRHG+cvHr6D+3aHT
	XqtKWvgi6LsUM2VcCL/0AkRjERfTo0eDJg5aanI80SlYASqFI+MAwE5opI2qwqQ=
X-Google-Smtp-Source: AGHT+IHlDcGvSSlmSoCOZtAKT2zYd9WHqBA3yrLaM9pCakhIJQ/7iIvhr20DdpvwtiU7bWUoZXaPcA==
X-Received: by 2002:a05:600c:1910:b0:426:6876:83bb with SMTP id 5b1f17b1804b1-429ed7b8ab6mr53592135e9.17.1724002220484;
        Sun, 18 Aug 2024 10:30:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7d5a9sm134999915e9.43.2024.08.18.10.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:30:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	patches@opensource.cirrus.com,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] dt-bindings: clock: cirrus,lochnagar: add top-level constraints
Date: Sun, 18 Aug 2024 19:30:11 +0200
Message-ID: <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks.  Drop also redundant assigned-clocks properties, because
core dtschema allows them if clocks are provided.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/cirrus,lochnagar.yaml         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
index 59de125647ec..ccff74eda9fb 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
@@ -67,9 +67,9 @@ properties:
     minItems: 1
     maxItems: 19
 
-  clocks: true
-  assigned-clocks: true
-  assigned-clock-parents: true
+  clocks:
+    minItems: 1
+    maxItems: 19
 
 additionalProperties: false
 
-- 
2.43.0


