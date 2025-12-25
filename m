Return-Path: <linux-mips+bounces-12597-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D2CDDA73
	for <lists+linux-mips@lfdr.de>; Thu, 25 Dec 2025 11:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D80D30072AE
	for <lists+linux-mips@lfdr.de>; Thu, 25 Dec 2025 10:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1ED31A81F;
	Thu, 25 Dec 2025 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKrLGr+j"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF7C31A57C
	for <linux-mips@vger.kernel.org>; Thu, 25 Dec 2025 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766658381; cv=none; b=MlYiWG+oj1R744M2WjktS6oQKhSv9Xug33pK//+uGRqQKsXhn2ok0y9KQmatfUIYB6PFWQM0e2lYD4GMO8LaNy+UJ6gtYQh+c3VI4FNspfgWs0pNK8TsuIn+GLPVtZHFOokVaywU2u8EY/kS3kqRwIV3c62W8X5NXG0FLBaHNO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766658381; c=relaxed/simple;
	bh=0SCMMhLFUL8eSdcIdgKvcOi5bla/TKQvmrbo34ohGaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHwf6lQrxgp9G1qPY5MeGxLLL2zTWf7TVRG+1ysxHlgoVKZY2AhlccCs0lA1zIjW4eVqTt9yfFIPxZSpI/5bOKchJMGkLMEJbIFaauoi01KfcRu/BsyIBFtMz4lVWhdjWxRApeFS1oXRvICjfYQhVwuOz9TbqpQecj3KINqoNw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKrLGr+j; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so958702266b.2
        for <linux-mips@vger.kernel.org>; Thu, 25 Dec 2025 02:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766658377; x=1767263177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2++FgtnfO3AA5+lDQwKDweGeQ+SKknf+ji2k3HfukE=;
        b=dKrLGr+jH/arDPgwLUsqivCF3lj71yDaok8/Pm3314Co4LajuqKCysYkDJsb7skOgQ
         +UYfRVisCtB+qOCTWJWBzStomR9tbWpdSocCWZoroafvv1C2neCW5UwwQhrR8m3YaMun
         hpVivDK/1FOPPwHmJr9/E0GcrFyYML2OXbUGAsREplXcuZh1jPfZj+lyWSOy2auApZy0
         NtU8vE3nT2prUBT8kuK5a8GHeO0sBFUSCRMAEelmLY0ZxbtJupxk/PUVB+ez2sUq6yHP
         tCCYIs6RUfQg7f41v5rPkAehXAgTjr31ReEzTlwr2eUlkzYxSG7a5lDxbIsGPtcJNM0e
         EZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766658377; x=1767263177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k2++FgtnfO3AA5+lDQwKDweGeQ+SKknf+ji2k3HfukE=;
        b=qmYpLDC0K9IEjDqLiWBQRhPbqVzOEWNaw2zJMWbl1EYpkvddngDVF3Mt6s/KNYMruQ
         EOe94zQRPcvYOOfy8m2XZ+Mhwijk2Yxyqv+YeVqOkUuOov5nGtVGhi2KlRzZ3uOQNGqz
         v069reQTnU/4FoCgA8nJCNR+L/Oaf8mMI7d2dWG/PN1vPQLX+sX1E0OL/ILfA7mO0gks
         TJTV/qRtAz6VMwj+m0OiITjhhatajX8k4vSBARhePqClpEWbkisbG7f1T+K0NfvLseYP
         OjbSQba/VGAjSYgmjBrvKNAbS8D6ZNR5egz/RUTuuAQirLuzK1seHRWmsUlLgGKxGZiw
         c4YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVymQ8FghU7w2qbbZ04WVm64X4Pf+awJXBoYCnTFgn7dFLvMwyRoeZ5HKKB6SPvKg7Xn2SUnRYgjd07@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWQvSGbQPKNq/Onhb242Tz1txwWSKj6AA047Zqubgh9nRDtRx
	fM/utUrEzV73xmaQDs0pPYY9nbzSmFmgp0s4giFB67iS7MqYltZaSwQV
