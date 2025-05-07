Return-Path: <linux-mips+bounces-8958-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DDDAAE14E
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 15:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41AB63BAADE
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 13:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FAA28CF4A;
	Wed,  7 May 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="HtdWb82G"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BED289E25;
	Wed,  7 May 2025 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625533; cv=none; b=YH4S4ncGC/ypP6x3r+h36GH+owSYoBNPYxlv4WnqvqrBbMfJNiYKWYJq9XQ7PpWumzV0PMoEPv761ZHUYpIUBpUhxQEG/3UP4iaS1/IlOwflorE5ZgtY3w4t7FdVnV9ZtnNyB2tqeeiRS12loxg4IXVLhJ8HS3eMsKAXOk4phDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625533; c=relaxed/simple;
	bh=w/28cHd7sQVZd4bwz0tqFSqlXQVwghn1QbYmCYK1D60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4L9tnTXbz73/Ox35THCH9o6/O8AI7VYXxFLZ29J/4fx81cLqwFBe64BiPvJBqkhEI6bk9+fXyKS60XzTxCpxrpBvZy2EIqkMIfw7j6jT2FLiRp/6rJCBdrIkLDuV1aiw/lUhSqsYdel/qS8dT3b0DqkW0K7n61kfjCPb/EvcvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=HtdWb82G; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE9E3DC0BD;
	Wed,  7 May 2025 15:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746625527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GIq50VzAPDRvLfqv8bBnT6iyvFUQl6Hp2zh7m8sObPA=;
	b=HtdWb82G5zQkpA68ouf6UH5dh8CDKtDKpSW3/mS+wtaQh4NDizUO1L1EhL0VDwmZGKr9f1
	VXek7LWdJ5bKMWnFJBNcR5ReS8OoN1DoCCX/LZlmYwn8eno7DbcpuJC1slkfnL13Tj4RU9
	CGDOSUKPkk5qGLH7SkBdenVpDDsvkBnSGlQWJuXSYwI6U3n8YBsk2ryUCb6HHmQ6l8vkrH
	iNQbu0I96Vf/wtR0vVkyKadRyczKvxKvrKUirBY1YhlxTrD8WK3fP1uR283QlRb+wkjmu7
	uhwY2T7Oo7sYbLyL9twz1LrebYswzXg4R8fokR9OM9ML7rPk/ILbaDcseqN0VQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 5/7] dt-bindings: vendor-prefixes: Add SmartFiber
Date: Wed,  7 May 2025 13:44:58 +0000
Message-Id: <20250507134500.390547-6-cjd@cjdns.fr>
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>
References: <20250507134500.390547-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add "smartfiber" vendor prefix for manufactorer of EcoNet based boards.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..421fd5c2e41c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1396,6 +1396,8 @@ patternProperties:
     description: SKOV A/S
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartfiber,.*":
+    description: ShenZhen Smartfiber Technology Co, Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.39.5


