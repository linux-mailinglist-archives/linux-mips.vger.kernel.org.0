Return-Path: <linux-mips+bounces-9472-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B4AE6409
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 13:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B67807A1B98
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 11:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB84291C0B;
	Tue, 24 Jun 2025 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="kb9zP2YH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A892B28ECD7
	for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766301; cv=none; b=nyh8oOWwSTS6E+7XBo/sKBM84kjvAOX+jzWwGeAV+U+2gU6aO4JAWBzBWpG54ZOX37bBHyvlZmu6eMp0AZK/J3Y9fH4niZhk6a8XyJv22Xn9Eo2CmS8m5POcxpQggiX64HhGdw/6/romnqyKa8038MsVwsb7tlzeYS4vB1DFUow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766301; c=relaxed/simple;
	bh=xXOn0HsXOLMhwrK8hxGYgemk6ajiFApPGs1BV9Yy8Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBVnpfZaNUpYLttMj96vduxVF78OTFnHWeJjFb1+FCtEvxIheJlX3rt2KdUjV37he+nwrXG0Tdse9PWQW26u0ScODLFDooumwTMa8+QWj3xOXRAC6vbt8cy+WJ6EORqzCJQ6bGBU795AZTyQgEnLf4Uxy1gGXa+m3VKD0Y7luHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=kb9zP2YH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso229356f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 04:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750766297; x=1751371097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGE4KFMiA3w+V5SFnoNxn7J/yaSX/gETYA3wlTGQnvE=;
        b=kb9zP2YHWQZ3aAdo9N1O+bDkRvtT8TrGzuLyCzj9cU90I7ROghIGzBR3sVllElNOoi
         NcRvTwSg9aBEec/V1aKjxmfdWhU3mCiD7zdiPWjoOD67349MN6Xz2oDp8lA7m7iJTIYb
         ZCF3Xeo8g9IwOnvN2ti19UTeLBCVo+EwKUHpN5Do+ExkAhNOZrFQsBHFQOuSuwAwcL/L
         9wrLH4kXp6NtsZsNxOOLzXsesBBLx8MhYbLm/j3T08ksVCzMzE6/o3kQu5hIoVWqeOr6
         3k+Y51gS9JApZnRrX775GqJl1MWXGDQmvOKzLgR8M4aLCixqLLWVX3IU78PcooqZncSR
         BIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766297; x=1751371097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGE4KFMiA3w+V5SFnoNxn7J/yaSX/gETYA3wlTGQnvE=;
        b=MOzLu3LrHvuNN6+lZdcffunN4moHgijEZQibqS40io/oYWTx3jwJjkMtGUjENQqbGN
         AEEaqjvN1vH1bXNruitZ6s2L81VGPVg+6rNBH20Pulz8kzeSKaMo0yz3HRuUrSLrEueo
         P44KUukZrjQz8wLBNeraq+qQdXqk9bWAspSfqI7RgkTMXbRbQGuVkYt1LrYDeuquu0H8
         xNVUpKl36LoN06SDagGchqe/vORDCUoSe7pdlnACeRQAxHa79sBdlG+dab0fNMCcLjo7
         Nw9EjMy2Pax4HSPN8OijVjKW5DRaUn0vgnSujoSu0Z4NwDinv9znQPJdFJ9xTLDgSAPw
         MDvw==
X-Gm-Message-State: AOJu0YzSrmUtdckvXtGT/BqQbzZvnzxeqt3BndvkqwUCx9wQRwdrniT7
	7unmPaswcTDRUc5Wpy+H3cpqjNCzbOBZQIA5NMTsMSf222ww3MvgH58RhBYuGxJOTHe+eE6+nS+
	63trR
X-Gm-Gg: ASbGnctK+mXEzGNTCFOPfUlajlM3WnMx/KvqBcjYFPIxVGR4oK0ZWty5Ds4xH8+Z3Br
	DT/eIE1L9457wpGlLRiX8Z5H0mqxMy5Ud9VoDOCzpitB/dUmiJF2/cye8TovNBB+W2eGAoMIL38
	GKsPGyzrFlh/FncgoDK02MEQ1mxsQ688PKjd72pN71hPNUdP+qHBPyMZ4FdaJ/wLHC12y2BfDWN
	FBRc0CfDCbbYCjAKQf3zqiu3bApbfKzaRIQ67hOVwjL0IZ7Dn3ryopTBg/uLhzwoALS6Qj+4Eb1
	DmsyGEuqPnJ1/4ZgYp95fe3LzxljFtUeiiIY0JR0oVpoALEXgijO/lnwAiNy
X-Google-Smtp-Source: AGHT+IFubDJTKHj661hLTfHQAJpwAc5+Zi+823QflKwgRA6BrUCM8dJiTGs0dTErPXPjhxnZj3//Jw==
X-Received: by 2002:a5d:584d:0:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3a6d1322b83mr12410677f8f.29.1750766296603;
        Tue, 24 Jun 2025 04:58:16 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:d834:684f:62eb:5df0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm173860985e9.34.2025.06.24.04.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:58:16 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v4 3/4] MIPS: dts: ralink: mt7628a: Update watchdog node according to bindings
Date: Tue, 24 Jun 2025 13:58:09 +0200
Message-ID: <20250624115810.37851-4-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624115810.37851-1-ezra@easyb.ch>
References: <20250624115810.37851-1-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Most notably, add the mediatek,sysctl phandle and remove the redundant
reset/interrupt-related properties from the watchdog node. This is in
line with the corresponding devicetree (mt7628an.dtsi) used by the
OpenWrt project.

This has been tested on the MT7688-based GARDENA smart Gateway.

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Reviewed-by: Stefan Roese <sr@denx.de>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 10221a41f02a..5d7a6cfa9e2b 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -134,13 +134,8 @@ pinmux_p4led_an_gpio: p4led-an-gpio-pins {
 
 		watchdog: watchdog@100 {
 			compatible = "mediatek,mt7621-wdt";
-			reg = <0x100 0x30>;
-
-			resets = <&sysc 8>;
-			reset-names = "wdt";
-
-			interrupt-parent = <&intc>;
-			interrupts = <24>;
+			reg = <0x100 0x100>;
+			mediatek,sysctl = <&sysc>;
 
 			status = "disabled";
 		};
-- 
2.43.0


