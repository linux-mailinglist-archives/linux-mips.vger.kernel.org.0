Return-Path: <linux-mips+bounces-12929-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3DFD1EBB5
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 13:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05377303F7BB
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 12:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7477339447C;
	Wed, 14 Jan 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/aDhRo4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D952D0618
	for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393314; cv=none; b=FEPpiw39bdl94HcwWcy3EjAXHwFRaqxso0UaBgbtT86TuHLWZ9171a/oSy2RP9CDugU+nj4/n8Q8FX6QhROb8KrX3TvP7C33Aa76SjUytKVpDlqeucUUeQHSMroEHAs2+Y8178PxQmADU79ei7xOtky+UOa6Wi8Ryxpo+pao7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393314; c=relaxed/simple;
	bh=j+mQoSqzAh5RCYUg705iz2e3cyvLCAFRTNP2daSCz30=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UH9aTjnlJYGigk1ibL5fIccaKMNKdKzW57wOwmpTiVMvpnaRoCe3p0xEgP0fHweZAo640kjnWbdbgzyO9QpkUQZUxSFdEFHRz5rd+YCTkAgaRz3EvUu5Z9wFsNZfP8G4OrSJuNgXiJ7GVXnKYNRUinylcApLht8axugG69lht6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/aDhRo4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so13832217a12.3
        for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 04:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768393311; x=1768998111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gsd8G2M81+WYoxdkuRC18RhaEdxHWf3NY55zL6lQS6M=;
        b=Z/aDhRo42f3RMpIf+XyG9hY42fasimiNzqc4iyjHSJiEGxu/1u7s6B5vXRQ7J1U0OH
         UPpiZKlheATniWQZ5kU90zYH7aOSCJc6sPQ63oRIFF+afFhiHjXjW/RqPz2iG6f5K3hl
         1C00c4xnJAT6YVNZ5bruSqSj0t6JL84HQbpNdJlwQYCLEvL+IUS7jfMyoFtFKKzZZRux
         mecS5tgEdFD28x/kZl5pG40UMawhS1N6NyZx+kCZHwk9qxUEFiI+XPk3s6HgjdCKbpRL
         X6WWwsXXumEg0Ou5GL8TFUBShEtgsBALTdiCE9Ntx73n7rHnUCcD7lh2WNkGCZCIaEt3
         1m8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768393311; x=1768998111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gsd8G2M81+WYoxdkuRC18RhaEdxHWf3NY55zL6lQS6M=;
        b=CknO9UTbs6GAGAsDbMUq9liPhZhrhV3qxLmHxr6FW8z9iq9s3yt0DGNp6GMGfVqgoi
         YEhUbM6qIpsPuHQEXV3wznRugDr9oX8kNNZejehcBvCiyl0Z82UmUL1XoCOyI3+dAeaf
         qoaVlJLUEAH3sJj9gcntyR2PxF4/k/3FnA2PNlx2jb2SUSI4w6W3a3WYdvDoYMLll+ay
         7XJU415/RoJxifu9uHmvw1Vf5LyGYjV8eyXV3leT0DTdq2XyKUI86X4OtoFJcfhny3d/
         6vJ+Qlnj9ereA16tq+DATg74fU6YHs9UgEv6G7uYZZmXYSP0Z0DfQHP7teHbkK6U4ozo
         QfGg==
X-Forwarded-Encrypted: i=1; AJvYcCUpDOQskAgKUQMbOJ1/XI/tZ9EFhWBScOxLngVAQhZHtgAJ1N1j8mh4K7X9bdmXflv8p980v899Rqpa@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ+UAhU7EhPshEOjtGDF2YTgWypqb8GrJv+R2DEUhDvaI2hg9G
	+ejOkMhZDIkCAfFge+q8JTZNr2KD4dMJL/9bCzi3A9+dyTKyqm0PLG5LPlHC0Q==
X-Gm-Gg: AY/fxX7+h0pwyZ5bPR+LD4grxKzPS6ZNBr5a3EFub/ILfAZ17TMUlNc4UStifTJxsSS
	0gp7/YitaQhbHUcwpCLChrZ97530qar+h4UPyYK3057WkyIAIAvEsejnCO/OGWbrap7pYyGiVhg
	LHascgB0heLFBOGuLYCv9CkDPu6NMHkZNj7wEepRhY3RrXhZmZvV9Zu2FWRll8IEOGlGnR78vWt
	O3NRZ/PKrLDrHJtvfuWaRlO2WAcRFR9Zj/EKFLH8tF9xtGVvaoaVym5VtJ7bx8qLUIu22Ryhddm
	aSWLEpHUVPZyYV2vZ0RTJduLebiwl+e6vH2KKW7+R7i7oxUfgJVtHubMxvXJkJfwqVOC8kiJjxd
	wGJQyX4macSYC37rQpfJlim7voGej3Yj0cRb1bOCwYG5h6i0wK4FPqdXZzqP3hX5xxHKtJgh913
	xDG4jIE5UKEZ+o4Apeyc1KKO0mA+Bh7OoZBOuSJ1ICoA4pWw+2WvwQ
X-Received: by 2002:a05:600c:c16a:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-47ee32f14ddmr22777885e9.13.1768386665307;
        Wed, 14 Jan 2026 02:31:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee5914232sm24680845e9.14.2026.01.14.02.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:31:05 -0800 (PST)
Date: Wed, 14 Jan 2026 10:31:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Nicolas Pitre
 <npitre@baylibre.com>, linux-mips@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
Message-ID: <20260114103103.216aa122@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2601140453090.6421@angie.orcam.me.uk>
References: <202601140146.hMLODc6v-lkp@intel.com>
	<20260113200455.3dffe121@pumpkin>
	<alpine.DEB.2.21.2601140453090.6421@angie.orcam.me.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 06:19:02 +0000 (GMT)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> On Tue, 13 Jan 2026, David Laight wrote:
> 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
> > >    div64.c:(.text+0x84): undefined reference to `__multi3'  
> > > >> mips64-linux-ld: div64.c:(.text+0x11c): undefined reference to `__multi3'    
> > >   
> > 
> > This looks like a bug in the mips 'port'.
> > arch/mips/lib/multi3.c has the comment:
> > 
> > /*
> >  * GCC 7 & older can suboptimally generate __multi3 calls for mips64r6, so for
> >  * that specific case only we implement that intrinsic here.
> >  *
> >  * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82981
> >  */
> > #if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 8)
> > 
> > So this code is excluded for gcc 8.5 but the compiler is generating the call.
> > 
> > Looking at the git log for that file there is a comment that includes:
> > 	"we wouldn't expect any calls to __multi3 to be generated from
> > 	 kernel code".
> > Not true....
> > Not sure why the link didn't fail before though, something subtle must
> > have changed.
> > 
> > I think the fix is just to remove the gcc version check.  
> 
>  Or rather fix the version check.  The GCC fix went in with GCC 10:

Does that mean the GCC 10 generates the multiply instructions and never calls
__multi3?
(Rather than just not using __multi3() for that specific example.)

In this case gcc knows the high bits are all zero - so just needs the two
instructions to generate the high and low parts.

	David

> 
> $ git log -1 --pretty=oneline 48b2123f6336
> 48b2123f6336ba6c06846d7c8b60bd14eaeae7ec re PR target/82981 (unnecessary __multi3 call for mips64r6 linux kernel)
> $ git show 48b2123f6336:gcc/BASE-VER
> 10.0.0
> $ 
> 
> I don't know why the PR got it all wrong; I've fixed it now.
> 
>   Maciej
> 


