Return-Path: <linux-mips+bounces-549-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15457805CBB
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 19:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46FFC1C20FB1
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 18:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783D66A350;
	Tue,  5 Dec 2023 18:01:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 122D81BE;
	Tue,  5 Dec 2023 10:01:45 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rAZjs-0003nS-00; Tue, 05 Dec 2023 19:01:44 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6B96BC0A7C; Tue,  5 Dec 2023 18:54:15 +0100 (CET)
Date: Tue, 5 Dec 2023 18:54:15 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
	stable@vger.kernel.org
Subject: Re: [PATCH fixes v2 0/3] MIPS: Loongson64: Fix some long-term issues
Message-ID: <ZW9jxxoJF0IHcYyl@alpha.franken.de>
References: <20231107-loongson64_fixes-v2-0-5c49ceed7950@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107-loongson64_fixes-v2-0-5c49ceed7950@flygoat.com>

On Tue, Nov 07, 2023 at 11:15:17AM +0000, Jiaxun Yang wrote:
> Hi all,
> 
> This series fixes some long-term issues in kernel that preventing
> some machine from work properly.
> 
> Hopefully that will rescue some system in wild :-)
> 
> Thanks
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Typo and style fixes
> - Link to v1: https://lore.kernel.org/r/20231101-loongson64_fixes-v1-0-2a2582a4bfa9@flygoat.com
> 
> ---
> Jiaxun Yang (3):
>       MIPS: Loongson64: Reserve vgabios memory on boot
>       MIPS: Loongson64: Enable DMA noncoherent support
>       MIPS: Loongson64: Handle more memory types passed from firmware
> 
>  arch/mips/Kconfig                                  |  2 +
>  arch/mips/include/asm/mach-loongson64/boot_param.h |  9 ++++-
>  arch/mips/loongson64/env.c                         | 10 ++++-
>  arch/mips/loongson64/init.c                        | 47 ++++++++++++++--------
>  4 files changed, 49 insertions(+), 19 deletions(-)

series applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

