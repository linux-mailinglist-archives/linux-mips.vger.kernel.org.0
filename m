Return-Path: <linux-mips+bounces-14770-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDn+Cs+zFWpxYAcAu9opvQ
	(envelope-from <linux-mips+bounces-14770-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:53:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D775D7FDA
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5791030279FC
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FAD40313F;
	Tue, 26 May 2026 14:51:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FAB4014B2;
	Tue, 26 May 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807073; cv=none; b=EhuUDB4farqx9Drxy3azIXExtz3TxIYKv+Hgp7bquHgCw9hmD+q2fdCFFiFvOY9QZQf5cRZPiIx8ODfOKsSanFkbDH1GKg54flv4O3cSn+AuSsXj0KtWoeo1O8eJVGg9RQAM8ijX3Glecg3XcuiSYg1F8XiZ91AH57G8cnTnZXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807073; c=relaxed/simple;
	bh=Ell3OK2oueJMjKWXnPrvfH7iafKJAjOOVp1waok2vZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAbES5e48H7FkhNQtJNIiTN2OhT0IMhLOkxc0Bnd4doBNvWxqP7sjG/H8/lgQgT02UNxeL2xyENex5u+7RSFhUsKSv/p3govmvSVOWJ8h8/4ssvByVvokPccg1RLMi0B/EVVGTGqGFBVcbQ36XKgx1fY+fnTSm4dx7fDctbFNVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-00015D-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9A4FAC0154; Tue, 26 May 2026 16:42:15 +0200 (CEST)
Date: Tue, 26 May 2026 16:42:15 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable LPC interrupt controller on MIPS LS7A systems
Message-ID: <ahWxR7sW7o06IDDX@alpha.franken.de>
References: <20260411101744.4020216-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411101744.4020216-1-zhengxingda@iscas.ac.cn>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14770-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.842];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C8D775D7FDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 06:17:42PM +0800, Icenowy Zheng wrote:
> This patchset tries to enable support for LPC interrupts on MIPS-based
> Loongson systems with Loongson 7A1000 PCH chip.
> 
> The corresponding irqchip support (along with the DT binding) is already
> added to the tip tree.
> 
> Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse as
> integrated ones.
> 
> This patchset is splitted from the original patchset that contains both
> driver part and DT part.
> 
> Icenowy Zheng (2):
>   MIPS: Loongson64: dts: Sort nodes
>   MIPS: Loongson64: dts: Add node for LS7A PCH LPC
> 
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

