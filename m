Return-Path: <linux-mips+bounces-4334-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12A931D1D
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jul 2024 00:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FE811F2317B
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2024 22:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3082913CA97;
	Mon, 15 Jul 2024 22:19:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4535713B791;
	Mon, 15 Jul 2024 22:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721081962; cv=none; b=h2OGFu9tRy7GY4+OA9rHfhaotQ80oCOLEPakXiWhzYe1Zc52oeDnKNbUAr4z6Bs6uBF/EzOavcHp4fP41E0emN65Vdtux3S1PtiChvPm/YD5ALs5VrKqhPFNqtQH2/Yl/9bTrqhLAn2ZtEcrNu3/l4JLy7FPSlylnmK/mizmatU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721081962; c=relaxed/simple;
	bh=bKnEoi0BmMob7IVyJQSwMAI+t7uPqkY6N/2nLwxD9uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY17J89zJ+gHgmTe0CiRfjIG6WefZDgsYF/8LyyEv7xiLgcwQACpCyUZ1w38MWoBdOEJQPA5zI1IhvQunM0mfKocJTBawBN1QiuBSmCd50ktARiWPP0KqKTwIzyx7jLgp+WZUmdu0m0816uB+V3+/kBqrNhlW5XvXIV155YUGKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sTU2C-0000fj-00; Tue, 16 Jul 2024 00:19:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 036F4C0411; Mon, 15 Jul 2024 23:48:46 +0200 (CEST)
Date: Mon, 15 Jul 2024 23:48:45 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] MIPS: Refresh some configs
Message-ID: <ZpWZPaSxmKj7s2nI@alpha.franken.de>
References: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>

On Sun, Jul 14, 2024 at 10:20:46AM +0800, Jiaxun Yang wrote:
> To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Fix typo
> - Improve IP30 config (thomas)
> - Link to v1: https://lore.kernel.org/r/20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com
> 
> ---
> Jiaxun Yang (4):
>       MIPS: config: Enable MSA and virtualization for MIPS64R6
>       MIPS: config: generic: Add board-litex
>       MIPS: config: lemote2f: Regenerate defconfig
>       MIPS: config: Add ip30_defconfig
> 
>  arch/mips/configs/generic/64r6.config        |   2 +
>  arch/mips/configs/generic/board-litex.config |   8 ++
>  arch/mips/configs/ip30_defconfig             | 183 +++++++++++++++++++++++++++
>  arch/mips/configs/lemote2f_defconfig         |  54 ++++----
>  4 files changed, 216 insertions(+), 31 deletions(-)

series applied to mips-next,

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

