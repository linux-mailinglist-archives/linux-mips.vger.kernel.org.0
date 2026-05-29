Return-Path: <linux-mips+bounces-14820-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFWxFDODGWobxQgAu9opvQ
	(envelope-from <linux-mips+bounces-14820-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2026 14:14:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D622060219F
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2026 14:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28EF2319FD5F
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2026 12:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D083DEAD7;
	Fri, 29 May 2026 12:09:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6483D3D1F;
	Fri, 29 May 2026 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056561; cv=none; b=F0CDaCw2hEAL+7YLAO/O14rK9Am13GbkJQ5tUegouzNfw/PwoZnUGzR4DqqdWH36qi7cof3N/cFqfsyUvhTli2zG77aDOheMjfFen7/vo2eV5YtAVeAb4Sklis/3idHRJTCGAQCfgfd32IVIFjX9ZYOqIV5pa1v0Uz+4gTKME1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056561; c=relaxed/simple;
	bh=vqPrJxftwRU9YiOgwQLSK763dTIvK40s0TFjc5T0E7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORPzJFMbKunScKAbMhuRAwwm1FCLcDXgJdpdNi8UM3uszvAqDnbkYNju4kBDUMr9tUNTXqPbdI82XwPQFPsSilgNNT6yyG6QCnhKZ6GpjF4ZeBJjMz/8gLQEwh61Qv4zx0z2xpy8xZLYRSLlz3KrFwC/1RifRSfGuSAyB6X4ouw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wSw1V-000050-00; Fri, 29 May 2026 14:09:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 823D9C0154; Fri, 29 May 2026 14:09:01 +0200 (CEST)
Date: Fri, 29 May 2026 14:09:01 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: ath79: pci: remove
Message-ID: <ahmB3YdrR8asjKKu@alpha.franken.de>
References: <20260528035943.719613-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528035943.719613-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-14820-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.986];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,alpha.franken.de:mid]
X-Rspamd-Queue-Id: D622060219F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 08:59:43PM -0700, Rosen Penev wrote:
> Commit 85b9686dae30 ("MIPS: ath79: drop platform device registration code")

this commit doesn't do anything with pci at all. Do you mean
commit 73d8e6aa7d20 ("MIPS: ath79: drop legacy pci code") ?

> removed the ability for anything to bind to these drivers and use them.
> Meaning as is, these drivers cannot be used.
> 
> Downstream OpenWrt has hack patches that add the missing OF stuff but
> those are not suitable for upstream.
> 
> The current plan is to rewrite these drivers using newer APIs and have
> them live under drivers/pci/controller. But as for these, axe them.

wouldn't it make more sense to revert the commit above and remove it
after the change to a new pci implementation is really done ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

