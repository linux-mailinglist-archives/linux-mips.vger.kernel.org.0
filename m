Return-Path: <linux-mips+bounces-12866-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3A0D15567
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 21:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17AC83007490
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 20:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B033563F6;
	Mon, 12 Jan 2026 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TCxLxebe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MNRcrFQJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3133C192
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 20:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768251279; cv=none; b=HMNKCe7Sx+O85HVANn1mRDHP6lwJGT3zIVROhbrs9TDyJhN0PejjHANnW6es+ypMEEUYnh7b82ek0tgnbCi6/tytrVHFrxGDzCuRD1qNuHeonzTeGTfpI/hy2xnUpyN3LvGrhg16YuN8UivWPt4uyDyIHWxHdeM0TzD/p9mak0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768251279; c=relaxed/simple;
	bh=heWjzF+AmilmUzHwXu1Ept7hAquo1V8G0vGWDv2VRkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTngkzGw5lQpdF5pfBMQWXcajmw4Hw484egn4nm1ld6Q2GJo/LM90J3+OnK0zcOGsdBzl8Y0dSDVJ1NDfInszH0SEVHoiAYmPWrbXpoRBzsk+7Z5COzdJgSJiquRXtzIJ2Ob73EuohszJHzddH9kReswgzmRBdAd/XFtnrtGzNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TCxLxebe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MNRcrFQJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768251272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RQtLUY/JE7t2au1QRWYYIx7qIRDxSfraBeIEwjxysb0=;
	b=TCxLxebeY3S/uPjQR4/Eu7nht0daQz1OfUZB1emoPeicVYoH6VmduDHwqadpTLH2x3RGpj
	nPYISkKrRTioLw/GQO6JILmfSfQ/bhpYP0gV8HXAFhJ9eXPo//rGsJn/vJpH9LPUszyBsk
	uAQvh3X6HPQumXS5YICVRP6G0iRfNAo=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-GYqm4b1FN76muddICTZEhA-1; Mon, 12 Jan 2026 15:54:30 -0500
X-MC-Unique: GYqm4b1FN76muddICTZEhA-1
X-Mimecast-MFC-AGG-ID: GYqm4b1FN76muddICTZEhA_1768251270
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ec96023d46so13517944137.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 12:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768251270; x=1768856070; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQtLUY/JE7t2au1QRWYYIx7qIRDxSfraBeIEwjxysb0=;
        b=MNRcrFQJ67bj31HEdT9YeC9SXvV8aoX3ihVzJmfu9SvRrvCxUnrBosy05zB3PvWExw
         8LMwxpPHM4jjbKnqcNhWMMk/G/sFVPDzDVfsp5ZpOKwKwKrkRT9kCKZg528NWoT506Pj
         BSjNseaDV6xe5ujzxnVQV+It1rp7w8cVErl8qbMOdlnWdek0iiPLTkeUMAMbRzcfxy21
         KlCO4UTknZEAbkuKRJeAc6CrcI+SUFcq8OlsHIIXP5ZzjO8oQzx85B7o8YX/u4pLcz36
         WSj4IkI2HGhtVE/l2+IvMTYe5W0p5NZgwxW5FlGieqnXUP49ZXOm3djM3s35FBruxqKQ
         Y3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768251270; x=1768856070;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQtLUY/JE7t2au1QRWYYIx7qIRDxSfraBeIEwjxysb0=;
        b=PJBvR87L3i4dDgvBv21cqY4h/n68OuJacq/73NBL+OWiaMcijodAmVl0wYVD2LmKNa
         bDSnxsUcBrNCuZIMvCN1vh9n0f/9W7R7I2w8Y7ooL1Wgbf6wGFXi6fYMkOz9+7vQHq9W
         8dQqn8M0wUsyBDJtY4u5Dw2y5VcCsV08NN4yUpSuWTrCU5rNN4LRptRFzS3BDIwK3c0z
         O0ey28mvNqJzdsFPnnrhP9e/ZtksvwPy3VryRLe7sMyLKuwMofqJTny3FM6iWxbeh0gi
         4PvpgZ5S5YhY23YXsMqvCcWo+Ohski+EO64Rz3kqEbmbbfYSSvmJURscDJFuFHIzfuGD
         +6nw==
