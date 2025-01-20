Return-Path: <linux-mips+bounces-7540-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF1A16931
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 10:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0BC81694AE
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 09:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40481ABEC1;
	Mon, 20 Jan 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B71/Z0fv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57871885A1;
	Mon, 20 Jan 2025 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364913; cv=none; b=d1KQ7VlopHEQz/+Ltf/Tpkv5aLIsFm1T6RewmTlHWmxktRYAHflVT4hyKd2GY5Zm2J0XPMZuyGvVzdXEAH/rcnUu4BPHjRUDjDDS96cW/LWOXXarXFR46o3ibcb6LK2Ra3PQI/Fs2S0oeGE7XW5MMszNuYJFbdSujqUCQ3nNBDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364913; c=relaxed/simple;
	bh=IWwgl6VMXJu7yraH76C5LIm9Vk9IG6t0KaiISs/faYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U9SG4zMRyDdbS+UUQK0fddQnRyq730GcJ1Uf+AXnCyyRs/0Vs2TzLD2WDv6BUEKeZHdmo+jynR2V2Kx8QRb9VFiLTCLl2b2/dfl2izvuAgeDj2DWgjdN24p6Jfod7T2A8dHJ7Upu9yoqbRMDPhCuXAgtAvKZ1vmmTQW8wv8R38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B71/Z0fv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso32133595e9.0;
        Mon, 20 Jan 2025 01:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364910; x=1737969710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzka/3o1r/eZ9YDCKi8zcYXbaHUSqQQBefdYfgn1zq8=;
        b=B71/Z0fvy0Lmjg2ysNyQYiPSF/t2GdoVhNvLDqoAfKfh1tpK+lwKRHxJ5uXFjQRVFH
         v+jVbWjACSj6Wp0JVaLwZ+qRmBY6bBNES+Vqk6jV6bpSOqaGl/DF21ID8vnJttYp1GPE
         f+rTNH89GlCh3OZ2aQ+g0aT1TjCzdAyNCxhEhfUMXdDIadRuYFoWet6sTJDHzK1ujjC1
         w1nRBJU23qxmfi8TQNqkWSAeBcUwE6jNNqSRnKJa6Ck+tBnqUOrkz6dNRq4W8UZdtap6
         s4XsYwjXzRFVgnXGv6sn9htVaNO7sa5a+D/UbnexhOgo8QePW0xetWAYEXEOB68WiRKj
         9z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364910; x=1737969710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzka/3o1r/eZ9YDCKi8zcYXbaHUSqQQBefdYfgn1zq8=;
        b=f8pHC7/tJS0F3ZLx5JSBTl4frXcq2QwEKq3X7T7jattiwre42vhRHMiWzM1TBfyVRW
         D3sK5bfySjfbCED9ErlQwHVb/6Dck0LUS9jj2avyu+jMAO3fZWye4exIzFxBprVPv8Q3
         zHHbPMeziRBQRFwxO/KxcHlFVi7BVjfbx0vBH/06ipUUe3DFE7Cr48JRkA3uMsksILdE
         p/7WQgWYesdrh2Dh4b14oQe0Shk2IfWbdQRtjLAnmpx15aqBQ9lWiq0iZjcKu0pFauyb
         szdwhYnfvm7WOOIqX8/O5LQ6QHlr3pmYWpnE8NcWC1W9Qfs2pggTR6KvNKHprYLYq4cb
         RKEw==
X-Forwarded-Encrypted: i=1; AJvYcCUs0oNLpj1fGyZ2i0Phe0PfZhm+CDsk6FX5zX3c2EqcXv5T3xMdOW1t4G92Gj78QcCnQd5nurSG9cZA@vger.kernel.org, AJvYcCVXSM+9fYl/ByZHTENcBBSr4i4RV5PRTUUP99YP7xNAZ3KZjayGas17dUSqezJYAS7rIcXW2tlKrNZqlK6w@vger.kernel.org, AJvYcCWOeLFRq2hkteTk/IbgRjfMqa04YhaDbE36i2Rcz4Y+l+8tqosvoRvDU+VrgyJsvVsjwik70HQbDHVYsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJ4ulmpVH5XZtKPprz/t2w6LR+sPEpkkj8BGy0nAqxAiC2q8V
	t/0IuwZF7v1FOMUllSImmNr1imxuDqoc6SXGtckLdKnuTDQC3HV5I2pGqQ==
