Return-Path: <linux-mips+bounces-9430-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C7AE0EA4
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 22:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 217B94A0FA1
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 20:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD90D24394B;
	Thu, 19 Jun 2025 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="dZrAiJnn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61204218EA1
	for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750365311; cv=none; b=Bg6nz1fal/4clQI039GoiAOX/94a6301njdla2ZOtTTHt1GLeVc9FScsMZpplmGmqnDaZpho4jEhtFShcz67mDuMPJ/cBw+0AnWEdsEI7n7MJnr9ZG3/brkgedN53hnYFvdK+eMIBsm8ZGaod7vYZr59ZdtS5iykgas0mwJdGSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750365311; c=relaxed/simple;
	bh=T07V3sAbb7FMtV2pvVEqIO4g+bcFfg87lTtgBLYLTVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HztnfBvbh2xeWbXkM2uM1D2o9GWerulunWBRXNUyljlC6lQNvIawiFqW9g8EwBI6VMk3QGcUCYqnIR3f4m+qqJ3qsfnU7hxli/4oaOHqr9ZZYvbXKZQ5Yt7RPmW9xD2cxge5i2f8lSznzVU7t7FN+B+s2/BjnWv7/V2y3txtTY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=dZrAiJnn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so888969f8f.3
        for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750365306; x=1750970106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Me4R70YQwZZWGPaTnVq7JZtj/BWzBdRzoLQ/qm+MazI=;
        b=dZrAiJnnVvOQCPRcl/8ppWqD52So513GI+IYUgpXIN6qtjJPDHcMKur56X4dWD21qT
         vuWH8jCWpPDp/RqUeEvIjaayKn9b4jnKSWT+d4bwv0uShmu3YowzolXp7oYBsONjNmIP
         KOthvYKwSWZkff+1I3eJP1/LguR30hYwbRBIQC0pF9jLLQz0uMjvr0j3usmW0r+x0A0O
         Ng+6TCaNA38vCYmq9beWbDxCx/qbVtI+2afVE4tWhPaN+wZLz2SQoYg7Gu7ZYuZ6jEks
         YHyhdpbeQvSXN15eA1Q+GSDzGZXxWKmbVedk1Rhk/w25sQnM+JEHR1cJZ0OoH7yiIAi8
         Dv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750365306; x=1750970106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me4R70YQwZZWGPaTnVq7JZtj/BWzBdRzoLQ/qm+MazI=;
        b=cT3l5acRCVWqHxP/usdTo8KMjFVe/vEmWGX07RXURpm3yPKrBVa/9cdNmaCsU5WnTl
         AD7D/yArb47nijI44tY2GfDmegfvMoJbM0G+CBINuUTHUtPs665XP1KohpULDjHoprHc
         GsHTuBbDzAiLXm75wEGPwDyX8lcwZibz1/v2PMbDcGK1GUiXTFXjHGuElsE2q3nyI3r1
         zn9PVZxg4p019xjF+stVOH1XW8ahespq+tuEXla61lB50RWWYcxJXQW6OJ7UbDk9biBG
         NpQrvfyzdIZgZBt1C89tA8YDGQwrbCrhCf8YOdoHhzqsP69UJSel6uvz8C4gGIMEAmaH
         FKVA==
X-Gm-Message-State: AOJu0YyQ6opnSRRWc27yF1+CObGVHa6Fn60z7VT3DOs1mAIW7rZGYKDv
	eNhT1Y6Nvg1GkpfCDE4VGKsbTMSjtzf33ULF3USR9GY/8HbdXuhxaOZlq0UDnppJW6kzJh8Q8UD
	GLHM+
X-Gm-Gg: ASbGncsmfxcQ+fyY/mPfYn5OQFFYrUFqDaU09r9PAbPU6RvwjopKDbGUvPlAIHw4O+t
	4Z2mJW931GCu9iZ/hE/UQ1IV9lpMpPy1RwQ3Nj+Inp5ptJ3Hi7VwAmCNC8dfJJmfCMfu8g8hx2k
	tTnFv4KLi/7RQhZHMy+DmyrGBdHCXM6p2/LtbhDoemCqYABXA5dXWAkq2RcU08qKiAZOq1vOOwD
	YHXHfDI8cahW1P8zNeqRHEV7wVsKwYbIqw8HTum92rozZnshOY2EHUxcvVxgmd+/zitG4xV81mq
	GVT2n9P71l0VSLZ/8tyXwq5WJDac2gowoswHBni7cZX84d8Q+BGLTJZAD9ZD
X-Google-Smtp-Source: AGHT+IFIpVZyrd2J6npgOTQ1JxO8v814vEoUGWW0amRSS6hbiHRLtymtz2OMwWmRGzMTORX6iDc8ew==
X-Received: by 2002:a5d:64cb:0:b0:3a5:2e59:833a with SMTP id ffacd0b85a97d-3a6d12db838mr325155f8f.1.1750365305748;
        Thu, 19 Jun 2025 13:35:05 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:a60c:e454:f09e:79d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d91bsm288495f8f.42.2025.06.19.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:35:05 -0700 (PDT)
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
Subject: [PATCH v3 0/4] MIPS: dts: ralink: mt7628a: Tweak for GARDENA smart Gateway
Date: Thu, 19 Jun 2025 22:34:58 +0200
Message-ID: <20250619203502.1293695-1-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Various devicetree changes needed for the MT7688-based GARDENA smart
Gateway.

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
Changes in v3:
- Remove duplicate entries in mediatek,mtmips-sysc DT binding
- Link to v2: https://lore.kernel.org/20250617103058.1125836-1-ezra@easyb.ch

Changes in v2:
- Add patch for mediatek,mtmips-sysc DT binding
- Add Reviewed-by tags
- Link to v1: https://lore.kernel.org/20250611194716.302126-1-ezra@easyb.ch

---
Ezra Buehler (4):
  dt-bindings: clock: mediatek,mtmips-sysc: Adapt compatible for MT7688
    boards
  MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
  MIPS: dts: ralink: mt7628a: Update watchdog node according to bindings
  MIPS: dts: ralink: gardena_smart_gateway_mt7688: Fix power LED

 .../bindings/clock/mediatek,mtmips-sysc.yaml  | 27 ++++++++++---------
 .../ralink/gardena_smart_gateway_mt7688.dts   |  2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi        | 11 +++-----
 3 files changed, 19 insertions(+), 21 deletions(-)

--
2.43.0

