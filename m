Return-Path: <linux-mips+bounces-12496-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B81ECC794A
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 13:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C137305A804
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 12:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D023446D0;
	Wed, 17 Dec 2025 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOrJ2PN+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED693451AA
	for <linux-mips@vger.kernel.org>; Wed, 17 Dec 2025 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973864; cv=none; b=oAGrrEpGPBYxtAS5g7tRxfX/fRj/6mUEtxAt7Akp5oSIQu3MEpQ6u7rh9y3lJMeIMy1dDHPOUvMqBN7XmAnY/8JsPdmJp5XlE7Qu0TtEd8ZQc3/RUHmu2kbOzdmltPfxoHQp19Y51RMm73qE8NETjLz/7ZO5GpiB3nlYaS/hVoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973864; c=relaxed/simple;
	bh=Us0yFCBAjwxulhriZ3mYjriGCty2jScVl7WxuOuzAMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTt2E68u4BZjL4tdtIoUDGmLslnubXRJxBYwhdRa4lG/YI3clHHSXTGhVOKLjHXB7wKMcFiusIst3dteqCgA3Gjn18DuWxbJEcrsKwscKdCyWlL5vv04ftDuIuqcsNpmYqodNMSjVLzIjlKtZaeeXk8y7nmECimrmlLkNFAr9n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOrJ2PN+; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-11b6bc976d6so746738c88.0
        for <linux-mips@vger.kernel.org>; Wed, 17 Dec 2025 04:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765973861; x=1766578661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=;
        b=KOrJ2PN+L6+TbVO7KqCSD2+r7pEofzuJHbxAc+gzotDkkNRcYSGqQmMFOThGciI5CK
         MkyLyf35dMHDxGr4kmnb8kCFXTSHXE9m6kmfctGOMf/4eKFaujEP4LY8gThUsF/qnr5R
         IrqEhZU7Ofen7fSR7WxBRcfWqsflOkCGNjynaRGVtMxidG0zLgW/lehgVvW90GJwFdjc
         lyDA+hgct4lwqEG28OC6hS4prII9m7tWioQa+xUrTubsddQWaZRjUEh/QjYHSpdTd0EB
         81l8YYCQSTLXnUfdHMteczWSqQBSl9V5ARBEgyrnjwn1j155TGGY3uP5iyx3TepXFdBN
         3Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973861; x=1766578661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=;
        b=i7tjUtShRdVfVq8VKyq2TIr8ktuCLONIzzBr81RsKiGg7w+mH2ROU6J5LRwhz2GT4F
         cpCqoFnLBYatYbfHF7Cu20BFVmBWJfpyt0la5dFfPw8sJfbtDqZv2cCz606m3dch7CX4
         FVB/OhxfshkzZGqpa5RiCao5e5DR9hDtwL0uv2MbEV/wuXB3k5oFhzzWhgkJJEjbocas
         mWuIaPo1B0eM3vdQsUuJY9OBCk89xSoBXPPIZ+FqZu6wqlOrGvSR+2Erd7XNZiG3dO13
         UovFzeFNlPw9JwJsZG6sJWAXFmNEDZQm7y/WvBRW8bkbeRP4FiRgN1y6tWNRS97jocse
         /aCg==
X-Forwarded-Encrypted: i=1; AJvYcCUtfB/rAFXxNPL6ORmIG8o9l27vWjpgO6vAT6+OTIlPiovADuMm5Pb4bFPyJZU7f3SimZSXGMZoq+Ns@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKyH7xhpu4k6lFX+h6Ik4/tG3bQ2Tm5XA21WFPjxRpDyIhbR3
	XedOmosxIFCMvhNDTni4DQLQ123S0KDtlNQ3EtFZf8c4g4g+JrRkFXzl
X-Gm-Gg: AY/fxX6lIvUXkRGh8v/VhlP6MIKWAFwJ4n3VJlsMGk1CQi9gIdgD5YA9D493MM6YOoo
	eRuxsccsErlRro5cXVisPuHjsqJy2Krn12XwgnSR7uRyjrS2zO9pgeteU0IKrKqmdrkvZU/1xAW
	JRVTczrnMZ+bxntTkZhdRiEhEjXCTR1+4TFNhPKPj4JWGTgsdSdO0yh4DZPLUkhTakOQDp6VdNl
	WUP9z7uKJLzRip4Ie+A1wqnqRVFBb/qgLIVs84qfN2VHZz/uJn882c+ytjDMc1z398U7rIsruV9
	f7nm+Hv9GXA9Sx8n6UhTlpgbMzgLaAqf2HP7OxHQ/yLb+AJSxYbj+vUwDfjlPvpHvxwgetMsniH
	zF9VdpEaICgdBePSxnNguOwMqxPD3idId/wfFVkLCi+3UELpLN+jd+5ovl0bA1twCVQbpW5uoLA
	swPZs86Jspy1Isr45Jiqb+ZAkp
