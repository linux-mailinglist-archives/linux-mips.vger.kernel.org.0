Return-Path: <linux-mips+bounces-7462-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34AA12775
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 16:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1BE1888525
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 15:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6DE73446;
	Wed, 15 Jan 2025 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3lTIqd8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C2155330;
	Wed, 15 Jan 2025 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955025; cv=none; b=XeuU74GcVa9CTGaHAOp95+sQnBcFhn1qHAzxLsydTEnmHnkuOhSgX7z/zc7nBgZefMaCrqbKdf96BPPgxQTw0nRyVrVgIQhPsGiMJAe7hNTfA/Rue5NZ8B+bmB1Q91SUA3ZYUZ5lpfXm+SsqLq28L6o2zToKKvWzRXnT2PLJt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955025; c=relaxed/simple;
	bh=vCM0wUyiHM9zpU6S69uBiphGtA8dUD5/WIwJyYg/hjA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RgEkzkFTF9E2B48ajP8hIMFtAPfV9ge2fjEX79Co5TmXoD9BQ51z2gfkngp09qCNITLHFn365FtV3Y3XVo7SwXIj22o9qHPvmIStQhdfyczmmIzloP9H/Yb0kZGpyrEN5CnUMqtkDZhPJmR+wMTW+IqkjZ1CBgqjvL4vMbpuQiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3lTIqd8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3507453f8f.2;
        Wed, 15 Jan 2025 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736955022; x=1737559822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=paG9HeMCFxbF7ZmTi1kkJGJ5obOV0RE14z5yiI59s0w=;
        b=J3lTIqd89x8yf1eggP1YNxwoTZHoP/qF6XzZ27Xf4YTQ1nr2Y2Feot0Wh4IEIUiUxl
         cODJBR7o8dyil0/Bm8ktfCIv8MEsQxFucNujRVwJLUTNJ56e0zTCvMEvQu6DipfKrXmi
         0ykqVTx1efGWC0JsrGwZORBNwyO9pnFzUFTw9z//9YVWgDi7HBExHXcT47PtgPjpcTN/
         lAeUtYn5cf3FjjYuMRCDLHcrsyUCgjVkPnFwXEdX3I3QvZz0mqBCgCj1jwA7WHNukgsm
         p58/0PN6Q2MICKRPg/rjUwGN0oPeFDI3gUBEf1vvY4LQEWJjQ/zCpWkoohwOnygLQcEg
         4vKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955022; x=1737559822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paG9HeMCFxbF7ZmTi1kkJGJ5obOV0RE14z5yiI59s0w=;
        b=Rsh4G58zQMG6MmqbcRtaL4/H1KxiDwWlhWrMVhKl2QtSbDEL13KwtXuOBmUQce/4EZ
         2VScjMbZ7UsXf5GeK/zaQI8cecDKjoWHzQ6bdk8dNFcYsKHFlCAQECh+ApDFqcDQxn30
         +kuNVWShmNczhpfNWLPotKCkePmR8vBnnAUsjKGuz/keIbip6lVAPpbMFYvDe9rViNxW
         r4JWeS24iHOnyJuy6Q08/VkFtJEU4Bug3uAF4HogCSTHnaOPdYSDJO1+s6JXd+10OYzS
         qXSUU7uAcTjNaTek19ZFEwGpfGJ6gb5FohO9rcUcw9TqLCYORLIGmZ3AA2uzNAVke28L
         hqqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ3+ECdUfWAXTJvUIjiHl8J+HiK0SL42S5zCCrZo4nh8Im5iZR+iSkekglMkwGWQGGC4w8h8bfJ7qG5w==@vger.kernel.org, AJvYcCWlI5uDpsdIfBF+AdjovBJ7inWeckknqAosH6tAy/BJ532p2ZUa33Fe5Y7EYBCDxO1OGgW8KBM/UsSP@vger.kernel.org, AJvYcCXscwbgEI0ah5gU7nlTu8MQIfG6m5ACLYFBcc1fJoy8/BNt6crWILHFF7hxGvvE44Ic7zOhF5oraToK7kaI@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLM6hT0zW9tvQ+uBXivEQLeaV7ejQ572ksoH7KsbEhYrpopKt
	3l4zPmhhuEd16vOOhRpb8nryu+b5JFRcaJZ6fcP4HaYG3cSysYm1SdOjPg==
