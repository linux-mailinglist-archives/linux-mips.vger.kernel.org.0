Return-Path: <linux-mips+bounces-15109-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b6+rEdctMWqCdQUAu9opvQ
	(envelope-from <linux-mips+bounces-15109-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 13:04:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2B68E9E4
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 13:04:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15109-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15109-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 292EF3002F4B
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 11:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85DE42981C;
	Tue, 16 Jun 2026 11:04:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7C6357CEB;
	Tue, 16 Jun 2026 11:04:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607853; cv=none; b=ANSYfygo79nCLrNSmjECjstJd60EPMzLbqZf8xGE+08BN+UQHj5IbN8oad9H4VZYk75tAHfRtkdhCkg8avUeVjbme4C7rHdAJoGGaCR3xxAaZSYRfTkBuWKXpdeqG8lyzFCOdJ1PlDJIYJnU3x3/LzmxVB/lB26tQnzkO1xA5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607853; c=relaxed/simple;
	bh=YGGy4X5XartVgDqRWXWnqd9WogwE+vHNUSBe+2jbAW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEVbo78iIqKcZeE9Cqj1qDd4icjBfIy+ktBJfsD6m+rNB6jwkZovKFqkxVFXLKkjJrqqDc90pV3giTTV/j0PCwXcoDyiu0f3jhnF6UdmXolprJvlCI5GYCo8owkrU+W+Z6WCt01BHDHnj3e9FI9mGhRcMWDJ19PaVyopY9ZrcXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZRaN-0007FW-00; Tue, 16 Jun 2026 13:04:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 11DADC00E8; Tue, 16 Jun 2026 13:00:41 +0200 (CEST)
Date: Tue, 16 Jun 2026 13:00:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [0/4] MIPS: kernel: proc: More efficient data output in
 show_cpuinfo()
Message-ID: <ajEs2UcAj-YmT1og@alpha.franken.de>
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
 <39fa676a-e761-4a33-9660-f366c692d4f1@web.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39fa676a-e761-4a33-9660-f366c692d4f1@web.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15109-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:Markus.Elfring@web.de,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,lkml.org:url,alpha.franken.de:mid,alpha.franken.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EC2B68E9E4

On Tue, Jun 16, 2026 at 12:34:18PM +0200, Markus Elfring wrote:
> > A few update suggestions were taken into account
> > from static source code analysis.
> 
> Does the feedback indicate so far that you would like to omit
> the patch “MIPS: kernel: proc: Simplify data output in show_cpuinfo()”?
> https://lore.kernel.org/linux-mips/5dcb1ae4-dc98-4f12-8ccb-ff47b16a326c@web.de/
> https://lkml.org/lkml/2026/6/4/1819

I prefer the way how text is formated over saving a few bytes/cylcles.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

