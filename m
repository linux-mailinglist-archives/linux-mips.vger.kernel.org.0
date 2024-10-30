Return-Path: <linux-mips+bounces-6559-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 264739B614E
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 12:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C72031F213C7
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184421E2313;
	Wed, 30 Oct 2024 11:19:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627D51E570D;
	Wed, 30 Oct 2024 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287197; cv=none; b=m8z8+3cZTDCa0K8ptlFeWVO1Myiq1BWYqjPDT9E2odGc9BcBErS8+wVPgiKhKS8IXhbFdfUeWVnax6vJj4vB4hkSlm7WKPKrE6vSLjo3iQIOPFCMAkyKFVUGd/BXUIgTj9fNr/gKxOkdKAt/7J7v41wZ5GdSOucWN3D/zEjNVU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287197; c=relaxed/simple;
	bh=YRdy5uWoZoJJ5qTZ38VoVAkOxP6PRMlbpNJ1tGediY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQ02EKLYj0gtaWwU1tVPtoXyT8tOpdQLE864gGOggkSJTEPoyyYR+8vJEB/ons4SSrzh2a79n85gcI7ANbCMtcXEfN1p2kHKuU4zxB5VvkSdkr15Y8Lh7Vd3rtmVR2dP3BRYmyD/EXdVdjjUCV2AdTC4fofuWHm7S4g7mPh/MhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1t66jk-00061V-00; Wed, 30 Oct 2024 12:19:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 210DBC0161; Wed, 30 Oct 2024 12:15:30 +0100 (CET)
Date: Wed, 30 Oct 2024 12:15:30 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: bvanassche@acm.org, gregkh@linuxfoundation.org, ricardo@marliere.net,
	zhanggenjian@kylinos.cn, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] mips: sgi-ip22: Replace "s[n]?printf" with
 sysfs_emit in sysfs callbacks
Message-ID: <ZyIVUk52InAoJ9en@alpha.franken.de>
References: <ZxDVRru_o_5nqGl5@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxDVRru_o_5nqGl5@mail.google.com>

On Thu, Oct 17, 2024 at 10:13:42PM +1300, Paulo Miguel Almeida wrote:
> Replace open-coded pieces with sysfs_emit() helper in sysfs .show()
> callbacks.
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
> Changelog:
> - v2: amend commit message (Req: Maciej W. Rozycki)
> - v1: https://lore.kernel.org/lkml/Zw2GRQkbx8Z8DlcS@mail.google.com/
> ---
>  arch/mips/sgi-ip22/ip22-gio.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

