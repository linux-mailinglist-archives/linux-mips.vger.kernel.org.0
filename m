Return-Path: <linux-mips+bounces-9343-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2BBADC857
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 12:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90AE618990D8
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 10:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9C52D12F7;
	Tue, 17 Jun 2025 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="CJpMQB0e"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CCF2D0289
	for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156268; cv=none; b=Rgzc7UhBgB2CE31TilecYzMdYfvvSCyvgRecLEMxYamt7zTNSsRcOJR1dyqQQdVjfdYMzVZ+cLhY4rvN8pGinQbD4RO4YgYOz+TfY+RgaOXSQ6ZNinKoLuWUX1DlbPnPshZ5HHxWz/Fn4/BrrT6XXIVNmtygR+B5U5wLs2zGkgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156268; c=relaxed/simple;
	bh=TrO2SFjGKBK1TwkijXcscyMw/RsP3DJJ4iYMXoLZjYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ChjV5sjkAu0lAZG3zJBIZsRKJzYvE+/dQ/yVY/dwDW9C9Hh0jxrxrDa/PR8SKGo/X7sJ0Fk7gH8MaQ3vNjDFEdT/DgHCXGtGkfTrU6o4j8uAEW8970y24VAk9+2bYu0dQtAo+CS6sAoVPRshrShXa+ClO21slEYx/Qxc8H1L45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=CJpMQB0e; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45310223677so44804025e9.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 03:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750156265; x=1750761065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EIhw+Rvhc6cZiuD+svHBrLE+9XGVyIueYFgEdxmfoI=;
        b=CJpMQB0ereSZWBP4xZJtNUEs0BMJ1uDLceNv9/mpJZEKxJP8/qaZBOEcCviDhFb4kR
         iqbYBaYHcVi3e63RgLMLbuioei/V5p9XGaffvsZ9gPeFuRs1QgL9mS6oQRhtl3r7l5jr
         kakcondm0AYmSxI7zsZ+s8AbjNVthJwe0xkwRGw9eSqxVno/bAhPcg002xMlejSnGwbl
         QQSViGWmBvXYTgD4E189aeU0De80vsaJaELTLQkjK/FLXrzBfXPCP/OMFD5aVwp7vPg5
         MZfK09y3Ad6AmXvKvxX/QCVm8VXkelDD+Kg2JDP9zS6WjJ0CI0k8fMeP7tznffF4fSY3
         kQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156265; x=1750761065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EIhw+Rvhc6cZiuD+svHBrLE+9XGVyIueYFgEdxmfoI=;
        b=VMkRIZXSUTU2TWGzJBPMArMRvS3qE9gt13+D3pr8RAPTEnXvyhRv7a4RjjYxMpxGfP
         st+epDzzBbZ1y/CPJZqeX9ybCWYwto97plVVO2A8UgFOgCOOOeRpgkfYevmB4tlxDEP4
         zLFqyh7czdwiu5ftvFvuU5LXrepB/JXRar5m93Nue9/OGS2glMy7QA8Im0CAwBOeWW83
         i6XW38UEabPV3T8VZ0KIsyFkKhVxCRpjTrUPmub6bA1Ad1hWOld2HyyyM4rSUdI0UCvc
         lKcIaH7k36rtx45lkyN7hFiQnxQL1RKu8keq8lFJeR3dyBWWV16R8JvmG6L+LSUk2LGi
         heeA==
X-Gm-Message-State: AOJu0YxecvgfgGfBw3BcydRDJ3TTKV7j++iAmBhujZoe0sGJO5pZBt31
	Homv6HYPWqQxfHwaPUcqBnmGZzW8Wz/3jdJzrm3zlMmD89BR2zcJHxK4Q5v89Y1ukeTukHTEAel
	M1Q1F
X-Gm-Gg: ASbGncuTJrFFoUtwZgkTJKCcarUUoxdrkf37MMZdBRhFEsnygWMRVMicO55PGfxIYdO
	WynaACwBh/yEo15plfLuLfPaEkYakKr66D9OrhL/MgAWY+dg6KAbQzJ+RYFFo9fLEoZ3SfvcZaB
	7oKVoKtkly8V3LWiMyZAo9EAYZk69j6/9DcKYLoY3Evaowb8ojEJIjAcam8LESx62bbA0q13jrU
	68q/96PcjFBX67rl2eRIic9jBOWoHM5rE/GNa0S9YnsMM4WM4eWgu6NGWWL+pbK8T/tY8HLB9SU
	X6E5QXi3KD9srXM5YZ7Wq5vQHwqldJ4YSlWp+DbJnllH0roUC2rhZlrKLHw=
X-Google-Smtp-Source: AGHT+IGtDKpHFy5WHmvYJBL42JR6U9VDIK34mA7pSWjqK42F0jExFwDeVF6E15A9/TbCdRZsiBlyXg==
X-Received: by 2002:a05:6000:3112:b0:3a4:e480:b5df with SMTP id ffacd0b85a97d-3a572e79749mr11186526f8f.44.1750156265412;
        Tue, 17 Jun 2025 03:31:05 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:b1a7:bc8:262a:3102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e16a097sm176749215e9.33.2025.06.17.03.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 03:31:05 -0700 (PDT)
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
Subject: [PATCH v2 4/4] MIPS: dts: ralink: gardena_smart_gateway_mt7688: Fix power LED
Date: Tue, 17 Jun 2025 12:30:58 +0200
Message-ID: <20250617103058.1125836-5-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617103058.1125836-1-ezra@easyb.ch>
References: <20250617103058.1125836-1-ezra@easyb.ch>
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
Reviewed-by: Stefan Roese <sr@denx.de>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
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


