Return-Path: <linux-mips+bounces-14097-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOiJCuwf2mnEyggAu9opvQ
	(envelope-from <linux-mips+bounces-14097-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2026 12:18:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 744D43DF476
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2026 12:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F16983005D00
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2026 10:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967DA30171C;
	Sat, 11 Apr 2026 10:18:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B07294A10;
	Sat, 11 Apr 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775902685; cv=none; b=aEViSdX9lm9hlUfwhJA7oah8TFPw0ef3Q8DIyVIqGwW4dhGBFvf6xgG5UxuhtmO9k7szT01Ys07Ml4KId0fGpYVeSwWovF80rRfZvnd5HauSYk9biV0bCHfzJP+6XXM0QNo2TNvHFQ5O1/wJ1XdV3uBvupLjrxMtZOqs4ZcU1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775902685; c=relaxed/simple;
	bh=P7JgAQUkHvF8eV5CI8MNiikfBhYq8gaNjsfbWNvhsfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+bcMU28BQ5RIsXWxdhzsOUO3DE9y8NueKfwzjRVOeLAYsInZI1kwWGZPNgjNGFGWotci2IwCTB5d0FYDCCwMJi2C0m03OK7a5uGWrx/XcEsYGsLhhKaqpeiNiAoKEhdjAJls7imt+T+v8WX3R89ZZ74ckegRXf0sLB2lA/yLa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.1])
	by APP-03 (Coremail) with SMTP id rQCowABHaeDJH9pp6sKrDQ--.17907S2;
	Sat, 11 Apr 2026 18:17:46 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 0/2] Enable LPC interrupt controller on MIPS LS7A systems
Date: Sat, 11 Apr 2026 18:17:42 +0800
Message-ID: <20260411101744.4020216-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHaeDJH9pp6sKrDQ--.17907S2
X-Coremail-Antispam: 1UD129KBjvdXoWrCFW8Cw43CryUKw18ur4rKrg_yoWxWrg_GF
	yIvrZ3Ga47Xas7JFZ7ZF1IgrW7WFWUuw1xC3Wvqr48t34Yyw4fJF4DCrW5JFn3XFZ0qF1r
	Wr4kXFWrZ3ZIqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14097-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 744D43DF476
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchset tries to enable support for LPC interrupts on MIPS-based
Loongson systems with Loongson 7A1000 PCH chip.

The corresponding irqchip support (along with the DT binding) is already
added to the tip tree.

Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse as
integrated ones.

This patchset is splitted from the original patchset that contains both
driver part and DT part.

Icenowy Zheng (2):
  MIPS: Loongson64: dts: Sort nodes
  MIPS: Loongson64: dts: Add node for LS7A PCH LPC

 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.52.0


