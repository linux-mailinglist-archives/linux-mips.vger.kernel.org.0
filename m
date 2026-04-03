Return-Path: <linux-mips+bounces-14030-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAzACY4b0Gmr3QYAu9opvQ
	(envelope-from <linux-mips+bounces-14030-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 21:57:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B8746397F76
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 21:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08727300899F
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2026 19:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1458C3B3885;
	Fri,  3 Apr 2026 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q72QCnJt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462624E4C3;
	Fri,  3 Apr 2026 19:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246219; cv=none; b=YBIl9CO5oDAYKr5bqdmNKX6u14FYJlhRrBIxzscrA5QVPncWKsnj7/WNOfJWvuTd4AcabNiMEpeFu3KQ8sBkPCzwqeih8hPiPvJ9aT99J+mCXxJYyrF7iCj8s5R0VNXDGhkOrYvLprn3HHJNjL+4GwiIvHkFjAYgYUbvUz/2xrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246219; c=relaxed/simple;
	bh=i/moDq0DGqe89rhWcnbMfpd1fOs4JQ4tDR5Rad9XOKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZzUC2LX+ZwfggTlMD8nrimIaYk/jktw1PeeP2CpAbjiJjaH3EOSt0X4+A+wOLjVzo3jWtX+Blqi6vmRqn4x0fIgXt5TtbeEzIDJndXyhinGGkG2wQyVFL54zqbT2/yMNdt4Be+sH/tSYB18LWAEDXj7n8GsSHb7rQ/bg6Lp12j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q72QCnJt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44607C19424;
	Fri,  3 Apr 2026 19:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775246218;
	bh=i/moDq0DGqe89rhWcnbMfpd1fOs4JQ4tDR5Rad9XOKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Q72QCnJtolrdfAl0t++TuTiC3koOuaEji+ymU3jHbtTupWzOWgx5WN5Lvu1MtXSSb
	 Ie8MNVEuYsSN36so1VJfqCVexa6J7Sf38JcGC+sMePAhc3zkXf+1dPjtVakGk1eYAX
	 I6DGKKg36VNsfeXCTDL6J4S5ACrui9iGS9YGQg1cAqYk/BQakA99RoDpQ/QHCPWwVZ
	 lZdM3dNrIL1xr09McGG/bJM/cIa5AQl8vN4JyNMEfmX01ilaZ4zNyNCu6rI8EIi48c
	 lSRZ3MZ1LMbY9yT25BafikuhDlIvA1DbyYoY7pAyQW6549UTysLsVRe3bEUW/ImAWU
	 MgAQL3FzVSy0Q==
Date: Fri, 3 Apr 2026 14:56:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, jes@trained-monkey.org,
	chenhuacai@kernel.org, kernel@xen0n.name, tsbogend@alpha.franken.de,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, bhelgaas@google.com, dakr@kernel.org,
	kwilczynski@kernel.org, ojeda@kernel.org, boqun@kernel.org,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, ebiggers@google.com,
	ardb@kernel.org, tiwai@suse.de, tytso@mit.edu,
	enelsonmoore@gmail.com, martin.petersen@oracle.com,
	jirislaby@kernel.org, gregkh@linuxfoundation.org,
	geert@linux-m68k.org, herbert@gondor.apana.org.au,
	vineethr@linux.ibm.com, lirongqing@baidu.com, kshk@linux.ibm.com,
	vadim.fedorenko@linux.dev, dong100@mucse.com,
	wangruikang@iscas.ac.cn, hkallweit1@gmail.com, kees@kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH net-next] eth: remove the driver for acenic / tigon1&2
Message-ID: <20260403195657.GA351015@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403123329.42bed564@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14030-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,trained-monkey.org,xen0n.name,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,protonmail.com,umich.edu,suse.de,mit.edu,oracle.com,linuxfoundation.org,linux-m68k.org,gondor.apana.org.au,baidu.com,linux.dev,mucse.com,iscas.ac.cn,lists.linux.dev,lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8746397F76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 12:33:29PM -0700, Jakub Kicinski wrote:
> On Fri, 3 Apr 2026 10:40:10 -0500 Bjorn Helgaas wrote:
> > > > -#define PCI_VENDOR_ID_ALTEON		0x12ae
> > > > -
> > > >  #define PCI_SUBVENDOR_ID_CONNECT_TECH			0x12c4
> > > >  #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH8_232		0x0001
> > > >  #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH4_232		0x0002  
> > 
> > > Does the PCI ID needs to be removed? There was a similar change that
> > > I recalled and the discussion eventually leads to ID not being
> > > removed.
> > > https://lore.kernel.org/all/20260123033233.16906-1-enelsonmoore@gmail.com/  
> > 
> > I don't think there is value in removing the PCI_VENDOR_ID_ALTEON
> > definition.
> 
> Do you want me to respin the patch? "there is no value" is probably fair
> but also there's no value in keeping it so LMK if you want a respin..

I think there is a little value in keeping it.  Removing
PCI_VENDOR_ID_ALTEON:

  - makes future backports slightly harder, e.g., we remove
    PCI_VENDOR_ID_ALTEON, then add a new definition like Vendor ID
    0x12af, then backport the new definition, and the backport doesn't
    apply cleanly because the context doesn't match.

  - means we wouldn't notice a future addition of another name for
    Vendor ID 0x12ae, either by mistake or via acquisition of Alteon.
    We want to know about either one so we can avoid collisions with
    Device IDs used by Alteon.

