Return-Path: <linux-mips+bounces-6708-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE89BFE3A
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 07:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 925981C21F42
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 06:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B1C19596F;
	Thu,  7 Nov 2024 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6B8CVF2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593D194C6A;
	Thu,  7 Nov 2024 06:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959896; cv=none; b=BycdLOXbve4NXXDx8OlsISwNj+t+LXfHNKBigdlTYyQ8GYiRIsQQJbVaqfkQyqYC73iSfk1V/rOH6hslF5gSnGHJp6r2hybNMgMTughv6cr2K9TeT8l6qsmOYX4Uq/SJvAJPRepfQpgs+Jj94fPh3CR8lx10oqxe+JPmL34ndQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959896; c=relaxed/simple;
	bh=ns+qICv4ryQ7JfsDRazMozL0fDUROfR+O8kTeP4q2ck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hi61+M+VZkGU+32OX5fjc8v9NQTORMPqbysJnNM+1C/ck8Opr/+wO0FagS8DvJWYW9Wfqmtc4OoCKj74fWo5qIfNuopWYOIs6foOGlsgcb15S/cds/a6Abq7zPIG7gvYcdOyfxFeAkkcV38u7RkY8X9pG7tu5ytaPx8uK30gSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6B8CVF2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c693b68f5so6381865ad.1;
        Wed, 06 Nov 2024 22:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959893; x=1731564693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=;
        b=G6B8CVF2syNvnUJGYlMci84TvXdar7DuZ0xjnOXKQ/zIxEkcHwiA+RlLeh6QNpj9MH
         o8ajNHqmDjc3vuwDy3uagQRHr7Hn8mUna17ipwyLcI5fhQ22ULk1V/AlkEyuehOfpcCY
         DeZgZ9DBR61Cr4t63+s2RRJ2soNx0Au20YTvwdXy7HD7TnovMfA1kCy0FGBc9WV0ltu0
         azzGs6in7NzbGeyixNY4I9hc6jYjLC35AnJSXhxPgG5I/ErbfWMKaGPSFvwjIxd25r/E
         Ek+za99y3t5yGjLnsxl8iifLSWGUsp09oVGOGaERWbcpXV0m6awsxJT5wZw3KBWASpIR
         Oo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959893; x=1731564693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=;
        b=HR9UqTYuwjN8LuqJzPV+cBre5kTmdxE//z1DFjDv+b/3db+9PCLU64kcfNAu3Ks6By
         W1l4zaHiwmGDayvT6vrAf97Z9gr4XQGMChEzVhiQLUHyrZMg3jO+hXalpFf5Ggb6d2Az
         tIxmSicuOu12OIjN6dPbm4F2vAEnvghjDtDYfTLtx5wiOUCigUozUYHTmcopvW4RRo7j
         bHMNbUhNgcDqqTEs8r5t3VQvx/4I5l13WPsGZRa6JNjK94BeV6PMNoWb1h1UJldl8/KF
         OcvZ/nEEJWsIzlBBRMKS+7WibwUIjdcP2LxsUUx9ahwKiq6PFNQHzI6SYed7qKZljUSU
         7gkw==
X-Forwarded-Encrypted: i=1; AJvYcCUBjabykeLrjuWUr3JsMgh/ovLHRNtIy9gid6tZNFzqj0mHmwwWK4Gh7IQV9SApzZuNmQ1cluDRal6L@vger.kernel.org, AJvYcCVwYEVVgbXPc+eq2Cxd21tMfEI+qVGQmIpvvsEMEkLzWiY66TpneV7M661AJ4n86E6zl8HTbffxTliJxg==@vger.kernel.org, AJvYcCWQedO3O1i7IWe3WqFjxUUDzuojcnHRyZkOaOaUM7ojTloaQSN35u9hToMe3wg30XJuUOp61n8VKe8YbRs=@vger.kernel.org, AJvYcCWSAtA2O+L8y8a5tDyw0bvf15j1gSUUayw8KTHFwob/BqzCCY5AcdTgW8X0Euef48ubPjCklVYFWeb2uxm2@vger.kernel.org, AJvYcCXusiFdpB5EF0J8uhOVl0wIh/Y81UZ29h3Rr+ZxISjrv/Wf74tQp9E4VKvTX8O/SnMJmS9H+N17oKwK2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj9fF2ojtApbWGKVIHpF75bxahU6H+rm91pUadZVZETPNUWxb4
	eu+/lueDpajDhl6ODUCQDCqwaLWkmvF5ne8UStj0Y1A69EeadFf5
