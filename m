Return-Path: <linux-mips+bounces-5151-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9296204D
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 09:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86475286F38
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 07:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AAE158A04;
	Wed, 28 Aug 2024 07:06:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB5415746F;
	Wed, 28 Aug 2024 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724828769; cv=none; b=U+qhLlg3rgK678JkyTtIuR69rSTsdNPt4QUhD12nhNZlQVg4KhJ3adAmq18rSi7aIvlK7J1fGOHK60U/sygu6W6UUaIc1g16jP9ONQxQy7CdG6pZFCaQK2Ek/yCmPHf7hzsni/rUXex3QLlqfkae6M5qw2gvtluLxNbKXD/21SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724828769; c=relaxed/simple;
	bh=lLBJeaqBhEtwZfAOc+MBl2NBhfl0qWeIuwY64mtnmxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gAPygcW1ewhtdmjo24ch74zxATtz3pfbLXxd8QZFNwAojQdq8sWmfy6gMwJut5+pTlY6roMT8rnzXUtU9ppHN8nxX6Zg/oL/kwsOf0Erkd7Yt0SjSYwBpxz8KPyRx4VKivNwRPGusPZWOUcrq6EAS/Gg/QHExQMrbWDEsKQItjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bx25pczM5m3XsiAA--.32987S3;
	Wed, 28 Aug 2024 15:06:04 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMCxB2ZbzM5m5UglAA--.2269S2;
	Wed, 28 Aug 2024 15:06:03 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [RFC v2 0/2] irqchip/loongson-eiointc: Add multiple interrupt pin routing support
Date: Wed, 28 Aug 2024 15:06:01 +0800
Message-Id: <20240828070603.3518753-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxB2ZbzM5m5UglAA--.2269S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

There are four times about EIOINTC_REG_ISR register group access in
eiointc irq handler, in order to get all irq status about 256 interrupt
vectors. It causes four times VM-exits since eiointc register are
software emulated, here multiple interrupt pin routing is introduced
and each 64 interrupt vector is routed to one interrupt pin.

With this method, there will be only on one EIOINTC_REG_ISR register
group acces in irq handler, it will reduce VM-exits.

---
v1 ... v2:
  1. Add different route_info handler as eiointc interrupt handler
     parameter, so that irq handler can read corresponding ISR
  2. Call function set_csr_ecfg() to enable cpu interrupt pin in eiointc
     driver inside.

---
Bibo Mao (2):
  irqchip/loongson-eiointc: Route interrupt parsed from acpi table
  irqchip/loongson-eiointc: Add multiple interrupt pin routing support

 drivers/irqchip/irq-loongson-eiointc.c | 83 +++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 8 deletions(-)


base-commit: 3ec3f5fc4a91e389ea56b111a73d97ffc94f19c6
-- 
2.39.3


