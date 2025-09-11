Return-Path: <linux-mips+bounces-11231-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCEAB5282F
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 07:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51BCE467FB4
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 05:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635DA248F72;
	Thu, 11 Sep 2025 05:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="Hs7ZfSyD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65FD23E23C;
	Thu, 11 Sep 2025 05:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757569113; cv=none; b=u1DIdvl4dPpLIU5wLQd60iH3/R9AMMq96/zWygl4ceJt5VgAOKySKNo+EGYgcMqdGdsxYyOUzKo1VYcBvn2Ks7qN4ten0xWAdBgfxst/Y7lCMh9M/HUvZTEN56Rs16L2c7GjgyrwgHlqUAxvKRsR0z6EkCNoD0kkT892v559tG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757569113; c=relaxed/simple;
	bh=zslq5NZ9GBE+NFMFpUXQKdQwmGpJdU16zodzEZ5lWJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amjmZjD/VqyCfyUaPsiybHxCKnJ6r+099qVDEe+S9L5okhWZoBiwOgsbyIjNy8Mvw+npb30PztVdVA8sDONAE40P7Lx03z/RgV6chsFn+jI2CzfSGDAG6nklNWJLogLuNCTnMv146jJPf/ci0GYVn1UHhZ8lqpgAjV1msJButn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=Hs7ZfSyD reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4cMmYn6jWzz1FQVw;
	Thu, 11 Sep 2025 07:38:21 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4cMmYn1PXCz1FQVP;
	Thu, 11 Sep 2025 07:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1757569101;
	bh=J4SmUX7P+kpNB7OaZvmmYUNeRGLdLLWkUbpUICDS3qY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Hs7ZfSyDOM7aPRu33LOA+3yef+fVto4kU9xa+4YpClIxfuXs1fUOvHNHSbYzTsH95
	 ys3zgWHJHS23RTioc6nK1rRkrbxCam9D5ptr5a/DgIz7xpPRDCQ6Etyd5bStpWc73w
	 7yOC/+8Ounc2FdB1AGu5KYNtNxw+XWF0Y0vJdIXiwXVxxPzwE6FGqoMLKjGAvRTDu6
	 0tRpQ6v9KDjievFY3f8w6p8LSH1LMGdoj0SQczd00LYltcWoPmKILRmn5F8FOypXFd
	 6Zp6gO/YqFuyTXHhSNlsS6DU3Zk+NRltjlY23ffJsltCzkH4eal4Sp3ahPCc/wsqRM
	 gmrx1Brnia8oQ==
Message-ID: <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
Date: Thu, 11 Sep 2025 07:38:15 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Richard Weinberger <richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand
 <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-09-09 23:23, Arnd Bergmann wrote:
> High memory is one of the least popular features of the Linux kernel.
> Added in 1999 for linux-2.3.16 to support large x86 machines, there
> are very few systems that still need it. I talked about about this
> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
> and there were a few older discussions before[4][5][6].
> 
> While removing a feature that is actively used is clearly a regression
> and not normally done, I expect removing highmem is going to happen
> at some point anyway when there are few enough users, but the question
> is when that time will be.
> 
> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason. Some
> users obviously are alarmed about potentially losing this ability,
> so I hope to get a broad consensus on a specific timeline for how long
> we plan to support highmem in the page cache and to give every user
> sufficient time to migrate to a well-tested alternative setup if that
> is possible, or stay on a highmem-enabled LTS kernel for as long
> as necessary.

We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
used in LEON sparc32 configuration (using 36-bit physical addressing), a
removed CONFIG_HIGHMEM would be a considerable limitation, even after an
introduction of different CONFIG_VMSPLIT_* options for sparc32.

Regards,
Andreas


