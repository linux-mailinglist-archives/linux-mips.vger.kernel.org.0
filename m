Return-Path: <linux-mips+bounces-622-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D5C80A874
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 17:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A38D91C209F5
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 16:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C760B38DE9;
	Fri,  8 Dec 2023 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m3cs815W"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707731998;
	Fri,  8 Dec 2023 08:13:08 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 784406000E;
	Fri,  8 Dec 2023 16:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702051987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+KygOxw7upzFkFkKPQuC0aojbbTgfulc0YH1c5kUVo=;
	b=m3cs815WFIHLVIMLhVpCaxbd3K7f9rXDj+iediY1yqDNWcPpvHemvigMZWMmWiydQMiL5v
	Y2lflUCSbhGmxoNsQXYHHYf+rGe10/LW+e7OuBzS9yhrcnxmsl4Zuu5N82ki3h4b5odkkP
	aMlLn4Ws7tKhUXyHToRvLqTL7nioGl4pkhc3Ut/ROiuaGkfxqGjJm1HxUxbu85a6Rs103D
	e3sZpE/3w/Cgn5jJHGbm7EWZsNekekU6CvvjbnyVj2yOw9B6Uxw05VPeu/qylseNv5qS72
	7lufyvNYUlS94mF5uKK3nKGiZOVqqCUCv3MNBdeV2M3fGwoQ+LNMuPyMK39adA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 16/22] dt-bindings: mips: cpu: Add I-Class I6500 Multiprocessor Core
Date: Fri,  8 Dec 2023 17:12:32 +0100
Message-ID: <20231208161249.1827174-17-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208161249.1827174-1-gregory.clement@bootlin.com>
References: <20231208161249.1827174-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

The MIPS Warrior I-class I6500 was announced by Imagination
Technologies in 2016 and is used in the Mobileye SoC EyeQ5.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/mips/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
index 9bc47868d28b6..a85137add6689 100644
--- a/Documentation/devicetree/bindings/mips/cpus.yaml
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -23,6 +23,7 @@ properties:
       - brcm,bmips4380
       - brcm,bmips5000
       - brcm,bmips5200
+      - img,i6500
       - ingenic,xburst-fpu1.0-mxu1.1
       - ingenic,xburst-fpu2.0-mxu2.0
       - ingenic,xburst-mxu1.0
-- 
2.42.0


