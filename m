Return-Path: <linux-mips+bounces-14428-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODTOAcVy9ml0VAIAu9opvQ
	(envelope-from <linux-mips+bounces-14428-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 23:55:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEF24B38C9
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 23:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF0EF3003343
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2026 21:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4206833D6CA;
	Sat,  2 May 2026 21:54:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BDA319847;
	Sat,  2 May 2026 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777758882; cv=none; b=f9L9hAy5Yu8FN/YQ7dyP/5br2S9sfuesWdSpVPsRAEVHRJETcjLyeW1FGkxtSYZnvISDThyG6CCWHvs/EhqBn6Uc+3SAACINLattDOQRyJ3wKq8d1cUGDdGqndYe6trxuCKTTzOHTme+ohk2ZMZ3HbCdNka1Z7LkZiilVJVzwtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777758882; c=relaxed/simple;
	bh=tpnnFjisTahUM4MUYPoN0l/SLFoAL+pWtU6uPI3YPFU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jybJ5PaWoc7t92AqyxQZXvEbUdhXy/71JBeZ5sq5Nmvp24OhZXthTD7Z1azhZPPxMJTsxqh2QAsg/s56f1ZR96i8wI8malIr6q93pDn/JlfVrk6rfvoDn/zq3bKoBF1ruTz4Sk/EPJH9WvZOhpgIs2j/AKHgJpuwbrHrEJEd8q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 632CD92009C; Sat,  2 May 2026 23:54:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5E56B92009B;
	Sat,  2 May 2026 22:54:37 +0100 (BST)
Date: Sat, 2 May 2026 22:54:37 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Gleixner <tglx@kernel.org>
cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org, 
    robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] irqchip/econet-en751221: Support MIPS 34Kc VEIC
 mode
In-Reply-To: <87tssuxmh8.ffs@tglx>
Message-ID: <alpine.DEB.2.21.2605022158400.23161@angie.orcam.me.uk>
References: <20260425123531.270548-1-cjd@cjdns.fr> <20260425123531.270548-3-cjd@cjdns.fr> <87tssuxmh8.ffs@tglx>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: AAEF24B38C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14428-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, 29 Apr 2026, Thomas Gleixner wrote:

> Other than those nits, this look like a reasonable solution for a
> completely unreasonable hardware design.

 Why do you think this design is unreasonable?

 How is that different, at the high level, from say the x86 APIC priority 
resolver and vector generator, combined with the interrupt descriptor 
table (except for additional optional GPR stack switching, which saves the 
handler from the hassle and extra cycles needed for GPR preservation, 
though I reckon with x86 you could use task gates in the IDT to yield a 
similar effect although at much higher cost performance-wise as x86 does 
not implement alternative GPR stacks)?

 Analogously to x86 in the MIPS VEIC mode the IRQ number is determined by 
the vector rather than the somewhat arbitrarily numbered (particularly in 
cascaded topologies) IRQ line and available to the handler in the 
CP0.Cause.RIPL register field.

 NB this arbitrary non-VEIC IRQ numbering is particularly obvious with 
MIPS platforms featuring an x86-style PCI southbridge with an embedded 
8259A interrupt controller pair, where for compatibility with our driver 
code we give root MIPS CPU IRQ lines numbers 16-23 while 8259A IRQ lines 
cascaded from one of the IRQ lines 18-23 are given numbers 0-15.

 Example such an odd topology:

           CPU0       
  0:          0   XT-PIC   0  timer
  1:          0   XT-PIC   1  i8042
  2:          0   XT-PIC   2  cascade
  3:          4   XT-PIC   3  ttyS1
  4:         37   XT-PIC   4  ttyS0
  6:          3   XT-PIC   6  floppy
  7:      52456   XT-PIC   7  parport0
  8:          0   XT-PIC   8  rtc0
 10:   99668740   XT-PIC  10  fddi0
 11:          0   XT-PIC  11  uhci_hcd:usb1
 12:          1   XT-PIC  12  i8042
 14:          0   XT-PIC  14  ata_piix
 15:         15   XT-PIC  15  ata_piix
 20:          0     MIPS   4  ttyS2
 21:          0     MIPS   5  CoreHi
 23:  803937130     MIPS   7  timer
ERR:          1

(where XT-PIC interrupts are cascaded from IRQ line 18/MIPS line 2, not 
actually given stub registration).  At least the VEIC mode brings some 
sanity here.

 FWIW,

  Maciej