X-Gm-Gg: ASbGncuSTLvSumEhoh8QooMqWhuwLGs4E+6rFPQ/VMn9VJD6FJGunAkgRVj+VmhN1Sv
	QOApbKMiHVnVmu8geRHiNijRk6pYZdLOT/PURhZtM/dPSZyvFxHYkVSwvGfmvPxrwK390Lr8lhk
	DwrqV2xgQA85t7f3HdkvvqH5LzQONWZZDdTHkoMDPTf0yU9ypWsag7irelDXU5mLz0snMFKufTC
	TmOJ2tqiJAoEo5Gr0NzrLzd3DUSlJDx1A/n5iz/ApA8AcidK6r122fuNfWmmdNVBqoUSA+26HHO
	9FgK9gpudzBftIh+nPRYuLzmkIxk38oh0MZzpSF/2XSmbO8=
X-Google-Smtp-Source: AGHT+IF52neb8NRqgwnp7yyTzX5f4mJ12kMbDSE0OgCXgjGuMUqIfOpt7AwxtIEz0ve0JQczpvtvrw==
X-Received: by 2002:a05:6000:402a:b0:385:f23a:2fe1 with SMTP id ffacd0b85a97d-38a8730b072mr24122809f8f.26.1736955021917;
        Wed, 15 Jan 2025 07:30:21 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm7440771f8f.43.2025.01.15.07.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:30:21 -0800 (PST)
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
Subject: [PATCH 0/6] mips: dts: ralink: update system controller nodes and its consumers
Date: Wed, 15 Jan 2025 16:30:13 +0100
Message-Id: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
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
providers for the rest of the world. This patch series introduces clock and reset
definitions for these SoCs. The clocks are registered in the driver using
a bunch of arrays in specific order so these definitions represent the assigned
identifier that is used when this happens so client nodes can easily use it
to specify the clock which they consume without the need of checking driver code.
For the resets the definitions are the reset related bits in reset register of the
system controller node. Users of this introduced definitions are DTS files. 
DTS files which are currently on tree are incomplete and out of date and will be 
properly updated with the ones that are in openWRT tree[0](which is the main project user
of these SoCs) somewhere in time. But I am also updating current on-tree files as user 
of these definitions only taking into account system-controller related stuff so 
the things make properly aligned on tree. This is as per previous attempt and discussion
of just adding definitions in this patch [1].

I'd like this series to go through kernel mips git tree if possible.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

[0]: https://github.com/openwrt/openwrt/tree/main/target/linux/ramips/dts
[1]: https://lore.kernel.org/linux-clk/CAMhs-H9yoZ-m1Mf147F9V1OVxNO3kvQTt_nP-YLD970f-Y-UOA@mail.gmail.com/T/#t

Sergio Paracuellos (6):
  dt-bindings: clock: add clock and reset definitions for Ralink SoCs
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

 .../bindings/clock/mediatek,mtmips-sysc.yaml  |  18 ++-
 arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi        |  43 +++--
 arch/mips/boot/dts/ralink/rt2880.dtsi         |  10 +-
 arch/mips/boot/dts/ralink/rt3050.dtsi         |  10 +-
 arch/mips/boot/dts/ralink/rt3883.dtsi         |  10 +-
 .../dt-bindings/clock/mediatek,mtmips-sysc.h  | 130 +++++++++++++++
 .../dt-bindings/reset/mediatek,mtmips-sysc.h  | 152 ++++++++++++++++++
 8 files changed, 357 insertions(+), 26 deletions(-)
 create mode 100644 include/dt-bindings/clock/mediatek,mtmips-sysc.h
 create mode 100644 include/dt-bindings/reset/mediatek,mtmips-sysc.h

-- 
2.25.1


