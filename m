Return-Path: <linux-mips+bounces-3614-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB4A9051BE
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 13:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBC29288184
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449F716F28C;
	Wed, 12 Jun 2024 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="bLTTTIAJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Acs/FxLM"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E92C16E881;
	Wed, 12 Jun 2024 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193408; cv=none; b=n2xsa3txx8v7Rgjufk7fYKQTbf9b1XgQC4WHkc3MFNBFXCySo2ycZHnL11sKwWMv8j5UQhTHNwmPS9H2EuF4zHXFSg+Hn8NUaXYaAZ3ndrHIvYACBW01fWXkvol9UiLbVtSLqtGhGj60unYJqbUlnd/4pHU7i6pph3zRKkX0jOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193408; c=relaxed/simple;
	bh=ls/nWAOTi8XvMgR9Re+u8+3eb2zQ0ipLSfasbrSfUps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IXu5OcPSoCiLzgM7t445CKqnLggE69ACGbYWubX9jv2CtyaH9+rtHSPA0A0/pQnxn1q6GNLVDm/asD3Ims7XiJb4WkGaST85oHapOvyRr0s3vlLfdiYD9zdv6sdsFP5nF8wfp22O9rkj7tEkDn/YeSXhuLDpUfIF8xt7xWwovB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=bLTTTIAJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Acs/FxLM; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7BB6213801C8;
	Wed, 12 Jun 2024 07:56:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 07:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1718193405; x=1718279805; bh=qr
	6GvDGfUn90TNcCageDe0j6K7jl/OS6aFThJQQ6PdU=; b=bLTTTIAJZmGz0oUMuk
	6FbvBu/xpup+HSYrIHBYgoat297hzeFzTNds6Ja4o8xkFJ2wNQSd5Bc8JlZhW8yW
	RbkzHRfaszytcV073oJkhA+qcGpoZQF+LhEY2MWvByqSFc8E6mA2QgCV9geNqZWP
	NDxeQppx9YBIhU4y8MEU/Jqy6S2Og7PWmpi6TGEa9HyrHfgJw/u9H6pY7dYSnn0H
	+CYoGab3SJy7GnAo5Go31wN9RndC2PVBFoWbia/m2zVGCeUvfvjLPo5f7fMhO5KG
	UYuAc8FGdAGkB4KgJKmI2ZZfFgrDA+WUJXJe+kaFjYAcXDhBX8EW3fj/MX+mZ91V
	g23A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718193405; x=1718279805; bh=qr6GvDGfUn90T
	NcCageDe0j6K7jl/OS6aFThJQQ6PdU=; b=Acs/FxLMHZBPx7mmEhF4+gRtoWKV0
	CMbABIUIJ2TjaUAz8nN2wQh5rvQpSnMXv0GXx+G0mzQdAFluirYrtOWAVjMwgmkB
	fEDETQeie63eMQM7ei1Phh1/hUcQ4nS7pQ3U4fmvfZZqu0rr7lhOHB5dvh98cHRa
	Fmb1b+vgzx5xGah1zhBHg3PnYRazG2DrUEX4KFAlsAaubyayMEELoLs7irvjse7W
	7mRBedJiZJFHY0gsQbS1cyQBjeiTyC1z0U46d7+YxTH5ikxRTX3jrGPJ35NLl1zS
	6tuivr2SjUevNG9Sf2YPgsRjf8NOkJnsawrjVtBSxx5uVSRIvGJP6fUNg==
X-ME-Sender: <xms:_YxpZvcETBV0hXyy5WlB-7zpUeVk3C07BgA3iG6uGgRYSwXWyyMM1w>
    <xme:_YxpZlMjfmvtTuvhPzx2qx7eMfSuiMbzE9hQmcGAA04tfUXVNKZH43nYPUHkV2NhN
    5rw_hlLKOYIB44xr68>
X-ME-Received: <xmr:_YxpZoj0VZpMZAwR-QQ9uujLNDwcPzpANeU8jYdmMcuzalf3CsmMRUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeugfegvdeuueejkeejteek
    kedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:_YxpZg-6jpKFzV1jEwpsQdOMvcA2AU7OAPOHyqWOXv4dndXETd_LcQ>
    <xmx:_YxpZrt2Bmb4L4bjAuDp7REkcDGyLsQ-5uRTg6YiHMEqxjsqAEkOtQ>
    <xmx:_YxpZvErt14WDfWHT_FSfHwlXH5Icf58sFQVlu-S8ktbbI__twWtcw>
    <xmx:_YxpZiPNQdgAEXgr6gQwIy8ztSapOdp3Do7V-DQvo0FLDnUjluyJ0w>
    <xmx:_YxpZskttHE4d0ed5ZyNRuHtYsRzDDc0BcTvEh2AH_OhFA1AgSjXR5HG>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:56:43 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/8] MIPS: Boston: Fix syscon devicetree binding and
 node
Date: Wed, 12 Jun 2024 12:56:19 +0100
Message-Id: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOMaWYC/3WMyw7CIBREf6W5azE8I7jyP0wXSC8tiRYDDZE0/
 LvYvavJmcycHTKmgBmuww4JS8ghrh34aQC32HVGEqbOwCmXVDFBHjFvcSW5ZtdDo2AKjbTaSOi
 fd0IfPofvPnZeQl+neugL+7X/TIURSozwXqnLJJTUN/+sc7Tb2cUXjK21L3xr76usAAAA
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=ls/nWAOTi8XvMgR9Re+u8+3eb2zQ0ipLSfasbrSfUps=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMnj/qxhktxXnfVO9kt76WPPh6fvOd5mZuy1d/cqfvP
 XFEPH1BRykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAExkw12G/xXFWxoLJ2d1v9aw
 tVY0WLto7et1XPGzd2gsui6+6o+68lxGhhefD1ue6Pne5xAuvoaRVXMFU/Khf3uPsas1s208W9Z
 mxwkA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v2:
- Write a new binding for this device (Krzysztof)
- Sweep other warnings
- Link to v1: https://lore.kernel.org/r/20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com

---
Jiaxun Yang (8):
      MIPS: dts: Boston: Add simple-mfd compatible for syscon
      MIPS: dts: Boston: Move syscon-reboot node under syscon
      MIPS: dts: Boston: Remove unused #interrupt-cells
      MIPS: dts: Boston: Add model property
      MIPS: dts: Boston: Rename uart node
      dt-bindings: mfd: Add img,boston-platform-regs
      du-bindings: mips: cpu: Add img,mips compatible
      dt-bindings: mips: img: Add devices binding

 .../devicetree/bindings/clock/img,boston-clock.txt | 31 ---------
 .../bindings/mfd/img,boston-platform-regs.yaml     | 74 ++++++++++++++++++++++
 Documentation/devicetree/bindings/mips/cpus.yaml   |  1 +
 .../devicetree/bindings/mips/img/devices.yaml      | 33 ++++++++++
 arch/mips/boot/dts/img/boston.dts                  | 23 ++++---
 5 files changed, 119 insertions(+), 43 deletions(-)
---
base-commit: 6ba6c795dc73c22ce2c86006f17c4aa802db2a60
change-id: 20240513-boston-syscon-8e315e94a894

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


