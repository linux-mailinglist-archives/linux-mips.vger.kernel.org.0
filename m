Return-Path: <linux-mips+bounces-14025-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHnMHgF/z2mvwgYAu9opvQ
	(envelope-from <linux-mips+bounces-14025-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 10:49:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E7392524
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 10:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31D183019823
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2026 08:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341CC386427;
	Fri,  3 Apr 2026 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LDnk7S/p"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A13845B1;
	Fri,  3 Apr 2026 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206090; cv=none; b=ANSQTfRL1pMfl9L6RHADEzPqLF38vupDKaoFgXewQl4MrljsiHR3aZk+xkKuCfreM2ZtBW7K4ieG5BfUBp8hd7vANIfHLaiSzgZ7nNuUE81fo/DKnNJ1Z3xvTRX2Ze+uPIZf/9rz6sv2IvwwcFAIug/092i5V5OOHZtxjXiiMuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206090; c=relaxed/simple;
	bh=06cSFbB6Pd8/6jNNaiACu6E5Rd6wULxB8jLFZ7TA/XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYOe0+SrvbBoS9BwkBwyoEn5eHpsMwaedltGflrK4dR8h5Nitm4zGCmN1rsfBTByniNJB65CCQakY48RdNRYTvr66VG0HBANEZCRc9tPyegwk6yp1DMBswsHxqIvRq4S394RhxDRP7dA3h/pkHDiRTX/inTZhZ+iNkw02sEB4iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LDnk7S/p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5078CC2BCB0;
	Fri,  3 Apr 2026 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775206089;
	bh=06cSFbB6Pd8/6jNNaiACu6E5Rd6wULxB8jLFZ7TA/XA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDnk7S/pNFohQ10dX4/nYUt5Jgi6pqvcaG/5+Z17/3TfF57gHIwm+IPPm3DCcIV4K
	 1m0r3PW3Qgh1rqa/Fi6GDMYw2CM5NqZ69Ab0CSIQ8tkafCEEca6ZkEU13ibl4g+pP6
	 xtgPq9tl41QLyNGGkg0C6MVpppASUZa43AqTncHA=
Date: Fri, 3 Apr 2026 10:48:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	jes@trained-monkey.org, chenhuacai@kernel.org, kernel@xen0n.name,
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
	deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, bhelgaas@google.com,
	dakr@kernel.org, kwilczynski@kernel.org, ojeda@kernel.org,
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, ebiggers@google.com, ardb@kernel.org,
	tiwai@suse.de, tytso@mit.edu, enelsonmoore@gmail.com,
	martin.petersen@oracle.com, jirislaby@kernel.org,
	geert@linux-m68k.org, herbert@gondor.apana.org.au,
	vineethr@linux.ibm.com, lirongqing@baidu.com, kshk@linux.ibm.com,
	vadim.fedorenko@linux.dev, dong100@mucse.com,
	wangruikang@iscas.ac.cn, hkallweit1@gmail.com, kees@kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH net-next] eth: remove the driver for acenic / tigon1&2
Message-ID: <2026040357-flick-coil-0c5d@gregkh>
References: <20260402183029.1236713-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402183029.1236713-1-kuba@kernel.org>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14025-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,trained-monkey.org,xen0n.name,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,garyguo.net,protonmail.com,umich.edu,suse.de,mit.edu,oracle.com,linux-m68k.org,gondor.apana.org.au,baidu.com,linux.dev,mucse.com,iscas.ac.cn,lists.linux.dev,lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 160E7392524
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 11:30:29AM -0700, Jakub Kicinski wrote:
> The entire git history for this driver looks like tree-wide
> and automated cleanups. There's even more coming now with
> AI, so let's try to delete it instead.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