X-Forwarded-Encrypted: i=1; AJvYcCXaZjNlP6tqC+4RS9zGZf0Qvsk9xa25l1BxMWcXd5MKlppDEFCkXzRcTizQBWe/qxrDCdKU4wgcWgKd@vger.kernel.org
X-Gm-Message-State: AOJu0YxGQCMTENQPqfijSo89dMBMX3vtSRnKAQ9UTO1pF42Z9A7EgwSi
	oT9lWxhHRE5CMN/nvqMjKozUaB+GvDs7RX+A7fG68u4IuXJ5WnUI1BlSAAgAl1V8SYkdo8QoULf
	a375Uxp9DOyvAN0vCbWYne0L/x2k8kDh71fuJgfIaoyzgq4j8pIvg7aJj+wg+SBs=
X-Gm-Gg: AY/fxX6MNwquUznX02qQWnqHa9SM16s7ryrAqG3CekmtKNdUpEgpgNZH5QItOu7/C1P
	iB48a22hcTLyTB1J4lqwl0d5iWZKAAHBAePvJS17Kgp493xZM9WCtd7zzD36eH2/YF/o0t6EzjY
	gEgfyXd0UWxTIW30/DF9n0F295lU5ovtboOUkh6cNFgFNvsmrfbSWR2AnPgsTQ9uJgZKp1HTg/a
	Gt4qVjhVd00voZ1VMsfk7Bm/PL53+0OYzr3t95TBed6D8MM8f3DtBW7QoXQPN4Rxal6PCKcyMa/
	X51OkGeyXibdUmCE+B/bzBqEU6AGs7ugUGgdW1eflmH0Hy+T1Ax698QUkED75m8hT6IQDBJIp+i
	nOn5xpgHf
X-Received: by 2002:a05:6102:f0b:b0:5db:ecac:5800 with SMTP id ada2fe7eead31-5f16cacb7b5mr354898137.19.1768251270183;
        Mon, 12 Jan 2026 12:54:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUy4CpEwuxm8S3FrkZ8Tlt99aDpzL3BC+8t5fBT66xtDR5qpVls7IxrVD5mbftlUkdr9xx2A==
X-Received: by 2002:a05:6102:f0b:b0:5db:ecac:5800 with SMTP id ada2fe7eead31-5f16cacb7b5mr354883137.19.1768251269697;
        Mon, 12 Jan 2026 12:54:29 -0800 (PST)
Received: from redhat.com ([2600:382:771e:5aa5:103f:e4ff:d734:7cd4])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ef15be79c6sm11394917137.12.2026.01.12.12.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 12:54:29 -0800 (PST)
Date: Mon, 12 Jan 2026 15:54:20 -0500
From: Brian Masney <bmasney@redhat.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 06/13] mmc: sdhci-pic32: update include to use pic32.h
 from platform_data
Message-ID: <aWVffIGEtPYZmdkh@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-6-99859c55783d@redhat.com>
 <eb84ecc7-e409-4e2e-b609-7fe68336feff@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb84ecc7-e409-4e2e-b609-7fe68336feff@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Adrian,

On Mon, Jan 12, 2026 at 10:40:03AM +0200, Adrian Hunter wrote:
> On 09/01/2026 18:41, Brian Masney wrote:
> > Use the linux/platform_data/pic32.h include instead of
> > asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> > is in preparation for allowing some drivers to be compiled on other
> > architectures with COMPILE_TEST enabled.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> Seemed to compile on x86 with COMPILE_TEST, so please also add
> COMPILE_TEST for sdhci-pic32.

I can do that in a later series once this series that moves the header
file and updates the includes lands in Linus' tree. These are low
priority fixes, and I don't want to create extra work for the various
subsystem maintainers with all of these cross tree merges, and
immutable branches.

If patches across the tree get merged in the wrong order, then Linus
will get some build warnings, and I'd really like to avoid that. :)

I'm sending out a v2 of this series in a few hours. Hopefully the MIPS
maintainers can merge this for v6.20 / v7.0, and in about a month, I'll
post patches to various subsystems that enable COMPILE_TEST for these
pic32 drivers. Based on the clk driver, there's likely to be other
cleanup pathces that will be required as well, such as to fix sparse
errors that will be newly introduced since the drivers will appear as
"new".

Brian


