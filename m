Return-Path: <linux-mips+bounces-4932-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC5955E3C
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2024 19:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A64C72814B8
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2024 17:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82FB15B10D;
	Sun, 18 Aug 2024 17:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sfNMScWj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CE715AD9C
	for <linux-mips@vger.kernel.org>; Sun, 18 Aug 2024 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002227; cv=none; b=EgvKtAkIl5lSvzRZrUP26z08b9sPfdqcAWmlT2OnALfy6rFVi6CQModn0JZEERINcgD3ODZG1rzPlGz7XcV+JXyDETP/ro2tVWkgY5SMtfOkWWuKtIDSvtUPHFkYd6pcIkf6PQ9BbufwZXOYAzw1y/8mlxCaP7wupDWknIngi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002227; c=relaxed/simple;
	bh=U6S5tfFiL27fmhyJLQdFRdd1Wz5/I61DAlDxqq5TzA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNC8Njmwuj/noSmSTGJKvzQiq/CC/E0WPR5+IHuSV/VUEnTMBIG8V05rT6gXbSMQKOe5Mj01vqfOPw/jUEfuvc/0QlEYX71l6fY9qii4OfMSMQN1Ch6BPacC9vQNOCm74DCQtC4iQMDvZIyzWShTDRHqGRJvvSN+LVlHywUiw+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sfNMScWj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4281faefea9so27193195e9.2
        for <linux-mips@vger.kernel.org>; Sun, 18 Aug 2024 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002224; x=1724607024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LJzGmSDXl8HNs+ZJgf58xM3uvdTJPYEdQtiLGgE/Vo=;
        b=sfNMScWjJlwkS+KjEYdsS1rrn9ZXLEhZYBnLaQGthZyQh8x6cZHa4Z4LYg9yDbLGb5
         xfZh3KzTc+c3bAthC23QnkUEd1ALJ9dyoQNNjVNc8+fyCX8kNPEqIjrrA/D538/rAA7v
         7ggFPJeVwGL3Aa6WHDaYFB2VNZdsRFPBJJhtcAPaFZRcGJI8O1wUAUKSFjzj558yIx0x
         /RwV6dCTQRXKrULKQ0AqFPwhithQkyA3q8503N0LMoynNGrx8sTv8c8ls6dTntE1LfdA
         AkkHRLYGpzIapNtmYI2mvYi6mRWYGxaRCCzuReE1BOLi3YotVEg9qwpiI/L4QoDheKh+
         k43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002224; x=1724607024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LJzGmSDXl8HNs+ZJgf58xM3uvdTJPYEdQtiLGgE/Vo=;
        b=ww0iJFAnL0lt8EScO9n58CrDeAhDyCsG48Ijkp5cmH0Meg9mCDxnzW7TYLDuO1PN+v
         p/uvz8s+4uWDEX41iNBaRCg8AsjcDTC/GJgsKd84Td+OQXrb+yUIqvV+eB1czv+9R+2G
         GlQU2J6Ib9EoHedFHn57/bVD/ZW4oeVSvnyIhYEQvo25IMAIYDdvpXXGzZkZCMMgp1kG
         ViLK7LJt2lbnViCcHSAsuXmFjGvJBlVPbssx3w6FMEJQFCz7XtWPmmnfjYA6HYz2qOmq
         Zl6hpSNkzairYepFlV7VDwiiNOL3m3Bbiu2yiBBfZtRgvKQXWPLPPIYkH0IDHXSvSecE
         QgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCphtm/QE7+2UuXbYB3x7j33zpa40JB4ww4C420AzcY/p08VnCjzehouYQNX7Hl6vpLb/XXG5vr4Bw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bsMPnB6D+s6YUZ0JPEI6M2SXTGFSZcLrAMfVvg3Pg4fLgdiP
	pmtpNBOtcVR5CaQuEouKUrNkeVEKAi7bazYawgcRmmdQd8j5I2vuZeKfisBN6G0=
X-Google-Smtp-Source: AGHT+IGekL2+ttve0hynRqEEzbgRWcWynLHa1J/EMMNb3eGD6VlpT3jMglNMhKBlzMDg3B561e5RkQ==
X-Received: by 2002:a05:600c:5254:b0:429:d43e:dbb9 with SMTP id 5b1f17b1804b1-429ed7cc4d4mr55016825e9.23.1724002224225;
        Sun, 18 Aug 2024 10:30:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7d5a9sm134999915e9.43.2024.08.18.10.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:30:23 -0700 (PDT)
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
Subject: [PATCH 4/5] dt-bindings: clock: rockchip,rk3588-cru: drop unneeded assigned-clocks
Date: Sun, 18 Aug 2024 19:30:13 +0200
Message-ID: <20240818173014.122073-4-krzysztof.kozlowski@linaro.org>
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

assigned-clocks property is redundant, because core dtschema allows them
if clocks are provided.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/rockchip,rk3588-cru.yaml        | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
index 74cd3f3f229a..4ff175c4992b 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
@@ -42,10 +42,6 @@ properties:
       - const: xin24m
       - const: xin32k
 
-  assigned-clocks: true
-
-  assigned-clock-rates: true
-
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: >
-- 
2.43.0


