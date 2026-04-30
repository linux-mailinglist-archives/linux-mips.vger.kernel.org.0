Return-Path: <linux-mips+bounces-14406-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCvpF5Z282mt4AEAu9opvQ
	(envelope-from <linux-mips+bounces-14406-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 17:34:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 102704A4DC3
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 17:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9ACB73011CA7
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 15:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0484C33D6E3;
	Thu, 30 Apr 2026 15:33:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F7D31F9A3;
	Thu, 30 Apr 2026 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563227; cv=none; b=JrKClcCPmvugzBTgtaMPbcWcaZgVkEMJ+N5l7/aoOJZ2Jyc+6NW98BSJ0zTZWl2491sW65CdBZsQQZD5K0MTkTetn8GcgfpUXkMc/tJhquxfOZVJdqh8X5ps3io/NMQmcffOZfLHIu6gJMQrXuyBHwlOPkeYwXHoEZgCE75qpnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563227; c=relaxed/simple;
	bh=aIyoNAj5rUTLLb9C21t0YUvB4rf1DO5cACrPoFhslLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxTsLMrq3N7FX1BSJEO41ytNhgoeJcwsVOytOjJHzzLG1W4DVRwDbG24GncqmLzjdHoZYq3pMvw3DM3KEUOK2e4L0jMLu9cELSb5XUGm0mMYvJahqqYMmRcXHTlnNSE6S3O7CFCr+0IFaGWknmDXsHS6C/bJg9f1GpFrEUj9wHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EABC2BCB3;
	Thu, 30 Apr 2026 15:33:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/7] pinctrl: ingenic: Fix type in .pin_config_group_get() callback
Date: Thu, 30 Apr 2026 17:33:14 +0200
Message-ID: <9f50c234c44af9075b5252ee7e59452ed2179b27.1777562725.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777562725.git.geert+renesas@glider.be>
References: <cover.1777562725.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 102704A4DC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14406-lists,linux-mips=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,crapouillou.net,atomide.com,linaro.org,gmail.com,collabora.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-mips@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.468];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On 64-bit platforms, "unsigned long" is 64-bit.  Hence checking if all
"unsigned long" configuration values are equal should be done using an
"unsigned long" temporary.

While Ingenic is a 32-bit platform, it is still better to use the
correct type, to serve as an example.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/pinctrl-ingenic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index c7f14546de0528de..29d7f4e54bc7b126 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4334,7 +4334,8 @@ static int ingenic_pinconf_group_get(struct pinctrl_dev *pctldev,
 		unsigned int group, unsigned long *config)
 {
 	const unsigned int *pins;
-	unsigned int i, npins, old = 0;
+	unsigned int i, npins;
+	unsigned long old = 0;
 	int ret;
 
 	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
-- 
2.43.0


