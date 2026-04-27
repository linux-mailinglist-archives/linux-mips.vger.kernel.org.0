Return-Path: <linux-mips+bounces-14326-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGe4Nzjc7mm+ygAAu9opvQ
	(envelope-from <linux-mips+bounces-14326-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 05:47:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 821B346C91B
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 05:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83D3C3033D2E
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 03:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385DA36B061;
	Mon, 27 Apr 2026 03:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qokvMuaj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF9B3624A3
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 03:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261493; cv=none; b=HkppNc5iPwOCszo5hG99uxsybCEouX4ZOiu6IpTItGHqsdm/FJ4NRiH1eIoS9mI7RWFR01+WNVYFHTW59GGbxEGZT+tMamEOn8vrXRz5fX2V7Nze9VUTdkJ8N6Kw2MY/Fl44iezthgMCaZzM3BE70PcUSx3/qND11AaW6+PHrHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261493; c=relaxed/simple;
	bh=m8RlGgwURyICt4aQmcsLHhrwNopwUAIPa5Y88JK2eEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQDcPO+VhixA82T12RC1s0G7rkUNF4VWeOwerDZOR6c/ZrTGhmlyF3lmWx8crv2WO5WExTUmkZg57XtUu6TqnGLE7rwBorEDwoy3wcUMSdwtPE04QKjTnKqPLBt4e43i8lhQt16ueVydDNh0tYBU98aGZZNmVWOPcZdFSE1Nceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qokvMuaj; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b2ea1b3962so55432545ad.0
        for <linux-mips@vger.kernel.org>; Sun, 26 Apr 2026 20:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261491; x=1777866291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=;
        b=qokvMuajAOpzl26J9X6XYx+S01mVCKDdnmCS3nEbLfpkn3oNG017cUAmeUXmSKCotx
         FpcVMKl+zZ4ZykBiuk9C601KcjNBzDZbsHqUt6e+ZnAqv3SCAzOu9gK534jyjtHI3AI+
         CyYcStlv0V2c47jrEYyarsSek1Grcd40iLn3JCkXRt6uKMrbLhiECQHNG4hwj5o2p/0R
         onaU41IYKuyaa5hg3tPAUnj8DV+Apm8lwBcE5wy4yB2i2lmm2cHD9PHy3bw78XLKvoan
         azr2HpOv9nN3nNu9YpiSz7/7uJjJz34YwuR3oSrdvvJmGvVvvqNnuVNuEfHoG1wB2tig
         z2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261491; x=1777866291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=;
        b=f+sOcgFYgw2eioPTgw+jaoxKcYACjDF+Juc5xGCBD0uGBjE8jwG26kNcdzUVfap7j2
         saEmKhuL8A1zve2+Q6vj9C4WoZwOFzKkebJSlto8EYfNh0T9jTRmA5dQXQBWqAEUNQSX
         W+ygOag4K+pWaz0oHsBO6eyWwaBkRrvm1pjGEGBppdqg4ZCEnt6cSm5Xk7ngooQy7MCg
         0kbT5wM8Xxsk+EXUqtXApqUIbIRL7aqFAk6YA3Wyhy1FXL1uIkm5vw1c0+sWGmlO5TOy
         UHHgokgcpBrb8JNL93P8Ngsy4Uca+QSH3opYmKx7tL/ybDGcTRvfaNdBPa25QiRRpYri
         8kjg==
X-Forwarded-Encrypted: i=1; AFNElJ8k/+k2JESEEmTz8BB2oivfc9H4CEjjAvUX1rnFsciRRduRjq/Yb368dAof7tUNLupSVS5DErzaD3Wv@vger.kernel.org
X-Gm-Message-State: AOJu0YwxpohoGxSIJeOUBPTM9z/yPnjVsEdUGl13lCNerEbqG6vP1Stb
	Af6aahPoucV9UoqnllGspOhbXWNLtQlULtirYJkB/KvYQLwkr9OZnXTu
X-Gm-Gg: AeBDieuN2XlYP8XjC5PIIqPsXIsd/q1hQBC1vsbXTvZc+d5r3mDEnWrvFANJUv8/aKO
	eDTnrhAeBahJ0ifKDPjn2G2O6QtNQTal5hJJa1oxggMxXwjUOTjwNZI0gL909NOfJpMjhgk2vBQ
	EekKonROQmeZ/v284fwB6R+f1x2u+HNIxw+ShM7hhH0l000Gj0vbsdMSZBhqJ27b2sbkhjJXMCq
	zEO9pCH77NEcdzSBsC5JB/ztqC4gVCXYmno/4D5N7soRypR1NRrmcfB9whhWYYhSphghe6t0KqY
	zBcDz5hF5PFu7gFGozyc2ndtOSeJRmZWE6T7jTO0gn5/GYfhwJLWQI1PsN+/B6PiOuDPweY+Qp7
	8clyZOtttOrjhpUlhS2hzZdimJGj+lycOrgqdzhQYbbTUS3eWeufuV6Edsukhp/dH7pby90lNF/
	eRWkAk3gNDcQdAKobdXM04dfpX+I7+1n+/mdr7ESKOmHiJ41KLkpgAi4ecI/dcrzImSlNpXUjma
	lq+QlyxHoAU0BpIjkEy3OaPSw==
X-Received: by 2002:a17:903:32c9:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b5f9fa70e1mr428464165ad.27.1777261491168;
        Sun, 26 Apr 2026 20:44:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
Date: Sun, 26 Apr 2026 20:44:27 -0700
Message-ID: <20260427034427.881389-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 821B346C91B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nbd.name,kernel.org,mediatek.com,sipsolutions.net,gmail.com,collabora.com,alpha.franken.de,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-14326-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

mt76_get_of_data_from_mtd has been replaced by
mt76_get_of_data_from_nvmem in all usages.

Remove it to prevent people from using the deprecated
mediatek,mtd-eeprom binding.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
 3 files changed, 92 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index afdb73661866..092804323d81 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -35,89 +35,6 @@ static int mt76_get_of_eeprom_data(struct mt76_dev *dev, void *eep, int len)
 	return 0;
 }
 
