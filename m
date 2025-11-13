Return-Path: <linux-mips+bounces-12221-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38610C55FAC
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 07:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D56B83492EB
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 06:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2050D2FF167;
	Thu, 13 Nov 2025 06:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="kP44HQcz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75551289811
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763016703; cv=none; b=kSJs8ep5qLD2phT1smfaN5fqKXUbdqTCibJ28zc6XTV5sfKWXQdJAgvZgZuDzax4GrsLxvYfaRzG/Gi5jcKfD3L09xPJlDDyO85AgkQy+dhINSS2TTYVsiVKPOey1fwOj1iCZW5v+F0Jc8W8f0LqP3yD9Q0Io9zhXT2UWqtkYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763016703; c=relaxed/simple;
	bh=4Z0awSzt6jA4LQDwckE33K6hrjrl09ovLvdB1ZAJ7dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlQbyZ4/2UdGTVrNBrBcVkQmILw+B4HbQVHdNL3qFhRPQ53oBEmiGHf6OVmpn9aNwipz6W+9WI6cF8HOypoBBmgYACeIgO5lnj1Y0vTFEBkSCu2T3agOJW8cWjtGfiyAq68nrgW4m6yLnVfksyU4OMazfWCaAhggvZ0e0S7Ys20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=kP44HQcz; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4eda26a04bfso5493261cf.2
        for <linux-mips@vger.kernel.org>; Wed, 12 Nov 2025 22:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1763016700; x=1763621500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55yNIb0wIDP3OqyuftaZgIIonDQqNLeSpd2TSvNiBJ0=;
        b=kP44HQczQdjA8S9AJBTkPRqsc0uihSRhecIhyuzLDn7EQ7d8glT7XGHaDGf6eavwRB
         vYTaOXMImFKgSqLjXwyI9d3VjOBIucEd+wJgkxSQf6613AwJJ3BAUe47yOUb4yNXplMk
         HoGvkcYIoFB5J2UW/Ovo8eX10kvpUO9polrP6DZ+Ukqsdzb7attXmLzzKAcxNYwrer73
         gK6gg5Av/FrlhpyXiIE9+rbGbEIwPs2oJuPZorYrhLsv35ieUT3RAIYIdd0ybJazyF0e
         fMshQVTVGQRZqrtCH49vtc8WUnvIfs/43jw5jd8DCwpSJCTQqa3jguQy/JxmAPblelAL
         onPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763016700; x=1763621500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55yNIb0wIDP3OqyuftaZgIIonDQqNLeSpd2TSvNiBJ0=;
        b=dvWVd1xiXhtp1Rmu/u/kJ6nwG2e9517x95Ol2JYUoEVElLaIAsu5iPvDE0k6gTUhjh
         2vPWTozCvZvTMneeZf4G+irH8saWn7HVdvDEsm7/QAUqiRbbqgH2dIos40756cCFUKOe
         5/uYVu8eh3bxtSmf/7kPDNVOsnETWzHCrWYY63Bwg9kmJl/BReXR98qk7qiysWuc9Qze
         Z/0lbT+K+WzHq7hVmcCFLd0jDDfiZQPyc/GyThuv/6HdX1DsCKeAJbLIsq40jdSmdwXP
         /YWFh+6wrkHH4TAHydKJ4CP1s0kLG6w1d5z+r8Fh028QC/ZAcLyrJVgiTf3dpwB7DASn
         Bcwg==
X-Forwarded-Encrypted: i=1; AJvYcCWczCjGLlBR5eHaYWJ9Dua7ftoVmO7YX7cHAaHzl/HsfueupWKRsweaaET/M6S8zEQ5cwyiVJHBcEfU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaql7nd1pnehPpOAv2eeXHgck++1oe5e75lIPV/JFbLNPjHvsK
	U4xFX1pYSihCCUk4GsB9Hq7kJvO/I8hnpOM/dj9X/lwYx/SeTQl/g8tj+r9JJFgCtNaEibPhEJc
	U9yWe
X-Gm-Gg: ASbGncsk6v7cFDbHxFU8fTAlbz4DnWm/PPJrtYOv9qCMDk4gY2ti7mKxFdd9kolG4EF
	bLJvTbMfvo56FsjFagpBZv3ydalpWeIT36yvdteUFodm/FIzt5s+9Kt1Fw4gJuQUFszC3QfjIkj
	GGtOmiD5wjDR64Vr05/b72HWGiyWchpS7IFdCFN6bplhWztkpXt5zvG02rwdNE0t8VRWIsfdCFq
	7je6vfiAubgeIrRRc9sQ99rDEPDvy/te2TEbjvFi2vAA/DJJgQoPuA58uRocZWNQh9O6XLCjjGi
	guc8RrT2JgxFiffdnHV2YbYrP09H+bL5p2L3cLwkiLt5Z7X0shzZBRNABn3VRfhsW++UBUzcZjK
	LWjqYkijyjAFNCEDbJqF08sf3r7xmJ8QPSHaWwa/OfaHCvik/jEbN4RTa0P9Ef0hn8vmkvHNhK7
	1g3XD9O/dZJATBKoM9+E5lHka9FDTmkg==
X-Google-Smtp-Source: AGHT+IGjGqNrA3/P9w3mkwJ5Eqm8y7891ivQ9PHPBmXUSssAVEpKmpc8Pg2Vd3FcMNoJcH7ntkYFOw==
X-Received: by 2002:a05:622a:1455:b0:4ed:441e:6f14 with SMTP id d75a77b69052e-4eddbc94c93mr64331901cf.3.1763016700191;
        Wed, 12 Nov 2025 22:51:40 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4ede86fa04bsm7410111cf.16.2025.11.12.22.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:51:39 -0800 (PST)
Date: Thu, 13 Nov 2025 01:51:38 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <svsxljofa343sdwhsb55uysnzelfgovgzmuomhvtpax3c4paog@qlkqwml5ldbf>
References: <alpine.DEB.2.21.2511122032400.25436@angie.orcam.me.uk>
 <tsok52tdbt3z5j3i6ht22iko3mdqeom2ojcvvb52pwfbjnzzyy@mcwnzfpvksee>
 <alpine.DEB.2.21.2511130521330.25436@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511130521330.25436@angie.orcam.me.uk>

On Thu, Nov 13, 2025 at 05:27:22AM +0000, Maciej W. Rozycki wrote:
>  I chose to respin the patch once again after all as I concluded it makes 
> no sense to pretend we can handle wired TLB entries with the code as 
> offered and neither we need to take care of them in the first place.
> 
>  Would you mind having a Tested-by: record in the kernel if you choose to 
> give v3 a spin too?

Yes that would be fine.

I can give v3 a go tomorrow.

Thanks,
  Nick

