Return-Path: <linux-mips+bounces-6706-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0285B9BFE2F
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 07:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D0E31C21BA0
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 06:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B7E192D9E;
	Thu,  7 Nov 2024 06:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avDgTOA5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F8FBE4A;
	Thu,  7 Nov 2024 06:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959892; cv=none; b=Th7n3Gkg/Oj3Dk0M3U8BOfHrymYSV5xd1rv1/9b/Q/IMfwxa+SLGtPJhntVtx0RpeArCd1dIPQIUsN1ivbzFQVOpXg+X2HovfNjtYdZwxkQ0lrUOd58lOwve01ZjJ+yygCTo4zjNvgCsSfR/ebTWmkA9t4j65HtiRzs9p7hsDks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959892; c=relaxed/simple;
	bh=5ccryXiFMCZqpwAcb8tIEL7hAQ+1BqdnpslvGenxExs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aule1AcC/0s6sP2ndQZ7uzHDbtJzSmab7YhCbwE7/yvlOmFB8W+II07Vciphv6BXwtIVAujDzW4domCPGCw+Gg6z6fbmJLCnQIeHkJUnuhioZyJa69/2qWhEhzFpegZaNWQG4WENVYz3oYndTJ+uobIdxiwbmV8WKQ4ClHcbUoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avDgTOA5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cdbe608b3so6116215ad.1;
        Wed, 06 Nov 2024 22:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959890; x=1731564690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=;
        b=avDgTOA5cqHarx/sCyjiE4Ihkmm4J69fUUPL+zbOXuNR7vOr+huWDsQcote516dXen
         767DshPyaRkPnNenZSebmbFe7CHfDNxUZ2ETamnE+C6iC0Jo0/2Sy97Hg5l186gHch2S
         u5gv4e8NilrMgl2ykU46kRCxN49vQDXSVJAghrhljnpX5DT4N+6QdIHWGm9l92GQTgnM
         cF+Mm4FY9ddPnx9pvvScF6Watvst+jxfSClj2ql4WXiiFJUopGW5iXZhe6mDo4QnFO1D
         AgdwSnFgFtqy2Mna/fVgl+lvEQKJHUUE9WraBef4suhn4lqlGMvZXlo32ZulqW24gLim
         jTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959890; x=1731564690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=;
        b=utIt3cr14TudAk6otdfMGlj1gVqV+H0hMFUjunp56LN1W2HuWWzBn/K2LsaUpw6g27
         TN8MMh7Yn1hzjo5ONjXl9AEWQoVYXKGagV221/PNg9SZRZCOpnf9Fd8Q2DFQ6vXmtezr
         ED76qNWQ526RUK2XeA2ft5J30dG6cF/uLtUASyKpuU1sRhCW752lN6jNTZa3+NCXb5vx
         l6RWMWZ8hHCuRv6mpp864qMyGhsLMe7nXJdc224ejJwVp67aNZkecZsgnr6qU5kXlW0x
         /ud/VApmEucrFp/f/uh/B23UDZisGkBpS28qcO+tV1IbDn63J0Syjdf5otr8Y2NOhXBJ
         RWbA==
X-Forwarded-Encrypted: i=1; AJvYcCUp6dVJC4mVnj4reef3OMv0inlafehiEL/WgGhy7pv9+GwgeCOR4aKiblUKgAxIUFenwxKIgZiN15kKFgA=@vger.kernel.org, AJvYcCVggHP/5AYiEvC3PePRCwEcvdoDwoKmhnzu6lDwFrAvG13yk0VPIeQhYlZTgY+Ai8bpB/mFpSQC8+3MMUCF@vger.kernel.org, AJvYcCW1iDM2G070S0nxCpAGjHuGTdtX39ZHjqCEhZTOZt5hY0fZijsABE7Czbpsm+LgO146b71TrQCp3DMd@vger.kernel.org, AJvYcCWZZR4WyOYI+KgFL/QFmsfm3A7VMO6HtAeQjb6lISTRKfdaAKB4esY4kNDSN7Zdn1dgDnt1aRt6B/PvYw==@vger.kernel.org, AJvYcCWc7DvzVb2dqeajMcfzL7AyQHbZaYhcXKgJLNqgiQRoZ7sd4wbZhFLncfcdqbaEeA+hIFSjG5T+oW9XnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gXc/+dagmEWz2uMIH8Fi9VZf6qyTNmPxPJ2VWUJnljAbb4D8
	xRd7NzgzskWINgU3CCWw/SZT8A5pO6sflbdJYG5Az5zGMjiW2UDV
X-Google-Smtp-Source: AGHT+IFb44ve8UxBIvy91ELgGSUmf+xH+y8rohtBiFFGcFZF2HaHBFlJbfOx82kv14jZNYjFRB9GRQ==
X-Received: by 2002:a17:902:c407:b0:20c:da98:d752 with SMTP id d9443c01a7336-21178618acbmr7885715ad.16.1730959890021;
        Wed, 06 Nov 2024 22:11:30 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:29 -0800 (PST)
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
Subject: [PATCH 0/2] Documentation: dt-bindings: Fix documentation issues
Date: Wed,  6 Nov 2024 23:11:22 -0700
Message-Id: <20241107061124.105930-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch series fixes documentation issues in devicetree bindings,
specifically addressing repeated words and trailing whitespace found using
checkpatch.pl script. No functional changes are included.

Patch 1 fixes repeated words in various binding documents, while patch 2
removes trailing whitespace from several files.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>

Abhinav Saxena (2):
  Documentation: dt-bindings: Fix repeated words
  Documentation: dt-bindings: Remove trailing whitespace

 Documentation/devicetree/bindings/gpio/gpio.txt        |  2 +-
 .../devicetree/bindings/interrupt-controller/msi.txt   | 10 +++++-----
 .../interrupt-controller/nvidia,tegra20-ictlr.txt      |  2 +-
 .../bindings/memory-controllers/mvebu-devbus.txt       |  2 +-
 .../devicetree/bindings/mips/cavium/bootbus.txt        |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt   |  2 +-
 .../bindings/regulator/regulator-max77620.txt          |  4 ++--
 .../devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt      |  2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.34.1


