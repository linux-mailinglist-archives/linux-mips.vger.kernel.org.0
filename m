Return-Path: <linux-mips+bounces-9262-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3280FAD5F47
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 21:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62F5A3AA0C7
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 19:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B0A2874EA;
	Wed, 11 Jun 2025 19:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="Fz9o7dDm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AFE2868B8
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 19:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749671246; cv=none; b=LheGRVPwv/fEN8CLDxscgtoz11a0FXCd37LDpxoLYZhXI1U/BpTPWcOrxDO8iBOY0ZvHiGFVQqiLYA2AQJHj7sFLE9pCazqnW9J9i8S8ZgznEP+RqcoYVuMaseuRa3Q4X/5M+K3keS81kSToEb4iLTPH+OMz52bg34KQGobVRS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749671246; c=relaxed/simple;
	bh=xO/wrwe33YqXeitLbJg6/NkUqkrfpbwsyauCSJUgemM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1BnyLHx4mm9NM7dzrjKmh+IlSUJ7W+EbRVxR5z5Esg76JRq4GE/qI3H8GQyCcsMDRqeCOY6MjJerIuQzR5iXfJ0TtDlpCl8bMtMGGNIERHJNAo2+uINE0Dnm4PDkF7LPkYmYUHe09z9TOrhAcfJvkGSfMK3fmiE9TH5QS+6QEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=Fz9o7dDm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso159083f8f.2
        for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 12:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1749671243; x=1750276043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4r4mKHcZW8xBTgBZ77uu48fPSSUh+iVSvsgFeCmYGM=;
        b=Fz9o7dDmhy6Z4zBtKr8RqCtxjscBBac3NU6JH1GOxTm/m4yKyaYzJzx1mPgpR7kkzc
         NUhfqXWzZ4Y9hyqUYE6DcHi+67VfLa9qCHjoC0Di+CRa0l/F4EO6g/N9q4gHnlx1Zrom
         zP05js3eWl1m3AWXQlb5HkYEeiXMbRIunTYaeyD1sn3HUCi/tAiCsts0Hlr/7pMips64
         KHWAxvSdOr1nWTbP85GhUD4KuhxVimCE53gJ+z0GOcDSod4SlWES5KbH84UsCBtVXFb7
         KkSnD4UP6XaTSa7k/PVb7glHMWzVKLHXxV9i/IWsVhwV9f10+54GeQM6xBq7VOShdZc+
         6K9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749671243; x=1750276043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4r4mKHcZW8xBTgBZ77uu48fPSSUh+iVSvsgFeCmYGM=;
        b=EZOh+vyCCcAb7tt185X9IQSI7VXWHstLCfuWaOUhp0LtRvsWRTLjf2NxhX5zyVCYAp
         WQdh8QGF22093kTBira/Y7dPno0oHPq6SdleuZsYtaMYQyAGd+alNRgHs7U6g4EVB/XP
         RrVYDnOUFeVvg7QWBx8qvHLEU47GMbyB1srQ4BOIhTWenFtM9w3Ew6A8mI7FA6gilub0
         66KqjGavwBkscxBN/GP2ylipIMhYeUAHqeavA2o5rPGrbJiGyU6HiyocjDK5+DQuiAyP
         quQ4r+X3a/tdvbb+/CVr0fEu+LiSt7N1ao2SIy7a9186m60YJvx4Z0qTGuqixvuKSk7i
         G/ZQ==
X-Gm-Message-State: AOJu0Yw6CaTb5Q3NnKxfTJl4+SjAbJf4/F/TIL+QuPauRuojt9luh4pX
	MtCKQfJ8F3/XBFbaUqzhX8ztdYlHN2h0LtgTuLWnUgqSS/xcXbIH9HqG6x+QaigNj0QGLhHGS3Y
	4rqr1
X-Gm-Gg: ASbGncuTQUO5t4VxOCsdNkN7p2S8HPSbJZb8RzkqzVv9nId+uod/PdFKy9LMeqfNbIl
	Bhdhp9ks0IW+yykSZHNu1yDVyZsmaxcj4R7MAmljva9f3QUFVJURn0hYEq0qZg2UhjN8dYn/fYm
	6r/ntZ0/oHbtu/UX4Gxj2W/9zeAjFsRmMBP6IuoNWfXb9P8O5WQPkoQ6OTMEiumxOggKELNer2W
	XZKBQ5/42gAv03JzhMZmNuViDcbWTOrqBUV+oirOPL9Z5xfebfQuv+SuEGhRSJTTJ1gNXEaaIZ5
	HUfBWDfqMi9OgFwQ5aKc6/3DU5I9uH/qPxw7Gqg+ZSzkhj48OaEM9xFsfJIo
X-Google-Smtp-Source: AGHT+IFDW984aYodK6mYa1fkvCYYHSknt4AsK43TrgqBHPL32oCK3xxKtQ8WK8NadEIzDVUN/k1PMw==
X-Received: by 2002:a5d:64e6:0:b0:3a4:fc52:f5d4 with SMTP id ffacd0b85a97d-3a5586e983bmr3639098f8f.47.1749671243445;
        Wed, 11 Jun 2025 12:47:23 -0700 (PDT)
Received: from fraxinus.home ([2a02:21b4:9a83:1500:4cac:8ba0:e616:6d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fceasm15949433f8f.82.2025.06.11.12.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:47:23 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v1 3/3] MIPS: dts: ralink: gardena_smart_gateway_mt7688: Fix power LED
Date: Wed, 11 Jun 2025 21:47:16 +0200
Message-ID: <20250611194716.302126-4-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611194716.302126-1-ezra@easyb.ch>
References: <20250611194716.302126-1-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

When starting up, the GARDENA smart Gateway's power LED should be
flashing green. It is unclear why it was initially set to "off".

The LED frequency cannot be configured in the devicetree. Luckily, the
default is 1 Hz, which is what we want.

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 7743d014631a..0bfb1dde9764 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -56,7 +56,7 @@ led-power-blue {
 		led-power-green {
 			label = "smartgw:power:green";
 			gpios = <&gpio 19 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
+			linux,default-trigger = "timer";
 		};
 
 		led-power-red {
-- 
2.43.0


