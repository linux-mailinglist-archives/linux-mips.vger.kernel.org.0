Return-Path: <linux-mips+bounces-15870-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ippFYlfVWoNngAAu9opvQ
	(envelope-from <linux-mips+bounces-15870-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 23:58:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C57474F5F9
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 23:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tG9nqy6y;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15870-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15870-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A8A23034568
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 21:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC0236A358;
	Mon, 13 Jul 2026 21:58:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D4365A1D
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 21:58:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783979909; cv=none; b=ZgQXH+tcb9QwTd3ISzh7UhMryae/dtxHplKABf6XvnVgmEiyasFTn1dS+YKwz7KjCbC9r6tHKZG4QDoM3OkiV3wg2uML0Eg7w5PhTOsrvCR01dpIZkapJS1xvCu/kzKj7Au0Wdpml8mydWJcjZe1+KcrtclQyLgEZb/oRuPspP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783979909; c=relaxed/simple;
	bh=rvtLKiUTx8JU87qPeh1zFP/g9VJHkoaTb8XhvmeuwVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BHR9MIDXqNSUysiQayRDmgGGm937EreHs/2buXJwLVMNT/3dkNAUb+tdIbQqc7eh/HFve4ecC/EYd/wdnbR3FuLWXL0Xdj1Z4aJV4vlC92F6P6t//8c6XM2oSNDvu0PNMGajo/d8DwkaaICF28AqE7jbxreUcBjdogNmcAsZnYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tG9nqy6y; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381216921aaso3992520a91.1
        for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 14:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783979908; x=1784584708; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AhUPfC1ZGiOKf60pIcQbBz514ywJlA6acyUZE/li0u8=;
        b=tG9nqy6ytYfDhBxja30vXn7kKrDo2isMemReEs6VAjse+KfSENPL1wDHRZKjm5UBiu
         LO8/2U0XoD3vKUMadIHSyNiFjqizWwojoPI0mzTx5NJpGe46y+4SCnq4oovrq+cO9q8b
         ANmTS1UfvAsyMw25aCtb+WaDh5KvDFkgqpz/a0i9IADPuIix0Y4VUYDibNRgH3vq1MHW
         snBPQB3eqyR5gpNXACmpzwOiuRidfN9uixf1pA5Y9Si0FZu2rA79aUIs8+oxxV/MmWks
         6Hoeik7+8ZuDdPZ5UjTiAx6DMhQYU2SqqNKIfRyVlXdvgS2suqkeZLMDBF7vSn0WCD1H
         AaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783979908; x=1784584708;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AhUPfC1ZGiOKf60pIcQbBz514ywJlA6acyUZE/li0u8=;
        b=FN1DYxmQN3+V/pmZ57+l6KAOug0Rdst6LCtOt7GBzgSsUZ/r3PAuCgbwg8UWX03M7Y
         f5oCNQd0zsbNBgtQ9TnTpoYoMcDkEVenQ9zacDeRV7IQubD4v6OWp1i6e3SFDZXkdOER
         aBY/F/IOTOpQp++hFaIauQNiJUFVCRh7e14X0WBZ9ETNNvw8+FjOcpjfMaV/5EsQkbH1
         1o0Rmd7NgoCxwtvtDiq6UNDh+QM46+GLCcEAQi6gE/92/HOETUDjQCSDybn8Gao7Dlz8
         7o/rzrSBOiyqbPrI+34l5Spxp5wjqlLQ7fq0pEupzzzoDaDZwh2qab8aOZXDwApJX0uM
         UvOg==
X-Forwarded-Encrypted: i=1; AHgh+Rof8K6k5S5gXZMU9zqSLVdZRusxO/zjH5FoOU3I2C1e3hrB972c7LyJzQFSggd4MpFqrrhb1/gthIiy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7tx1X32KvSer3o74Ee0m6mqSOfc8zeXXcv7HU+WSidmOy5cZC
	Ffj7rkIf6QPu0EPFljl1CPqYH7BaT4T6d4qbrDO1zvGmJGrJn4sIs2vK
X-Gm-Gg: AfdE7ckHOlxeMAhb0Ey2lxeR/pi70FuwcgxI/fc97kAPApH38g3vW0I1uL065NZ/mYl
	fSXHw6NjxyQLp7+t16HljUzm8GH3pgmd1Dyivq4dbj7V+cUE44jdRkGZAZZGE53SjieYZMNXQY3
	9skZheG2hVxOWaTNvU98wd7Zg9jFJaJ0nYOd2xF+dz8YO6kLdv5vWk1u+uhGH2+/FTFDgANnWbD
	UOvOqAOdeVt7sv6oxCiPzuwYFv77Joiu+lZZA5YEr54J2zb2K3vVzxzubullm8hefTjdx+ASbXL
	4uTdv3aaovEFGLoO1YE1Q7vyPaH9YM7M4w3Oz5LYpJxCGxvecX+KvqpZxQAhsBPGvRB0h0EKfGh
	HdpC9FOyW0Qu1kBDsJgEmsNmzxi+gV6nmEVievsnjLURbJuNOqYa5UnIrwCJAaF8vNW531L+SR0
	ftiVt01B/URWP2sMcjGjRLzmdjtc6Fh+aG9SJ6uRaHG36aSxTmjLqLdCNp+3m50hFDDAIyvfc18
	Bre
X-Received: by 2002:a05:6a20:2d22:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3c1107650dbmr12735116637.15.1783979907832;
        Mon, 13 Jul 2026 14:58:27 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e15f:5d5f:580b:f2e9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8a5992c9sm28371487c88.4.2026.07.13.14.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:58:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/3] MIPS: BCM47XX: convert buttons to software nodes
