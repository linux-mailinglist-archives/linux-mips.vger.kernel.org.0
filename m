Return-Path: <linux-mips+bounces-12951-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBDBD38B9E
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jan 2026 03:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35442302687B
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jan 2026 02:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B802314D3C;
	Sat, 17 Jan 2026 02:27:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25A22D781E;
	Sat, 17 Jan 2026 02:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768616841; cv=none; b=mhN+SEWIwDm6M19y1gC7x5fyhQMt/XfaN9rc8DxM/VkRdjCwtwGT1TGNQFq3RBKKYhuPAXfi3KoNIUrAx41OAj4QuePPO+JEMUYstfkZW12ILJK7yA0qQRHYyGXunp5spDHjokEjNrO5fctGitxeRpz4MdPP9logi55vLOJYbO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768616841; c=relaxed/simple;
	bh=MPS+Q17WZhqccCaiNObtZvCzkiuO5EvwsI+/aySsXZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUctSs/Ukm0zpcSgBStBJKbjIT/Wuzf0U+ioB5zhPDNdYpQTN7qWizEUbTv54+dcPhxsJFQV8RcYlf7HraODERmXbburOqGo1N8Hl/TFEbWq69gOohd0ZtvY34ASlicyL0b6rnM8lnn8S2OTy6wu+2+9CqBUoSTXlvZNI4Of0FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8DxusJ582ppzccJAA--.31479S3;
	Sat, 17 Jan 2026 10:27:05 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJDxTMJ082ppbNkgAA--.65061S2;
	Sat, 17 Jan 2026 10:27:01 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 0/3] RTC: Add Loongson-2K0300 support
Date: Sat, 17 Jan 2026 10:26:47 +0800
Message-ID: <cover.1768616276.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTMJ082ppbNkgAA--.65061S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGlp0zcWgwAAsz
X-Coremail-Antispam: 1Uk129KBj93XoW7WryxJrWUKw4rWry8GFWDZFc_yoW8GryDpa
	n8C3sxGr98KryUArZxJry0yrW5ZryrJFn2gFZxZw1DWay5Ga1jqw4ft3Z8XrnrCrWfZa4a
	vF95Cr4rKFyUurXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI
	0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jnSdgU
	UUUU=

Hi all:

This patch set introduces the Loongson-2K0300 RTC, which has a similar
hardware design to the Loongson-1B, but without the alarm feature.

Thanks.
Binbin

==========
V3:
- Add Reviewed-by tag from Huacai, thanks.

Patch (1/3):
 - Update commit title: dt-binding -> dt-bindings;
 - Update the commit message to describe the binding ABI breaking.
 - Drop `not` and  flip the 'then' and 'else' schemas around.

Patch (2/3):
 - Update commit title: dt-binding -> dt-bindings.

Link to V2:
https://lore.kernel.org/all/cover.1767663073.git.zhoubinbin@loongson.cn/

V2:
Patch (1/3):
 - New patch, correct Loongson-1C `interrupts` property;

Patch (2/3):
 - Drop Loongson-1C changes;

Patch (3/3):
 - Rename LS1C_RTC_CTRL_WORKAROUND to LOONGSON_RTC_CTRL_WORKAROUND for
   consistency.

Link to V1:
https://lore.kernel.org/all/cover.1766471839.git.zhoubinbin@loongson.cn/

Binbin Zhou (3):
  dt-bindings: rtc: loongson: Correct Loongson-1C interrupts property
  dt-bindings: rtc: loongson: Document Loongson-2K0300 compatible
  rtc: loongson: Add Loongson-2K0300 support

 .../devicetree/bindings/rtc/loongson,rtc.yaml | 13 ++++
 drivers/rtc/rtc-loongson.c                    | 71 ++++++++++++-------
 2 files changed, 60 insertions(+), 24 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


