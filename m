Return-Path: <linux-mips+bounces-14102-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wiQcE8Zi3GkHQQkAu9opvQ
	(envelope-from <linux-mips+bounces-14102-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BF3E6EC3
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22F5C300877C
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 03:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B7722256F;
	Mon, 13 Apr 2026 03:28:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2812E3FE;
	Mon, 13 Apr 2026 03:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776050883; cv=none; b=Keu9krDpJaf/cYwIFzK0ItmV9PmwlIfdQcFTG2kpLT2CNf4x1PzIFlFu5WUKDCcSHkl7eCWNYGn2lAzOfVeZCmxPIV9hz8ZSMfDncn2CP8aPAcQb8um8NglYmeiXvlZhOkjVE9vfxg1sipfm9UMJUdgV5iHpqWDJA2uA1bf4Gbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776050883; c=relaxed/simple;
	bh=8mofEHyiLeMCm+5yvmFofvywXpwuoenuZcMe+lYHv/g=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=WoA99cdTzVUt4gSch2TwLoq3MDT/dBSUTwr2st/XD3TU+sALDJwp1aAl5V96fZiT6/ZI9Ua1jIllcuDbNwCih6HDjox+KxR1Edgl7huPkQZGWAydZDN53zzLfDn3sJR4y0KjfTTqWtk1KJKeCy9MP+ZAxo/lVJqYJHCifx7PgvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0115692009C; Mon, 13 Apr 2026 05:27:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E7CFF92009B;
	Mon, 13 Apr 2026 04:27:52 +0100 (BST)
Date: Mon, 13 Apr 2026 04:27:52 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH 0/8] MIPS: DEC: Fix serial device regressions + RTC cleanup
Message-ID: <alpine.DEB.2.21.2604102250060.29980@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14102-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 978BF3E6EC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

 Starting from commit 84a9582fd203 ("serial: core: Start managing serial 
controllers to enable runtime PM") drivers for serial devices used with 
the DEC platform have stopped working due to a null pointer dereference in 
the serial core, which means a kernel crash at bootstrap if the relevant 
driver has been enabled, as is usually the case for the system console.

 This patch series addresses the issue by switching the drivers away from 
legacy probing to using platform devices.  A notable consequence of this 
is the serial console is only switched from the bootconsole handler that 
uses firmware calls over to our serial driver at the time the driver is 
being properly brought up.  This causes messages to be produced to the 
console between the device reset and console setup, which in turn causes 
the firmware still being called via the bootconsole handler to loop 
forever owing to the transmitter having been disabled.

 Both drivers are affected and therefore introductory changes 2/8 and 3/8 
are included to fix the issue by doing a rudimentary device setup right 
after reset, using parameters compatible with those used by the firmware 
(9600n8).  There are auxiliary changes 1/8 and 4/8 included as well, that 
respectively prevent a message corruption regression from happening at 
reset due to the change in timing of messages produced to the console with 
the dz driver switch to the platform device, and simplify reset handling 
in the zs driver by issuing a channel rather hardware reset.  Then 5/8 and 
6/8 actually switch the respective drivers to use platform devices.

 A tiny update follows, 7/8, that enables modular build for the dz driver, 
not to be backported as not a bug fix.

 Finally 8/8 is a small cleanup for the existing RTC device, included in 
the series and then last only, due to a mechanical dependency and neither 
for backporting, as it only addresses a code quality issue for a failure 
scenario that is not expected to trigger in reality.

 See individual change descriptions for details.  Verified with a 5000/200 
machine for the dz driver, and with 5000/150 and 5000/260 systems for the 
zs driver.

 Please apply.

  Maciej

