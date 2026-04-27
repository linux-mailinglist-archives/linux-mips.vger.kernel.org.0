Return-Path: <linux-mips+bounces-14323-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ou7hI7Hb7mm+ygAAu9opvQ
	(envelope-from <linux-mips+bounces-14323-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 05:44:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3AF46C8BC
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 05:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B9EE30028A2
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 03:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14FB35F8D2;
	Mon, 27 Apr 2026 03:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTOrdszY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811962E11D2
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 03:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261487; cv=none; b=DDoU4o7ihbSbGYPBaB0OyuUBNfXZJACMkFjZ1v1CTa0kbd8eq6iF6BljvS50EBdVkbTWwmsPhWmID+2hMqn64IGSZtCNLJTEvE0OvTjETpojX5TR22GPivoT3kt07tAigw7+B82xYNEVVUJnRAAmFZrarI8vG47SgcV6LjHdkD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261487; c=relaxed/simple;
	bh=j5aLZ0bQ/Gf1GYmI3hytmPuG91fCyx2+8V1l/Gvl8tE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QCvDQFxfQoL5yfBzIC433S79vx7K7YacWfbXu4JZlKsj/wg2bFHdTzOCGrwuH/JWFKymjrEO04EyHzHSDFVfdWAqB4XDhOT1Xd5CsKM1A5adkixzvYagtnGJ8OL0Vg4RKYQsg+WKXABbM31ObnQxjE2yPksIQmFg/dxy22Jke7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTOrdszY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b2429f98d0so56003245ad.2
        for <linux-mips@vger.kernel.org>; Sun, 26 Apr 2026 20:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261486; x=1777866286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=;
        b=ZTOrdszYArogEbP2wp06bvIccMhoFcJZ9z5L5v+W1YdtMxaoSFNhkHefUZEhC5Y+Hj
         J1bGNc8Yv2fML49i4E04dK5z6iJTpQiGqmKeznOIw9n3ApNwg9r1jv9gPbEK5r7FwTm9
         m6q7XOPlnnyIgQmCy+tI04sxo56qLduPp67+Eg4gYizHwMkVuwLMUlaEDVTrYCd2s6iA
         C6Mhj20MeKFUtmEsrQxXW4VORaLWpFp9CiCYa+YySpp0AEbIzIEGUq6sStzXqn2OFLXK
         A/I5fyRQlEUWOVjE91zGf7Ry1/4R//muyw4lEJTylSATH1cQwii/8HfJYB/f4rP1AB7c
         8F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261486; x=1777866286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=;
        b=C1Lr3RhO74JgT1d3TWtCs7jPXf+qiTVP9fwj8D/WvaR+M4wsJQnH4pkQUt3eEAL/36
         FXwuz9wlpAkWgC8qH/VNStQwWBmV/tPhMOI0QWk1Xrbr4rNCkcIDIY+H6Uy7no04Gqbl
         jmxpXdXICcdzUonxYEtZZivoW3Qm0YS0Q3t405aIfVrm6f7PQYxBdLdwNzdygTqld5QJ
         XgpQPahLHqO1FE2njfn5PCb2FzDw1vzVoAvVWh1sBztoGY0I2t1xGJUgWM6+KZlth89T
         wfToRiIa/pZpHJITSCggaSpozjHhBXLBGrZ9ochc/E3Y9WM6+NGB2IEzi95JPsCSsszf
         dJqA==
X-Forwarded-Encrypted: i=1; AFNElJ+86Mrzeuhwu2bT+3oeVIM9F4Q2WRnSiKtm1enkq3aqL7ANwg/VdqqE3xzwfvZEd4pi+69uqQmyX1Vn@vger.kernel.org
X-Gm-Message-State: AOJu0YzgNutxbQtNi5a/PUBn3GtbFX4PnK8Z0hNtql75jZoq7+vVwyKo
	RFJft9cJmgOb5fy0FaHpcJ51QVEyULDF+M4tyKhd+k9OlB62A67Mls1m
X-Gm-Gg: AeBDietyt7I0uqQD6n+J1uvX34j/UNsF3XWJaXB9CuPFogS42Twm8AMrQ0Z+W8Ez51p
	NVg8NX3loN/KihEnBsJOTmKYEp9FvRQ09p+9FHN0fQTZbDcHvg0/SzqDywAWot4DAiBS2BcfF1a
	r98mQTIWR4UIYy2GXbHAVekauY31PEw95yfgKGo+EJ5/C278tkpE2CGReDGLDED89nY0Xdsb+ao
	7MTCf2cY6V2X2uXER2LRixBXT/MoirWzorsYKjFcmcfixehy8FMyGC3j9msvIw/IUxQnTAH7+gz
	1WV6ZeVia43L/17bhfjVgr86LlAeSjpnUWairn3k5TeyvYoCPdgYbabK29LFTvs5On9skCLQ71b
	K79zc071zv32wNUoxA+PMQYXs/cV4wGt2lRzWUUT1F9FT+CQ6e4i8DWhTDar/VMpYK1BMCws62H
	IBY43YGySNuWNJXLYNt8zl2E9MculPk787cbmetCJyniAvPNbOIHSLn1amQRd2DavUOMBz6fHjc
	uxj32cK8vqUohtMf1kVSBwgZw==
X-Received: by 2002:a17:903:1ac8:b0:2b0:70c8:ccea with SMTP id d9443c01a7336-2b5f9eaeba2mr422778205ad.13.1777261485859;
        Sun, 26 Apr 2026 20:44:45 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:45 -0700 (PDT)
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
Subject: [PATCH 0/3] wifi: mt76: remove mediatek,mtd-eeprom
Date: Sun, 26 Apr 2026 20:44:24 -0700
Message-ID: <20260427034427.881389-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2A3AF46C8BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nbd.name,kernel.org,mediatek.com,sipsolutions.net,gmail.com,collabora.com,alpha.franken.de,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-14323-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

mediatek,mtd-eeprom predates nvmem which is used everywhere to grab
eeprom and mac-address data from MTD devices.

Transition the one place to nvmem and remove the binding to discourage
use.

Rosen Penev (3):
  MIPS: dts: ralink: gardena_smart_gateway_mt7688: use nvmem for EEPROM
  dt-bindings: net: wireless: mt76: remove mediatek,mtd-eeprom
  wifi: mt76: remove mt76_get_of_data_from_mtd

 .../bindings/net/wireless/mediatek,mt76.yaml  | 19 +---
 .../ralink/gardena_smart_gateway_mt7688.dts   | 17 +++-
 drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
 5 files changed, 17 insertions(+), 111 deletions(-)

--
2.54.0