-int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len)
-{
-#ifdef CONFIG_MTD
-	struct device_node *np = dev->dev->of_node;
-	struct mtd_info *mtd;
-	const __be32 *list;
-	const char *part;
-	phandle phandle;
-	size_t retlen;
-	int size;
-	int ret;
-
-	list = of_get_property(np, "mediatek,mtd-eeprom", &size);
-	if (!list)
-		return -ENOENT;
-
-	phandle = be32_to_cpup(list++);
-	if (!phandle)
-		return -ENOENT;
-
-	np = of_find_node_by_phandle(phandle);
-	if (!np)
-		return -EINVAL;
-
-	part = of_get_property(np, "label", NULL);
-	if (!part)
-		part = np->name;
-
-	mtd = get_mtd_device_nm(part);
-	if (IS_ERR(mtd)) {
-		ret =  PTR_ERR(mtd);
-		goto out_put_node;
-	}
-
-	if (size <= sizeof(*list)) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
-
-	offset += be32_to_cpup(list);
-	ret = mtd_read(mtd, offset, len, &retlen, eep);
-	put_mtd_device(mtd);
-	if (mtd_is_bitflip(ret))
-		ret = 0;
-	if (ret) {
-		dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\n",
-			part, ret);
-		goto out_put_node;
-	}
-
-	if (retlen < len) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
-
-	if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
-		u8 *data = (u8 *)eep;
-		int i;
-
-		/* convert eeprom data in Little Endian */
-		for (i = 0; i < round_down(len, 2); i += 2)
-			put_unaligned_le16(get_unaligned_be16(&data[i]),
-					   &data[i]);
-	}
-
-#ifdef CONFIG_NL80211_TESTMODE
-	dev->test_mtd.name = devm_kstrdup(dev->dev, part, GFP_KERNEL);
-	if (!dev->test_mtd.name) {
-		ret = -ENOMEM;
-		goto out_put_node;
-	}
-	dev->test_mtd.offset = offset;
-#endif
-
-out_put_node:
-	of_node_put(np);
-	return ret;
-#else
-	return -ENOENT;
-#endif
-}
-EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
-
 int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
 				const char *cell_name, int len)
 {
@@ -163,10 +80,6 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int len)
 	if (!ret)
 		return 0;
 
-	ret = mt76_get_of_data_from_mtd(dev, eep, 0, len);
-	if (!ret)
-		return 0;
-
 	return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 527bef97e122..f447ecac664d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1339,7 +1339,6 @@ void mt76_seq_puts_array(struct seq_file *file, const char *str,
 
 int mt76_eeprom_init(struct mt76_dev *dev, int len);
 int mt76_eeprom_override(struct mt76_phy *phy);
-int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len);
 int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
 				const char *cell_name, int len);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index eb92cbf1a284..c24e1276700b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -29,10 +29,6 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 
 	offs = is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
 
-	ret = mt76_get_of_data_from_mtd(mdev, dev->cal, offs, size);
-	if (!ret)
-		return ret;
-
 	ret = mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", size);
 	if (!ret)
 		return ret;
-- 
2.54.0


