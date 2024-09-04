Return-Path: <linux-mips+bounces-5328-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3F96B7B2
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 12:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AB0E286242
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 10:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D01F17BEC0;
	Wed,  4 Sep 2024 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="hteFQ6tA"
X-Original-To: linux-mips@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF0D146A76;
	Wed,  4 Sep 2024 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725444180; cv=none; b=aKfn0lktgyP/fMSZtMgqSl3WsfDSxRdgr2pKku1mVvYleAFtlby3heLG4CZGSu7IaeA00ahRXaFcY/yuerLvz68KF9kGQIMRk/yiHKxAxqU9N6q6ZmRU7d8p7R+ZcdYEYeSgQW/9KUAI0Mi550ACI0oTtAy766jwE8UsOKY/w8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725444180; c=relaxed/simple;
	bh=NUYBQoP01aPvnT4bl2+unGZ89Uht7GTOYdx+m10A1CM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MOEKkGx7XqUuPCiJ7sSgR4YtqDe8s80UBzaCY2AWnynIyBf+NeOficp/zNgZeK+ckJFemljC8gJHlNrF2HW8HLdCLOKB05cHLDq7XMtsa/7RkGHEGdqOFX0k32iS2+zQjIYbBXgyrRH8vMhKRWVNawMzz9YO+GzJK2tCyyA2LDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=hteFQ6tA; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1725444172;
	bh=eaX0nbFpBKwu6wNGpm7V4LgYVzMNZMmgUTt/i+a5EpE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hteFQ6tAuY3P67/P99yq6rSs3z3MZbeYW1WFoHj6UKpHluQqjt+8pdSPKw5fMVn9O
	 oY5VwaTgzxgkM7nUrclPK6hPCgPW6YS2j064nCEbVhc6ubdWYjo7muI4J+81lsxI/m
	 7Nnb8HR0YQAf45cvY5qxRtr/4f5zraMwGYOPha/Q=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id ED19D67655;
	Wed,  4 Sep 2024 06:02:50 -0400 (EDT)
Message-ID: <f47376d9dfc174fc6eeb29ee45c67413ecc1feb6.camel@xry111.site>
Subject: Re: [PATCH] mips: Remove posix_types.h include from sigcontext.h
From: Xi Ruoyao <xry111@xry111.site>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang
	 <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Sep 2024 18:02:49 +0800
In-Reply-To: <alpine.DEB.2.21.2409040229030.1802@angie.orcam.me.uk>
References: <20240828030413.143930-2-xry111@xry111.site>
	 <alpine.DEB.2.21.2409040229030.1802@angie.orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-09-04 at 03:06 +0100, Maciej W. Rozycki wrote:
> -#include <linux/types.h>
> -
> =C2=A0/*
> =C2=A0 * Keep this struct definition in sync with the sigcontext fragment
> =C2=A0 * in arch/mips/tools/offset.c
> @@ -66,6 +64,9 @@ struct sigcontext {
> =C2=A0};
> =C2=A0
> =C2=A0#ifdef __KERNEL__
> +
> +#include <linux/posix_types.h>
> +
> =C2=A0struct sigcontext32 {
> =C2=A0	__u32	sc_regmask;		/* Unused */
> =C2=A0	__u32	sc_status;
>=20
> so not without explanation and clearly to address a userland compilation=
=20
> issue.=C2=A0 It seems that the original directive should have just been m=
oved=20
> into the __KERNEL__ part without changing the file included though.

Yes, I just mean *changing* the include file is not explained and it
seems an error.  I'm not familiar with ancient kernels but AFAIK for
using __u32 etc. we should use linux/types.h since Linux 1.2.

Moving the include into #ifdef __KERNEL__ makes sense to me.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