Date: Mon, 13 Jul 2026 14:58:21 -0700
Message-Id: <20260713-b4-bcm47xx-swnode-v2-0-2b879f0c193c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH1fVWoC/22Nyw6CMBBFf8XM2jGlLa248j8MCygjjBFqWkQM4
 d/lsXV5knPPnSBSYIpwOUwQaODIvltAHg/gmqKrCblaGKSQRhhpsdRYulbbccT46XxFmGVnZSh
 NZWIMLLtXoDuPW/OW7xzf5YNcv4ZWo+HY+/DdTodk9fa+FfpPf0hQoFWiSjOlhVT2WrcFP0/Ot
 5DP8/wDrOxvz8QAAAA=
X-Change-ID: 20260627-b4-bcm47xx-swnode-99836e552166
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>, Hauke Mehrtens <hauke@hauke-m.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-b242f
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15870-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zajec5@gmail.com,m:m@bues.ch,m:hauke@hauke-m.de,m:tsbogend@alpha.franken.de,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,bues.ch,hauke-m.de,alpha.franken.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C57474F5F9

This series converts the legacy gpio-keys platform device on BCM47XX
boards to use software nodes and static properties.

To do this properly without relying on legacy name-based matching
(which is being removed from gpiolib), we introduce and register
software nodes for the underlying GPIO controllers (BCMA and SSB)
and reference them in the button properties.

The first two patches add the software nodes to bcma-gpio and
ssb-gpio respectively. The third patch performs the conversion
for the BCM47XX buttons.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
As Johannes mentioned on v1 this best should go through MIPS tree.

Changes in v2:
- Restrict software node registration to host SoC devices in both ssb
  and bcma drivers to avoid conflicts when secondary buses (e.g. PCI
  wireless cards) are present
- Fix dangling pointer panic in buttons driver by allocating software
  node references on the heap instead of stack
- Link to v1: https://patch.msgid.link/20260704-b4-bcm47xx-swnode-v1-0-730d59340237@gmail.com

---
Dmitry Torokhov (3):
      bcma: gpio: Add and register software node for GPIO controller
      ssb: gpio: Add and register software node for GPIO controller
      MIPS: BCM47XX: Convert buttons to software nodes

 arch/mips/bcm47xx/buttons.c | 442 +++++++++++++++++++++++++-------------------
 drivers/bcma/driver_gpio.c  |  43 ++++-
 drivers/ssb/driver_gpio.c   |  48 ++++-
 include/linux/bcma/bcma.h   |   2 +
 include/linux/ssb/ssb.h     |   2 +
 5 files changed, 337 insertions(+), 200 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260627-b4-bcm47xx-swnode-99836e552166

Thanks.

-- 
Dmitry


