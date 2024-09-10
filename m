Return-Path: <linux-mips+bounces-5519-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9E9743E3
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 22:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4D96281853
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 20:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7686B1A4F2F;
	Tue, 10 Sep 2024 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhFFQJQS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97B176252;
	Tue, 10 Sep 2024 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725998865; cv=none; b=LfN5qmJeajTwTJ+dYUVmciRrHbJyy1NzUjIP/Xk712wauQWdnu0jpWAESoF2IWA825rGq1qzGMKtOm8lcOt35Rh77gxBByiahIlcjXwSelUO6mGnDYDw/HOpu/axWiGQskExY3A7R3dZY0347ykeKXvGuTc2lZBxtdENyPdGFEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725998865; c=relaxed/simple;
	bh=b+THmAwcAom/Qv4imatSq2nSA9VS+JPd6/u3vlwm+/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfT8OBZoZ8JjpvPpqj8Ojq8GEEGigLB4pEW+RndiHHyS/IBPxsux9vCDluMxhW/mipwJvEtuHfJ6WXl/u1D0+sJsu0flHnF32jDd5p7FwDU+gSxUZHKMV2cFXspSdiOqW9DOHJhbLysiFNZnEm2ZzUzTTvtgm7KrDOd19MjoGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhFFQJQS; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f762de00e5so38812881fa.3;
        Tue, 10 Sep 2024 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725998861; x=1726603661; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LyVrAiITGfV7pYArU+Q+t8KwJ+D0u4APPVYawY8r7+Q=;
        b=EhFFQJQSU6832dHtvmmINLg1JMDD4Rqc9nY5WAW6fUMzxdk9EOoRLI7X3y6/pHyGVL
         5NJwfClGF6FDUOIh2a3airOpIQw52FFEldL2iTLTG8eCAkJkY4saNPs2jmMNUfQtO6rj
         CVt07wcbF57p5I4gS2GNoOvSan6zojNyhfi6DIYUNby95eoF26M6zRKJvH+qfBM0qe/H
         ezx3RTjEIieaE9La+bMO8VHs/cSeWNAVDg6ZP7J13SwDHDe9YNtBVQSwd58ON6De/bPw
         5Z92YJJ1/LttDN5RkokaG/1YXe+M/eGTqgiuu8np3OTkxK20RkvOfVP3SZ2amP+TBgY5
         +WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725998861; x=1726603661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyVrAiITGfV7pYArU+Q+t8KwJ+D0u4APPVYawY8r7+Q=;
        b=qX3cV9lvDqaj3bbHqMjh61vhqkahol+sOotQ/x3fS1G4G8GULIlRLqFNdDIZSzr8MD
         1A5M0LdHhOxzL/D689cVD8tLVFZz3k2ZR3pAWQId1gSLIHi7P02KQmzPFP9IWioYHf1j
         pyedgKgzDraQSEDDc4j2LPmF7wHViCkyo7RFVX8kIisCmIBbQDVwBTwWGwApFKdwk2aA
         u0HS5z89RyLekgnvjRhhIDlZBgXFvMz7O3AGds/cI2jK6PzLL5VuM1GgjoeppOQ43LgS
         ClJVJz1xZGg/K5fvt7mjkKA+6ZjlEHMrwur6LivPTqWBDLAjvltmjNCS7HC9Dr67txCQ
         Q1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/DU3Dnsl2PQpaShem864k70DAcfVWb1TYR65HvSEMhUJJ1pSe56agQwI+fSc8SonLYYPetPNXMdN5@vger.kernel.org, AJvYcCUlGTrrUhF01e2ghognJ9QksJWPzRY5Fax+GEfG2NvXU96/SegOTx80xVgM8/zTaMW/g5cA4y05EKsRfA==@vger.kernel.org, AJvYcCUmseWNvmcUQ0VrOzdcDw2gTBief5WcOX/L/h9cOl3eAwiv2b+7pOwmkwAw7FazelQ6UpQeMMCJl+gqZhJ9@vger.kernel.org
