Return-Path: <linux-mips+bounces-14111-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJP3N+9i3GkHQQkAu9opvQ
	(envelope-from <linux-mips+bounces-14111-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFEB3E6F67
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 925AF3009525
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 03:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F7B23ED6A;
	Mon, 13 Apr 2026 03:28:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4022E3FE;
	Mon, 13 Apr 2026 03:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776050915; cv=none; b=vBTPIN0WmZi2+tgO9Sk321+yPCMZ++DMGhV/70axz/cqDJvs2WWjNE3O7ssbWnggRcf8zpL5xFOxxJomIbsYSKJqoWT5+ETHF86xG0DAb4Uz0jkb4CB3BbWFmVhCs8LK500bHB7tkHbn0kF9GTT8dQnRBseKi25LcO8nUAITuoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776050915; c=relaxed/simple;
	bh=tdmIlm4xawZg9c91HigNM/ksIlEOvWt3Ih65ZDATfyc=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=pL9+HfBFHibeLtxJtDnXgYeeP7CJJguUuYgaLh9OZaBK6GIGRvXgDBp/pBd1+1NSLNHhkcIdjnrM0Xze53VcXWNqNsAq31mZs5OpNN8V92BWFvn6yS+EQWJzkPeFOkhGpGvz56Y6kwmvj24gqora2m6I0lf6glnUcf+KcEvGs4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0B85992009D; Mon, 13 Apr 2026 05:28:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 05E1F92009B;
	Mon, 13 Apr 2026 04:28:32 +0100 (BST)
Date: Mon, 13 Apr 2026 04:28:32 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: Elena Reshetova <elena.reshetova@intel.com>, 
    David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>, 
    Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] MIPS: SiByte: Fix serial device regressions
Message-ID: <alpine.DEB.2.21.2604130239560.29980@angie.orcam.me.uk>
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
	TAGGED_FROM(0.00)[bounces-14111-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 7AFEB3E6F67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

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

