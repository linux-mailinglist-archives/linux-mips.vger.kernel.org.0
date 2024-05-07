Return-Path: <linux-mips+bounces-3117-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4C68BDD9F
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 11:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F0861C21A4A
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 09:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB5314D44E;
	Tue,  7 May 2024 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="GbrVqsw7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OtNW7qJz"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B099E14D2B6;
	Tue,  7 May 2024 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072514; cv=none; b=E1AbetJm+xW7SIfgneXPER/gEK/EBoHOt5pla9bz4HXXIoK7OyxcKi6YihMLAcecGcEj4nlv6cZzNtrg2iqe7JJrg0fZhMtDxx3OVSwYoZGKP8ySryKTt82islY6iBqP4oVgelzTTFxF4Duxs2t12fAMYqDyQGmtee/eJvzinXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072514; c=relaxed/simple;
	bh=MkHue8S4BQIxwK+1JsfuYcgFlqMXjlm73/q8bJJv11Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rQZSCawsPQL4U+J1BuGKkCFISsDSUM7xXNAokMIcIMOk3BoW5VYTJjmSto6zdRBbvKGWTY9B7vWlGkDAjJQERYqT8Cx5fUp6cv66mpA3FOPGo2icOuOPwt8AAbSCRoKV72exEImUazIeg3yrdsi6lJAfygsoyzzQqKfyS3U/rtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=GbrVqsw7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OtNW7qJz; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B423A1140174;
	Tue,  7 May 2024 05:01:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 07 May 2024 05:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1715072511; x=1715158911; bh=Hi
	hTRv1yZ67xb/WPLADRRBZMZzkOnW5oUxtfEvjFXJM=; b=GbrVqsw7nz5In3SnjO
	sNAKbNzGemUcOR1Z2HPBVo6xNCOVbS1p8XVuOVHbSxke/OZkgg0vHt9MfcEWKC41
	OCthxJaiPb/D+vTq5Ksjf7BvzZrTR79eryuILY7UFjbBJJ8VEQJL//bFnfxx7pIU
	fjOqT0YyCNQMT9wzn1b+1nHKkmy5b7AMERo2TxoWzO92/G/7Z76GZV16tXWhoIUz
	Qp2S9UUuHVmk1j5n0l6VAqsB+XqEFUTjnBbf+m5gT4NGbWL4q8dXIHexx5O/5i0Z
	n1vOTW4PokoFRfyx7SjzcsBjMUSp+W6Rl+X3KMAjL5UStDVmxWHhC+xup0HrpGgm
	mk5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715072511; x=1715158911; bh=HihTRv1yZ67xb
	/WPLADRRBZMZzkOnW5oUxtfEvjFXJM=; b=OtNW7qJze4EbCIht+75D7ShE92HH7
	16Lo2VRFrAsT8m5g1+BM3i8/G8vxgceowWWiv7Do5B/k9mxAmI1POPD/KmrkEa26
	/e8nVz5onnTJs8LScFUshvuupWUZB78mCgJFLh9fvw28pZPqNNEClk01P2Y7onl9
	llrIjGAdAm9ZI0gKIELZGz9n40uOtP5cnmrHJ+6x8I2+Jtr6tEVcVz0rXnVaQu+T
	cK7NYAcWezN/XIU02exLiFNLMOORsuPtqQbxWNo6i9UIDaBVg1XAgcONHUE5z82a
	C/vWpS/07vs1XCzMZExbVTETAKjxG2Gbg3VSCeOCt1fF27mltMBZ8rhvQ==
X-ME-Sender: <xms:_-05ZlKa-p8zpvkmvBIlVQXW4saIZKteNn60vEGdJEsewnilkHWBdg>
    <xme:_-05ZhJ95-ttViHmkH8QPej_XnD1AE_A4swGVjITHgahpHcHx2s_NJqWqwT8EWbo8
    yVOedM_mPcxQn_ltOk>
X-ME-Received: <xmr:_-05ZtvE5ks5okBjxMsBW8_ncLg8u1yA8FKjEDDVrW-0t6vwghvzw8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepudffffffhfeuheevhffgleevkeeugeetfeegieeijeehfeekheek
    veduveeigeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:_-05Zmb_5U768GPCYVnNx08G2pA7VSFn-GIa_agaKBoR_LRFD4KwvA>
    <xmx:_-05ZsYmr10-KZbUuTkwOhPpTXFLPdAy4tK__USv4j5N0bgWrz7pOw>
    <xmx:_-05ZqAC2DM1ttZ4KY9uhUN8yloaMVHtUeE1MYFeaw7ANnpVoEUUGg>
    <xmx:_-05ZqZvcsO272dutd9PoRmd0oL6gejbQdfeH4oyWglYZu_SW8A6mg>
    <xmx:_-05ZqnFsesbJMFp0Fr2pZFaVJ6lpvahdndI0fNAP7F3wvTvIY-KEkoa>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 05:01:50 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/5] MIPS: cm: Probe GCR address from devicetree
Date: Tue, 07 May 2024 10:01:48 +0100
Message-Id: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPztOWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwMz3eTc+IKi/KRUXYNkMzPzZIskM+OkNCWg8oKi1LTMCrBR0bG1tQD
 ymTllWgAAAA==
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=MkHue8S4BQIxwK+1JsfuYcgFlqMXjlm73/q8bJJv11Q=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjTLt//P21bd2hWk6yKzs2/VC/vlWnoZc3x6rimEcDZ4L
 Lz+1T6ho5SFQYyDQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZy/g0jw0QrSzExt+Pnk6tO
 f/H82nRin/vWhTLsP/cEXjkiWGvqLsfI8Ed+xpeDLGEMq1lPnZv3Qtku7enk0E9W3jHT5ojF3Zz
 hzQIA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series enabled mips-cm code to probe GCR address from devicetree.

This feature has been implemented in MIPS's out-of-tree kernel for
a while, and MIPS's u-boot fork on boston will generate required
"mti,mips-cm" node as well.

Please review.
Thanks

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (5):
      MIPS: generic: Do __dt_setup_arch in prom_init
      MIPS: cm: Prefix probe functions with __init
      MIPS: Move mips_cm_probe after prom_init
      dt-bindings: mips: Document mti,mips-cm
      MIPS: cm: Probe GCR address from DeviceTree

 .../devicetree/bindings/mips/mips-cm.yaml          | 37 ++++++++++++
 arch/mips/generic/init.c                           |  9 ++-
 arch/mips/include/asm/mips-cm.h                    |  4 +-
 arch/mips/kernel/mips-cm.c                         | 66 ++++++++++++++++++----
 arch/mips/kernel/setup.c                           |  2 +-
 5 files changed, 100 insertions(+), 18 deletions(-)
---
base-commit: 2b84edefcad14934796fad37b16512b6a2ca467e
change-id: 20240506-cm_probe-0c667c8b63bf

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


