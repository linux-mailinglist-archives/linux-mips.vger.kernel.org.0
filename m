Return-Path: <linux-mips+bounces-3602-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2166904F9C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A7771F2575B
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 09:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1363E16DEB7;
	Wed, 12 Jun 2024 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="2fiUFocI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z2sSrXNB"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C314A34;
	Wed, 12 Jun 2024 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186017; cv=none; b=R6J8u4mZQFjO3VsZtP6KRb5jxBVngsPnQEhuIwlZ4w+Q1Xq7/X837YqOSf0Ej3slHy/k1JRnMCdTV22adSGu/kW5v7MByOMIajc4XkBbrYxzhHMa6TuIeiuZ8qEmb3YldM+tRMg5+HD6JuHWNPaBEMWhsEz5X15rbhm+1tjJFBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186017; c=relaxed/simple;
	bh=LTt8Soc7AMOTMEDD18dBhsJ9SMhm26/CHqO5qzg9vxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qDJTixV4UWKuEqdazdTVQk6sWnbz7MzqbIjjNxixibz9jtgSk27grbU4oyt58LqyazV8eHgEtACNKnskg8f16KiSVrogwyTxK/UuMNVM1irToDI+cQjJc+OoyhYu2UtnFSfQCXoBlSg5RrB1boIUtdLJvfquw36L44G8SmlfnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=2fiUFocI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z2sSrXNB; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6024F13801AD;
	Wed, 12 Jun 2024 05:53:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 05:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1718186014; x=1718272414; bh=cQ
	HyV8JnUmrwi4UXdpt8Fz/R++EiBrxTEeAiMYKquj4=; b=2fiUFocIm6MKx+iF7U
	jcwIxKirHmAxbKf4f462HEQF/WZG5ptIMOveFcjFcA+88chcrP8Qqo0jY67KN2w1
	ayxJKmHc18C14Q3RxP8Z0vNXTomefa6+M0ewJNVfHDuPyebmPDjj1qqxG7nJCMgu
	Aji9UOmTSmmnpwfhQpGE5v4/by7ySXAELYIo1UpOGJ8Lk3oKVQ40TvNKYBrwg9Cq
	4FJKVljEqOZb8enG93yxtiaQ5NqaBh7PpX5ONM4qKlZMtWXV4EKUNcVZs8JqvMwx
	OVEz2Q/p3SIqM+SFajcv+kQRJ/1DWrCkObXecVo10I7XZnj5T7UW8EtmbM2Tx6Dm
	vctg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718186014; x=1718272414; bh=cQHyV8JnUmrwi
	4UXdpt8Fz/R++EiBrxTEeAiMYKquj4=; b=Z2sSrXNBsuaYRfKGSVKKsSjsZx3WB
	PZwAerV1qVa+BVcXyjihKi+Qz19KsnL2kvLdTQqu1Mr+rBS6oSkNdG8DFlf4bd/9
	DBTYP8+i+D4E/j0OT6Z8GDVf/tbmnUuOJKFVUiR52Kxo4GDGs5S7tYAvaxk+f16D
	WO+2E1nUBX196O0U23QReRuzDVbDp4cYtf1bPCqiDRLRXSuC16tbQ1LX4PD7DExW
	79GrshaFx/HPY0VppOpjzKOru/jcKGecJy21GU9ZRJeo/0mYOJ9Nhrb6zW4/Mrwt
	TBaRWPHe97w3zyljQEcoBuKk6ARr7JbJkd6fsEB/DCYrUeNUpIE3jAXag==
X-ME-Sender: <xms:HnBpZny0AhU4fDHMQUapMGuPl1Vpd0Gg8Z_21aiiNvFjlX0ybD1hMQ>
    <xme:HnBpZvRclJKkEGdNfUF8FbS2F2NiAkMKde7tz5mWPaGZap3_fzpzDeU7lJEtV3_Is
    kt7eTCn6C7IDssoccE>
X-ME-Received: <xmr:HnBpZhUk__SU2x7HTQd69lKjlc55xecfEX5NTYKJ0k7rF52P96ZLm6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeugfegvdeuueejkeejteek
    kedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:HnBpZhinTEmeaLEsNce0wYZajqDZfp2RCRzXy0hxCtO0fi-OVZ-FRg>
    <xmx:HnBpZpB5Jir4bWZ324tkTFHTq-toBlxQTqFenn_m6NCh1gYTcGpjOA>
    <xmx:HnBpZqK-P_URGWTLymsmBjaT7RnbPcV6vx-vueemfKyMtg4eRwgBVg>
    <xmx:HnBpZoBIX11wl-b3btcgj7Qpgrhl9BqsmH9Y-4oGsYSnUBvC0fJshw>
    <xmx:HnBpZr0wtk7dixymJTeyZE4Qaa-v5vvdHjyWRCGkgWJS1h4s-vGqAqkj>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 05:53:33 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/4] MIPS: Enable ARCH_SUPPORTS_ATOMIC_RMW
Date: Wed, 12 Jun 2024 10:53:28 +0100
Message-Id: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhwaWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDM0Mj3dzMgmLdnJziZF3DNKO0JEtDM8tkgyQloPqCotS0zAqwWdGxtbU
 Aw19DZFsAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, 
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=LTt8Soc7AMOTMEDD18dBhsJ9SMhm26/CHqO5qzg9vxg=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMAlnmuji3CdNlnhk5T1u/N7V3oWP9sm/hQdneDZ+N7
 vkfvbWho5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACaik83wP7osJ/WSmOusjxcY
 OlRWf9239rnC6dPZ5VO2Fal8nSgx9xYjw/8v6k8id9VYPFHudT/8Ye692e6vt6eWBGmkMomdD7q
 pyAMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series enables ARCH_SUPPORTS_ATOMIC_RMW for MIPS.
The first two patches are for making LLSC availability information
available to Kconfig, and the last two select actual options.

Please review.

v1: https://lore.kernel.org/all/20230519164753.72065-1-jiaxun.yang@flygoat.com/

Thanks
- Jiaxun

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (4):
      MIPS: Introduce WAR_4KC_LLSC config option
      MIPS: Introduce config options for LLSC availability
      MIPS: Select ARCH_SUPPORTS_ATOMIC_RMW when possible
      MIPS: Select ARCH_HAVE_NMI_SAFE_CMPXCHG when possible

 arch/mips/Kconfig                                  | 28 ++++++++++++++++++++++
 arch/mips/include/asm/cpu-features.h               |  9 ++++++-
 arch/mips/include/asm/cpu.h                        |  1 +
 .../include/asm/mach-ath25/cpu-feature-overrides.h |  6 ++---
 arch/mips/kernel/cpu-probe.c                       |  9 +++++++
 5 files changed, 48 insertions(+), 5 deletions(-)
---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240612-mips-llsc-1f2fb9169c0b

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


