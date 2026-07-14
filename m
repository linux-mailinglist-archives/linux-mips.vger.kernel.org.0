Return-Path: <linux-mips+bounces-15905-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fRYvC0yzVmpjAQEAu9opvQ
	(envelope-from <linux-mips+bounces-15905-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 00:08:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AF759234
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 00:08:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bgTzHB9o;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15905-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15905-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 992323006F08
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 22:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072463E171E;
	Tue, 14 Jul 2026 22:08:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F048F3DA5BA;
	Tue, 14 Jul 2026 22:08:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784066889; cv=none; b=QVjB8WG7QgrrkYRvF1y+lNmF4uynRgLXfhSoI6Us1hlEk7JrPhbdqivI6rQNUGoXmetVL0W40hCmcoeHM/xnD2FTQ+50XdhcBSuQzIhcLLnT/lRSX4LdmcFaOi4YpL8lOdh6rjbMH1+Lf2TU1GskYiXhIWOKTjP1hj0cMKsDTPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784066889; c=relaxed/simple;
	bh=fQZjCkLG/7BvHPHGMGFdT8OJvKSTTFC326JDS7Hw/KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnCb4VOy2b4WVJkQoF9kWb8aTo0xJgtAPuq92vpm/EqUNtP+vvvVvqSHGPJQfvWYxGCf3/VzOSX/jpHXU63qOlg47K5EfYpCXsmGzdJCgdKKnLCZXV3+TmGmEQKwYVJ1qwFv826vnaXcp9zAAvWb0GnK/WJF5E/8iN2ah6YDVkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgTzHB9o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4EB1F000E9;
	Tue, 14 Jul 2026 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784066888;
	bh=JQeuVqK4HY8Dr6NmEwStHi+ThicciF0gRHayWVQwtrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bgTzHB9ovO51cjAruozOAu+mo5+cMYwa9cSkfmL0Mp/bh14ZqbNRxxLQxqOZp+jLZ
	 b4xpOXqmoC3h9uyOWOkKUaqEZA45kLvVbUhscldXfj2htIaTzVz+IUDEz+hqj/RQXA
	 +BBtghpdoaOWh22IHELA5dZj0QyqLGuuz4Re4YUh2Nbx/QSM4o7HeRkDGpRXtDbePL
	 emNjyTVN1E1lEpmCQbm9o5/7ZLv95WJlwfEUlgb7LiLT+JLb1wEXTINjlovRs9IAVk
	 MjYl3e3HLdio1gQVAfkl7IU94awJfUvOePQrINkdgRvLYpdfLOv/9m68cQeIIH+SOz
	 8taC7c5zC9IQw==
Date: Tue, 14 Jul 2026 17:08:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: skhan@linuxfoundation.org, conor+dt@kernel.org,
	linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	me@brighamcampbell.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: microchip,pic32mzda-dmt: Convert
 to DT schema
Message-ID: <178406688708.3037481.6414192882451546243.robh@kernel.org>
References: <20260701171917.263050-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701171917.263050-1-challauday369@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15905-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:challauday369@gmail.com,m:skhan@linuxfoundation.org,m:conor+dt@kernel.org,m:linux-mips@vger.kernel.org,m:tsbogend@alpha.franken.de,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:me@brighamcampbell.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 808AF759234


On Wed, 01 Jul 2026 22:49:17 +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 Deadman Timer devicetree binding
> from legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
>  .../bindings/watchdog/microchip,pic32-dmt.txt | 19 --------
>  .../watchdog/microchip,pic32mzda-dmt.yaml     | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
> 

Applied, thanks!


