Return-Path: <linux-mips+bounces-12783-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD2D00BEE
	for <lists+linux-mips@lfdr.de>; Thu, 08 Jan 2026 03:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E08930249E0
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jan 2026 02:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1409F277CAB;
	Thu,  8 Jan 2026 02:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VO9+Hp/X"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA912231836;
	Thu,  8 Jan 2026 02:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767840994; cv=none; b=oSZlZcklT2Xw7eV4fIcOZBSBcMLPXu0mYP92TjFo/FJGviSfCCS6Wf6Q79hwhHV9BosmChLxf592thXEaKvh2nUZReIvdVNoFyHNhg68YhGHEdxOI+Ioc53RjWmuoXgeEFsKsXf6AQvhNj5njVvm9nzoHPkkBqJRfbPZbcM2O2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767840994; c=relaxed/simple;
	bh=bb09VXEHSGVuDvACYJHsjuF/qKdFpVlUXhZlI58yIwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWeTggRijzeilZTc/TpfnINLHouXg4/4Hktkegy4gpv3zNeGgnLNOnc8mYDhewttnVvw3un6aZeLoNQUV8vl4/efO1Ee36shzqSB/XBSXm1uy2cTOL3ikrfHYt3k239OIPwvyyrVH55BqfbHWl5KiypCOZiNQG0lLOOlzAgxZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VO9+Hp/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97908C4CEF1;
	Thu,  8 Jan 2026 02:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767840993;
	bh=bb09VXEHSGVuDvACYJHsjuF/qKdFpVlUXhZlI58yIwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VO9+Hp/XVRs8XQB3IDBstup2R+DaU4I6K4mDp34Wm113uMcakMBKaj2eTx55ExHtE
	 nBWUzkdaWvlhDxELVvEA3C6puD6nUZG5J+gpcQ61WkLHnhj+M05LSE5AZcHJamwhvc
	 j/BMfPrbYmdBOqJI5BeEugABP3Mc/vfHCk9GLrpJscoyfLAOJwB+2t8XFPTPsEybag
	 xGnWNL183qpjfSIH8SOBIaB8sVnhazL4Rw/1WNvWFQdpTNcIdnvnpj/0Brkneg1BPR
	 7qMuhdE1AoXtCk2F775jaiAkT9nh2gM4h7JiM3GPN+qLCo8vxQs/u1WGbxiPYaxbeg
	 hV7kgr+lj43kw==
Message-ID: <dc57f648-524c-4fdc-9fce-73f1bab2fee4@kernel.org>
Date: Wed, 7 Jan 2026 18:56:29 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/28] arc: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-3-rppt@kernel.org>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20260102070005.65328-3-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/1/26 22:59, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thx !

Acked-by: Vineet Gupta <vgupta@kernel.org>

