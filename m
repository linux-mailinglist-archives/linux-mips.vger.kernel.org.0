Return-Path: <linux-mips+bounces-6739-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F879C786D
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 17:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FEDEB269BF
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 15:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF1C41C64;
	Wed, 13 Nov 2024 15:55:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687331632FD;
	Wed, 13 Nov 2024 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731513336; cv=none; b=m4GJVK1U8nVX4/fRfDvB5ewM+RKkZ/H5ZLyMgQQPVzpsDXYlIsnGSl2Jm5QUmevBNnIzOhcGliZmsQgfUWgie2nusEpnPP6UJV3ltA5efSRVnlolrQIYUxKWFSHvm1nuVO76nioOnLSLVQ+3aABUAL62GuvYle3P/AyYIWYV8m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731513336; c=relaxed/simple;
	bh=hN3pVbBYDbXNZTNcI+XvxFAo5aNxxb2ie10BPs1vuVk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=C9VlktBSZEEdgQHk5Cyn4dT+DRIdNP2clc//mZLacfXkkVyzzrBP7VqXa8D71YbmTl/oJvcPTWrc3RYICAIgpC/diJGhw2MCKA56Hghgu785ZBljCsoaFeS/yHws/8KuziMdFwYi/sg6cquj7YopG6ziJCKKiRC0Fb0stlBzK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 65D0292009C; Wed, 13 Nov 2024 16:55:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 63F2A92009B;
	Wed, 13 Nov 2024 15:55:26 +0000 (GMT)
Date: Wed, 13 Nov 2024 15:55:26 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Rong Xu <xur@google.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Masahiro Yamada <masahiroy@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Klara Modin <klarasmodin@gmail.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: move _stext definition to vmlinux.lds.S
In-Reply-To: <20241113064028.2795128-1-xur@google.com>
Message-ID: <alpine.DEB.2.21.2411131542500.9262@angie.orcam.me.uk>
References: <20241113064028.2795128-1-xur@google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Nov 2024, Rong Xu wrote:

> The _stext symbol is intended to reference the start of the text section.
> However, it currently relies on a fragile link order because the existing
> EXPORT(_stext) resides within the .text section, which is not guaranteed
> to be placed first.

 Umm, arch/mips/kernel/head.S does mean to be linked first.  We rely on it 
for environments where there's no entry point is available and execution 
starts from the beginning of the image.  See the comment right below your 
change.

> Move the _stext definition to the linker script to enforce an explicit
> ordering.

 So if you say that the link order is fragile (which it may well be), then 
that problem has to be fixed instead, likely with the linker script too, 
and then perhaps an ASSERT placed there to verify that it has worked and 
`_stext' refers to the beginning, taking into account what follows too.

 Also note that `_stext' currently points beyond the space reserved for
exception handlers.  Have you analysed what the consequences would be if 
it was moved ahead of it, which your change does AFAICT?

  Maciej

