Return-Path: <linux-mips+bounces-14229-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIgXNgup6GnEOQIAu9opvQ
	(envelope-from <linux-mips+bounces-14229-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 12:55:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38252445016
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 12:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63597300F9C3
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 10:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311CE3ACEE0;
	Wed, 22 Apr 2026 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUNttYnM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACBF46B5;
	Wed, 22 Apr 2026 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855217; cv=none; b=KkA03jfqtktAckqo31yvk8FVRs8Yx1NvFyw6S+3TmKuibfxdm3P2BgNbPq7bDYvmX9LAulDh3yBQBm2rPsNGUUxNXPCtN8AFuJkGVjpQu33sG1U8FKZ/I+9uVCuHj53Zn0rMDIlyeCyDb1RmEqtCnst8nzvOQ+8Hzn2v7OEpIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855217; c=relaxed/simple;
	bh=ft71bsoOUWGTJtW1ZFq6hY21ozdG2v4Dg7mr51X6pLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kx8v2+QW/AiFCOB/rsosGYbM43rId2fxbS4C5SxrIQJ/s6LfsYqPiNP/89TvywWVfaKPahdLDPG74upHgE6cFO+rzHSSH2yKV19mCvpkSrhLksU1hqHSw1ifcrFEUllvtNX0b+mk7lzaMGSN8nms4j8vx1Q0WKAh5uJCpJW1lfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUNttYnM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B4DC19425;
	Wed, 22 Apr 2026 10:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776855216;
	bh=ft71bsoOUWGTJtW1ZFq6hY21ozdG2v4Dg7mr51X6pLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUNttYnMtOBg3D7mM/O3lX1Z0FGZo8PMNwpzoutfIDAn1mbNGCjRXJSl+TuSgdOyK
	 voHy0YijRIzCz++rwem8APKKdDeE8s793e91t43vmEdEhOj0EZnTwM105OAHoRQShU
	 auQ8TY+v1/K0im0i8CavgL8HaGtVtSHk+65Nw59rZpq7leNkAfWR+T89MjKp8I6Yg7
	 H0c1EwBiPYCgS2l4XJCJd1rF2F8DnoAnXtVcfcUCgQYfVXUUGhb+CzGEorgrtJKHoc
	 oAbdruxMz7gX4PABqsOKDE7h6be9BAug9JX4rJ2h/Sezp7wUDXbKZEZGrQEzonePmc
	 K3P9S60/wfmjg==
Date: Wed, 22 Apr 2026 11:53:24 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, corbet@lwn.net,
	skhan@linuxfoundation.org, linux@armlinux.org.uk,
	tsbogend@alpha.franken.de, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, 3chas3@gmail.com,
	razor@blackwall.org, idosch@nvidia.com, jani.nikula@intel.com,
	mchehab+huawei@kernel.org, tytso@mit.edu,
	herbert@gondor.apana.org.au, geert@linux-m68k.org,
	ebiggers@kernel.org, johannes.berg@intel.com,
	jonathan.cameron@huawei.com, kees@kernel.org, kuniyu@google.com,
	fourier.thomas@gmail.com, andriy.shevchenko@intel.com,
	rdunlap@infradead.org, akpm@linux-foundation.org,
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bridge@lists.linux.dev,
	dwmw2@infradead.org
Subject: Re: [PATCH net-deletions v2] net: remove unused ATM protocols and
 legacy ATM device drivers
Message-ID: <20260422105324.GM651125@horms.kernel.org>
References: <20260422041846.2035118-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422041846.2035118-1-kuba@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14229-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,lwn.net,linuxfoundation.org,armlinux.org.uk,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,blackwall.org,nvidia.com,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,huawei.com,infradead.org,linux-foundation.org,lists.ozlabs.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,horms.kernel.org:mid]
X-Rspamd-Queue-Id: 38252445016
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 09:18:44PM -0700, Jakub Kicinski wrote:
> Remove the ATM protocol modules and PCI/SBUS ATM device drivers
> that are no longer in active use.
> 
> The ATM core protocol stack, PPPoATM, BR2684, and USB DSL modem
> drivers (drivers/usb/atm/) are retained in-tree to maintain PPP
> over ATM (PPPoA) and PPPoE-over-BR2684 support for DSL connections.
> 
> Removed ATM protocol modules:
>  - net/atm/clip.c - Classical IP over ATM (RFC 2225)
>  - net/atm/lec.c - LAN Emulation Client (LANE)
>  - net/atm/mpc.c, mpoa_caches.c, mpoa_proc.c - Multi-Protocol Over ATM
> 
> Removed PCI/SBUS ATM device drivers (drivers/atm/):
>  - adummy, atmtcp - software/testing ATM devices
>  - eni - Efficient Networks ENI155P (OC-3, ~1995)
>  - fore200e - FORE Systems 200E PCI/SBUS (OC-3, ~1999)
>  - he - ForeRunner HE (OC-3/OC-12, ~2000)
>  - idt77105 - IDT 77105 25 Mbps ATM PHY
>  - idt77252 - IDT 77252 NICStAR II (OC-3, ~2000)
>  - iphase - Interphase ATM PCI (OC-3/DS3/E3)
>  - lanai - Efficient Networks Speedstream 3010
>  - nicstar - IDT 77201 NICStAR (155/25 Mbps, ~1999)
>  - solos-pci - Traverse Technologies ADSL2+ PCI
>  - suni - PMC S/UNI SONET PHY library
> 
> Also clean up references in:
>  - net/bridge/ - remove ATM LANE hook (br_fdb_test_addr_hook,
>    br_fdb_test_addr)
>  - net/core/dev.c - remove br_fdb_test_addr_hook export
>  - defconfig files - remove ATM driver config options
> 
> The removed code is moved to an out-of-tree module package (mod-orphan).
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2:
>  - keep BR2684
>  - correct the claim that Traverse Technologies is defunct,
>    I'm still deleting the solos driver, chances are nobody uses it.
>    Easy enough to revert back in since core is still around.
>    The guiding principle is to keep USB modems and delete
>    the rest as USB ADSL2+ CPEs were most popular historically.
> v1: https://lore.kernel.org/20260421021943.1295109-1-kuba@kernel.org

Reviewed-by: Simon Horman <horms@kernel.org>


