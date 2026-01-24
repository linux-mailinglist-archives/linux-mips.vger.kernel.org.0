Return-Path: <linux-mips+bounces-12999-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBbzMxkodGmA2gAAu9opvQ
	(envelope-from <linux-mips+bounces-12999-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 03:02:01 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 373037C28B
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 03:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F7233035261
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 02:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB7B1DED63;
	Sat, 24 Jan 2026 02:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbnLfBIw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9279284039
	for <linux-mips@vger.kernel.org>; Sat, 24 Jan 2026 02:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769220100; cv=pass; b=Id4kO1AfV6AQ0uIDirH4mBT9A4cCdhQWcCgJ8p+u75ZgZeiz29LPWx414XD3Jyqg+gsi2D6PRVS870vQmZgY1wj2ESOIi45E5aM4rUCsIA9UoXc4AF5rrnJXOP6o3JFX++qINGdGVjJsWt2bsuqgEuaGDOe0neA78A5x56pCPlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769220100; c=relaxed/simple;
	bh=jLt0PwGKxUNFP/UMurV5/9hmISNtz6t9H2HpKnVOTXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1/leD+4H+CmuR37ad9M2yiKczI9K0T4B0j5praKfGjfVoM93Asajn+zx9CO3ESun+/itkxiYeoZELjWImXK7FV+ErjkUGpdWhTmOccTAaYu6XylZSp8D5vDgudVKIwt0L/AiMVL7VLOaPbVa52Ei34TkvyXIQv6/XPjEEbJj3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbnLfBIw; arc=pass smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8946a794e4fso36010176d6.2
        for <linux-mips@vger.kernel.org>; Fri, 23 Jan 2026 18:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769220097; cv=none;
        d=google.com; s=arc-20240605;
        b=F79O/lxl31O9DE4GIPMgMfFWSa8K5jY1maXiw5hOHl+7cVjqfd35OAbPjFd1SJxFlR
         sVDnuioj7U43NSL55NfIbxu9Dtzn4i17WaLmFHSoc1o8b9oElC1Xy4GYxUKcuOp++Sa9
         G9MASpn9+oGs0eCIVhEvnOFomV1xSgjUL4C1WmABeyu1Z/z07rdwQd57mzh7zHkZPW6O
         jHTgDd5zQT+vxENZm1eUCgsahXxR3SwYUSHLKHNKBzO7BLEVOz7Yxec7UEpGpzzT/ZSK
         mAwWhRpCHSzjhOLH9V8i//RPggV/QW2XRCsrCu6tCjy/sle3/MeUWS58uWYK/8dsIuHU
         /2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GcF2ydOy+nfomakh5Blwon1hHz6tHyuDcePaQDWXLgo=;
        fh=d2hZdHAhVgQZkZO3V1E2NB5dsjrB3wLifOME5fj2Z7k=;
        b=IKJyU/vyQQ8XJlpyK3P3mEQVN4Ch+5HD/95ESA8fbzylX4sXCwKlRIZQCEh6PJjAjC
         hJlo2RzG73NJxjWQKOpytrWsWA1efxCQEdhrKkma6zYq114+W0cHpe9FGHOtr0CujMhd
         gh2cShGd3ka1xy0rUBvfCD1GS6gE6Oyda2/gV61sE8dp/qIzUnYy/gEkBgwqZQG4Gygl
         INCQoyXSUfuUJYRUYa/Z5jiVflTA7MYrBtK3j2qmbLJnBtwmy2wnfic3mXuN9BFH3Hop
         Xy38OjrHFjczqUgvAVZb6KLpkL8AqPsyS6PycHA4/SiWNX9Io4yS2DY5e+k5qf3PHvPO
         kzIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769220097; x=1769824897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcF2ydOy+nfomakh5Blwon1hHz6tHyuDcePaQDWXLgo=;
        b=MbnLfBIwUY7s5JWxSi5k0cNKlLxO3lYFzN9LojBwsQ4pDdC8XVwO5+R+/h+1IFsf27
         q4+PzSgB5wS2PNv4PdEsCJ7UbiYfZgzZKLXxVZ/og1hakbRn20Qs921fX4Wi6iHStHP/
         bZMael74BErb/s1YoYs/jlUHmtO4iUSIc4i3YVtT+n0Da7PNQkQwkbe/xytokq57lRgm
         PsuOLQU9ZgR3LRwtXFTVbA0QPf/vb7m0+kd51rAeLmrvmBurK/1mB/3C9tcPWVpi0mIS
         DaDojl0ddnaXDI//bByPqXD8Cp22LeM6eaCpRT3Ov9K2Kvo0R/cDo3HVb7uwFcDO14+m
         ZbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769220097; x=1769824897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GcF2ydOy+nfomakh5Blwon1hHz6tHyuDcePaQDWXLgo=;
        b=gKK8zaMh/4HV/0zE/lxuAjpqhBUtLlPSdC5yLKxm6tEbnTumCuE9l+/Kg7/nCHRV7y
         7EKUfW305b0nKtXSzkYspaxx7i0Pt1fU8ctnHdbF/M3fFMdnKpwSdfwRAwx8Z+TNYPWu
         VeOiHs1pFzktIthMyb2Nzd60wgQHQsT8CHfAIsE0MfKkftWCpxn7s3m0xTP2P93HxNhH
         7cX61zptU7fk3QNfdbhLuK+pv9p3bW8fRqH+ZyCgbgDm9/pIqf3+pKZ7dxPkdMxUJ7Oj
         O5UL8LOdlAquqJqrB2xBifTvJjqd1pEMIAt/HUQU5jYXhRubRVtq03zb8cO759CeZtdl
         d49A==
X-Forwarded-Encrypted: i=1; AJvYcCX2NgeGhtvWRYp1lh9apxIh3zwtTuxpfSdEeCI3JGRCQZ4dGZHu1k7/ClDvC9mbuYqBZlIRn4cIrckL@vger.kernel.org
X-Gm-Message-State: AOJu0YzQOqif9sw0VQGBRPLI9nP3uRYfSTLkQ6Od5eI2mz12xCA493SM
	Rt+/wJuJUiu8FyqtydIRRXmMQKNdQLP8GmHT/QQBsWpv1GtInO676A3O27Cd7svw8x5m2/B/4el
	870VMTNXqpdpmMKU4Duq0nKjLbmtEsl0=
X-Gm-Gg: AZuq6aKMlPdo5kCsiFnUJmshDJCQJ8iP1yJgQL3oId64ss49OHNp3atsl6+TRpjBb9h
	j+rjpnvE1PAZ9oaYo73Esc0kEoMyfnSTR2jBKnxo4NYEuAWxs/MtieeeNLnlZK4MmDULhK7ZqLR
	uDPjlBleRTUyyisGsYDdX8Bvw4z2DbOWNYNUH1zfnGx1OWckB9RjMSQ7HYCsQIxHBegrzAIDr6b
	WA2PWdWEX6DhYMsCgET6bvG+Led7d27eXeTtSTzKXUsdYSlovtU2C5zzsDAN2D5TRTvxgJpG7CP
	kNV9y+co9qWG8jqaWClPQQgoJlQ526xYEfklK/StvyPw6/lkpGMFZLWC
X-Received: by 2002:a05:6214:20ab:b0:890:5973:a567 with SMTP id
 6a1803df08f44-894901b45f3mr66553036d6.12.1769220097575; Fri, 23 Jan 2026
 18:01:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123033233.16906-1-enelsonmoore@gmail.com> <20260123181156.GA84531@bhelgaas>
In-Reply-To: <20260123181156.GA84531@bhelgaas>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 23 Jan 2026 18:01:26 -0800
X-Gm-Features: AZwV_Qihtc5vhyYPwevTdmoQ3m_JYluy6sboC_AzdDpVbJp4Phlr8m3XaH144WU
Message-ID: <CADkSEUg5EqpKg2_X3LRc1CaQ2RVFNucJbuxDcHQxvjdLq1Qg1A@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Jon Mason <jdmason@kudzu.us>, Jonathan Corbet <corbet@lwn.net>, 
	Linas Vepstas <linasvepstas@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Huacai Chen <chenhuacai@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, Takashi Iwai <tiwai@suse.de>, 
	Eric Biggers <ebiggers@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Dong Yibo <dong100@mucse.com>, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-12999-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kudzu.us,lwn.net,gmail.com,linux.ibm.com,google.com,davemloft.net,kernel.org,redhat.com,alpha.franken.de,ellerman.id.au,lunn.ch,garyguo.net,protonmail.com,umich.edu,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,mit.edu,suse.de,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 373037C28B
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:11=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
> Not sure there's value in removing the IDs from pci_ids.h.  It may
> lead to unnecessary conflicts later for stable and other backports.

Patches to remove drivers are generally not backported to stable
versions, even if the driver is broken, so I don't think this will be
an issue. There is no point in keeping unused IDs around.

