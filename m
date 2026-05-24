Return-Path: <linux-mips+bounces-14732-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP+TO9SHE2o0DAcAu9opvQ
	(envelope-from <linux-mips+bounces-14732-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 01:20:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344F5C4C2D
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 01:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22733300A39D
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2026 23:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33853B47C6;
	Sun, 24 May 2026 23:20:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645C03033CC;
	Sun, 24 May 2026 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779664846; cv=none; b=JU01idJjKIbfuvVfwa7zaqq90ZwV4wzTJu6ITjyUoxi/N0n3+IcvbrO3TGffILnzwIcdpXQGkMO05ZV6SjoqZ32QHIpN4ZdIABE2Cf34lsNupN7wlxqIetdP3JVaIT6NVgn020X4djVatQkxrrQ6aDbcjScCMCKCxW/A0SzcW3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779664846; c=relaxed/simple;
	bh=nzzxquScANU0vNmN00+dLvYrgvxIHh/UGP/IMxDlrWo=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=E/7h1rCVNbjkC2A+Mc7Id9m/aNLIdh3GosYboxKWBO+ovMUWaf1kWjhj2QXbiIbS9QGwPyXrhBGkhsZnTG1hJogrycW47rGy/FAAam1N/E7562sn7K0Nduphlqip2nAuwCHMV56LXKZQDvjEgE0OHsxZ2Llr8LFznusI939W404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 67A8792009C; Mon, 25 May 2026 01:12:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6012C92009B;
	Mon, 25 May 2026 00:12:00 +0100 (BST)
Date: Mon, 25 May 2026 00:12:00 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: Elena Reshetova <elena.reshetova@intel.com>, 
    David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>, 
    Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] MIPS: SiByte: Fix serial device regressions
Message-ID: <alpine.DEB.2.21.2605241602220.1450@angie.orcam.me.uk>
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
	TAGGED_FROM(0.00)[bounces-14732-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 9344F5C4C2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

 This is v2 of the series addressing feedback to original 4/4 where the 
plain revert was questioned.

 I proposed using a spinlock instead of the atomic counter, which was then 
agreed upon.  In the course of making the change I have realised that from 
the algorithm's correctness point of view the request and release of the 
resource in question needs to be done under the spinlock as well, because 
in particular setserial(8) can cause port resources to be released and 
requested in parallel for individual channels of a single DUART.  It makes
that change a fix rather than a cleanup.

 I chose to keep the revert anyway as it's a regression that oughtn't to 
have happened in the first place, and it's a self-contained change, as is 
the newly-added fix.  This will help backporting the new fix too, should 
someone wish to, although I don't think we need to rush pushing it to 
-stable.

 I've added a MAINTAINERS entry on top too, as previously stated.  No 
change except for the patch headings to patches 1/4 through 4/4, which 
have become 1/6 through 4/6 now.  The original cover letter follows.

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

 Previous iterations:

- v1 at: <https://lore.kernel.org/r/alpine.DEB.2.21.2604130239560.29980@angie.orcam.me.uk/>.

  Maciej

