Return-Path: <linux-mips+bounces-5337-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B396CAA0
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2024 00:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B15F3287987
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 22:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036DC1714D8;
	Wed,  4 Sep 2024 22:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="ECsPNRE/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9FD15B56E
	for <linux-mips@vger.kernel.org>; Wed,  4 Sep 2024 22:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725490569; cv=none; b=u5Vbzdw1US6lHtmNhtv1t/7JuM/6KOlwS7Vuo6aUSLlxJfODJTIC7S4F86In11OyAaSfrTc2TY6jDlYL6kNeLjsqu+VJAh3Ilc1IYlR/O55MLgepOPxSNRIELsQGuw25UjMU/+Wy6hrLpr66NGJRFsEqXzM6pzb9yQ8HsoNeGug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725490569; c=relaxed/simple;
	bh=szdO1vb9faSGYA2Jc6crUSmefcYSz1qzFB4PGRjDfLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmBJ3d2xSPKTxahhXy/VFAOrc2gJr+VhvFpKMxgHbpqWRfIItSInzld7n3VNS6y57M6tUln0FoBfRfMmjvAexUQRkl4jStrbGbuGbRe+UpN7AtJETkdWWm4snlrrqC/pjpu+qPrfk9HPe2/zOj1XvhqX3EI/fVl5avM5GYe6Uw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=ECsPNRE/; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7d50ac2e3f8so22362a12.2
        for <linux-mips@vger.kernel.org>; Wed, 04 Sep 2024 15:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725490568; x=1726095368; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=35/vvYnjYcTahPnX2Ak6JC2o1aEV4aWjtE37kGrVzrs=;
        b=ECsPNRE/8hQBTF+pxD/HcZGtcGCuYJhWLC3JL/GO5t9dx8wU0Vf8TgAIlJrZL02lA7
         Gp/0Gj+ZPjJu7nHPYn7cmlKOqCaIpRqb4LS9zChNvYrndQTPvygI2DN8hTNCgaefCJRs
         ILx7j4HVo2DMUlMWt6VLRVl59tpWrOWuerxFRIwsodZTU9tuNDvU9fmj8AZ6cbOiT4IE
         8HJXp50UF+MiFqUhX0rrPaIEfo39D+hxA3NgC+VS+nX686EcGcb6gNqReiEBJxLLk9vw
         +/8xef0zDRn/WlLlWgIWsF/rO+LOxyO5isdEu6jM/CU+mLOInGvFO6SBaNRVAqLsJpwx
         c2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490568; x=1726095368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35/vvYnjYcTahPnX2Ak6JC2o1aEV4aWjtE37kGrVzrs=;
        b=uefWA97FWwRR/Sp5dDkGqI5luPWmg3sZHIHr2AqGY16v7vTKWxQFXYAB+2E46NJoJ4
         Nlv+FBBALMAFiDobqrPFam6JUOo78OHWtaeXyD0ujbHfDom8AGmDA+qcLXhno2QWVNwZ
         fVNVKU0UmPTdLSd/HuV1SGBshmwCnZDdK7gBZNzNsA3/FfGF7bDvk8RIu4ZASJEanyNN
         rwFnSo1JJf/aKyg9ZoxtexcmGinfNowiAT9b/d3M6Rkr6wwWDvHvWr6LbZeFaP6WWx7N
         igB2FIieO7g4u9q/0jTsHAf/ccqh2dOl4JdyGqQlO9/agkpV52FiBCRZHvE8mogM2PVh
         aWDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3gQY/8/NPDwwYa6/fVw8I1ZzH9m15Xcz4o/wAAPg9FbGWXKMrkmG4JslfZRJPykXqNsj8wZHt82ps@vger.kernel.org
X-Gm-Message-State: AOJu0YztoC/VfgfwFTwov+VXBvWep9aBXJFdLUFda699fXt6P2P+0BEk
	KyY7kVnK037xhrkFnq70WxtVXUUlphHu36djvSSHmX71zqlhGNCoe4poP+g3qbs=
