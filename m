Return-Path: <linux-mips+bounces-5731-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B798C185
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2024 17:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B8631C242F8
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2024 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332801CB320;
	Tue,  1 Oct 2024 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrT7u8ys"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733581CB31D;
	Tue,  1 Oct 2024 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727796287; cv=none; b=B44D30X4p3k+WdrmYSKz77I6OS0zVQzzCrj6Yca02RrUpOJnJksIh0qrI+R5h/Qv1tiwIDAs+ee4zBoaDdSFVtgwd3pCXAaAVxWSxo/gmBi6JDkYDvTWoIMumK8l0NIgRXyO5wq0yCIx/ERblxnmz18fWa0bIHB9ie6XQqazXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727796287; c=relaxed/simple;
	bh=jBFCuKXqIo6gd5R46Ijk43ctP8kU2hUIGzImwN4euSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8e5l0WL/KEDdmUFqLb0s2e3Xs3Ya2cvqeZ5yIvzibshvYGgs8HxCNoHN5Q563KAUjuXuMywiE+8fx2fwewpDnKttnfX+F4mJE93G8UeabgdTxq75C1BYH22sO5T5VoLwpckIiyW/Hg9AqIRc8cQt4ojN05+XG62MesYRkj/4Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrT7u8ys; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cafda818aso54479795e9.2;
        Tue, 01 Oct 2024 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727796284; x=1728401084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts8opjQWqr5XRKIeCryo93gnWbs/EAFRANxC/IOWkRI=;
        b=WrT7u8ysN/16k1Xyxw+3Ay2EAc5eXL7CiMvGWn605rie/CYZ99M0CPLHFsnqafM9tF
         4ZHlZ26rpwGVzRuIv+J9NPpnJJrdgSWwERGx3iotW2Ea+gxlSYAcDrS7J2VkenJEKF+7
         QWG/B3etY7kevYC/pCDh3VUqKdOLfwkTe1DyF/+8LKT1UoiB960r1SfOWk9B0bG/c7z2
         492ViPSrlMPRvfqjebeJ5/rLtT7VOly4tZxlm/BImVEHWK+Msu277bbu7vELOp0pcOJC
         TS4Wuxe10rA8kfs0801oi1Q26tMQZsdFcdIcZ2XqXPaPxRUg0stgrx+bLGryCfDijxgS
         SHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727796284; x=1728401084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ts8opjQWqr5XRKIeCryo93gnWbs/EAFRANxC/IOWkRI=;
        b=Z4ShjIHlzjeKfSe5mskSo9d9BXTWg7A1gQerNqbEt6WyQXO9FwI1ET/1SIbXKaAS88
         QyfCgMBrFCoDTpagt8+rKkNxqKMGq1Kf2vMms8I0OiA/1dzy/hFxC0cCZ11ksKtNA8Gj
         Ck58w1DGJZeKgbGGIu2J0SHODuWx+k1j85Id1ygd4s3Il5HR9XR0ZKcc0Eb0RrWYsDGj
         49W+A+u6zYZuaqUm3btM6+SBZk+SDf0ify1FJWVYO/pY//+oY8BJ2fubFKpJGk4YsdkJ
         YgJUWaOuEI7doRmG1/WO5J9O89LJdo6F/IwSO5XY+Vmm2Hu+/0EtT622sEQTUOYYKtPC
         3m7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQb/mobCtRx4sDPGlmj/zmEYgl0JT3Jc3fX/6UZJ9/b/ZNJKSuDX8h2k5SvC3PymbYXYvwvpIwqRpK@vger.kernel.org, AJvYcCUghirIuP/GEn9NrRMu8ql1T/IiwsKxMGmaoWNE+SIgHfFQoqili/aj1TTZXRsycG2zYdE4id3PUqha2w==@vger.kernel.org, AJvYcCWz5QXZcICIfVh0uFQjnBlfzRTupmENaafFJ5z/08OoWqwqJXLgtIFiLl17z8sWyRNSaqa24gF5Sx4mFihX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2cVeGiGfKiZC/GsWg7W/tmFSkvdgJh4/Jk/YtTXnK1CxiYKoi
	N7WexpqEsiNK79ozdhGb/SgbL+KHMw87efhAKVufePCftH5Y2HAx
X-Google-Smtp-Source: AGHT+IH8rynOwUzsnyM6pEQ3H3r4yYZ51LGcYvrVKy2Wys8WA15Znq1t0LUWkWvuT4Rgwp/wfMpPrQ==
X-Received: by 2002:a05:600c:4453:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-42f58490733mr104259445e9.23.1727796283392;
        Tue, 01 Oct 2024 08:24:43 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a56fd1sm179988115e9.48.2024.10.01.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 08:24:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] mips: bmips: bcm6358/6368: define required brcm,bmips-cbr-reg
Date: Tue,  1 Oct 2024 17:23:59 +0200
Message-ID: <20241001152404.15830-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the bcm6358/6368 SoC the brcm,bmips-cbr-reg due to bootloader
misconfiguration or HW bug from running the system from TP1.

A workaround is now present to handle broken system that suffer from
this bug hence add the now required property.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409251520.pE12GzHd-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6358.dtsi | 1 +
 arch/mips/boot/dts/brcm/bcm6368.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index 777c4379ed03..5e487f66c343 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -13,6 +13,7 @@ cpus {
 		#size-cells = <0>;
 
 		mips-hpt-frequency = <150000000>;
+		brcm,bmips-cbr-reg = <0xff400000>;
 
 		cpu@0 {
 			compatible = "brcm,bmips4350";
diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index fc15e200877d..087f3295a14b 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -13,6 +13,7 @@ cpus {
 		#size-cells = <0>;
 
 		mips-hpt-frequency = <200000000>;
+		brcm,bmips-cbr-reg = <0xff400000>;
 
 		cpu@0 {
 			compatible = "brcm,bmips4350";
-- 
2.45.2


