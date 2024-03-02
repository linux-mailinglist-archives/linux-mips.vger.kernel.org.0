Return-Path: <linux-mips+bounces-2001-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B486EDFB
	for <lists+linux-mips@lfdr.de>; Sat,  2 Mar 2024 02:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A720C284DAA
	for <lists+linux-mips@lfdr.de>; Sat,  2 Mar 2024 01:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B738410782;
	Sat,  2 Mar 2024 01:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TIc1hC1B"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F3DF501
	for <linux-mips@vger.kernel.org>; Sat,  2 Mar 2024 01:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709344271; cv=none; b=quu/MhUeHUJn1x82WBjucnq/WWXbRrFl7hq2vRWrC4uNWpE5wY9WAHKWIyO2cSOt7aTe2OmWywgdJGV5KmzzWZd9YPs4EkZhEgoi8oLd4DdGu7gMhxlJaTM9Ms4LNtopag0AifqZTgrFQwSNNGZhRDWS48tncMG+5VnWZZ6sgDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709344271; c=relaxed/simple;
	bh=/8oSmkPc0IaP5CM6+fKqf9jvC9DwK8RXxd3zPN60QIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTvt9NzdZYaqDy1HBpP0ZMUmeU3wyhb2kexzrpizgf1Q6gagNN2cnEpwCR/EbADhQjTP+NHOU+KAFZhZeXN3r7Fvn8JNMB8K4m4OWiMaurnVQGHdQGbKlS5jkDVRit0r0+ummEoCP3dszezeYtxjjKpq8dm5jODJ4r6Ddad/YxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TIc1hC1B; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so2626424b3a.0
        for <linux-mips@vger.kernel.org>; Fri, 01 Mar 2024 17:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709344269; x=1709949069; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1JOHRODJmattJBY3YtQ+51tfBSOEI55kux6+SckPNNk=;
        b=TIc1hC1BaG2C6O48gHCVwqAMREqybRwL/38QZkQjs8birZpqFdZpqCIImbYMYW7Eiv
         jRPIv6GZBhjfsVtfypwxiChRkpef7DVwQMyj5nOOLNLueAgFL8DiRBb4+OjSwCy83w58
         nhEfdX/lBy3gXtmcU7KGWUmYplpKX5RVOBkGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709344269; x=1709949069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JOHRODJmattJBY3YtQ+51tfBSOEI55kux6+SckPNNk=;
        b=DsVQKtHLzFU9F4f8mPIo/P+Zsh4w60yflIzpEsin61dGoArMtXorvGhyvJKp97jkmW
         6oYPE6aFqkZGwVkiuO3IRWEDCHg9H2tftjmlMBAfZTj9L/ygKuYb7SshywMQpTnVVXuY
         k9cc6Qd5VzCKIPamPUV2UV9ka/9SD27Q2mcgMxuriIdsDCkes0k450ead5ayQA97xWjJ
         IYPrDtA9qURkg7w52hQFklqkfzqUW551v20zLO1jWLYiIurVMqCf9+ZiLdD5FpUKTD7w
         7+4fjDfAX1ngDH2m1ualjvSIY13gR1M6AwqkpbTDHTeH601JvWd/2qS+hbzYN04Dn3u4
         bipw==
X-Forwarded-Encrypted: i=1; AJvYcCU4jy6P4SGsiwiHms+MxIRuWUBiqwTaxkJjIpJHPo1FH545lWuMzTIUU4iWsnnTusN5DWpMJr4iThkMzRAFcjO32F1OSJfgmecAsQ==
X-Gm-Message-State: AOJu0YwXaqz8ooMLl2yZj0+TIVuYnvLW9HvoTkssnPGRBv9G4+fo80KI
	sbHad8DsnwTl/B3VUMwlBOMaqWXk40E+XN2UAyLcizZ3GAn68k6UDfnBbmF0qA==
X-Google-Smtp-Source: AGHT+IHRDk8dRy87orC5sOO0fLYLW475IUp9U1sSARPtPvgR8uAOkuMFjfqikjpTM+PGmCnZ+zOW8Q==
X-Received: by 2002:a05:6a20:e11f:b0:1a0:ef1e:a5a7 with SMTP id kr31-20020a056a20e11f00b001a0ef1ea5a7mr3447528pzb.4.1709344269211;
        Fri, 01 Mar 2024 17:51:09 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id rm12-20020a17090b3ecc00b002993f72ed02sm3845854pjb.34.2024.03.01.17.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 17:51:08 -0800 (PST)
Date: Fri, 1 Mar 2024 17:51:08 -0800
From: Kees Cook <keescook@chromium.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"luto@kernel.org" <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"bp@alien8.de" <bp@alien8.de>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <202403011747.9ECFAD060B@keescook>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
 <202402271004.7145FDB53F@keescook>
 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
 <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
 <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
 <202402280912.33AEE7A9CF@keescook>
 <ac04c9aa134807bbc00e6086e7a14a58a682f221.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac04c9aa134807bbc00e6086e7a14a58a682f221.camel@intel.com>

On Sat, Mar 02, 2024 at 12:47:08AM +0000, Edgecombe, Rick P wrote:
> On Wed, 2024-02-28 at 09:21 -0800, Kees Cook wrote:
> > I totally understand. If the "uninitialized" warnings were actually
> > reliable, I would agree. I look at it this way:
> > 
> > - initializations can be missed either in static initializers or via
> >   run time initializers. (So the risk of mistake here is matched --
> >   though I'd argue it's easier to *find* static initializers when
> > adding
> >   new struct members.)
> > - uninitialized warnings are inconsistent (this becomes an unknown
> > risk)
> > - when a run time initializer is missed, the contents are whatever
> > was
> >   on the stack (high risk)
> > - what a static initializer is missed, the content is 0 (low risk)
> > 
> > I think unambiguous state (always 0) is significantly more important
> > for
> > the safety of the system as a whole. Yes, individual cases maybe bad
> > ("what uid should this be? root?!") but from a general memory safety
> > perspective the value doesn't become potentially influenced by order
> > of
> > operations, leftover stack memory, etc.
> > 
> > I'd agree, lifting everything into a static initializer does seem
> > cleanest of all the choices.
> 
> Hi Kees,
> 
> Well, I just gave this a try. It is giving me flashbacks of when I last
> had to do a tree wide change that I couldn't fully test and the
> breakage was caught by Linus.

Yeah, testing isn't fun for these kinds of things. This is traditionally
why the "obviously correct" changes tend to have an easier time landing
(i.e. adding "= {}" to all of them).

> Could you let me know if you think this is additionally worthwhile
> cleanup outside of the guard gap improvements of this series? Because I
> was thinking a more cowardly approach could be a new vm_unmapped_area()
> variant that takes the new start gap member as a separate argument
> outside of struct vm_unmapped_area_info. It would be kind of strange to
> keep them separate, but it would be less likely to bump something.

I think you want a new member -- AIUI, that's what that struct is for.

Looking at this resulting set of patches, I do kinda think just adding
the "= {}" in a single patch is more sensible. Having to split things
that are know at the top of the function from the stuff known at the
existing initialization time is rather awkward.

Personally, I think a single patch that sets "= {}" for all of them and
drop the all the "= 0" or "= NULL" assignments would be the cleanest way
to go.

-Kees

-- 
Kees Cook

