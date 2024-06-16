Return-Path: <linux-mips+bounces-3691-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 915A0909DB3
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 15:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7E1281D2D
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 13:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E10E188CDD;
	Sun, 16 Jun 2024 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="TkKew1Cz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lvm4MzsR"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4660188CC5;
	Sun, 16 Jun 2024 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718544342; cv=none; b=ehlk5Rp5oBgUNUpvqamuVR17ubcn5gBIOSEA4aNYSU9IZOJ7m4uLCeYDUpGwTweeeRgOPD6bI6bL+NRNbaqccBSSTieWYONZEqjZJ5EiRP1jVJr9LmPguJ6EJfqTedEHHyNdm0c94oN3G8tkbd4XbhMLf8NUIHHoxSAPWe7Mx2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718544342; c=relaxed/simple;
	bh=Et779FeuNWZclxrmdOYQKmc3OZKxVm93sf+cH8Swk6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nblPAEqm3Dp+YZJ4U663SN9upkwoML8Cu8Q8DgcHS3U2MgTP1Xw6MGyeup81x4Iyw8b+ZYdVVJ1+bfrvvFg6fowOqRyCLBoL/e781BVZnATYuT0CK0HYnzTWlxNMXXSpPdYRg277fK91KGV4ygTXssFyczmNSVqhQtdx5GgRRGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=TkKew1Cz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lvm4MzsR; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id BB0CE1C00095;
	Sun, 16 Jun 2024 09:25:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 16 Jun 2024 09:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718544339;
	 x=1718630739; bh=UFtmELAbV0dazR6tW8AmQP8wxh+6rkY4WLYXR/M0IPo=; b=
	TkKew1CzBBdFmYWm1qlfWXi2oiMkDbRf27KRqGiUjpp6lZlS1J7u/EblBhViZBP4
	JTXeCXyJK5Wk7Vg22SFaj9xpUnd3BwYzxPAJgtkNtU1J5pepsR6EfgF6031Ar5BK
	lAfywIxASrqGKLUEHqu+shGEmLZTQfe+tEYv1cuHn2P3A2GkojN/R7qODnd7Q/dF
	0a5ZXGec9qRJMQs97BkP5JbwdfVD69yKDAIsFSU4CyvUotfbAcOBCShAvxFlq8YX
	nhjRceywXPk+FzoS9ZXNLzAktOaNxYVfcpreOJZv0MSnCm8skBgDHx1XahYWS5vS
	5yY+hr2KtHTvizRL6+xqOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718544339; x=
	1718630739; bh=UFtmELAbV0dazR6tW8AmQP8wxh+6rkY4WLYXR/M0IPo=; b=L
	vm4MzsRmyzghLCzQNKYZkntlI/VUCXHL4F+dRZ/WgO6uL1qlgH311fox4PAyvziy
	NxA1TPhqvU4NSg6oG6rDwxZYBMxAGyUn0dRuFVnRaG3wR4seKKnqAW1wUfVX9dI+
	q0SYTgLUHQJvJxYElSCurK4qgcQ6BQYd6TwmccZK3tBCRtUxmdWMs8h6LCwcNWr0
	3Kgp5ahF0L786a80/donSu9SjEvTpsY/Hd4DNpNHytGatca3TbK0fu0Mii8YQJXk
	YgZpbLNlqEAnKAmwN+e4yTUieFTBy4V/c/b1aTmVuWguVLiPBVbnkKUtNiXI1CF/
	3Tr3l0ammFQiB7RZSO4Bg==
X-ME-Sender: <xms:0-duZjijKOZ3HrP9evlvdH9bf4nOt0EVu25jg91AdJQlPZKKce9wvw>
    <xme:0-duZgDrh9HWs6ojeD9Tc0NoMPIYPI0NysmYcUMID8HZAPIbB-9IvsKIDxxqpSKkq
    ZCDEwTk__6q-BISXKg>
X-ME-Received: <xmr:0-duZjFnYe980tpEr9bIWLpZAkxSiIBYAESKr8me2bthiyqHdJBxjbk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:0-duZgRiPlPDl-4W4E4ayWQZ0-pKkME2TUyZNmqQIlGp1inA5flBnw>
    <xmx:0-duZgwYk426OT5wSprwFYBMcg4ViQOktPXohhcPi1uCmPOmleTSsA>
    <xmx:0-duZm6hMoNDz9TelmE59dOL7xPutmla5dgzfJtoh6JfOvE7J2M1Tw>
    <xmx:0-duZlwhnQGCb05fYI9tdhgcdOm45eZjbZ9nMp9-1f8ZLlfZcNC1Aw>
    <xmx:0-duZvpzC-kcqPXhX8eNqanI0lUBzXL_BYEGHbfRqYirPm03Iyzy44en>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 09:25:38 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 14:25:02 +0100
Subject: [PATCH fixes 1/4] MIPS: mipsmtregs: Fix target register for MFTC0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mips-mt-fixes-v1-1-83913e0e60fc@flygoat.com>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
In-Reply-To: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=864;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Et779FeuNWZclxrmdOYQKmc3OZKxVm93sf+cH8Swk6s=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS85xd1z8gU/Kyb6pyXt73b54DpjCaGqHh1zf8mL1y6L
 rkbLrXoKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIn0MzH8z/0pV3xqmQ7fPclG
 yfuzuuUl/1x4G2lazXq/QmK3do92JyPDAx2v6P6HLxh/fGb8M+eSgxDDg7Wx/cL8jO2d38OPm8s
 zAgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Target register of mftc0 should be __res instead of $1, this is
a leftover from old .insn code.

Fixes: dd6d29a61489 ("MIPS: Implement microMIPS MT ASE helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mipsmtregs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mipsmtregs.h b/arch/mips/include/asm/mipsmtregs.h
index 30e86861c206..b1ee3c48e84b 100644
--- a/arch/mips/include/asm/mipsmtregs.h
+++ b/arch/mips/include/asm/mipsmtregs.h
@@ -322,7 +322,7 @@ static inline void ehb(void)
 	"	.set	push				\n"	\
 	"	.set	"MIPS_ISA_LEVEL"		\n"	\
 	_ASM_SET_MFTC0							\
-	"	mftc0	$1, " #rt ", " #sel "		\n"	\
+	"	mftc0	%0, " #rt ", " #sel "		\n"	\
 	_ASM_UNSET_MFTC0						\
 	"	.set	pop				\n"	\
 	: "=r" (__res));						\

-- 
2.43.0


