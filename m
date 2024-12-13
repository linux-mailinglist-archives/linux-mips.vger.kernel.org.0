Return-Path: <linux-mips+bounces-6994-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C19F033E
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 04:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23D54188469D
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 03:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE4B1607A4;
	Fri, 13 Dec 2024 03:50:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8957DA62;
	Fri, 13 Dec 2024 03:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734061838; cv=none; b=i+bbwsD4g0HFtzsXtsmavjAOoxZga6XcNblEyzO6dOmOP5EDBhQi7YbY6RovonTaqOyEcUaw5hTxGw/7r07aC6C8L32DJOtvDjx+NGgrAOqN2/eUuux0tv39L6uTZibakm2TWxQx3qegODJlnQkiIw2nJCalV06I1o7AkbChAJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734061838; c=relaxed/simple;
	bh=hiEC7arCdUSMBwLua35LiRBAuVwtm+9jEQwq35PRmnI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W2bXfln0lf52tFURWrw8VmwUM3pDnOOOVdzgxTXXaYxESHOkLQ1QrkkTgvitPKqpuvHZAxc79X4DuNLSIBf7Iwt09gKgbsFqjB3zg32NLeFcVLz/bo5gHdRIVHjKbMSMGb6WP0sqBdzp9wBXwq26n1xc7N5ptAZOrCtag63p6jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxaeEEr1tnMXBWAA--.36583S3;
	Fri, 13 Dec 2024 11:50:28 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMBxP+EDr1tnV3WBAA--.53391S2;
	Fri, 13 Dec 2024 11:50:27 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v3 0/2] irqchip/loongson-eiointc: Add multiple interrupt pin routing support
Date: Fri, 13 Dec 2024 11:50:24 +0800
Message-Id: <20241213035026.1643517-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxP+EDr1tnV3WBAA--.53391S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

There are four times EIOINTC_REG_ISR register group access in eiointc irq
handler, in order to get all irq status about 256 interrupt vectors. It
causes four times VM-exits since eiointc register are software emulated,
here multiple interrupt pin routing is introduced and each 64 interrupt
vector is routed to one interrupt pin.

With this method, there will be only once EIOINTC_REG_ISR register
group acces in irq handler, it reduces VM-exits.

---
v2 ... v3:
  1. Update to latest kernel version and solve some confliction.
  2. Add strict check about multiple interrupt pin support, only the first
     eiointc device support this since intterrupt pin is limited. In order
     to support multiple eiointc driver in future if there is in future.

v1 ... v2:
  1. Add different route_info handler as eiointc interrupt handler
     parameter, so that irq handler can read corresponding ISR
  2. Call function set_csr_ecfg() to enable cpu interrupt pin in eiointc
     driver inside.
---
Bibo Mao (2):
  irqchip/loongson-eiointc: Route interrupt parsed from bios table
  irqchip/loongson-eiointc: Add multiple interrupt pin routing support

 drivers/irqchip/irq-loongson-eiointc.c | 96 +++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 8 deletions(-)


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.39.3


