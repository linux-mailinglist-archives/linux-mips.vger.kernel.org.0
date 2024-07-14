Return-Path: <linux-mips+bounces-4310-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1050F93084A
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 04:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0B911F217C6
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 02:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1342453AD;
	Sun, 14 Jul 2024 02:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="c+Vtxv5+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B7P76t59"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04072F5E;
	Sun, 14 Jul 2024 02:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720923673; cv=none; b=actruiMjfsd0CZGj9OWrS6YnmCM70GriE+KLtcKZLXVzS0sAbT9mZNbTl9FF7U3wLxHNR6LgRQv/sO3lxhnYGpMS5VieySm/E6m/Di5VvKvZqKx4RXOfByoh+2oGTHSjbZn8stZQc2Df7Yx8jjg8KkWSbPX2+ZJUMSDGYUrvmic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720923673; c=relaxed/simple;
	bh=fzSBnCd1jBDbangdb3noGLEnh+X3cellPhnMXgCpir0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qgobg1K2RJ24RrOfD8cCYSKVWa1UjCq8vI1+enm6x3+56/IbfuP8P0BAW6KhKCta9WVM8bxPPPPspxkWod+2Abtai/Zx6Ub5g59vMzKXpNeekLL/t7IBmW/yggTs79Okhh6Jhpl8ijctfXl+7PG1dEIIWTUvG5aNUr4wfg0BcWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=c+Vtxv5+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B7P76t59; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id CF4091386D18;
	Sat, 13 Jul 2024 22:21:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 13 Jul 2024 22:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1720923668; x=1721010068; bh=cm
	RgUJiwdx/VSnm+HObbdA5hg7lgmjkUpJyksqlIBTI=; b=c+Vtxv5+ewLG5xrpGh
	tLCSLXdt2x/k94jUIyB9TFSrRUtuMf5Ll3xuCZnNRxrlX/zg2d4GB/kzA4lUcnsc
	RRHMLkoeirKqc/6FfrA6GTy/hiGsJF8TT+tzow1GHlxJxaUdTyA2qUc41VIDv9IF
	ps1KCkxb5mJoTThc/flETSNtgDThK12qRAISuabfJlDz/+LuJm/4Tjs+wN6fOefy
	zX6jLv4QRqtb8wfhZW4oZMpfsbmEXTLF1SljiI3u4oRvhez3MQ8J1bFG8NZXUlw7
	VqaJQYgoMDNrMEy/fdO+pZCtRsTllpnZQjx9xCxCR5UaCtzzernzEnvwUcGdu0fL
	5HSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1720923668; x=1721010068; bh=cmRgUJiwdx/VS
	nm+HObbdA5hg7lgmjkUpJyksqlIBTI=; b=B7P76t59V9Se3E0lC8vtw/4cANTaw
	txSBNrFqrqxnpUVgopj2mOJs9fMxtJ+LstGu45PnWG7AnxnRc7eXYT/y/Mk5Zr4l
	l/LhgwSxKPkz/MRJbF8O4clwTRkmJyxIk02NWS4U3AyRu/MASoN7GuNeeDjqJKOY
	vtir7d7m5t8VCQm6GL7fLMB7ujiDH57eMj9p+CQkoHDjsQgOc9MFExRs0kFn5gB8
	LYwmOX+t7KohJRA7tHRlT/fM4Rmca/J1sVlOBqWanoEBxKVYWWW8hut5HerENWVS
	RZkbWu+NSvE2/y5ZGGp05pGVOzysjwgmG1hHGF+SKmcLOGCHPMo3lgLSg==
X-ME-Sender: <xms:EzaTZjMNmFN1mh2boGYo07NBAp52FOfdq4XpIkVLiCT1n946vdE4_g>
    <xme:EzaTZt-Mk-BlroHxEikhFeM7s2qmVTabOjQtl3vK676JR0oyxPaY20DOvUhWWhGY8
    SlH1H90KlvVBaeshyc>
X-ME-Received: <xmr:EzaTZiStV2YUfDoeU63CmaBtc8P_517oDPvXbH5L0JTGxVx4wZWTMufBnC1wWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfhirgiguhhn
    ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
    frrghtthgvrhhnpefgveffjeetgeejfeelgfekteelkefhuefggedvueeujeekjeetkeek
    vdffffefudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:EzaTZnt89nLcUVAsxsB9gta3p3OGs8X9mv30l5D6FjHEdKKdfeEfHg>
    <xmx:EzaTZrdGcQ6fqtA0yHt81HtTiXJopsWvdfAz6h7RpXk-pcrodQ5mpw>
    <xmx:EzaTZj0iXk8Nmb0vUCbUH6tsXaRc1UXZiQPFc0lutuwJNqsOg6KYQA>
    <xmx:EzaTZn_zsEawwQHmk7Wvbd8Jx3Mqvh5RtOVvRVqjRcuXofv4Y76dNw>
    <xmx:FDaTZi7TV2vgfVYsrjxyNH7Tgo8v8qFR9fSegXjkYq0wGvr4uENpJE8I>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jul 2024 22:21:05 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/4] MIPS: Refresh some configs
Date: Sun, 14 Jul 2024 10:20:46 +0800
Message-Id: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP41k2YC/3WMywrCMBBFf6XM2sg09oUr/0O6qMlMM6CJJKVYS
 v7d2L3Lcy/n7JAoCiW4VjtEWiVJ8AX0qQLjJj+TElsYNOoGe+yUCZ5lVpE4UnKKax56a/nStRq
 K9C6HfI7gfSzsJC0hbkd/rX/r39RaK1StfUyIXWMYhxs/tzlMy9mEF4w55y9gZYiyrgAAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=fzSBnCd1jBDbangdb3noGLEnh+X3cellPhnMXgCpir0=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTJZgJJTf/PfU4Luvbxn/8dtru7TkwNzmrXal0kM23Gp
 NumB1r7OkpZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAiq/8w/M/TuuYgpqUQqL3i
 s0oIk8jJi9P47PnP/JnEvLnhfdez9ZIM/5R3zd8981vcW70eaR+J0Dd5L4tmhfRdLp/FffLhgrI
 5xtwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v2:
- Fix typo
- Improve IP30 config (thomas)
- Link to v1: https://lore.kernel.org/r/20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com

---
Jiaxun Yang (4):
      MIPS: config: Enable MSA and virtualization for MIPS64R6
      MIPS: config: generic: Add board-litex
      MIPS: config: lemote2f: Regenerate defconfig
      MIPS: config: Add ip30_defconfig

 arch/mips/configs/generic/64r6.config        |   2 +
 arch/mips/configs/generic/board-litex.config |   8 ++
 arch/mips/configs/ip30_defconfig             | 183 +++++++++++++++++++++++++++
 arch/mips/configs/lemote2f_defconfig         |  54 ++++----
 4 files changed, 216 insertions(+), 31 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240706-config-refresh-f1f87ddf3652

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


