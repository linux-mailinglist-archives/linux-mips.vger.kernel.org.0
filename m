Return-Path: <linux-mips+bounces-14028-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J7UEYTgz2kS1gYAu9opvQ
	(envelope-from <linux-mips+bounces-14028-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 17:45:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2B7395E8C
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 17:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46D2D3036794
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2026 15:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643DA3C872D;
	Fri,  3 Apr 2026 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjvMUx4l"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C033BE145;
	Fri,  3 Apr 2026 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775230812; cv=none; b=D975rd7jiuBO7FKNiu8eiNc+BAn3NTwGDKg09KWfrIuRBwCl3MV8FeEyUxNGPoYT87FnsKQ0PfeXLR7qdKzNLlK8FeRSwTnPnJLua/atocDq/z0Ki8ruffJLgp1JMqzFjB/oTSyXvgqnz/JYuJH3zx2EpSdpttsSuZMzfR3/OBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775230812; c=relaxed/simple;
	bh=yWko4zVzCCAWynSjp/vVAZSdx+z+fWAaf2R5l3ZiPuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RGjAdP+AcblMzwZZSsXiiix9kf5Wb62EyyGKNLaEbuYyT2etG8pkG2Gj1BLawMEWlnuCLKjLSoL89yYuBQqIC/nSc/GqIbfpu02p3QToW9D57T39kKlT6NiLIN/56S4fmido8Qpbr8Y3xU/OkAJ/GB9FUHWgW/nz3dm4eqBL5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjvMUx4l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F20C4CEF7;
	Fri,  3 Apr 2026 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775230812;
	bh=yWko4zVzCCAWynSjp/vVAZSdx+z+fWAaf2R5l3ZiPuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hjvMUx4lf3sd+/gDlfQLmiRx5snEoHkgPiH5lf/5ptZo9cDFe1xDojgFNmCi7cnk1
	 PFbUbeQvKtO8q5aDzlMCAu7k7+Eiv3YaX2SPLAX+NmSEmy2HzTM+1z0FCu3NSTIDDq
	 u34GrXS7Kkv4v+Uk8la0WnKNGZ1NDlin0qdyDxYdYrBKWgc9J8Ah5Hb5OA3Y4TCt+i
	 FTUsWbqBMVsRBNI/sS/84EisFl14G7KVv1CM4nTigP4w59xVYchXVBZJxroFPFlNh5
	 aps6TryG2jequWFoX4yJbR38ZMgCAE8OWpnvg4EZXo0vcp1dO13i8TOUcogejw3GDM
	 YBBhrPcypgaGg==
Date: Fri, 3 Apr 2026 10:40:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
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
Message-ID: <20260403154010.GA335042@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHJKGY0F52GL.14FQPOWWO0F77@garyguo.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14028-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,trained-monkey.org,xen0n.name,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,protonmail.com,umich.edu,suse.de,mit.edu,oracle.com,linuxfoundation.org,linux-m68k.org,gondor.apana.org.au,baidu.com,linux.dev,mucse.com,iscas.ac.cn,lists.linux.dev,lists.ozlabs.org];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D2B7395E8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 02:50:32PM +0100, Gary Guo wrote:
> On Thu Apr 2, 2026 at 7:30 PM BST, Jakub Kicinski wrote:
> > The entire git history for this driver looks like tree-wide
> > and automated cleanups. There's even more coming now with
> > AI, so let's try to delete it instead.

> > +++ b/include/linux/pci_ids.h
> > @@ -1809,8 +1809,6 @@
> >  /* formerly Platform Tech */
> >  #define PCI_DEVICE_ID_ESS_ESS0100	0x0100
> >  
> > -#define PCI_VENDOR_ID_ALTEON		0x12ae
> > -
> >  #define PCI_SUBVENDOR_ID_CONNECT_TECH			0x12c4
> >  #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH8_232		0x0001
> >  #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH4_232		0x0002

> Does the PCI ID needs to be removed? There was a similar change that
> I recalled and the discussion eventually leads to ID not being
> removed.
> https://lore.kernel.org/all/20260123033233.16906-1-enelsonmoore@gmail.com/

I don't think there is value in removing the PCI_VENDOR_ID_ALTEON
definition.

