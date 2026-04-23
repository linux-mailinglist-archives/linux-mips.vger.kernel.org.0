Return-Path: <linux-mips+bounces-14242-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNyhIrjV6WnxlAIAu9opvQ
	(envelope-from <linux-mips+bounces-14242-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 10:18:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D817C44E6CB
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 10:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB673300E727
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 08:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF0B366DC1;
	Thu, 23 Apr 2026 08:16:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7E5366558;
	Thu, 23 Apr 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.95.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932161; cv=none; b=QKtIY2qkZybCUJWXWNFNpTKgVc9S+Mb6H9ccjnTohDfsATw+xWtPm2awHmc7IaUEuOvpUTTNcwjLvRB2GnicXxFJ9uyiCOKMPKG9Lx58cGZ7UMnSxALkvWDtE4TzLyg9bQHbpmKUeitPsyMqMh99crJOa5XMJ7eoHyIHumTRbt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932161; c=relaxed/simple;
	bh=jWJJzG3JuyMUWdXtBQZSANLEqwCYgNxCmN5cswBpNEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jUag4PM1HPO0MojkgBLjaKNAwGS6RsFCZ0Xo3IOgfdT3XhBgwJqn+OCukMUdUCF6mji9XJCxxSPMea4hR1mlEfKesvjnnHTUOLfSg03oRwGsroXinGapYjn/UUvgI9j8yLB3IJe7Gj18bNqKCEAGcnhujpJev9igpnieOiGwg7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk; spf=pass smtp.mailfrom=toke.dk; arc=none smtp.client-ip=45.145.95.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Authentication-Results: mail.toke.dk; dkim=none
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 corbet@lwn.net, skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn,
 tsbogend@alpha.franken.de, dsahern@kernel.org, jani.nikula@intel.com,
 mchehab+huawei@kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au,
 ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org,
 pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org,
 mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me,
 pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de,
 kees@kernel.org, crossd@gmail.com, jlayton@kernel.org,
 wangliang74@huawei.com, aha310510@gmail.com, takamitz@amazon.co.jp,
 kuniyu@google.com, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
In-Reply-To: <20260421021824.1293976-1-kuba@kernel.org>
References: <20260421021824.1293976-1-kuba@kernel.org>
Date: Thu, 23 Apr 2026 10:15:48 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87se8mytvv.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [2.67 / 15.00];
	DMARC_POLICY_REJECT(2.00)[toke.dk : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.63)[subject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14242-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,huawei.com,amazon.co.jp];
	RCPT_COUNT_TWELVE(0.00)[47];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	FROM_NEQ_ENVFROM(0.00)[toke@toke.dk,linux-mips@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D817C44E6CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Jakub Kicinski <kuba@kernel.org> writes:

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

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>