X-Gm-Gg: AY/fxX5Wnema8HrJrzqt4qspGe8hMuW6Xj2cDXORLwZ7rfrbqjweOjBkaCSObqWShzN
	CGzBU4RyfhA81QTxg3Kr67WtHLcaD94aP8w/mK13RTne4oufDp7xaip1sGX+IRbLirGS9hgpGxP
	fyvE6rxs/lBY91lXgNIAx4oO50klHJEDRVUZcK1MRe6ojXEQkXC1IFp44giYtp54subW/rtlMC9
	W3mGASAPClQABo8PTvYbvWTJTu1TUrQE1BlZ0HKtEwH5rtng7vdIse/f+tr8q8LVRKY1ITsy2PA
	jNlBjCYm7taCeqdPnuIaJl/IzY8E7ITybzJSFzouyb41MvSXBSGXFS/nwcs1nB4pbEKE+Gg9fp9
	4xhfzzAl6FZhFZ6EMcEcqU/CCbUOFtY8TI0y9YYAr6PAVlUQHJ7wBVWgt6WBckaF/+DQTajn3xJ
	/dMZg4YZ1ubLeXqzaLkvWG8G3ocjIOJPnJytyXDrvFv9QhvAHP3TZnYclRCVEWUNyIFg7acgWJn
	84LRA==
X-Google-Smtp-Source: AGHT+IHJV5bDP8x6sjTalbPe1zBoWepD9Og5siig6WOHvYmmjUzMB0zVBYec1xGuONiy2xODt5Lhrg==
X-Received: by 2002:a17:907:7ea2:b0:b7a:6c39:8e73 with SMTP id a640c23a62f3a-b8036f12f2cmr1830270366b.23.1766658377314;
        Thu, 25 Dec 2025 02:26:17 -0800 (PST)
