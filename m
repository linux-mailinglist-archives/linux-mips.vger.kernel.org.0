Return-Path: <linux-mips+bounces-14297-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GFpNn1x6mnuzQIAu9opvQ
	(envelope-from <linux-mips+bounces-14297-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 21:22:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA74456B2B
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 21:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B062A300EB5A
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 19:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA436897E;
	Thu, 23 Apr 2026 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkcJgQ3H"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D3B2868A9;
	Thu, 23 Apr 2026 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776972150; cv=none; b=rrE6hAc2ivPJYSKoI3m567YBc1NPIo+NJap5vG5walfAHHKMX86YgDm12I7ZVG3epeXWmcgoxTewyn7OfTFjf18n8AROh35vZD/Oc/GCzcj1a8PWHJhKe2PGQrsUTKqHBRtWBYIKQbOWH1IxN4fprrDqWAOznPWxu4z6jAShqbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776972150; c=relaxed/simple;
	bh=j0GPDBAm0I4zxAqI6YWcxfV5/1mdBezPe3eBd3FNm2U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gi2VG95TxdZN+le7YqM7tYvPT78+W4vWqgXTq48vI0WSBZOcqj3taclrqA+ZSGYQo5IsB1yCcdew26XfH1NUy/5l6hPuynW3omuxXjQcJhSDfmlL5X3sPtWSwWo9zYkdrWDfXjqjjHTWkzyHaAKjJ0fYwJTfQwiMmcsgK++kqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkcJgQ3H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F940C2BCAF;
	Thu, 23 Apr 2026 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776972150;
	bh=j0GPDBAm0I4zxAqI6YWcxfV5/1mdBezPe3eBd3FNm2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jkcJgQ3HiRK14i/gFeArWLm8dfXNLDyZb/CpBpi/bg2TjV1D156Iw7VojatmxrCTw
	 Uk4tMSO0ptQJ3yEQ0ywEKSb1noOxH3OwK1MnLTfCM/vq9XfmghTzfaPgRrnppZ1Xgc
	 kFGzSEE8ml9Lbt3IukhfRveZZvqCqsyklMKvJD9kYlTLUyI39eU5IDbvCjRrrN4D+e
	 q1PAjGln/6wuqEz86fqtMAJMuyI2Y/8d/SXUWnZV3HJ0AWUZwmmzs7/C/dV6JI9dze
	 fRINV2aLL+GLGFZ48Gg+iryNpEsCaDM6wS6VAlLzaTOEQrnL0UAwaNb1jnF63pRK1a
	 pr6UfVB7Bhukg==
Date: Thu, 23 Apr 2026 12:22:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, linux@armlinux.org.uk,
 tsbogend@alpha.franken.de, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, 3chas3@gmail.com,
 razor@blackwall.org, idosch@nvidia.com, jani.nikula@intel.com,
 mchehab+huawei@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au,
 geert@linux-m68k.org, ebiggers@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, kees@kernel.org, kuniyu@google.com,
 fourier.thomas@gmail.com, rdunlap@infradead.org, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bridge@lists.linux.dev, dwmw2@infradead.org
Subject: Re: [PATCH net-deletions v2] net: remove unused ATM protocols and
 legacy ATM device drivers
Message-ID: <20260423122227.1454f68c@kernel.org>
In-Reply-To: <aeh0CV3UQw1quCXv@ashevche-desk.local>
References: <20260422041846.2035118-1-kuba@kernel.org>
	<aeh0CV3UQw1quCXv@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14297-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,armlinux.org.uk,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,blackwall.org,nvidia.com,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,huawei.com,infradead.org,linux-foundation.org,lists.ozlabs.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADA74456B2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026 10:08:57 +0300 Andy Shevchenko wrote:
> Since it's almost removal and it will go via netdev tree (same tree you are
> maintaining, I suppose) the -D would have a big help to review the changes
> (and not see removals at all, as 32k lines of one email is too much).

Good point, I'll remember for the future deletions