X-Google-Smtp-Source: AGHT+IGJMJTzWYcjGTZbRrQ6IDaoYzbHR/wGLI0wH+MKCl8eX8iKTnn29gVdjQTwsOFAi2AC/JBGeg==
X-Received: by 2002:a17:902:f545:b0:206:b618:1d8f with SMTP id d9443c01a7336-206b6182580mr23287495ad.11.1725490567622;
        Wed, 04 Sep 2024 15:56:07 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:500::4:761e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae9525cbsm18305395ad.99.2024.09.04.15.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 15:56:07 -0700 (PDT)
Date: Wed, 4 Sep 2024 15:56:04 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Benjamin Gray <bgray@linux.ibm.com>,
	"Christopher M. Riedl" <cmr@bluescreens.de>,
	Christoph Hellwig <hch@lst.de>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH 2/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
Message-ID: <ZtjlhFbeFZtxzmTb@telecaster.dhcp.thefacebook.com>
References: <cover.1725223574.git.osandov@fb.com>
 <f0e171cbae576758d9387cee374dd65088e75b07.1725223574.git.osandov@fb.com>
 <64e74f4d-948d-442e-9810-69907915401c@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64e74f4d-948d-442e-9810-69907915401c@csgroup.eu>

On Wed, Sep 04, 2024 at 09:50:56AM +0200, Christophe Leroy wrote:
> Hi,
> 
> Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> > [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: Omar Sandoval <osandov@fb.com>
> > 
> > I found that on x86, copy_to_kernel_nofault() still faults on addresses
> > outside of the kernel address range (including NULL):
> > 
> >    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
> >    # echo g > /proc/sysrq-trigger
> >    ...
> >    [15]kdb> mm 0 1234
> >    [   94.652476] BUG: kernel NULL pointer dereference, address: 0000000000000000
> ...
> > 
> > Note that copy_to_kernel_nofault() uses pagefault_disable(), but it
> > still faults. This is because with Supervisor Mode Access Prevention
> > (SMAP) enabled, do_user_addr_fault() Oopses on a fault for a user
> > address from kernel space _before_ checking faulthandler_disabled().
> > 
> > copy_from_kernel_nofault() avoids this by checking that the address is
> > in the kernel before doing the actual memory access. Do the same in
> > copy_to_kernel_nofault() so that we get an error as expected:
> > 
> >    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
> >    # echo g > /proc/sysrq-trigger
> >    ...
> >    [17]kdb> mm 0 1234
> >    kdb_putarea_size: Bad address 0x0
> >    diag: -21: Invalid address
> > 
> > Signed-off-by: Omar Sandoval <osandov@fb.com>
> > ---
> >   mm/maccess.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/mm/maccess.c b/mm/maccess.c
> > index 72e9c03ea37f..d67dee51a1cc 100644
> > --- a/mm/maccess.c
> > +++ b/mm/maccess.c
> > @@ -61,6 +61,9 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
> >          if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
> >                  align = (unsigned long)dst | (unsigned long)src;
> > 
> > +       if (!copy_kernel_nofault_allowed(dst, size))
> > +               return -ERANGE;
> > +
> >          pagefault_disable();
> >          if (!(align & 7))
> >                  copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
> > --
> > 2.46.0
> > 
> 
> This patch leads to the following errors on ppc64le_defconfig:
> 
> [    2.423930][    T1] Running code patching self-tests ...
> [    2.428912][    T1] code-patching: test failed at line 395
> [    2.429085][    T1] code-patching: test failed at line 398
> [    2.429561][    T1] code-patching: test failed at line 432
> [    2.429679][    T1] code-patching: test failed at line 435
> 
> This seems to be linked to commit c28c15b6d28a ("powerpc/code-patching: Use
> temporary mm for Radix MMU"), copy_from_kernel_nofault_allowed() returns
> false for the patching area.

Thanks for testing. This patch isn't worth the trouble, so we can drop
it.

Thanks,
Omar

