Return-Path: <linux-mips+bounces-9431-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D334AAE0EA6
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 22:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA214A0C6D
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 20:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F042423814D;
	Thu, 19 Jun 2025 20:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="bVl5qy8l"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99B258CC8
	for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 20:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750365312; cv=none; b=Eg8jW/Nbv7aZOIvomIChJvb3ydls18TgQyDYJ2fANCzlD8zH6Ty2VQQvKc4hr9gx8EyoMQnShc8Az3oK1ZdzVrMnCZdSdmAqzwjxnZafsETBsx+s0SyMajO3ZwYfwWPHp/2hA8q7BjpS3tHYPrij0q+Xia5O8cb2VIgL7NeXvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750365312; c=relaxed/simple;
	bh=xXOn0HsXOLMhwrK8hxGYgemk6ajiFApPGs1BV9Yy8Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExBmNE93kKzG0Ua59AnzeHravi+vhwhQJ4Fq0nRdISQbZoZSlAMei8RbGaLxWNUBsrg1KUO/6sfrX4xKapbH3lk64MNITp23Oxmdfdyzoj3XI2YWt0Z6unE+yzA6zg3ZbgainamBNRzF1oEQ8KwOWo4G2ZKiWjGReI6M7VKMKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=bVl5qy8l; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450dd065828so8643725e9.2
        for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 13:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750365309; x=1750970109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGE4KFMiA3w+V5SFnoNxn7J/yaSX/gETYA3wlTGQnvE=;
        b=bVl5qy8l/d7b0xNBebE7U1lzN3Qud7ln4E2gsDDan2miMGMxqMOebG6MCGXAtzdjFx
         nMSo8n0lRQqHHX6ATQ/Sq9Xxjzd+J4ziPYeNozYLY3LQFvn2DEgz5Q8ldBKthg156lyD
         U4ErYnamDPN1eLqGufC3Hpuq8OvwYINK36lTPp09wgUhubXsrx3Ua2p1tbdds1T24RJM
         yGWohOzTsusNZoJiJsD0XFf24L9V1D5sE2DgpSnS+oIDXUWZLP+D9dS0U9kUpTstNqbh
         9y1oSRlRqNqeVd39Q7egdHgaYHRFkTyMUB2jibtJXWAL06xDvGMJ+qLpcIHqFm+GaG59
         mTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750365309; x=1750970109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGE4KFMiA3w+V5SFnoNxn7J/yaSX/gETYA3wlTGQnvE=;
        b=GUlv7uch6MlgAiFUnBZXutXOQ8+BTOalsyvRYgr55/hjcEzDLQTFlM3V9/LDlSL+C/
         00zn9JPYFTMpyBAf4H6ba5Kar7w+ulN2jQZ9qvziXn7rSx/4z3oouNaTg7kNRw/FQxWE
         gVBC/cHBorqMKW7j78cIvOWAKv1/l0e8sQKeXPEkoKVPEm3B9HVzw3yZHfJXiTKiLufj
         ZrrS3FP+c4hmJsTOE4/o06K8FrZAe6EWJ3H3nYbvaQ/YVCBmvuaXDVTinbxph9tCOYSk
         +osQF1OMjc2qjH8b9Orz1ZzZwfLvJybqGxcd7UkzDd9xfdezOGuL6T6mLtWrs0nkZKSA
         2YyQ==
X-Gm-Message-State: AOJu0Yw8Y6Xyo2j/DH1FQ5HnjpbwH2yyhIxELQlPYH8JR0JhBjitePN/
	x9M3rm7mOdJ0Bilz3d5fEoj05gop08BOJb58Wg5p45bFUrj8KmzoE9ws0np3d3qzzTTH9mrsuh+
	fdexg
X-Gm-Gg: ASbGncsNLdybLWrWo88wgAIOf7/+FAMuEe2Ee65lotfJVH59xmQYa5xw+tX2mcGNUVW
	xppn2319pmuVKigSAOU/x9rIkR26R6zpkaYCY7XbjCtZwoWLmiZe8U1i0DytPFUuI/qX3UIKoi6
	xVXEm+V/u+XftvZ8VR0pj0YSTEHTMwlW6oUk6SeVAa548nzuWE4Nk0EzYe3uNh06kz0fJB5Z87E
	fsJocwelgogTrwHsABv1jaFUljy4U9HsvI6RUHY5jj+eG+JK99aJuJOCM3WkxeBIdMVmauHGdIb
	/8KslfEEVB3XAU5Zj5vo3d2PSoJYOaR4Dm71qYsISzFy8xb+PpVChkd+3zcA
X-Google-Smtp-Source: AGHT+IGTRuDsJQhGE2JsFOOf2cSPgq8KRfMogQt+8xubaFrCIb1LfzJh5AqVuEeNoZ7tBfsJjgbAew==
X-Received: by 2002:a05:600c:6305:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-453654cc279mr1601115e9.13.1750365308756;
        Thu, 19 Jun 2025 13:35:08 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:a60c:e454:f09e:79d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d91bsm288495f8f.42.2025.06.19.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:35:08 -0700 (PDT)
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
Subject: [PATCH v3 3/4] MIPS: dts: ralink: mt7628a: Update watchdog node according to bindings
Date: Thu, 19 Jun 2025 22:35:01 +0200
Message-ID: <20250619203502.1293695-4-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619203502.1293695-1-ezra@easyb.ch>
References: <20250619203502.1293695-1-ezra@easyb.ch>
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


