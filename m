Return-Path: <linux-mips+bounces-8526-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB43A8220B
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 12:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E909A1BA0EE8
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 10:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7408925D91C;
	Wed,  9 Apr 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hmv2um88"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368AB25D903;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194600; cv=none; b=NMdoSA8QvCILHZWF/hvh0Y02IIXntECdMSTw85N9lU/gL8ALeiEnwof71TncJqz5ASN1/KVolvZAmLkdpwR2EL3/xTS/9kXbtuooX8QEQBAcTihSsx/jvfPn7D3sVlYmBOVrPszeSYNLt4mX0bGCV4lJdx8K9bkdh7Qf9h9xcPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194600; c=relaxed/simple;
	bh=wTO9XVahwzKLxaPS9+9HXlOMbiu+xAnQVIyTH2JqEdc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gxIKmYnRkzi99T8RaWazDpq6ER69IXpTH+HYHMxabf/yoPd2Pu3QqAMoD62XfcK6XKhXVSJXEeBsHInvr870K6lMmVmVdmS3wzOHlpvb6NdgWzBNLliiTZq0tqx1fUUUiH2Hs/51wjB7wN42Owcrkug7jemBACWirkH795phNi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hmv2um88; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1D51C4CEE7;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744194599;
	bh=wTO9XVahwzKLxaPS9+9HXlOMbiu+xAnQVIyTH2JqEdc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Hmv2um88CV6KzCn5iwO68jn08TntANXxXvJgL7EmzfikVidy8Q8ZbkqrPxskVcjBW
	 5H9rTVHfzaqf09GDzr/wRELoxglk1M+pds9MokRzlUFaTNFJMUo6xP8WTzCFFlxiKZ
	 ItrtWnzEyEjrdeIlqhHhC45njST4mNAwmDPZAWrmmMh9NabZxXLu5gBAmyfseA/a8z
	 iISYy/GjC+4uLmCrYBQ7Zt1EjFCpJkNntn9KvyorkcAQWsqWo0ma7MpDT72r3HR/PW
	 K/UmeDQL7cEfkW4XhQdMUovWae/YBeV2PkRfNXNGsim+IxuCRvPtljkMOysbvYpC8q
	 G2FAervEHdMPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942B5C369A1;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] Add support for Loongson-1 AC97
Date: Wed, 09 Apr 2025 18:29:30 +0800
Message-Id: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAApM9mcC/3XMQQ7CIBCF4as0sxYDVELrynuYLhCmdJIWDBiia
 bi72L3L/yXv2yFjIsxw7XZIWChTDC3kqQO7mOCRkWsNkkvFhVBsjTH4HINgxo6a9cPoDKJVCnt
 op2fCmd4HeJ9aL5RfMX0Ov4jf+pcqgnEm+aAf/OKs0/PNb4bWs40bTLXWL3nB5M6sAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744194597; l=1358;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=wTO9XVahwzKLxaPS9+9HXlOMbiu+xAnQVIyTH2JqEdc=;
 b=DWbS+jO0h+JveVSR7kVCBar4uEFKji4nMkZQ8LrP60uOzZnWrsGlHTzVn9JbQJI7xcFuRHPnY
 LRoGsvkJKweBcUU5DwckahhyBroTWlBwmjn43xmY/zGtG/cpDa7YP9l
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
Changes in v2:
- Added a reference to dai-common.yaml in realtek,alc203.yaml.
- Return -EINVAL when 'audio-tx' or 'audio-rx' is absent from reg-names.
- Link to v1: https://lore.kernel.org/r/20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com

---
Keguang Zhang (4):
      ASoC: dt-bindings: Add Loongson-1 AC97 Controller
      ASoC: dt-bindings: Add Realtek ALC203 Codec
      ASoC: loongson: Add Loongson-1 AC97 Driver
      ASoC: ac97: Add DT support

 .../bindings/sound/loongson,ls1b-ac97.yaml         |  68 ++++
 .../devicetree/bindings/sound/realtek,alc203.yaml  |  36 ++
 MAINTAINERS                                        |   1 +
 sound/soc/codecs/ac97.c                            |  10 +
 sound/soc/loongson/Kconfig                         |  10 +
 sound/soc/loongson/Makefile                        |   2 +
 sound/soc/loongson/loongson1_ac97.c                | 398 +++++++++++++++++++++
 7 files changed, 525 insertions(+)
---
base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
change-id: 20250115-loongson1-ac97-389daeec55e3

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



