Return-Path: <linux-mips+bounces-3778-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6029910CFD
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 597BA28224A
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66851B5828;
	Thu, 20 Jun 2024 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IO8PASGV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A221B5824;
	Thu, 20 Jun 2024 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900858; cv=none; b=EXciMLlA7B+bJ0/Pv4FwXUzwCH1CSOoWFCOkPB2AUhKKQdnQDkcNn3xdIcQ6pW4XMF7VmeuZZ4zTWHDOtK2pMA4OumDDlcSw70Vsk/bLhQU82boUH7d4xuzqnP7TKW5x6ZXAIjM84Y9X5t62baHqXf6dpcFAzSBiSlZMPQg9M9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900858; c=relaxed/simple;
	bh=apJ0/kNo2UZsYa4YtPzkJl8ibvA2beUTWa1fEwZmGvc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDcS/PWt2DAI6WuuVALH4ZhJ/6Q7+SrZDT4FrzJHq+KBoBohF9O9Qb51E9aHbXDvrWWmyU3Pz7EEB5V9Bb/qESLAxbIFBCGLvQCKj41ADTBzmKmKEtmDm+Yz9OKjcu0vadd6L4uSgZStOWTM2NAcmgG/+Hu7DNJL8pqKWxd1VYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IO8PASGV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso12830465e9.2;
        Thu, 20 Jun 2024 09:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718900855; x=1719505655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YyMK6ZV0xdCVF8y1Q7YEZ0a3pJ8CrAW6HMQoj1k8taw=;
        b=IO8PASGVC+7Gcy6xVJH+uKWaA5IHBYgcrplRhXkiSoyifKu+qnm4k6wUI/b4Z4sqp7
         r3bVBF8Xw9Wnq+fT+qkVzi620e/0bCHGDGrRlN6VxUvMJ0jXZw9f22GOCYjomDfmBeMp
         FMN4uy5iZaG3Ze69x63UKUo2fAc7ot7VSw+LKuIu1z57SlLgvNpMJ3Zumy2innyDCHY+
         VG5BnHwN3pCHKYomQOnr7ARFSfZDoyTsbqyAJGyoFpkQgKbQPweYbFivF16EwMK82sPk
         03NzvNQNK9qM/vSjgXP42QwyOI+dpHloYn8a/RXLA5E89O8s925+PSy26ILlN7W0lgRP
         HLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718900855; x=1719505655;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyMK6ZV0xdCVF8y1Q7YEZ0a3pJ8CrAW6HMQoj1k8taw=;
        b=Um37RPQNV3d+EURU7gzWz5KYEDo8JAqx1zzi6hd0JEA32Z7nnDBH2b80LsQ87cPC0u
         qGFvWdLBYZkgogG2iKmKBlCYBRiWozVjvoMb7qgarmT262dKPSplrsAT4Ql3QbKAxHwn
         ob2bhCfMoAO7DB7iFaisRahlRVUDKWO0pJSr57KA3QwxiHOePIw+fze700Qw25Hs4tmb
         Gz9KB86aP1gygyaphOrDy2TExcFwmPe45ufCWP4WuZ7vAeF/3sCFRpGgONTVdIhVYGF7
         3wQt1qkK10Y386WEH5gajD7JCNoY4YF5otagf1fDYYsiP4uZ6S0thVV3kTNdTq8MUiqL
         XexQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWiXWW+Ill0lBs39WZGppOxUyEwXglhiPH4EMJOuGwHMpNpBBkVBTDr3/uMVQvQSAD5uK7RzouU63G91f/OwQI+sRnhSk/R40r0fUp3VZCUlJqoW6OWSZUf5rHdl9FESsnLS3yuE3gpj6AnZR/vTyZBfkh3Q6CG6xfzScIy8hsjqzP9UI=
X-Gm-Message-State: AOJu0YymKkNYL+gFy4Kz39KQgJ0ZxeMfwalmin/ELLPEziyx9WUwV3Po
	EXXw5drKd/i0cWYFg1/qRsPgrjZUrTwrwx5JFUxdE0wjD1V4XNrz
X-Google-Smtp-Source: AGHT+IFofNUfeVidCg819q1QRgkprtjFmMX3Cf/3zkluvCmtE81tZYV+0Y/oXvxwcBZq+A8+VnLFUg==
X-Received: by 2002:a5d:6152:0:b0:362:3358:48cd with SMTP id ffacd0b85a97d-363170ed20dmr4784758f8f.6.1718900855370;
        Thu, 20 Jun 2024 09:27:35 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be841sm30518035e9.20.2024.06.20.09.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:27:34 -0700 (PDT)
Message-ID: <66745876.050a0220.24048.c6a0@mx.google.com>
X-Google-Original-Message-ID: <ZnRKsOhGjKdQcpus@Ansuel-XPS.>
Date: Thu, 20 Jun 2024 17:28:48 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] mips: bmips: rework and cache CBR addr handling
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
 <20240611113538.9004-3-ansuelsmth@gmail.com>
 <ZnQ/auhuPWb1SGjb@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnQ/auhuPWb1SGjb@alpha.franken.de>

On Thu, Jun 20, 2024 at 04:40:42PM +0200, Thomas Bogendoerfer wrote:
> On Tue, Jun 11, 2024 at 01:35:34PM +0200, Christian Marangi wrote:
> > Rework the handling of the CBR address and cache it. This address
> > doesn't change and can be cached instead of reading the register every
> > time.
> > 
> > This is in preparation of permitting to tweak the CBR address in DT with
> > broken SoC or bootloader.
> > 
> > bmips_cbr_addr is defined in smp-bmips.c to keep compatibility with
> > legacy brcm47xx/brcm63xx and generic BMIPS target.
> > 
> > Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  arch/mips/bcm47xx/prom.c      | 3 +++
> >  arch/mips/bcm63xx/prom.c      | 3 +++
> >  arch/mips/bmips/dma.c         | 2 +-
> >  arch/mips/bmips/setup.c       | 4 +++-
> >  arch/mips/include/asm/bmips.h | 1 +
> >  arch/mips/kernel/smp-bmips.c  | 6 ++++--
> >  6 files changed, 15 insertions(+), 4 deletions(-)
> 
> still problems on a bcm47xx build:
> 
> mips64-linux-gnu-ld: arch/mips/bcm47xx/prom.o: in function `prom_init':
> /local/tbogendoerfer/korg/linux/arch/mips/bcm47xx/prom.c:(.init.text+0x3c): undefined reference to `bmips_cbr_addr'
> mips64-linux-gnu-ld: /local/tbogendoerfer/korg/linux/arch/mips/bcm47xx/prom.c:(.init.text+0x44): undefined reference to `bmips_cbr_addr'
>

I'm really sorry and it's embarassing (those legacy target are hard to
compile)

I pushed v8 that should handle the problem, tested bcm47xx and bmips.

-- 
	Ansuel