X-Google-Smtp-Source: AGHT+IHtTckxV0BrLKUtwEMMlG/KT0X6JCzQ/eEGNn1nvrPgi11fSB7RRA3IhgmdXndE9lBsM2aS9w==
X-Received: by 2002:a05:7022:e806:b0:119:e569:f86a with SMTP id a92af1059eb24-11f34c29cefmr11289687c88.7.1765973860378;
        Wed, 17 Dec 2025 04:17:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30b799sm60713771c88.17.2025.12.17.04.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 04:17:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 17 Dec 2025 04:17:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys
 interface [qemu test failure]
Message-ID: <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>

Hi,

On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Perform mechanical conversion from .map_page to .map_phys callback.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

This patch causes all my 32-bit parisc qemu tests with C3700 machine
to fail. Network interface tests fail, and all boot attempts from
any kind of hard drive (scsi, usb) fail with this patch in the tree.

Guenter

---
# bad: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
# good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
git bisect start 'HEAD' 'v6.18'
# good: [6dfafbd0299a60bfb5d5e277fdf100037c7ded07] Merge tag 'drm-next-2025-12-03' of https://gitlab.freedesktop.org/drm/kernel
git bisect good 6dfafbd0299a60bfb5d5e277fdf100037c7ded07
# good: [09cab48db950b6fb8c114314a20c0fd5a80cf990] Merge tag 'soc-arm-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 09cab48db950b6fb8c114314a20c0fd5a80cf990
# bad: [701d7d782d98242a64cdeed90750f88ff733bc39] Merge tag 'spdx-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx
git bisect bad 701d7d782d98242a64cdeed90750f88ff733bc39
# good: [66a1025f7f0bc00404ec6357af68815c70dadae2] Merge tag 'soc-newsoc-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 66a1025f7f0bc00404ec6357af68815c70dadae2
# good: [c84d574698bad2c02aad506dfe712f83cbe3b771] Merge tag 'modules-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux
git bisect good c84d574698bad2c02aad506dfe712f83cbe3b771
# bad: [b0319c4642638bad4b36974055b1c0894b2c7aa9] Merge tag 'nfsd-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
git bisect bad b0319c4642638bad4b36974055b1c0894b2c7aa9
# bad: [e637b37a520513a04d00f4add07ec25f357e6c6d] Merge tag 'rproc-v6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
git bisect bad e637b37a520513a04d00f4add07ec25f357e6c6d
# bad: [56a1a04dc9bf252641c622aad525894dadc61a07] Merge tag 'libnvdimm-for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
git bisect bad 56a1a04dc9bf252641c622aad525894dadc61a07
# good: [d0cf6512bbcf77afb6102f886fcd7fd48b7ae043] rust: bitmap: add BitmapVec::new_inline()
git bisect good d0cf6512bbcf77afb6102f886fcd7fd48b7ae043
# bad: [936a9f0cb16b0646143f8e05afab458adc51d0a0] xen: swiotlb: Convert mapping routine to rely on physical address
git bisect bad 936a9f0cb16b0646143f8e05afab458adc51d0a0
# good: [14cb413af00c5d3950d1a339dd2b6f01ce313fce] dma-mapping: remove unused mapping resource callbacks
git bisect good 14cb413af00c5d3950d1a339dd2b6f01ce313fce
# bad: [96ddf2ef58ec070afa8275f371b619462cd8fb2c] parisc: Convert DMA map_page to map_phys interface
git bisect bad 96ddf2ef58ec070afa8275f371b619462cd8fb2c
# good: [e4e3fff66a57a7aee048e0737a16874aeaffe9f4] MIPS/jazzdma: Provide physical address directly
git bisect good e4e3fff66a57a7aee048e0737a16874aeaffe9f4
# first bad commit: [96ddf2ef58ec070afa8275f371b619462cd8fb2c] parisc: Convert DMA map_page to map_phys interface