X-Gm-Gg: ASbGncvW+uX3HNN2moQXj/0OmYsO2SN/fYcSQRI+rKVq8R9JfiEiaz9G13AtTcH7mro
	7JTe2rmOmU485VXVLVsXwxwtwjn6FJ9SYpKUe9AjbbJDpyrjcA6FPWplj99CbxZoSEKZ4JSsDd4
	XTCJFqFy0uF3L37KXJJSzedEDsWKdo7hOe9MlmFiCf9Brw9beSN2gQvCnhDVcsIcPJQr+bkb+oO
	nFcbp15kEKCq5i7DSoCiO3VTF4q5pnLhoe49I5E4CAsVW7Atl5uOK9tW2tNMlqhCmVsA4VK27GN
	HKywehOyfizZSfo1eKxx8VY2E09lnoHZfHU92ZxMBNXW+02aRQbBsfQQ98jU
X-Google-Smtp-Source: AGHT+IH6C8G8MqRz9ppPw9iU2FlYj3hyMtKwz8pjQQF5w961y9AYKRYK5mjPzG63IsOB3lohoD5Y1w==
X-Received: by 2002:a05:600c:5692:b0:436:76bf:51cc with SMTP id 5b1f17b1804b1-437c6b2dcf4mr162408705e9.12.1737364909431;
        Mon, 20 Jan 2025 01:21:49 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438a1ec39a3sm80680175e9.16.2025.01.20.01.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:21:48 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] mips: dts: ralink: update system controller nodes and its consumers
Date: Mon, 20 Jan 2025 10:21:40 +0100
Message-Id: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all!

Ralinks SoCs have a system controller node which serves as clock and reset
providers for the rest of the world. This patch series introduces clock
definitions for these SoCs. The clocks are registered in the driver using
a bunch of arrays in specific order so these definitions represent the assigned
identifier that is used when this happens so client nodes can easily use it
to specify the clock which they consume without the need of checking driver code.

DTS files which are currently on tree are not matching system controller
bindings. So all of them are updated to properly match them.

I'd like this series to go through kernel mips git tree if possible.

Thanks in advance for your time.

Changes in v3:
- Address Krzysztof comments in v2 (Thanks!):
  + Drop reset include file since what it was defined there were hardware
    constants and no binding related indexes at all.
  + Update patches for not referring to this reset removed file.

Changes in v2:
- Redo commit messages in all the patches in the series to clarify why the changes
  are needed asked by Krzysztof in v1.
  
v2 of this series:
- https://lore.kernel.org/linux-clk/20250119154447.462857-1-sergio.paracuellos@gmail.com/T/#t 

v1 of this series:
- https://lore.kernel.org/linux-clk/20250115153019.407646-1-sergio.paracuellos@gmail.com/T/#t

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (6):
  dt-bindings: clock: add clock definitions for Ralink SoCs
  mips: dts: ralink: rt2880: update system controller node and its
    consumers
  mips: dts: ralink: rt3050: update system controller node and its
    consumers
  mips: dts: ralink: rt3883: update system controller node and its
    consumers
  mips: dts: ralink: mt7620a: update system controller node and its
    consumers
  mips: dts: ralink: mt7628a: update system controller node and its
    consumers

 .../bindings/clock/mediatek,mtmips-sysc.yaml  |  11 +-
 arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi        |  38 +++--
 arch/mips/boot/dts/ralink/rt2880.dtsi         |  10 +-
 arch/mips/boot/dts/ralink/rt3050.dtsi         |  10 +-
 arch/mips/boot/dts/ralink/rt3883.dtsi         |  10 +-
 .../dt-bindings/clock/mediatek,mtmips-sysc.h  | 130 ++++++++++++++++++
 7 files changed, 196 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/clock/mediatek,mtmips-sysc.h

-- 
2.25.1


