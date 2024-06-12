Return-Path: <linux-mips+bounces-3607-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9093E905015
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 12:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EB482822BE
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C2916EBE1;
	Wed, 12 Jun 2024 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="vzMRfhY8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jTlIT4pC"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9052316E881;
	Wed, 12 Jun 2024 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186938; cv=none; b=tERVmUqTp9lFbJBMnv+Pa5yMA7nTRgePhYy5oZ0sbYNbAsaHGujeT3IxXx10ozDwXVjRAHWUHvXqt+mqfdRW7sib+wt9SWKe+9PexTp75mKQ84HEeALO2VK/iIdJoviS764C1eaY8mQH+deBidDSxIlyld8a7YIPyhMTbUSVwkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186938; c=relaxed/simple;
	bh=kDKnbPN2HdEb0ASZjrHmYSVseFvVUKnuH39mFiiBr68=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jS+v95moMPOJbQRv4Yck7aDN3x76VEs5bR0A5QO2J8dEjgPGo3Swj9jk4dfzvY/QpTFSuVV3ZpBylz//2GxWXmoQtHXdLU69lR8OsGAaGeSIYUFI2m5FXnoWirhUEJ2Rq1XNVLyL5dL7jaMSnPcOKGA4C5fxoyABWwsxlwF/kbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=vzMRfhY8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jTlIT4pC; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B3A6411401D4;
	Wed, 12 Jun 2024 06:08:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 12 Jun 2024 06:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1718186935; x=1718273335; bh=4N
	V1RUD3ve28x6fczxn0+RvtHY141lPA7ObponZntjo=; b=vzMRfhY8ZbaxC34eaW
	OUJ/XJKXR12u8+fg8LlsvPD89szTORzdYXxim8Xx4HkSMwjsmAVLONaZb+SzrXLr
	Z40suefOzJupm5FfgydmPRj69XHsMfQ9P8KsHhB8enuy7NwNFIoovOZ1wBfHS9p9
	hcYrjZ6A/P/OUr5phyStjefg6GB+phrwd2xGAKixVXekWupF71nMQvsVKxD4bHDJ
	khKFzoKNrc4k0Fj39nZk9OcZG68P3DOZPD3RhRF2Mcf41ljUfz0v3w39lHSFKsC9
	vL141PErK4HgIFnNNvuhQk99RRH3q6zGb3LqWMfwl9I52it414MapvyB1MWhfFGd
	PHKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718186935; x=1718273335; bh=4NV1RUD3ve28x
	6fczxn0+RvtHY141lPA7ObponZntjo=; b=jTlIT4pCXhfMLcMJ/OvH8p+etmINn
	9djp5coQBWDgWcjqlhJKm5ceG0LH6fKwYPjCDE4U2s4hfT5DwMs5vwrLmXvYCf2G
	fLCP+rs7eh1F8CxoG032p96MHZWTHW1jBTHTi2r2emxf9GWiLMncRD5f60Wmncjt
	ZFDKPPSAkncMhuOcYuSv1gJ65IQMbR/iLUb0refiQ2RYLSUwq9XeMKI6UE7AwLFt
	7TmVTHIyWBj07gpaDWq6ECk1zc/+VOjucKoe4YdMbG/IkafiMi3d8EJP2Ji7N9VE
	lbWYc/lSPX5rEBQKDRPbsAWrG9GY3sFr4knCYBFYPn7mHTC+VyOx3DOnA==
X-ME-Sender: <xms:t3NpZqsX6vwlilyTVitDQD5Hf9ZxueORMmgFjc3FNvvmxTVxFHNm0g>
    <xme:t3NpZvfRiWQhsQkPakQT2VJBQWsOttk4vNf5JkVvxDZs1QYnTu5tDm_0sNruHkMPv
    jSh9elP2shIuFaV_LM>
X-ME-Received: <xmr:t3NpZlyoZlqYg2Bz0l3cUW4vv6igXjCTo3-czPw_aeKdKXEloSowjrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeugfegvdeuueejkeejteek
    kedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:t3NpZlPDq_r47ps23fCXNUlV_0LjvaGmTLdfaKT9MG-1m4bHji-3PQ>
    <xmx:t3NpZq-AZlNIqzOOJpe8yNY1IBdAlCK0Gk2K8Aywo2flmZvgYUevew>
    <xmx:t3NpZtWgfH5XJTLu6RthrfImfOBcpZdSOQa6ut1tuJLt0YxClxcRuA>
    <xmx:t3NpZjdqiUCH036LvaceS3DtUZmdqGCEUxt0llGvP0gUe3tnSSE4gw>
    <xmx:t3NpZr2cunn_r3xhveMz35WN8GTa0qUO93cKDAsJE5iZA2z9LxYG1Q4m>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 06:08:54 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/6] MIPS: cm: Probe GCR address from devicetree
Date: Wed, 12 Jun 2024 11:08:52 +0100
Message-Id: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRzaWYC/0XM0QqCMBTG8VeRc91imzmtq94jJNw80wPpZJORy
 N69JUSX/4+P3w4BPWGAW7GDx0iB3JxDngowYzcPyKjPDZLLC6+4YmZ6Lt5pZNwoVZtGq1JbyPf
 Fo6X3QT3a3COF1fntkKP4rj+k/iNRMM6E6LXtq2tjS3O3r21w3Xo2boI2pfQBMi8ZqqIAAAA=
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=kDKnbPN2HdEb0ASZjrHmYSVseFvVUKnuH39mFiiBr68=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTM4m0saiFHVm7n7Naeo7y895vme2eH6VPOrt0gumNS0
 owr53fd6ihlYRDjYpAVU2QJEVDq29B4ccH1B1l/YOawMoEMYeDiFICJZF1i+B9yYt/+aV7rzoaX
 /dpe1b/t2FnznxvnrHm4VWGTxnPx+bN4GBnumFtOFVDedOrm1I0CS0xlrjn8z+pbOY/v63nJuo2
 3ergZAQ==
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
Changes in v2:
- Fix probe order on malta (Serge)
- dt binding improvements (Conor)
- Build warning fix
- Link to v1: https://lore.kernel.org/r/20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com

---
Jiaxun Yang (6):
      MIPS: generic: Do __dt_setup_arch in prom_init
      MIPS: malta: Move SMP initialisation to device_tree_init
      MIPS: cm: Prefix probe functions with __init
      MIPS: Move mips_cm_probe after prom_init
      dt-bindings: mips: Document mti,mips-cm
      MIPS: cm: Probe GCR address from DeviceTree

 .../devicetree/bindings/mips/mti,mips-cm.yaml      | 38 ++++++++++++
 arch/mips/generic/init.c                           |  9 ++-
 arch/mips/include/asm/mips-cm.h                    |  4 +-
 arch/mips/kernel/mips-cm.c                         | 69 ++++++++++++++++++----
 arch/mips/kernel/setup.c                           |  2 +-
 arch/mips/mti-malta/malta-init.c                   |  8 ++-
 6 files changed, 111 insertions(+), 19 deletions(-)
---
base-commit: 2b84edefcad14934796fad37b16512b6a2ca467e
change-id: 20240506-cm_probe-0c667c8b63bf

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


