Return-Path: <linux-mips+bounces-14029-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM0IBRoW0GmV3AYAu9opvQ
	(envelope-from <linux-mips+bounces-14029-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 21:33:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A744397AD3
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 21:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BBE0300BBAF
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2026 19:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157273D567B;
	Fri,  3 Apr 2026 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRWyWbgt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38E13D6478;
	Fri,  3 Apr 2026 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244823; cv=none; b=bpgrRV/Ljpl9L0LlhypFEDV2B+kBWbYU7wA0qJRxrKEzTFi4VwwHHbp7PTEn+65mUevwEkBvx1IOgYQHcIeP30Ptr/NSTucUUSGjxRKMvaXf/8Kc368AFM/bMQZjsQnd1Wd5mURefYS7/YjDmyi7SM4vX8ufGhFQ6dA1/Q1paXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244823; c=relaxed/simple;
	bh=9DYHGS2w6V5E2Mnrip1cBt+8QF4uaeoksv9BYbR3ECE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8lzbJ0r3r5J6kgdHD90D0JCPv4GYWCcEYXGT7VHF6uffA+5Yq29zTXRoMTYkTytwpKWP2sjf8Bpy29J0EMq83Pn3lgNVkdzgEoT2ed7FxbzCQFl/yrG871S7bbZEPTAuvAvMN0cjwiqp/iaZlh7sd5TXmebsmoXRTrx+XxyjSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRWyWbgt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E55C4CEF7;
	Fri,  3 Apr 2026 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775244822;
	bh=9DYHGS2w6V5E2Mnrip1cBt+8QF4uaeoksv9BYbR3ECE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QRWyWbgtxPR+sXvwAe8gmv2Q9I7xZWULfj9giVMpio64qX0ikjHrMqRn2wV+jIJPq
	 8vvZ2/fxfbkMGDZCWY+UvVvBsD/Umx6xkRarnbjgK4kCl14EscwXd8G5wODwG5VWw/
	 5yPFBJrhVkDNChW2z8SBv5BX3LMF6FvLGeFq0lSwOGTknK79Xg8JFM+iJcLJP6Qhy+
	 VrdbQ2t4pzACOKtUXPnPNlPPJ2rV2Sd/byfqeOLMt2Z4+Et6irSABEAVcGYFFs46dy
	 YRLhekx9eER7uh3s19YQ3Li82TVCAiZjLZEYRXcMjo6GS/5kb3CGZOvu4Y7dUOHOTo
	 cggqD92ptrIgA==
Date: Fri, 3 Apr 2026 12:33:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, davem@davemloft.net,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, jes@trained-monkey.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, deller@gmx.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, bhelgaas@google.com,
 dakr@kernel.org, kwilczynski@kernel.org, ojeda@kernel.org,
 boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 ebiggers@google.com, ardb@kernel.org, tiwai@suse.de, tytso@mit.edu,
 enelsonmoore@gmail.com, martin.petersen@oracle.com, jirislaby@kernel.org,
 gregkh@linuxfoundation.org, geert@linux-m68k.org,
 herbert@gondor.apana.org.au, vineethr@linux.ibm.com, lirongqing@baidu.com,
 kshk@linux.ibm.com, vadim.fedorenko@linux.dev, dong100@mucse.com,
 wangruikang@iscas.ac.cn, hkallweit1@gmail.com, kees@kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH net-next] eth: remove the driver for acenic / tigon1&2
Message-ID: <20260403123329.42bed564@kernel.org>
In-Reply-To: <20260403154010.GA335042@bhelgaas>
References: <DHJKGY0F52GL.14FQPOWWO0F77@garyguo.net>
	<20260403154010.GA335042@bhelgaas>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[garyguo.net,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,trained-monkey.org,xen0n.name,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,protonmail.com,umich.edu,suse.de,mit.edu,oracle.com,linuxfoundation.org,linux-m68k.org,gondor.apana.org.au,baidu.com,linux.dev,mucse.com,iscas.ac.cn,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-14029-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A744397AD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 3 Apr 2026 10:40:10 -0500 Bjorn Helgaas wrote:
> > > -#define PCI_VENDOR_ID_ALTEON		0x12ae
> > > -
> > >  #define PCI_SUBVENDOR_ID_CONNECT_TECH			0x12c4
> > >  #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH8_232		0x0001
> > >  #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH4_232		0x0002  
> 
> > Does the PCI ID needs to be removed? There was a similar change that
> > I recalled and the discussion eventually leads to ID not being
> > removed.
> > https://lore.kernel.org/all/20260123033233.16906-1-enelsonmoore@gmail.com/  
> 
> I don't think there is value in removing the PCI_VENDOR_ID_ALTEON
> definition.

Do you want me to respin the patch? "there is no value" is probably fair
but also there's no value in keeping it so LMK if you want a respin..

