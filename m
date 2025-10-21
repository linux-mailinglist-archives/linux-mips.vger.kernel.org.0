Return-Path: <linux-mips+bounces-11836-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32183BF847E
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 21:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D986D19A3A57
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 19:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1162826FA60;
	Tue, 21 Oct 2025 19:38:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F29350A2C;
	Tue, 21 Oct 2025 19:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761075506; cv=none; b=tZimd22WJkT38BQ7lK2VelheuNxVIxsTpxsiw2yq5w2H2C8OPx279kZaAtoUCGOzXJhgAOtgZXTrKxiVnZwlac2giM4ruKH/Olv0Y3e3I0cZs23fVyRMumCJMPmCvURSze4pRBYYd8WOa+axBJrHstgy7x0u6/qCHRPPRWkFzs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761075506; c=relaxed/simple;
	bh=mu74hCD0N5eZ9ZNUprqkV/jotbAo65ncNwIJD/9v7D0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uRm1Iu+KAtDg3A6j8Z8DzuiW3eV6MIW62Tym1oe5WJUDI2xazN6x09D/AsS+hbrOT7n0aO0QJXRqDJvn8bsqV0LxCqX+B03EeunZORaU3v54QCksIvqtUXGXfp50gc053A6yn7CPXNLdIjPr1ymxqiAUC8wL9cz3ujzoMQvSm94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 08E7A92009C; Tue, 21 Oct 2025 21:38:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0145D92009B;
	Tue, 21 Oct 2025 20:38:22 +0100 (BST)
Date: Tue, 21 Oct 2025 20:38:22 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: Malta: Fix keyboard resource preventing i8042
 driver from registering
In-Reply-To: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2510211919240.8377@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

MIPS Malta platform code registers the PCI southbridge legacy port I/O 
PS/2 keyboard range as a standard resource marked as busy.  It prevents 
the i8042 driver from registering as it fails to claim the resource in 
a call to i8042_platform_init().  Consequently PS/2 keyboard and mouse 
devices cannot be used with this platform.

Fix the issue by removing the busy marker from the standard reservation, 
making the driver register successfully:

serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12

and the resource show up as expected among the legacy devices:

00000000-00ffffff : MSC PCI I/O
  00000000-0000001f : dma1
  00000020-00000021 : pic1
  00000040-0000005f : timer
  00000060-0000006f : keyboard
    00000060-0000006f : i8042
  00000070-00000077 : rtc0
  00000080-0000008f : dma page reg
  000000a0-000000a1 : pic2
  000000c0-000000df : dma2
  [...]

If the i8042 driver has not been configured, then the standard resource 
will remain there preventing any conflicting dynamic assignment of this 
PCI port I/O address range.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
---
 arch/mips/mti-malta/malta-setup.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-mips-malta-setup-resource-keyboard.diff
Index: linux-macro/arch/mips/mti-malta/malta-setup.c
===================================================================
--- linux-macro.orig/arch/mips/mti-malta/malta-setup.c
+++ linux-macro/arch/mips/mti-malta/malta-setup.c
@@ -47,7 +47,7 @@ static struct resource standard_io_resou
 		.name = "keyboard",
 		.start = 0x60,
 		.end = 0x6f,
-		.flags = IORESOURCE_IO | IORESOURCE_BUSY
+		.flags = IORESOURCE_IO
 	},
 	{
 		.name = "dma page reg",

