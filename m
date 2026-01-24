Return-Path: <linux-mips+bounces-13000-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGxwGNlzdGkU5wAAu9opvQ
	(envelope-from <linux-mips+bounces-13000-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 08:25:13 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEA7CCDD
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 08:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A586E3010BBC
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 07:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52A32459FD;
	Sat, 24 Jan 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqCXsxeU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D33EBF1E;
	Sat, 24 Jan 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769239510; cv=none; b=RCn3nTu3Vp6FqP1I+g/WCusiDBn8vL3Ub6rXlPgMAwAYHKMLQYUGwvvfN5zhvVVkJK+AoSmLJkTr9WUfxvwZ3dQVjI6Jpnp8r+aHPukfjbxoSUNjnhDdkjJZg2dafAlfCKRhqQAANmmW8bkWSDE2D0aGFrKjJoou0xp5ACx7ix0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769239510; c=relaxed/simple;
	bh=BpoHXPSY5AwaQmN6Xw7QMaOi0dRnd72osdnYD0X4kPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8h2fI3SkxFHdgh4+lkqtwkih5keB9Jy8XTWqTRALpS177KkjszMcxLDe/0LGWjci0xx2psfMB79gh+Tk31eB0B2+G9Xym5QHA+ZtLBiQQmhpIdqX7kYuSVYVCufa1ZH0hxaxLczymbUt4Yqyrvt20v8j/3X3rqixZZ1TVBvfWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqCXsxeU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DC9C116D0;
	Sat, 24 Jan 2026 07:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769239510;
	bh=BpoHXPSY5AwaQmN6Xw7QMaOi0dRnd72osdnYD0X4kPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lqCXsxeURasvHP4unVWE7PgUKtV41NIhdpM5vvDoekklddO/E8dY6AGHT6g46ECmE
	 jAqr/Ps7aGYp+PMRIA3YPw/Vwo9C+TpR/sdjlCknPM+8dAleph3X/4bU5wz1IumbJ4
	 vsIyOm7lmyAqlf6I/LEv+1yiLfUCgQG5Qep86ZG9pnUsCEjekEe9P1WoWrrEtjnmQI
	 QDhJCZSHNho0ytQ1vYlLxEHC3JmuX9H5jIR2xZzspstMFBwT5DWK5sGJiegpaS1O84
	 ta04pSX1Y2X93B0O1gM0i3o07Wqvm66WeMTmtMVkp9TeOCvY9mMZIkCPgoXqmAL2FG
	 PTBGII1HLujNQ==
Message-ID: <8477da83-2441-440c-80f1-66dac9700523@kernel.org>
Date: Sat, 24 Jan 2026 08:24:47 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused
 driver
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Jon Mason <jdmason@kudzu.us>, Jonathan Corbet <corbet@lwn.net>,
 Linas Vepstas <linasvepstas@gmail.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Martin_Kepplinger-Novakovi=C4=87?= <martink@posteo.de>,
 Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Huacai Chen
 <chenhuacai@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Takashi Iwai <tiwai@suse.de>, Eric Biggers <ebiggers@google.com>,
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan
 <ajd@linux.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Dong Yibo <dong100@mucse.com>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@kernel.org>
References: <20260123033233.16906-1-enelsonmoore@gmail.com>
 <20260123181156.GA84531@bhelgaas>
 <CADkSEUg5EqpKg2_X3LRc1CaQ2RVFNucJbuxDcHQxvjdLq1Qg1A@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CADkSEUg5EqpKg2_X3LRc1CaQ2RVFNucJbuxDcHQxvjdLq1Qg1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kudzu.us,lwn.net,gmail.com,linux.ibm.com,google.com,davemloft.net,kernel.org,redhat.com,alpha.franken.de,ellerman.id.au,lunn.ch,garyguo.net,protonmail.com,umich.edu,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,mit.edu,suse.de,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,iscas.ac.cn];
	TAGGED_FROM(0.00)[bounces-13000-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C1EEA7CCDD
X-Rspamd-Action: no action



Le 24/01/2026 à 03:01, Ethan Nelson-Moore a écrit :
> [Vous ne recevez pas souvent de courriers de enelsonmoore@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Fri, Jan 23, 2026 at 10:11 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>> Not sure there's value in removing the IDs from pci_ids.h.  It may
>> lead to unnecessary conflicts later for stable and other backports.
> 
> Patches to remove drivers are generally not backported to stable
> versions, even if the driver is broken, so I don't think this will be
> an issue. There is no point in keeping unused IDs around.

Yes and that's exactly the reason why removing unused IDs will be a problem.

Let's take an exemple: some patch adds PCI_DEVICE_ID_ARECA_1682 after 
PCI_DEVICE_ID_ARECA_1681 in pci_ids.h in the mainline. That patch needs 
to be backported and it conflicts with PCI_VENDOR_ID_S2IO which is not 
anymore in the mainline but is still in stable.

Christophe

