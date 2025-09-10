Return-Path: <linux-mips+bounces-11204-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF0DB5213A
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 21:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9267F1C87EBB
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 19:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9752D948A;
	Wed, 10 Sep 2025 19:37:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A912D8396;
	Wed, 10 Sep 2025 19:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533063; cv=none; b=G5PHlblLW/36WGMXbZ7ChXNm0tfkzQ/YZAHm/maY+o696RMgzGFgHxfEgJ6jvidxnyGfZmi3NB38qP554d90iOK5CQItJo/0atGoxYPsjzrfYR6WLIUIpsijiN1gxdhzBCBb8YL0DuiydOOyAfBhFeLzPxOxjeZPxtxMirERQEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533063; c=relaxed/simple;
	bh=Kvy79l38OjgXam56LG4SBUALLkxIDxyLLpk0bImYB5k=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ZQGKD8iMEiGgiIw5Z0Cepw+3ucV0RujC1KjQPqfnmk4lngmZ7rb8e9i6JJmYxPxaglM7r5zgOHMEHNyzYLqAaBAAtX+kS4W3Uhux42PhhOeIBQ1qY89bkBnwq9dBECP0K0GlmkAHo1yA6RXkCJu2YtJ2/VPsdu1WTcuJKT7uTaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E33972C14AA;
	Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mZ4QcxbfF_Ic; Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 274732BA98D;
	Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Q1j44iMB0ybE; Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D9D02CE340;
	Wed, 10 Sep 2025 21:37:37 +0200 (CEST)
Date: Wed, 10 Sep 2025 21:37:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
	Lucas Stach <l.stach@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	heiko <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Andreas Larsson <andreas@gaisler.com>
Message-ID: <1586788245.22320.1757533057730.JavaMail.zimbra@nod.at>
In-Reply-To: <d9caedb4-41c8-4ef7-99b9-51d891aee555@csgroup.eu>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <d9caedb4-41c8-4ef7-99b9-51d891aee555@csgroup.eu>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: Reaching consensus on CONFIG_HIGHMEM phaseout
Thread-Index: BY4xIXfJeETYMNF0Cnq/68k1mYFqTg==

Christophe,

----- Urspr=C3=BCngliche Mail -----
> Von: "Christophe Leroy" <christophe.leroy@csgroup.eu>
> Can you tell which PPC32 model/family you are using ? Is it mpc85xx or
> and/or other variants ? Maybe we can look at keeping CONFIG_HIGHMEM or
> find alternatives for that subset of PPC32 only.

Off the head, MPC8343 and QorIQ P1022.

>=20
> Could you also elaborate a bit on the kind of issues you forsee or fear
> with applications and FPGA device drivers.

Unfortunately, applications in this area often make certain assumptions
about the amount or layout of memory. This becomes a bigger problem when
using FPGA device drivers of questionable quality, which share memory
between the kernel, userspace, and the device itself.
These are mostly out-of-tree drivers, so that's my horse to ride,=20
I'm just mentally preparing myself for "interesting" bugs that will need
to be sorted out.

> FWIW I sent out today a patch that removes CONFIG_HIGHMEM complely on
> powerpc in order to get a better view of the impacted areas and allow
> people to test what it looks like on their system without
> CONFIG_HIGHMEM. See [1].

Oh, that was fast. :-)

Thanks,
//richard

