Return-Path: <linux-mips+bounces-14116-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gxYMEQJr3GmcQgkAu9opvQ
	(envelope-from <linux-mips+bounces-14116-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 06:03:14 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C73E7137
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 06:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3C0430036FA
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 04:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897FD218E91;
	Mon, 13 Apr 2026 04:03:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D4B156677;
	Mon, 13 Apr 2026 04:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776052991; cv=none; b=kBH6Whefja/c7gFep5CQvCp8UbEfZN+332+n8iIQnTunr3kd5ivuo0PNnULHIMCnx2d8w/hhKsWJwXRU/tt4SdeneH7VFc2RpjDYySnmV8kJLC5T8vNz2ywaV2522tIcUaBvRmRw/juUs8+oWw++CYKaqFXTTZyivs/aqnXFJMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776052991; c=relaxed/simple;
	bh=vjN8HmC5YMVUyIV59xFNbmlxN+h0QIFMrdoQTeizOt8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=KQ/0YshMKyeINqCFnQrCi4e4m3qIs/p/AIdMkBsK5ekIpqC3mVrb4YTO+xDs2nM2UzFKp0KvJ2DtqKG+NyGk51HM65mxHXpfjct53xRanvBuDGXbJ7CN1TmU32qDeogJJ1gpYgrIwBDarB2ZNHN97LgW0hJO1TG+nma4QLi5phY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8917A92009C; Mon, 13 Apr 2026 06:03:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 81B7192009B;
	Mon, 13 Apr 2026 05:03:07 +0100 (BST)
Date: Mon, 13 Apr 2026 05:03:07 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: Elena Reshetova <elena.reshetova@intel.com>, 
    David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>, 
    Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] MIPS: SiByte: Fix serial device regressions
Message-ID: <alpine.DEB.2.21.2604130453400.29980@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14116-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[angie.orcam.me.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 849C73E7137
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

 This v2 of the series discards a stray `i' local variable from 3/4 that 
causes a compiler warning missed in verification.  No functional change.

 Starting from commit 84a9582fd203 ("serial: core: Start managing serial 
controllers to enable runtime PM") the driver for the SiByte onchip DUART 
has stopped working due to a null pointer dereference in the serial core, 
which means a kernel crash at bootstrap if the driver has been enabled, as 
is usually the case for the system console.

 This patch series addresses the issue by switching the driver away from 
legacy probing to using platform devices.  A notable consequence of this 
is the serial console is only switched from the bootconsole handler that 
uses firmware calls over to our serial driver at the time the driver is 
being properly brought up.  This causes messages to be produced to the 
console between the device reset and console setup, which in turn causes 
the firmware still being called via the bootconsole handler to loop 
forever owing to the transmitter having been disabled.

 Therefore introductory change 2/4 is included to fix the issue by doing a 
rudimentary device setup right after reset, using parameters compatible 
with those used by the firmware (115200n8).  There is auxiliary change 1/4 
included as well that prevents message corruption from happening at reset, 
which becomes more prominent due to the change in timing, with the driver 
switch to the platform device, of messages produced to the console.

 Additionally there is a revert included as change 4/4 for a regression 
introduced by an earlier change that caused previously good code to fail 
requesting the control register resource shared between DUART channels, 
and issue a warning to the kernel log.  Not to be backported as strictly 
speaking the driver works just fine despite the missing reservation.

 See individual change descriptions for details.  Verified with a SWARM
(BCM91250A) system.

 Please apply.

  Maciej

