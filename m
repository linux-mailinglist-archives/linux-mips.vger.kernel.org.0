Return-Path: <linux-mips+bounces-13042-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WQ1fKkbaemk3/AEAu9opvQ
	(envelope-from <linux-mips+bounces-13042-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 04:55:50 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F41F9AB877
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 04:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B6D6300E725
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 03:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A803644BC;
	Thu, 29 Jan 2026 03:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb5j6+FE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BE3358D16
	for <linux-mips@vger.kernel.org>; Thu, 29 Jan 2026 03:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769658947; cv=pass; b=H8GXYrJL3gApOK3QNPnUP2Ve4uyZv3vk5RDTBsvXx1N2Bu3pL7XimabVz5gMQOGjldj8xVH27K2KQJeMFAYA0zsDfRYdcEtxcFMtwgeWvWI43sd294hIRz9G7zzJVvFU5UTOPmW6jjwCebpAmbAticFlv6ChbEwitlRtglnmi5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769658947; c=relaxed/simple;
	bh=dreyxwAadnjRw4GmLNjYV9KTAhpZn4PH/bUL/r3ljrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nr4hOa+8pe2H4GWTKoAoKnLzpEJjklPQtit68UpWrfOiqOAw49tn17HQSqX4ENT23sI8HSpoStPHHPPULSRy5rwjG+C5h0GByp2sY7V0ozA+jnqiJpQsWUznDYQZ8yeJfpsDWmSyny3o6UqEXvQuQgf0hYJvmPEk4PgDOzG5jik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb5j6+FE; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-88888d80590so9380426d6.3
        for <linux-mips@vger.kernel.org>; Wed, 28 Jan 2026 19:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769658945; cv=none;
        d=google.com; s=arc-20240605;
        b=lyZe8kCEYn+Br+sP0wrbwJRXoGT68dhAGFiveZpp72nE/xi1F9qdAD8ace8PzqNhTi
         56v9WBVC/k34MvRjNYacEa8KCKGpbRwD2HTg0edBiuEfn3kHt/j7ukPxJZ4dEH9YBf+7
         QIqKojMWqFx+TUetq0zIwj2ONc4RX2NngmLYgj2hKsQIPrkSS8xh6tbjoSE+hXnmPrSw
         R2cCsHNlj/a9loZjm+2iLvM5f6QhOep/kdXDLXu0sy/2hZQflBHbqgSmB3sGzdeNKYmR
         zQZHPQpYBGjGPtP0UkjmPK8qBc+OnAIATywPzTCsRmj/dVjFMqTE2vmhVSOIMPLYso+w
         IcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dreyxwAadnjRw4GmLNjYV9KTAhpZn4PH/bUL/r3ljrU=;
        fh=x3EqDs1d1UK6xPxWnt99ug6T1jFURYHLekELKpIF2iA=;
        b=N3u0zuwDJu1KdPeqHnrgOA0M/ivFeGj4FUIyDTVoM/njQiJPZbdKdQKtOp8pzScMBa
         7im3hdCiuJif8leUKWE1JNgFVytaUH9C4qGZMIW/303nIKcza9PYZfMRSANz8VK4kvXb
         qq/Hyznt1bvTznea5+rJdkSmTttCphByZENwN1fYMW3AemwwD2TRecAn3r8Muf8QABgl
         LodugxHRCXVKsq42abcv+AMZOphX3vtllrlN1lX7sjRYKxAXOCRXI+42lU3oOValTXu7
         HwPMhid1Hs7k+w8Oi9oZCwfeTq8i7grZ2+Yp291CAuwWktAoyjCINKVRL6vhdNVg2Szj
         BVwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769658945; x=1770263745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dreyxwAadnjRw4GmLNjYV9KTAhpZn4PH/bUL/r3ljrU=;
        b=lb5j6+FE2O0Pl62pBEhMsNfLi2bWioImX+YbzHIDJk4U2UjdvonV9hoEojHeu1HDGU
         ba9+vJKWf1JgciuIV0brHuUb2cXLpY+i87GPeZ3NzF2nlRluwxkLtohrda4B2cyDQmuv
         QKBBR4tT++0NpInsKX2COkILgZq4+SO1iCr99j6B1qV8SSxithPR44AxSL9unhlsMynZ
         WvZxyvrSYf/7P3kQ1uEPugknX2eFqjtca+Q6W68zkBAH2dcFkWm7rkGxxuJp0ZME/a28
         +Hcmnnd1SMohD30jCpLbPFXK5AnpHyZz/JP4CVz2Kz4GBOQSSW1rOFr3rDLAQ4IfnJa7
         6dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769658945; x=1770263745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dreyxwAadnjRw4GmLNjYV9KTAhpZn4PH/bUL/r3ljrU=;
        b=K1jvPxAXdhgymEHRbdDBcHDusPHoXYrOzzBRCgfdYsaY/6IjQbVzVO0noDRU7oYS3r
         RsQylp6GNbsupQJvDwb3h2fihNrNTLsrtfZLEKx8jOvthsDUalqtp+zGPl7Yo+DxIajc
         O3Tf78X6h2mIcPMMOvvEF6WUdZR1BxKV5oFx//8t0YYhEnd3odxcoZm+dAfAOqn/D9sx
         QLmJ0Bwn4O4O/9RPPO28AraMdML24nPGifayeAFgmInLIptXhOL+XhSSB7TJVNnXZKQA
         An+xrijGUR3sUhsuwUtWlnCI0Zm+Jy0Ivfh0gKTioz/F/NxKS8XW+xzyw7YtCKrcpgqK
         c8jA==
X-Forwarded-Encrypted: i=1; AJvYcCVpRVIkmDQzCKKGSV5g0PN5vStS2KNuoFnb8XDRXgFE7IAa9/EO8TMvjWl8J0GVuoZJi6AKM6eRCkWJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/aCkTTNyFQQzEc64eWdMKF5YvxyrLjj5LHjZSdN2HJfZ230ap
	uyW3kaXpmT6tNG9aNYnq6g0LReDaIYwvUBSbqwsmJ5P9SO+s4QxxqbaMByznNswuqMtSlO5BsND
	bpO1at9gTWslkXvLFrx6COi9iq/9ZKTk=
X-Gm-Gg: AZuq6aKi0TlN/DjiHJaU8VwxdJJxPgcYEugcBYaSgyRMfxiyny+MGYC0vXIYvcv9pnI
	x7vbmKFwWBbzvDy495n4HQgv97kwII79ecNVIb0uRDTfHxaeYuF9TmOmSL1CfTgKkxR9NuxVHHo
	vIqUs/HMTuDSDEjLmrMmXAV17LumfnpVwPROJIA+8O8b3ykQQ/7Hpsbw3u6eMtmwA7Xe57zGuze
	iGJWlx3Z4/VtIqSphh/SVX0TQpNuAJfGXDRr9eJ0mFUw5rsr52jwIKRJVUj9p3V0s2UYfwfN84j
	Csg0KpB0GIFitlsXxaYCMWNu4IY6npAcufBfNYNZndNP8TBAz5Lwe/yI
X-Received: by 2002:a05:6214:d47:b0:894:2d44:509e with SMTP id
 6a1803df08f44-894cc821c27mr116372646d6.23.1769658944665; Wed, 28 Jan 2026
 19:55:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126031352.22997-1-enelsonmoore@gmail.com>
 <alpine.DEB.2.21.2601270110590.40317@angie.orcam.me.uk> <20260127155607.3f80ec99@kernel.org>
In-Reply-To: <20260127155607.3f80ec99@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 28 Jan 2026 19:55:33 -0800
X-Gm-Features: AZwV_Qjhl5q7xOvj31R-bM_rs_0zlvr3v6oaj-AmWEWA1eTbTy2My24hcAGKR1E
Message-ID: <CADkSEUjfBQLqibc2zrcWHhOwu7kUf8FceYDfevAFHV4rCqsUUQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: ethernet: neterion: s2io: remove unused driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linas Vepstas <linasvepstas@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Takashi Iwai <tiwai@suse.de>, Huacai Chen <chenhuacai@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Eric Biggers <ebiggers@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Ard Biesheuvel <ardb@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Konstantin Shkolnyy <kshk@linux.ibm.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, Dong Yibo <dong100@mucse.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Lukas Wunner <lukas@wunner.de>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13042-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[orcam.me.uk,vger.kernel.org,lwn.net,gmail.com,linux.ibm.com,google.com,davemloft.net,redhat.com,kernel.org,alpha.franken.de,ellerman.id.au,lunn.ch,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,suse.de,mit.edu,linux-m68k.org,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,wunner.de,intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F41F9AB877
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 3:56=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> We deleted the vxge which I think(?) was for a newer version of this HW
> 3+ years ago and nobody complained.
Yes, it was for the newer PCIe version of this hardware. Since no one
complained about that (unlike when fealnx and sundance were removed
and then restored on request), it's even less likely someone is using
the PCI-X version. FWIW, 64-bit PCI and 66MHz PCI are even rarer than
PCI-X, so there's basically no way to use this card with reasonable
performance nowadays.

> On Tue, 27 Jan 2026 01:19:34 +0000 (GMT) Maciej W. Rozycki wrote:
[...]
> > What's the gain from removing a driver unless say it's broken and
> > does not build?
It very well might be broken. When vxge was removed it emerged that
someone had reported it as having last worked in 4.1 and broken
somewhere between there and 4.4 - see:
https://bugzilla.kernel.org/show_bug.cgi?id=3D197881

Ethan