Received: from localhost (dslb-002-205-018-238.002.205.pools.vodafone-ip.de. [2.205.18.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b372esm19689909a12.32.2025.12.25.02.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 02:26:16 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 2/4] mips: bmips: dts: fix {m,q}spi compatible order
Date: Thu, 25 Dec 2025 11:25:31 +0100
Message-ID: <20251225102533.30772-3-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225102533.30772-1-jonas.gorski@gmail.com>
References: <20251225102533.30772-1-jonas.gorski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compatible order should be from most specific to least specific, but
the {m,q}spi controller nodes had theirs reversed.

The actual order does not matter, as the brcmmstb-qspi driver matches
both, which than calls bcm_qspi_probe(), which only checks for the
presence of the *-qspi compatible.

Fixes warnings like:

arch/mips/boot/dts/brcm/bcm97425svmb.dtb: spi@409200 (brcm,spi-bcm-qspi): compatible: 'oneOf' conditional failed, one must be fixed:
	['brcm,spi-bcm-qspi', 'brcm,spi-brcmstb-mspi'] is too short
	'brcm,spi-bcm-qspi' is not one of ['brcm,spi-bcm7425-qspi', 'brcm,spi-bcm7429-qspi', 'brcm,spi-bcm7435-qspi', 'brcm,spi-bcm7445-qspi', 'brcm,spi-bcm7216-qspi', 'brcm,spi-bcm7278-qspi']
	'brcm,spi-bcm-qspi' is not one of ['brcm,spi-brcmstb-qspi', 'brcm,spi-brcmstb-mspi', 'brcm,spi-nsp-qspi', 'brcm,spi-ns2-qspi']
	'brcm,spi-bcm-qspi' was expected
	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm7125.dtsi | 8 ++++----
 arch/mips/boot/dts/brcm/bcm7346.dtsi | 8 ++++----
 arch/mips/boot/dts/brcm/bcm7358.dtsi | 8 ++++----
 arch/mips/boot/dts/brcm/bcm7360.dtsi | 8 ++++----
 arch/mips/boot/dts/brcm/bcm7362.dtsi | 8 ++++----
 arch/mips/boot/dts/brcm/bcm7420.dtsi | 8 ++++----
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 8 ++++----
 arch/mips/boot/dts/brcm/bcm7435.dtsi | 8 ++++----
 8 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm7125.dtsi b/arch/mips/boot/dts/brcm/bcm7125.dtsi
index 5bf77b6fcceb..92963a1998b7 100644
--- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
@@ -247,8 +247,8 @@ spi_l2_intc: interrupt-controller@411d00 {
 		qspi: spi@443000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-qspi";
+			compatible = "brcm,spi-brcmstb-qspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x440920 0x4 0x443200 0x188 0x443000 0x50>;
 			reg-names = "cs_reg", "hif_mspi", "bspi";
@@ -267,8 +267,8 @@ qspi: spi@443000 {
 		mspi: spi@406400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-mspi";
+			compatible = "brcm,spi-brcmstb-mspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x406400 0x180>;
 			reg-names = "mspi";
diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 9d6f97e02ff9..42125684b523 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -471,8 +471,8 @@ spi_l2_intc: interrupt-controller@411d00 {
 		qspi: spi@413000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-qspi";
+			compatible = "brcm,spi-brcmstb-qspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x410920 0x4 0x413200 0x188 0x413000 0x50>;
 			reg-names = "cs_reg", "hif_mspi", "bspi";
@@ -491,8 +491,8 @@ qspi: spi@413000 {
 		mspi: spi@408a00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-mspi";
+			compatible = "brcm,spi-brcmstb-mspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x408a00 0x180>;
 			reg-names = "mspi";
diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
index 6375fc77f389..fdc52acab8c8 100644
--- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
@@ -339,8 +339,8 @@ spi_l2_intc: interrupt-controller@411d00 {
 		qspi: spi@413000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-qspi";
+			compatible = "brcm,spi-brcmstb-qspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x410920 0x4 0x413200 0x188 0x413000 0x50>;
 			reg-names = "cs_reg", "hif_mspi", "bspi";
@@ -359,8 +359,8 @@ qspi: spi@413000 {
 		mspi: spi@408a00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-mspi";
+			compatible = "brcm,spi-brcmstb-mspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x408a00 0x180>;
 			reg-names = "mspi";
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index a7f60f059e50..e8b0b0ff7588 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -390,8 +390,8 @@ spi_l2_intc: interrupt-controller@411d00 {
 		qspi: spi@413000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-qspi";
+			compatible = "brcm,spi-brcmstb-qspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x410920 0x4 0x413200 0x188 0x413000 0x50>;
 			reg-names = "cs_reg", "hif_mspi", "bspi";
@@ -410,8 +410,8 @@ qspi: spi@413000 {
 		mspi: spi@408a00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-mspi";
+			compatible = "brcm,spi-brcmstb-mspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x408a00 0x180>;
 			reg-names = "mspi";
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index 2d483cbf254f..a1ed0b193389 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -386,8 +386,8 @@ spi_l2_intc: interrupt-controller@411d00 {
 		qspi: spi@413000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-qspi";
+			compatible = "brcm,spi-brcmstb-qspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x410920 0x4 0x413200 0x188 0x413000 0x50>;
 			reg-names = "cs_reg", "hif_mspi", "bspi";
@@ -406,8 +406,8 @@ qspi: spi@413000 {
 		mspi: spi@408a00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-mspi";
+			compatible = "brcm,spi-brcmstb-mspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x408a00 0x180>;
 			reg-names = "mspi";
diff --git a/arch/mips/boot/dts/brcm/bcm7420.dtsi b/arch/mips/boot/dts/brcm/bcm7420.dtsi
index 9540c27f12e7..62e7e1602d4e 100644
--- a/arch/mips/boot/dts/brcm/bcm7420.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7420.dtsi
@@ -308,8 +308,8 @@ spi_l2_intc: interrupt-controller@411d00 {
 		qspi: spi@443000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-qspi";
+			compatible = "brcm,spi-brcmstb-qspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x440920 0x4 0x443200 0x188 0x443000 0x50>;
 			reg-names = "cs_reg", "hif_mspi", "bspi";
@@ -328,8 +328,8 @@ qspi: spi@443000 {
 		mspi: spi@406400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-mspi";
+			compatible = "brcm,spi-brcmstb-mspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x406400 0x180>;
 			reg-names = "mspi";
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index c3bb020ff2b5..71422fd2ecc9 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -482,8 +482,8 @@ spi_l2_intc: interrupt-controller@41ad00 {
 		qspi: spi@41c000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-qspi";
+			compatible = "brcm,spi-brcmstb-qspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x419920 0x4 0x41c200 0x188 0x41c000 0x50>;
 			reg-names = "cs_reg", "hif_mspi", "bspi";
@@ -502,8 +502,8 @@ qspi: spi@41c000 {
 		mspi: spi@409200 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-mspi";
+			compatible = "brcm,spi-brcmstb-mspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x409200 0x180>;
 			reg-names = "mspi";
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index 60cfa4074cce..38eea5373b66 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -498,8 +498,8 @@ spi_l2_intc: interrupt-controller@41bd00 {
 		qspi: spi@41d200 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-qspi";
+			compatible = "brcm,spi-brcmstb-qspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x41a920 0x4 0x41d400 0x188 0x41d200 0x50>;
 			reg-names = "cs_reg", "hif_mspi", "bspi";
@@ -518,8 +518,8 @@ qspi: spi@41d200 {
 		mspi: spi@409200 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,spi-bcm-qspi",
-				     "brcm,spi-brcmstb-mspi";
+			compatible = "brcm,spi-brcmstb-mspi",
+				     "brcm,spi-bcm-qspi";
 			clocks = <&upg_clk>;
 			reg = <0x409200 0x180>;
 			reg-names = "mspi";
-- 
2.43.0


