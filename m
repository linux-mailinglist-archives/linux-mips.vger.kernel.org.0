Return-Path: <linux-mips+bounces-13968-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DcRI4TWxmmtPAUAu9opvQ
	(envelope-from <linux-mips+bounces-13968-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 20:12:04 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28215349F1F
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 20:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FA443070DCF
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 18:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63621378D9F;
	Fri, 27 Mar 2026 18:57:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD6633CE88;
	Fri, 27 Mar 2026 18:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637835; cv=none; b=gqt19XCs7wzWOLVP2wG0kWeGgJ4MyWrA+5x0FeGr+kZsYSfivSqVHjaqjY0uyCu9q6HGBgLeOw8Jp8Z76Eq4/Egn1lxv/jQb9nmEPnY0yJrU1fbEG/ChPNQDwSl8H8kUf4+4U8vTS4wr+CFern2l5Pxym/s280fZAu6BbtAsJHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637835; c=relaxed/simple;
	bh=j7RJ0hCCbFPer2qggJyi9ztPcfThpA+dHEKWNcPemM4=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=NWtMHzcJJx/+KYveeWECLuDCCqk2r7zEadWCo4Ra59in1zJ1XP+Iv8lh0lsJmYE37e2Fw8pNFO+LfFxdGj29Z+sJ4PNtJvphTLR/ZJVy1cg5EeuRGfPxTz9QWIvaF7mdkLxSudpJhQ9BJPyITnYBjj9/H56oOcvVWjKdoccdm6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7A3A592009C; Fri, 27 Mar 2026 19:57:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7387392009B;
	Fri, 27 Mar 2026 18:57:10 +0000 (GMT)
Date: Fri, 27 Mar 2026 18:57:10 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Thomas Huth <thuth@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    Keguang Zhang <keguang.zhang@gmail.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Waldemar Brodkorb <wbx@openadk.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MIPS: Avoid a TLB shutdown induced by a hidden TLB entry
 bit
Message-ID: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13968-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	FREEMAIL_TO(0.00)[alpha.franken.de,bootlin.com,redhat.com,linaro.org,gmail.com,flygoat.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 28215349F1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

 This is a reimplementation of initial TLB entry uniquification so as to 
address an issue with processors that implement a hidden TLB entry bit 
triggered by commit 9f048fa48740 ("MIPS: mm: Prevent a TLB shutdown on 
initial uniquification") for platforms that hand the TLB over unchanged 
from reset.

 This has been verified across the following systems:

- DECstation 5000/150, R4000SC MIPS III CPU, SEGBITS == 40, 48-entry TLB, 
  32-bit kernel,

- Broadcom BCM91250A, BCM1250 MIPS64 CPU, SEGBITS == 44, 64-entry TLB, 
  64-bit kernel,

- MIPS Malta, 74Kf MIPS32r2 CPU, SEGBITS == 31, 64-entry TLB, 32-bit 
  kernel.

A debug change was used to verify the TLB is initialised as expected.

 See individual commit descriptions for details.

 I consider this code ready to use, but given the diversity of TLB designs 
with MIPS architecture processors I will appreciate verification across 
various actual hardware, particularly in preparation for backporting, as 
this addresses a serious regression for a subset of systems.

 Please apply otherwise.  Thank you for patience waiting for this fix.

  Maciej

