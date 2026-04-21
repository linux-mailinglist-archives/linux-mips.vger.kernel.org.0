Return-Path: <linux-mips+bounces-14217-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZG/KA52k52kI+wEAu9opvQ
	(envelope-from <linux-mips+bounces-14217-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 18:23:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA7243D4E6
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 18:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1ED63051D0F
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 16:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431A736404F;
	Tue, 21 Apr 2026 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhtOqGe7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95699364038
	for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788282; cv=pass; b=qoPalG+jf8ZVbHB7SiuXOtewoSiM0J6Lv/yTziC+fORLZUYKjdNUUoVfqB+vQtWn+TP19Kof++2HGOuIneReRUaMdmbUmO1j7IJind2WwolIhJNK8gOrTy/AUG6crl+vFjRgNzYjk4bV+J4dqyfFPrA8aU8V4gr1aWX6fRbMR2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788282; c=relaxed/simple;
	bh=bpNWPmQUmtbAf0gai0ctu6DBVgpxv6rlo0i3uJ04sWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RiqZq7WgTLSnOINStTsyFSmR2IXQWcMUb5nvxL2ZUjODcWmz1FajqRt8a9taJe3Me/DxwtYu2Tlz04MmujLw2Z0pBhw/SxC05pJZJETKDFY9MvfBriGNykaAgB+F4SfkIia+YA24/LKHQMIlNcevM7hZK8uffL9D7Re/Rtz6WtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhtOqGe7; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78fc4425b6bso36461587b3.1
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 09:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776788279; cv=none;
        d=google.com; s=arc-20240605;
        b=adASmPobso54wx7b0RCJilhRDIa4ldxIsewwnoL4SBmrpWIPtUonfbKo0lp9wsSC+o
         /ts/G8nZT++ul4hiM6oCarSvHwQEs+CtkqChiR9dFiqgm/pA9yByrmlQcqTcOxhwLjlZ
         DNA0rCmrQbcrKcaKvr1J8IXWOwkXwz9St7CDXy7ZH+O+iPpC+7L4ZSexWFAGoTZyx4WL
         bhnxBKqRNAyRh+n07weH5C9enNAxj7fF4xIKdgExXokpKg8ALoFwfAq0MDV6n2Ucnkz8
         FathRmUZPJlkVDDSPAaTHoupOz+fR+1HRj6FyUAImMKfKltm2S5gUwA244hKchD+NN03
         xHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WlejQ2Tpf6EuBEgAofXCiHYBLX5AECYqklHU2vA9qDI=;
        fh=zOOfnwoCHIqKYspWD4cekHRIxxkYU2ebhbu9JoDYdDw=;
        b=gQmN0Sd1Ucz7qw6McxLgZhkuKoZSqXqz/oP0fYGzdELLs/eV/t0rxNMMJN4kmk2pFd
         gnOXUpT4kPsY3KerkyVdmMhWXV3wkd5ud/c3I+Yr85piqtbgEq/Dqcx/SXie95K2zVng
         tzkIysAWIJJ50UEKTaYCQZ4xGurAnjmVtMRPzahTt++rtRMwRsaUXWzOeRfWR608qK1S
         RdZzk8zyqSCIuR39U0vQEgE/cN0+GyxQ7i8cTYNAhxVZ9F3TsTqGZhwbDJJJtWSyq4kg
         rUFgfI7Y4EVaJY+lL8rnGFUHyhuzwQW9n68sz/FEDExn4z8fzjxp/40lqwByOgrvy8k2
         +onQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776788279; x=1777393079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlejQ2Tpf6EuBEgAofXCiHYBLX5AECYqklHU2vA9qDI=;
        b=BhtOqGe7RRiIumgDU5cmNdklvcPueg50lKI4WWG2/cDxTXZQlGpSViHfQ9efN+5Z8m
         EAyLwYe5saHRlKuBwhm/6CyS7NTsTr5fsc4wzlS8p26QcC7X+PGNgtHaCIqEkW6WItdK
         170UggOhkbPuef5armjmTEHwX6L76lT4T7pcbdJOGn5I3CEuKP0PlXUWEVGSRKUp27Bt
         NSKsBfmVSz7FIV4650sZtzBIWN67QdJ4yaUNTx+g2itL5c3EXIukyEO5O0rXDNO9+gT4
         CUHca599zSnFtZDldiQdna7j4annw/YRubSH4Ij4/3ppVf92s7h0rM5Cz5GKlBbBisva
         nZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776788279; x=1777393079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WlejQ2Tpf6EuBEgAofXCiHYBLX5AECYqklHU2vA9qDI=;
        b=nwru0ZRG6vzi73wQGVdwD80m50NBmDo77jfs3YT1taiAa7GlzhzTyBtC6Kg1atA7oL
         ++VrryY/kRsusiUg8q2q3PO+YweWCdGIHLTTa/3DxWDbyZgISqY52EQ+WjbsYWftpPUx
         fGkPnwFwGYTyFG/qHLGe5MneMpVr4Tz8wuahQUyNGxVK34zrJ34f/Gal2HB2Qi9EYQwE
         9lPyHkOWeGisM8YhSRUrMtmteT3s83uKeYA3Pv9LFJrZ4qXyX5/pbjSUCJtW/biO/eib
         kcGoTSF6Y0bBQbopzB43KMfy85639qY5PYMAJLjOSHg1fiFjkfW9H3d3ypVNFfFOtCbA
         8+2w==
X-Forwarded-Encrypted: i=1; AFNElJ9vFCoI24KMkCin0iajklJ/DIia91drLUillqStCzR+I6m2bd9Y/YUCAq2BUy715vTjX2QGE0ov9FUT@vger.kernel.org
X-Gm-Message-State: AOJu0YwgM6h3CUIRiSgHf0d6H1wiNlHNNjYrj2VtakUHCG3gKp20lmm/
	SYwF6k1P1STDb/9zTTsqVb3NhuP69AEDRF/coZLVKO/L9Xjc81wwUjOrbDsqkrQLjGiT1IZ7HLj
	E5NZEjUuHTtGptdci39me9TyPFtOjd5s=
X-Gm-Gg: AeBDiesY/Bg4zjXeraPt3f0rOLdfqmQ7vqESZTrta+czeLzhQGsXGMjlB9J1anFUIYa
	QRyiqkwISkz/olfBmsnssfW2OKeEmq2/vF8SRUE/FGSvCSWkBiaC2WpqCav7zWVSGdCDE/IiBa3
	VoL4ZffrPqNmmIaQFbP1UZwBKIXY991Fa/+xyw/eSGBhMXTjS8yPRcHdzzHIw1A75+/Dz6HVdwv
	9Os7PCgjS9dQdf0Ug2LttxLJMum68kSM6PPx1fTfj7UmmQk9AG1RFfyysgqvrBMPyea0c6fO7qD
	SZpcFuRP4Ekw8BffofwIvHXBWF0rGQE3csIrU0yIV512a6xwCg5n4hf/cVppQ5cyP1sTS01BFaV
	zJ1XLZfomyjFWa8s/0EcNfzk8ayym5vNOByAm
X-Received: by 2002:a05:690c:60c1:b0:7ba:f129:3770 with SMTP id
 00721157ae682-7baf129489fmr85282657b3.5.1776788279397; Tue, 21 Apr 2026
 09:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421021824.1293976-1-kuba@kernel.org> <20260421065507.2c5e3ba7@phoenix.local>
In-Reply-To: <20260421065507.2c5e3ba7@phoenix.local>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 21 Apr 2026 12:17:23 -0400
X-Gm-Features: AQROBzBxInpXswvKS4PlaD90HmpltOzEo3_9ivTaP46UHDxuQQ1dPVwgB3AoVnI
Message-ID: <CAEoi9W6ZRw6aEh62Xbgkg-TW8URHbVp6dHTT9krFiTkotjTuTA@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: stephen@networkplumber.org
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, netdev@vger.kernel.org, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	federico.vaga@vaga.pv.it, carlos.bilbao@kernel.org, avadhut.naik@amd.com, 
	alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
	2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de, dsahern@kernel.org, 
	jani.nikula@intel.com, mchehab+huawei@kernel.org, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au, 
	ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org, 
	pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org, 
	mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me, 
	pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de, toke@toke.dk, 
	kees@kernel.org, jlayton@kernel.org, wangliang74@huawei.com, 
	aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14217-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[crossd@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,networkplumber.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6AA7243D4E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 9:55=E2=80=AFAM Stephen Hemminger
<stephen@networkplumber.org> wrote:
> On Mon, 20 Apr 2026 19:18:23 -0700
> Jakub Kicinski <kuba@kernel.org> wrote:
> > Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementation
> > and all associated hamradio device drivers from the kernel tree.
> > This set of protocols has long been a huge bug/syzbot magnet,
> > and since nobody stepped up to help us deal with the influx
> > of the AI-generated bug reports we need to move it out of tree
> > to protect our sanity.
> >
> > The code is moved to an out-of-tree repo:
> > https://github.com/linux-netdev/mod-orphan
> > if it's cleaned up and reworked there we can accept it back.
>
> It would be good if these protocols could be done in userspace
> or with BPF?

Consensus for a userspace implementation is what folks on linux-hams
seem to be converging on.

The amateur radio protocols are more or less specific to low-speed
links, they are not particularly coupled to anything else that
requires running in the kernel, and the main coupling point (IP over
AX.25) can be implemented via TAP/TUN.

There are several popular packages that already implement AX.25 and
NET/ROM in user-space (for the interested, LinBPQ seems to be the
canonical example).  The main missing piece is ROSE, but it is likely
easier to add that to an existing package, or potentially something
brand new, than keep it in the kernel.

There's no compelling reason to keep these protocols in the kernel,
whether in-tree or out-of-tree; at least, one has not been
articulated.

        - Dan C.

