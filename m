Return-Path: <linux-mips+bounces-11202-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 496C7B51E0D
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 18:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6503C480986
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 16:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB4F274B30;
	Wed, 10 Sep 2025 16:42:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from blackbird.sr71.net (blackbird.sr71.net [198.145.64.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4309D271451;
	Wed, 10 Sep 2025 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.145.64.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757522575; cv=none; b=L1UnL2gEioC5hDPxhvaw2uhJ3e4KTS4QvJ36GpXpoGh0eei8BMoADOYYJ4fm4YLeBSj6twzUJq77+ZJENSgx4cTIwaKOpvWxUqm7giempYHwqyseuQO64IDeQN1cX4fJWWmXrJYAXIpLSMQQknf4Bjvp339CpYU75Remy9VdxsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757522575; c=relaxed/simple;
	bh=ioGpMBeXdAlS89t3hTLb2V4iRQeQROs5/oUBcEzBldg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKb/SGIDdUYo0ZYnrqmuCsDnrYwmoYFPRbapSMyUaQF2+nZoYqTPCrJMli0mgc0hInxG5HFM3S1jGpYpQE/EPhigLFWvrj7ysiicvkGmr+KtPko/RAXiTuPflyHGHKeHDBO/sbHAyYS8JB5wUTaj2+SNztjkJY4AmofFv0fELnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sr71.net; spf=pass smtp.mailfrom=sr71.net; arc=none smtp.client-ip=198.145.64.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sr71.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sr71.net
Received: from [0.0.0.0] (unknown [134.134.139.69])
	(Authenticated sender: dave)
	by blackbird.sr71.net (Postfix) with ESMTPSA id 4234E20193;
	Wed, 10 Sep 2025 09:34:45 -0700 (PDT)
Message-ID: <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
Date: Wed, 10 Sep 2025 09:34:43 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Richard Weinberger <richard@nod.at>, Arnd Bergmann <arnd@arndb.de>
Cc: ksummit <ksummit@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips <linux-mips@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, imx@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand
 <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>,
 Nishanth Menon <nm@ti.com>, heiko <heiko@sntech.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
From: Dave Hansen <dave@sr71.net>
Content-Language: en-US
In-Reply-To: <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/25 07:04, Richard Weinberger wrote:
> I am part of a team responsible for products based on various 32-bit
> SoCs, so I'm alarmed. These products, which include ARMv7 and PPC32
> architectures with up to 2 GiB of RAM, are communication systems
> with five-figure deployments worldwide.
> 
> Removing high memory will have an impact on these systems. The
> oldest kernel version they run is 4.19 LTS, with upgrades to a more
> recent LTS release currently in progress. We typically upgrade the
> kernel every few years and will continue to support these systems
> for at least the next 10 years.
> 
> Even with a new memory split, which could utilize most of the
> available memory, I expect there to be issues with various
> applications and FPGA device drivers.
I'd be really curious what the _actual_ issues would be with a
non-standard split. There are a lot of "maybe" problems and solutions
here, but it's hard to move forward without known practical problems to
tackle.

Has anybody run into actual end user visible problems when using one of
weirdo PAGE_OFFSET configs?