X-Google-Smtp-Source: AGHT+IEhLX1Ix3kvbnhGTk3oM5FNMOle9lT4S2S6mmMGQXogZWZm53W55lSd+4P4hV9Wykx6SDq4ig==
X-Received: by 2002:a17:902:ec88:b0:20b:8ef3:67a with SMTP id d9443c01a7336-211785b1234mr10045595ad.7.1730959893349;
        Wed, 06 Nov 2024 22:11:33 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:32 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 2/2] Documentation: dt-bindings: Remove trailing whitespace
Date: Wed,  6 Nov 2024 23:11:24 -0700
Message-Id: <20241107061124.105930-3-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107061124.105930-1-xandfury@gmail.com>
References: <20241107061124.105930-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace from devicetree binding documentation files:
- regulator/regulator-max77620.txt
- interrupt-controller/nvidia,tegra20-ictlr.txt
- interrupt-controller/msi.txt

No functional changes. Issues detected using checkpatch.pl script.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/msi.txt   | 10 +++++-----
 .../interrupt-controller/nvidia,tegra20-ictlr.txt      |  2 +-
 .../bindings/regulator/regulator-max77620.txt          |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/msi.txt b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
index c20b51df7138..2109a3454cf6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/msi.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
@@ -12,17 +12,17 @@ potentially including additional information.
 MSIs are distinguished by some combination of:
 
 - The doorbell (the MMIO address written to).
-  
+
   Devices may be configured by software to write to arbitrary doorbells which
   they can address. An MSI controller may feature a number of doorbells.
 
 - The payload (the value written to the doorbell).
-  
+
   Devices may be configured to write an arbitrary payload chosen by software.
   MSI controllers may have restrictions on permitted payloads.
 
 - Sideband information accompanying the write.
-  
+
   Typically this is neither configurable nor probeable, and depends on the path
   taken through the memory system (i.e. it is a property of the combination of
   MSI controller and device rather than a property of either in isolation).
@@ -48,7 +48,7 @@ Optional properties:
   not encode doorbells or payloads as these can be configured dynamically.
 
   The meaning of the msi-specifier is defined by the device tree binding of
-  the specific MSI controller. 
+  the specific MSI controller.
 
 
 MSI clients
@@ -117,7 +117,7 @@ Example
 		reg = <0x1 0xf00>;
 		compatible = "vendor-c,some-device";
 
-		/* 
+		/*
 		 * Can generate MSIs to either A or B.
 		 */
 		msi-parent = <&msi_a>, <&msi_b 0x17>;
diff --git a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
index 2ff356640100..0c37e569e6f3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
@@ -12,7 +12,7 @@ Required properties:
 - compatible : should be: "nvidia,tegra<chip>-ictlr". The LIC on
   subsequent SoCs remained backwards-compatible with Tegra30, so on
   Tegra generations later than Tegra30 the compatible value should
-  include "nvidia,tegra30-ictlr".	
+  include "nvidia,tegra30-ictlr".
 - reg : Specifies base physical address and size of the registers.
   Each controller must be described separately (Tegra20 has 4 of them,
   whereas Tegra30 and later have 5).
diff --git a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
index bcf788897e44..7484c0728e27 100644
--- a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
@@ -65,14 +65,14 @@ Following are additional properties:
 					Valid values are 0 to 7.
 					This is applicable if FPS source is
 					selected as FPS0, FPS1 or FPS2.
-			
+
 - maxim,active-fps-power-down-slot:	Sequencing event slot number on which
 					the regulator get disabled when master
 					FPS input event set to LOW.
 					Valid values are 0 to 7.
 					This is applicable if FPS source is
 					selected as FPS0, FPS1 or FPS2.
-			
+
 - maxim,suspend-fps-source:		This is same as property
 					"maxim,active-fps-source" but value
 					get configured when system enters in
-- 
2.34.1


