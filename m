Return-Path: <linux-mips+bounces-6588-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0129B7F2A
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB534B21739
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BFD1BB6BC;
	Thu, 31 Oct 2024 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Vc9fnRgK"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5719E99C;
	Thu, 31 Oct 2024 15:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389988; cv=none; b=QgWNbbHvTlTSRdQwyHbeQjXlOrp9RiBM3m1xPia7STMqEhwFR1gdU3lBoSJHsWThFA8NUTiPrn2nd7NA5D3a5tGX2zXY13133DM9l3H3owYUAWhPKZvWDHDLo/sVjuTGSb+szO3P1cxvOb9f5Y//0ZMOOGCFYoLFDUkMHySf4oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389988; c=relaxed/simple;
	bh=PkYmJSqGkFyq+J9VjbWR4RGNmdoD4abq2oGTEVhGWeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UfHJeBTc1lWLG72hAWNmbgkZJ7PX46BNk27g0vFZb8JkUbwdhc3oWfkkwJbSKPilTH0/7+VHXmkSahqtfE+6I+78FBHjuoCwS4O7gX4kNZ3vBAd0IRFimSiHIjQFmBSVj3tkq2cn3AYuFprx9Z4FXHFgTA7dlRHvXV3ATJgDZHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Vc9fnRgK; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E5ED1C0005;
	Thu, 31 Oct 2024 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QBvTtImYlxXqwUMA99jcUs5VY9iyrwJHK1o1kNXV6w4=;
	b=Vc9fnRgKDS7EoIhinn4okK1ZTylvYIrkFznGWMCERKaQ7ttruauh7Fi4FElCXhsvcwevwj
	6/VVWAkwkIEaH86CnrL890HEi2Pb/Fmt4EjRI87gihuXdJ/3RzBRXqO7p026yyi38TEJp9
	lVLkbn/CWN0GXb2n3CMzaNqBm8Zb1yKeBaG7DdNop6zFynQ9dHInLtqt3D+I0fdGSUfQHM
	xlNU4u5KsatM/WFzM9hn/RFRIT5rdDeCij7Uo9r/VCgLM60JYyREIDuzo6Z+M9smy4zJCj
	QWkIFATE7eKzzHfX22d5x7PDiNeT0ecB8JhZ0YPN7wPVD9PkG10qZ308xitHsg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:52:53 +0100
Subject: [PATCH 03/13] dt-bindings: clock: eyeq: add Mobileye EyeQ5
 peripheral clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-3-89d8b28e3006@bootlin.com>
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
In-Reply-To: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Add #defines for Mobileye EyeQ5 slow-speed peripheral bus clock (OCC)
and UART clock. Internally, those derive from EQ5C_PLL_PER.

OCC is standard naming convention on this platform.
Its exact meaning is unknown.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 include/dt-bindings/clock/mobileye,eyeq5-clk.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
index 359f7cceaadb368998db714344595f0449963536..7d9e700b5e59573c45919865d9c68a9e8cf6a9eb 100644
--- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
@@ -25,6 +25,10 @@
 #define EQ5C_CPU_CORE2	13
 #define EQ5C_CPU_CORE3	14
 
+/* EQ5C_PLL_PER children */
+#define EQ5C_PER_OCC	15
+#define EQ5C_PER_UART	16
+
 #define EQ6LC_PLL_DDR		0
 #define EQ6LC_PLL_CPU		1
 #define EQ6LC_PLL_PER		2

-- 
2.47.0


