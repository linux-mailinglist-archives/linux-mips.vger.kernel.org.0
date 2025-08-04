Return-Path: <linux-mips+bounces-9993-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2130B19D80
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 10:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5653E189878D
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 08:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91332241668;
	Mon,  4 Aug 2025 08:20:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448A7242D8D;
	Mon,  4 Aug 2025 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754295600; cv=none; b=LZk0TjpOq1RD2WFLgwe9/p9cfqOI3XTE7Qwkn8EqC+HMgrsiCraatcylTMiMHOieCMpaPeI7//AFOk/ziy7c8nbNqGdI3hsIuS+n3qk5ugC/tKpen9AdzA18Kz7n+WSuicdvP7sdP5Fas97mo1xLsXCRj3OdF6Eut0aqcrnAcXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754295600; c=relaxed/simple;
	bh=UgWhFDPfqwWi/B5y9DEeGb7u7hq/hkDsGo2z5krccHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R8xo3zZ+IjpeuZsY3WWOQGRyZh09N7mqI1XhdJ/96viBtZoClD1o5STWx+860PZl5G1FP1K8q4xHEiVIC3MnTl5Ht8TIhwfsz1F1Eu1iWXwdrhIp6j4m50k/ORXhhxMap7p9vL1p9VJT39mC8/yoa4toOA5AzWh2QhjDsDJgt3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxbeIlbZBoATk4AQ--.7152S3;
	Mon, 04 Aug 2025 16:19:49 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAxE+QibZBoTUU1AA--.65480S2;
	Mon, 04 Aug 2025 16:19:46 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v4 0/2] irqchip/loongson-eiointc: Add multiple interrupt pin routing support
Date: Mon,  4 Aug 2025 16:19:44 +0800
Message-Id: <20250804081946.1456573-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+QibZBoTUU1AA--.65480S2
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

There is about 6% improvement with netperf -t UDP_RR on 3C5000 Dual-way
machine, where netserver runs in VM and netperf runs in host.
            Socket Size   Request  Resp.   Elapsed  Trans      Improve
            Send   Recv   Size     Size    Time     Rate
            bytes  Bytes  bytes    bytes   secs.    per sec
Orininal    212992 212992 1        1       10.00    21689.78
With Patch  212992 212992 1        1       10.00    23022.67   +6%

---
v3 ... v4:
  1. Update to kernel 6.16
  2. Add performance result

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


base-commit: 3c4a063b1f8ab71352df1421d9668521acb63cd9
-- 
2.39.3


