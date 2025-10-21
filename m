Return-Path: <linux-mips+bounces-11837-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 298AABF8484
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 21:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B634022E1
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 19:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A647326E6FF;
	Tue, 21 Oct 2025 19:38:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BC6350A2C;
	Tue, 21 Oct 2025 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761075512; cv=none; b=oXTDiDig7imhUb826slXtXErQ/GS20nOEMYo65Gu2XayjvXrUd5D22S2h8T84iVPAnNvvYPG0vBofljfxICK0UKELr5OaTPrs0d5lBRBndaB9ZXXQrF9BDhtB8zNQV5pT9W0798eXHS+GEKZu4vlliyylYhSMloMD3mjn2xKnrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761075512; c=relaxed/simple;
	bh=6O/9qaWfEjlTYlM+TIrDzQlfkmfnsByO+S4xXrLWKFk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iQILQCyBWPu3lBtDpo9XeUNA4KDq8ms54y3JL1kvu7LCzjlIrsby3qmavQDLBUJf6cAfZlz6BxbDUxhKlPZEKnrmoYBfheol+5H9afNylQfkdNh8xD6y1DqPhUZNCeFeEqVaR8UnyhvR0m6r0dWri9FKHgO+j0TxQKVnDPWYC4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9F5E092009C; Tue, 21 Oct 2025 21:38:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9B03592009B;
	Tue, 21 Oct 2025 20:38:29 +0100 (BST)
Date: Tue, 21 Oct 2025 20:38:29 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: Malta: Fix PCI southbridge legacy resource
 reservations
In-Reply-To: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2510212001250.8377@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Covering the PCI southbridge legacy port I/O range with a northbridge 
resource reservation prevents MIPS Malta platform code from claiming its 
standard legacy resources.  This is because request_resource() calls 
cause a clash with the previous reservation and consequently fail.

Change to using insert_resource() so as to prevent the clash, switching 
the legacy reservations from:

00000000-00ffffff : MSC PCI I/O
  00000020-00000021 : pic1
  00000070-00000077 : rtc0
  000000a0-000000a1 : pic2
  [...]

to:

00000000-00ffffff : MSC PCI I/O
  00000000-0000001f : dma1
  00000020-00000021 : pic1
  00000040-0000005f : timer
  00000060-0000006f : keyboard
  00000070-00000077 : rtc0
  00000080-0000008f : dma page reg
  000000a0-000000a1 : pic2
  000000c0-000000df : dma2
  [...]

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
Cc: stable@vger.kernel.org # v6.18+
---
 arch/mips/mti-malta/malta-setup.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-mips-malta-setup-insert-resource.diff
Index: linux-macro/arch/mips/mti-malta/malta-setup.c
===================================================================
--- linux-macro.orig/arch/mips/mti-malta/malta-setup.c
+++ linux-macro/arch/mips/mti-malta/malta-setup.c
@@ -213,7 +213,7 @@ void __init plat_mem_setup(void)
 
 	/* Request I/O space for devices used on the Malta board. */
 	for (i = 0; i < ARRAY_SIZE(standard_io_resources); i++)
-		request_resource(&ioport_resource, standard_io_resources+i);
+		insert_resource(&ioport_resource, standard_io_resources + i);
 
 	/*
 	 * Enable DMA channel 4 (cascade channel) in the PIIX4 south bridge.