X-Gm-Message-State: AOJu0YxdeXJGx4Z8YbdOVcYC1PTrAVi8qpRhGzemNWya8gCf0p7WDdnl
	ifL+ygRdocBLKexk1XVXn9ybazoc0K450ZC2GevzvWLutkCekJP4
X-Google-Smtp-Source: AGHT+IFl0skS8bBYnEazfcnNMfaQP0989xihv8X3HDPU2apuy0G0hLs0tfMf6983l9Jzl//58Y2rNw==
X-Received: by 2002:a05:651c:1507:b0:2f7:6664:f295 with SMTP id 38308e7fff4ca-2f76664f61dmr68652641fa.27.1725998861091;
        Tue, 10 Sep 2024 13:07:41 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c098b77sm12512371fa.105.2024.09.10.13.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 13:07:40 -0700 (PDT)
Date: Tue, 10 Sep 2024 23:07:37 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"paulburton@kernel.org" <paulburton@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] MIPS: cm: Probe GCR address from DeviceTree
Message-ID: <7j6cc5i4z4nwg73fowjz756eblnesglqm72jveygqfxngw26mc@sdy6xxomo3qe>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <20240612-cm_probe-v2-6-a5b55440563c@flygoat.com>
 <ekvyyq3vzdbyi5suf4irfixyprvtko7rpkffwpc267kiex4ex2@lpu3ctysuviw>
 <79acb1b1-9c1c-4a58-91a5-5dbb286717ec@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79acb1b1-9c1c-4a58-91a5-5dbb286717ec@app.fastmail.com>

On Tue, Sep 10, 2024 at 08:23:25PM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年9月10日九月 下午1:36，Serge Semin写道：
> [...]
> >
> > This causes the kernel boot-up procedure to crash/hang-up because the
> > CM GCR base address is supposed to be redefined by means of the
> > already mapped CM GCR address space by accessing the
> > CM_GCR_BASE_GCRBASE register:
> > change_gcr_base()
> > +-> read_gcr_base()
> >     +-> addr_gcr_base()
> >         +-> return mips_gcr_base + CM_GCR_BASE_GCRBASE
> >
> > By the time of the change_gcr_base() call in mips_cm_phys_base(), the
> > mips_gcr_base variable hasn't been defined. So the IO operations
> > performed in the change_gcr_base() method would be accessing the
> > NULL-based memory space. That's why the kernel crash/hanging-up.
> 
> Thanks for the analysis!
> This path was not taken on my audience hardware, so I didn't catch this,
> will fix in next version.
> 
> >
> > In order to fix this we have to first map the CM GCR block at the
> > default base-address, then update the CM GCR-base CSR and after that
> > remap the CM GCR-space.
> >
> > Please also note, the GCR_BASE field might be RO. It depends on the
> > IP-core configuration. So it's possible that the CM_GCR_BASE_GCRBASE
> > field update won't work. Although that will be detected a bit later in
> > the mips_cm_probe() method by comparing the address returned from
> > mips_cm_phys_base() and retrieved from the CM GCR-base CSR.
> 

> Hmm, I just checked RTL and RDL for CM2 and CM3 and I didn't see it as a
> configurable option. It's possible to change hardware reset value but not make it RO.

Both MIPS P5600 and P6600 databooks define the GCR_BASE field as
optionally R/W:

GCR_BASE 31:15 This field sets the base address of the 32KB          R or R/W
               GCR block of the P5600 MPS.                           (IP Config-
               This register has a fixed value after reset if         uration)
               configured as Read-Only (an IP Configuration Option).

> 
> Maybe it was possible on earlier IP release,

I found the text above in the latest MIPS Warrior P-class software
manuals downloaded from the ImagTech site. Not sure why your RTL code
doesn't have such configs.

> in this case it's always
> user's responsibility to write correct address in DeviceTree :-)

Right. The system just won't work if the CM GCR base address couldn't
be updated.

-Serge(y)

> 
> Thanks
> 
> >
> > -Serge(y)
> 
> -- 
> - Jiaxun

