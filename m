Return-Path: <linux-mips+bounces-13005-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN7CANNcdmlVPwEAu9opvQ
	(envelope-from <linux-mips+bounces-13005-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jan 2026 19:11:31 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6081A9E
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jan 2026 19:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97276300459E
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jan 2026 18:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F04248880;
	Sun, 25 Jan 2026 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSXPgBM6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581F51DDC3F;
	Sun, 25 Jan 2026 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769364687; cv=none; b=Ql2T7YaLkM2+Pm6BrMOkqgPuFdP2v9TNB8Fqo3XS/XE8b/+l9iWc/vUE9pMBXric3BTOKsHMg491aQ7LqK23lrgXLAef7RtC4Ybi/Odxap4bf0ftSnKHabL8mNBv4bBFlEWpbTz637P0CR1BQSdMfqNt/7GAvYclRcIwlyhDusg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769364687; c=relaxed/simple;
	bh=qgVtO8mWSRuxFs90xJYzoTYRLOJL+pr5SZ3KzZGHvdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JrBl8NqOHqK/+j7aHq721HekzwPww8lzJE8c7RS/tLIqqwwc30YLXyEAb51V5OTuQoJH16wNfdVWLnIpZWwBNVeNUYDOtS0kFSb1T1AxiWednqEGG71jV/br1DwUP5oQrLjXWrRjMWztBidI5JTVLis24RaWJlzrHzKZuC+xejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSXPgBM6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF50C4CEF1;
	Sun, 25 Jan 2026 18:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769364687;
	bh=qgVtO8mWSRuxFs90xJYzoTYRLOJL+pr5SZ3KzZGHvdk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fSXPgBM6pyKu6dxW7/SPJOT2E4JeiGkQ610PJjUqTKkJD9/f6FdXDhiGS/C9infEx
	 NjqBQ+VPIKS16IbneeZpeiRn3dBNpjmUKDKCm9NK0GT4y2zfbjmuo+gQ6x1UmoXMTD
	 kZz2Irh3PGvFPBoVFaVH+V3BFLlM+GH3c0KBgTuGpNwBKg5MJWfMWSlJbD0UIfkwg5
	 DKDEIsbflP87ympyOXbQ3AF+c2uoO5v7DXWIhl6viE/qlEoW0SJxIRMkuV34fF3QjY
	 jWtTRONGo64Ey2japsnD7I9qrRXOkuY7b6Ww8c/lrOxcIhdtkuaKfpAI/o6fDzgsqu
	 Y3/fmBHYDsx6w==
Date: Sun, 25 Jan 2026 12:11:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Jon Mason <jdmason@kudzu.us>, Jonathan Corbet <corbet@lwn.net>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?= <martink@posteo.de>,
	Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Huacai Chen <chenhuacai@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Takashi Iwai <tiwai@suse.de>, Eric Biggers <ebiggers@google.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Dong Yibo <dong100@mucse.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused
 driver
Message-ID: <20260125181125.GA209392@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkSEUjyXH74izTrsfhdAjh=n-jnGx=tXbqPx86M9OYqjXj0PA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13005-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,kudzu.us,lwn.net,gmail.com,linux.ibm.com,google.com,davemloft.net,redhat.com,alpha.franken.de,ellerman.id.au,lunn.ch,garyguo.net,protonmail.com,umich.edu,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,mit.edu,suse.de,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,iscas.ac.cn];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 54B6081A9E
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 03:32:17PM -0800, Ethan Nelson-Moore wrote:
> On Fri, Jan 23, 2026 at 11:25 PM Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> > Yes and that's exactly the reason why removing unused IDs will be a problem.
> >
> > Let's take an exemple: some patch adds PCI_DEVICE_ID_ARECA_1682 after
> > PCI_DEVICE_ID_ARECA_1681 in pci_ids.h in the mainline. That patch needs
> > to be backported and it conflicts with PCI_VENDOR_ID_S2IO which is not
> > anymore in the mainline but is still in stable.
> 
> Hi, Christophe,
> 
> I understand your reasoning now. Thanks for clarifying. In my opinion,
> changes to pci_ids.h don't happen often enough for that to be a
> problem. Unused IDs have been removed from it before.

What is the value in removing the IDs?

The values can never be reused for new hardware, so removal doesn't
make room for anything in the future.  Unlike the removal of driver
code, removing the IDs doesn't reduce complexity or improve
readability or maintainability.

