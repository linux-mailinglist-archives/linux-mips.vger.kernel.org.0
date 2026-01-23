Return-Path: <linux-mips+bounces-12991-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FltI/K5c2kmyQAAu9opvQ
	(envelope-from <linux-mips+bounces-12991-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 19:12:02 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0541E7968B
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 19:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BCA03020873
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 18:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4658227B35B;
	Fri, 23 Jan 2026 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvwePtsh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3781DF27D;
	Fri, 23 Jan 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191918; cv=none; b=BYc1ZMNaNLt3XmN79TIDCIavz0WOvcbC4Hj+cXNUqAc3iP/UCwQ5QGC7e/wcah4Hvqa+Rznru6CTG2YHD7+JmjfquwDWMYXiQV03qoBldHVZPQ6MxbGshaPHCFg6q1m5lhDeKxbo7he+J0w/OdFjItTSqezTIohQ9VKdid26llQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191918; c=relaxed/simple;
	bh=gAu59N+pafJqOnym+UnaH+Jh421RCCkXaq2oHeKQwyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FP3bwLHfS0MH0qPhW5RhUYNPEFHVNGGTDdy1q0xPuObqFj2oeyJP+TfxsTPYJWa9vdnNMfTqvnsAWGvEPYRdnlcVj9SfTS90ZqjL7zChqVp/h4Y8mkmeCvPJ0dMfbwmWec9Nb6KNIbgajb+wkV7LzuWrNc4gCkMEeTWiG0ok2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvwePtsh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA38C4CEF1;
	Fri, 23 Jan 2026 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769191917;
	bh=gAu59N+pafJqOnym+UnaH+Jh421RCCkXaq2oHeKQwyc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LvwePtshB6UIxrIW7FGsza5eXIE59STNMmWVvsp2x4a0k7oWK6L/nkvXpMny6Y0N0
	 t1cdNdNtomNAL3LXCy81O3+dMW1wArBcJCl+kTme6UinW/FePbJLAAar2b2SDVFT37
	 PaylQ2U63tbJdsnNnJHNmqToZ0U+MctQUu60NCBxSfkfQQyfIOro8BndVP7AzGfySX
	 2dCTNodn3jt9yar2BXHmcyWJQ8BRNrjOiSTV8OP3+A2n86eGGvfxkDSYZbZAs0Hp0p
	 T7BiYPgnI7LNHfD+t1UwdrFrqfbNWOeRRTX4v3Mt34WgC66PjoejENdtnUgLXhIovk
	 A+IwYQ8ILJicQ==
Date: Fri, 23 Jan 2026 12:11:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
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
Message-ID: <20260123181156.GA84531@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123033233.16906-1-enelsonmoore@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12991-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kudzu.us,lwn.net,gmail.com,linux.ibm.com,google.com,davemloft.net,kernel.org,redhat.com,alpha.franken.de,ellerman.id.au,lunn.ch,garyguo.net,protonmail.com,umich.edu,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,mit.edu,suse.de,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,iscas.ac.cn];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0541E7968B
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 07:30:41PM -0800, Ethan Nelson-Moore wrote:

> ... Remove the driver, and move the former maintainer
> to the CREDITS file (restoring credit for the vxge driver, which was
> removed in commit f05643a0f60b ("eth: remove neterion/vxge").

>  include/linux/pci_ids.h                       |    6 -

Not sure there's value in removing the IDs from pci_ids.h.  It may
lead to unnecessary conflicts later for stable and other backports.

> +++ b/include/linux/pci_ids.h
> @@ -2445,12 +2445,6 @@
>  #define PCI_DEVICE_ID_ARECA_1680	0x1680
>  #define PCI_DEVICE_ID_ARECA_1681	0x1681
>  
> -#define PCI_VENDOR_ID_S2IO		0x17d5
> -#define	PCI_DEVICE_ID_S2IO_WIN		0x5731
> -#define	PCI_DEVICE_ID_S2IO_UNI		0x5831
> -#define PCI_DEVICE_ID_HERC_WIN		0x5732
> -#define PCI_DEVICE_ID_HERC_UNI		0x5832
> -
>  #define PCI_VENDOR_ID_SITECOM		0x182d
>  #define PCI_DEVICE_ID_SITECOM_DC105V2	0x3069

