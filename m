Return-Path: <linux-mips+bounces-14208-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GMULVwT52nL3QEAu9opvQ
	(envelope-from <linux-mips+bounces-14208-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 08:04:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7474F436B06
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 08:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B82AB30027A7
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 06:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FA127FB0E;
	Tue, 21 Apr 2026 06:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KKzkWbc5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF12175A6D;
	Tue, 21 Apr 2026 06:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751449; cv=none; b=hs5CDcmtIxsYSI8K6vOOmUEwg3Ae4XPjBZkokGc0FzvBuvvwMbr31yYTycwptJ/OPRfNjGwNG/60JGri2B6SEBbI4uN+g7L7Kgwiv/d0V8sBXqgYrSdTwUMHUX21l0NiyfbqM6WRDVEBIKlygaVb6NIyX1UWji0gVrHgiFYxp9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751449; c=relaxed/simple;
	bh=TI8LZTYV/KmCG1OsPote9A8sOaawJsYT4yYstMBFTCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ecb0K45IzfjlyMUC+3yLC2C+TqVEL7rIn5b0CCC8os1W7VnxsSvj+MFhDTSJiej3/cSMbK52e1noJbhgh9OQN0M7wI90uCnk96uhCljegByN6XzqTRE+VsJP/BcuYhhpTJVEBHNzucJVdjE558OcpONlkzY4IqnWVTmaMiVfKAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KKzkWbc5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F9EC2BCB0;
	Tue, 21 Apr 2026 06:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776751448;
	bh=TI8LZTYV/KmCG1OsPote9A8sOaawJsYT4yYstMBFTCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKzkWbc5zL/8yJTVCXh7VfQ7nS4igOr4WOal5jSjMRc7iDCFJnXy1sx4DEDi87qrO
	 Uds4IM6Kdw6qdCwQfTyE4PIAKBUg1FbOOP/M+YgxW77CFjMqJmcMtcaDTgL8iwj6pa
	 77JJvJeqH8avcFa+tFt2RU/Fbs63lE2txcpQPIAY=
Date: Tue, 21 Apr 2026 08:04:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
	si.yanteng@linux.dev, dzm91@hust.edu.cn,
	2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de,
	dsahern@kernel.org, jani.nikula@intel.com,
	mchehab+huawei@kernel.org, jirislaby@kernel.org, tytso@mit.edu,
	herbert@gondor.apana.org.au, ebiggers@kernel.org,
	johannes.berg@intel.com, geert@linux-m68k.org, pablo@netfilter.org,
	tglx@kernel.org, mashiro.chen@mailbox.org, mingo@kernel.org,
	dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me,
	pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de,
	toke@toke.dk, kees@kernel.org, crossd@gmail.com, jlayton@kernel.org,
	wangliang74@huawei.com, aha310510@gmail.com, takamitz@amazon.co.jp,
	kuniyu@google.com, linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
Message-ID: <2026042158-upward-obsessive-0c8f@gregkh>
References: <20260421021824.1293976-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421021824.1293976-1-kuba@kernel.org>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14208-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7474F436B06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 07:18:23PM -0700, Jakub Kicinski wrote:
> Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementation
> and all associated hamradio device drivers from the kernel tree.
> This set of protocols has long been a huge bug/syzbot magnet,
> and since nobody stepped up to help us deal with the influx
> of the AI-generated bug reports we need to move it out of tree
> to protect our sanity.
> 
> The code is moved to an out-of-tree repo:
> https://github.com/linux-netdev/mod-orphan
> if it's cleaned up and reworked there we can accept it back.
> 
> Minimal stub headers are kept for include/net/ax25.h (AX25_P_IP,
> AX25_ADDR_LEN, ax25_address) and include/net/rose.h (ROSE_ADDR_LEN)
> so that the conditional integration code in arp.c and tun.c continues
> to compile and work when the out-of-tree modules are loaded.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

