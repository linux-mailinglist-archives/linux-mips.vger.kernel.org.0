Return-Path: <linux-mips+bounces-7459-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C697AA121FA
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 12:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F7D7188D51C
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 11:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D922066DC;
	Wed, 15 Jan 2025 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5QHNYlU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24071E7C22;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938992; cv=none; b=PpM/vg13TBoVSrNLrWWLd/R3wXMqVTkeXFwg5l+CYYEmdC3wE5ofiq2jdYXxASlypQl7EMpq7jXWwTEcbCgx/70Xzxnvfh3K5BoNr0wylXu7hOjFx5qtTCEyzEzkAyTIwwBMeNePAXEkXwJjKpW77E64Q09d1PxlnyKY9axjJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938992; c=relaxed/simple;
	bh=TgflvuICDFK30ml2cKH2ZgYrUsJrKdWN1Z5vaApfIV0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qgjKlX2SaUoeRwGfi0rzxlrVyfm55bgD6emiFzZCLxdxWeCTJj8RRluqfCYm416AoY91A5by2YyCcEwwgI61gQRw4YP2GghCnEOYiyH8gnOGV4oWUYBhGwZKos7veplg3OhGsTv4HmGptfqME1rQdLVaXd0HYgRbnXho90W/Tp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5QHNYlU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A094C4CEDF;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736938991;
	bh=TgflvuICDFK30ml2cKH2ZgYrUsJrKdWN1Z5vaApfIV0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=X5QHNYlUGqReKjaVWUWVdwvDy5pdvQ7e8MDHH+346ozx/JuTIbA6U8ulV6QL4AVV3
	 l8KS0ZTutvINRYdWGxgjrAYkMkA7uhoBj4wmOnuGmC+90e7jx9o8RMBRkPYBj8WuP+
	 opgKR+QSX6qYfKeH/bMd0Rj4JuJo7xZTD8K/yzxpsPjLbdZeXgJNi1bcVN4iv0CfEB
	 Ry9jXrZe59sAJKPb9o2/MAN2OSx1PYgDOxoZ0ymzm11BfnIMrgD/ohsrzb0EAY2WwN
	 c0tCCYm005NfSl6c3PtOE88uBYu/yba4HD/ecPmh1QZuXOAf33cNakbVqoStOom3w2
	 WwoGGqk9pvUcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542A8C02180;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH 0/4] Add support for Loongson-1 AC97
Date: Wed, 15 Jan 2025 19:03:06 +0800
Message-Id: <20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOqVh2cC/x3MTQqAIBBA4avIrBP8QcquEi1EJxsIDYUIxLsnL
 b/Few0qFsIKK2tQ8KFKOQ3IiYE/XYrIKQyDEsoIKQ2/ck6x5iS583bmerHBIXpjUMOI7oIHvf9
 w23v/AOFwKkJgAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736938989; l=1104;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=TgflvuICDFK30ml2cKH2ZgYrUsJrKdWN1Z5vaApfIV0=;
 b=RZzN0p9wcJQWMe0rv9jn9Qwuk75gGeQtNyKTe5foyOakzYVylCb9ycE4PdnoPNYaY90YfzF8l
 k3KR20EVLrKBYHH6ukvdDdfIH6d9UutWHAhGvCu7PQYv2bdX3y5uMet
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

Add the driver and dt-binding document for Loongson-1 AC97.
Add the dt-binding document for Realtek ALC203 Codec.
Add DT support for the AC97 generic codec driver.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Keguang Zhang (4):
      ASoC: dt-bindings: Add Loongson-1 AC97 Controller
      ASoC: dt-bindings: Add Realtek ALC203 Codec
      ASoC: loongson: Add Loongson-1 AC97 Driver
      ASoC: ac97: Add DT support

 .../bindings/sound/loongson,ls1b-ac97.yaml         |  68 ++++
 .../devicetree/bindings/sound/realtek,alc203.yaml  |  33 ++
 MAINTAINERS                                        |   1 +
 sound/soc/codecs/ac97.c                            |  10 +
 sound/soc/loongson/Kconfig                         |  10 +
 sound/soc/loongson/Makefile                        |   2 +
 sound/soc/loongson/loongson1_ac97.c                | 394 +++++++++++++++++++++
 7 files changed, 518 insertions(+)
---
base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
change-id: 20250115-loongson1-ac97-389daeec55e3

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



