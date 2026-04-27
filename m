Return-Path: <linux-mips+bounces-14325-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJWeFwTc7mm+ygAAu9opvQ
	(envelope-from <linux-mips+bounces-14325-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 05:46:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E714A46C8FB
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 05:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CAD1302797D
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 03:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890F236074D;
	Mon, 27 Apr 2026 03:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EB9MyRgC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BB236215E
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 03:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261491; cv=none; b=F03q6apwb+y0zO2WepkrZJU+yCoMus+NWTdFZO9r9SRdVyKjOBhPhI2TK8MUVuBygNQd0N5+uFWYaHaR3vVlt4bPq2IrUE/z8BDYYD0FKjLmEHku4PK80RXUQstI5XnkySrzzdYQu8zbBPnomDyElWNRdLZvPI5vge4/mxcES9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261491; c=relaxed/simple;
	bh=AlqGAY2/4NNL+jMyIRi7fYh3ze89oIFRvHFa0sQLods=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXKzH3KwKsQNxODlEH1tx29Y7esk/+oDz6cZOuby0JeBjwu+B4ei7d8IldpLgG1e3hoaJxhfw7NvogMhEXegXCy3rwcxR6SCfcCbA/tI7ORpsP+S+nLrTvfjhU+F1AVPBoI36A9aRpzUBQ5M2WFgMMldwZxDkgI3WQplGy3dqVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EB9MyRgC; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aae146b604so64769765ad.3
        for <linux-mips@vger.kernel.org>; Sun, 26 Apr 2026 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261489; x=1777866289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=;
        b=EB9MyRgCDNMOAifBuvL4E/fQOTgUNA45DUQiiJdXbk9hqZgkr4JlYgNPPBQjQfarxx
         BdBcc8374LjSIsy6lnebz+ZishixE19m02QOzwqsyn/rDCaJpTXZ3vn0jvt0s9CwWl/l
         mwi/2IiRnnbIrNDb8Ixf4mZy4742JbcaoB1jTGUVvL2wXsFb8N3ZzW90GpmT+GKIxtth
         pkIwueEZpvi68Dms/xVG+FT8s/HoABSIG/UQaHMScDlR7J3jV072O5shvdfrrngDZime
         7xOw0txPoPaJWBVW+yw9JY/hFVFJo892GV8ikjTHpCQ7pcnp8x/lFbYORbfE6bGLzUEv
         vBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261489; x=1777866289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=;
        b=dvab6C/wDKSq7O50YhIfhUSM1d5oXJ5QKPUokWo0Ve9qHWaV5aBBBxCbTFcyUd5bd3
         BhHgMEqhU/tiL9BP5RMIpwOiOE5qmqNqfJ96Hd//s6LupTLP5veehl3ZKyYLP6mnSqfv
         I5B7VGAB56U4JB/Wzp0r4DaArht90w4m8GJGs1UovjKlJ6d3vtiPKE5/1lfgbAJRAW6V
         ytXeJqDyaRihLsQ4+DvlsdggGcG/Gel9krL7vvaCjEH5iO7mccltAb4X5ix+AJuf3oLG
         FWtb6ijqral5n8Gz7ui5fH/U2yAW+88tmtftin5v1UpzF1SFaD/BKn0FECeOposbKJ2G
         5CJw==
X-Forwarded-Encrypted: i=1; AFNElJ9L4zJlOugTw+HupNX0q7jxCONFLt/1KCEnOeznJkadXp4amxsw9zI/kEykNdt44N9DEhTr/+vQUajs@vger.kernel.org
X-Gm-Message-State: AOJu0YztCB8l8lK13nMjpH9HL2Gz09WMSHp76rH9Hmw+ZtsYN+p2LlDg
	f4sjuRe1vaOtNDr0Mn3j/aaK697QDe1u7x0d6MElu58Fl32JhOnnDZp1
X-Gm-Gg: AeBDieu04rUGbTlk4q3WoPVzmLUgSjCD1VHw1kesF3u0n/EXj+8jSmPv8bZV+Rir35X
	/RDNrWI7UXB72z0tCwqunOFMC1UqwVRQ9YiYXa6TKUTtJ0J5QpolIk/ETrTUiCmwAwLYGKHdrO8
	yQhhgPZm6NEoLpqMWswenoq6x5bazfk5xFkAwMshM5DJ0u2SsGxQ6oMrg5hno0i3t4sU4KcOEE2
	SoJCGy/c/fWnTPZYZLIYiMageXlMlfWhnOlDGPMS/XH8RowOrpwqaP3c3z8QAKXyC8tfsNAkVgP
	oHG4TxTXQadpTBYJpucpe5wtHiaVsFHoJ7q7moHjQpwgiCxKwwB1E2MHfWph5hvYDlpmuMkjhkW
	yyc1C8DFF0AkRiY9sjwyWu5DNA+1dZBfY4YKYKtyJHRxnsJ0ppyo7zmLR5Y4QqGVO3GEeXI2fVZ
	dHIISfAT8kxCTzT0FbC4u1jAG83aTngqMem8S7Iye6ziyodJwEObKa/xHHnmW1Q6yoL+HcxUtAd
	Mj1g8SkpKOqBwdq3eQGtFf8uw==
X-Received: by 2002:a17:903:37c3:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2b7aba0aea6mr161097325ad.11.1777261489333;
        Sun, 26 Apr 2026 20:44:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:48 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: net: wireless: mt76: remove mediatek,mtd-eeprom
Date: Sun, 26 Apr 2026 20:44:26 -0700
Message-ID: <20260427034427.881389-3-rosenp@gmail.com>
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
X-Rspamd-Queue-Id: E714A46C8FB
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
	TAGGED_FROM(0.00)[bounces-14325-lists,linux-mips=lfdr.de];
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

mediatek,mtd-eeprom is a widely unused binding that predates and has
been replaced by NVMEM. As there are no users, remove it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/net/wireless/mediatek,mt76.yaml  | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc44b..482c22cd6627 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -87,21 +87,6 @@ properties:
     description:
       EEPROM data embedded as array.
 
-  mediatek,mtd-eeprom:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: phandle to MTD partition
-          - description: offset containing EEPROM data
-    description:
-      Phandle to a MTD partition + offset containing EEPROM data
-    deprecated: true
-
-  big-endian:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Specify if the radio eeprom partition is written in big-endian
-
   mediatek,eeprom-merge-otp:
     type: boolean
     description:
@@ -314,8 +299,8 @@ examples:
         compatible = "mediatek,mt76";
         reg = <0x0000 0 0 0 0>;
         ieee80211-freq-limit = <5000000 6000000>;
-        mediatek,mtd-eeprom = <&factory 0x8000>;
-        big-endian;
+        nvmem-cells = <&eeprom>;
+        nvmem-cell-names = "eeprom";
 
         led {
           led-sources = <2>;
-- 
2.54.0


