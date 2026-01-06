Return-Path: <linux-mips+bounces-12758-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 503AECF64DA
	for <lists+linux-mips@lfdr.de>; Tue, 06 Jan 2026 02:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A797630802B6
	for <lists+linux-mips@lfdr.de>; Tue,  6 Jan 2026 01:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B2730F95B;
	Tue,  6 Jan 2026 01:34:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B062E62A8;
	Tue,  6 Jan 2026 01:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767663241; cv=none; b=tdI1Jp2a6hRFaQ2U+x+EkJILMhI2WMRGw+P5cEkaDNswCHjXZd7/SvARyhnPm4dsGhulEBS6Ecs3oxdkYNi0YY5nLGU+DArX3wWJL2Nl2YwcOtb9WpDPMVKJNR7xCb9CUt9JG8egqNZPNZU5OcYrPQtA2VVJuKukj46q7h/xWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767663241; c=relaxed/simple;
	bh=J3V6TtuE5AMRP9eOnw0YCgFdBP3IELwK8SngCudlElk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CMF6vNsBUW3AADunAdDRhDy97dIiJdBK6Qws8SiA4+59zqvdI65bpJ1ghhp0D0qpuooDDB9yQf8UXsB/9LsxPkqGpZ4Zrh2d8tD4ukCxbZKrpsoUH3BsO+Ng505e1IXVlmdmOTBYpTn/PovvV3GMDbZggY3z9Ylhn6wipvIaalQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8Axz8OAZlxp980FAA--.18741S3;
	Tue, 06 Jan 2026 09:33:52 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJBxKMF8ZlxpN4IPAA--.20395S2;
	Tue, 06 Jan 2026 09:33:49 +0800 (CST)
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
Subject: [PATCH v2 0/3] RTC: Add Loongson-2K0300 support
Date: Tue,  6 Jan 2026 09:33:30 +0800
Message-ID: <cover.1767663073.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMF8ZlxpN4IPAA--.20395S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQESCGlbUrYPYAACsh
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr1rXr45JF13XFWftF1DJwc_yoWfKFbE93
	4I9a4xXwn8Xr1xJa43XF17WryfXrWjva1vkasrtw1Fq34xKry5tFZFk3W5JF1xWrW3ZF98
	XayxGFWrAw1SgosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxV
	WUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8aZX5UU
	UUU==

Hi all:

This patch set introduces the Loongson-2K0300 RTC, which has a similar
hardware design to the Loongson-1B, but without the alarm feature.

Thanks.
Binbin

==========
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
  dt-binding: rtc: loongson: Correct Loongson-1C interrupts property
  dt-binding: rtc: loongson: Document Loongson-2K0300 compatible
  rtc: loongson: Add Loongson-2K0300 support

 .../devicetree/bindings/rtc/loongson,rtc.yaml | 14 ++++
 drivers/rtc/rtc-loongson.c                    | 71 ++++++++++++-------
 2 files changed, 61 insertions(+), 24 deletions(-)


base-commit: 16bd954c93360145bc77cc601e350913fc28182d
-- 
2.47.3


