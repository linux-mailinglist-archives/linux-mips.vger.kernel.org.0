Return-Path: <linux-mips+bounces-5488-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB3972B8E
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 10:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 508441C24BBA
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 08:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04910185942;
	Tue, 10 Sep 2024 08:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFVzPDGj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D814EC64;
	Tue, 10 Sep 2024 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725955623; cv=none; b=cj2B7Oh2UjWUbXH7Fw9FIWdIAf5XEBT+u4fAt5vM87L87r5QPmGFzDvddquNrrx0o5b8obyTE5fK3MsPu11LHgDPlkuro0IEBtSeTSsUzgAej3g3uytqaL488+xAMgXYsuj2JuLU5jTI7kUatKwTMr//GpanBRKvHvR0HCnhhVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725955623; c=relaxed/simple;
	bh=1ltcXmceTLZy9QqnQ13U4oGqvK2CTpI93pBXiQ17Hvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ut4IeTt/02IbW8p/hKmqLL3QjRch2h+16nb6Ct3367ubHW7Cmwb9HSToSg35KvfQT0XFHrVMDqSd6WquiSlgRK5fvcVt6raGHRTZViCT/obngf3IIhbw6En4c8ZeXZpUMn7I03rD7ek64UaWGZi0d2T+iLZYIgXELjGfp0BgjNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFVzPDGj; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53653ff0251so6181360e87.0;
        Tue, 10 Sep 2024 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725955620; x=1726560420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz5CIdHVHvkHtiNrFTW/30ci7obg66dA0as2KpLkByU=;
        b=QFVzPDGj6u3LNmx+cwLDXp+5UaI0Ol4hr0RvZopWfOym7EI+xGn9NxZzxDcskmRBdF
         pElmDJFBhijdu+SYxYwqaW4PCYZs/XJqeCSNtUJK/Wgq7Jm4LWr0Lcw9l+AGeCAy3zYS
         R/Xq4i0tHS/sx0Ghm8MTmV2oDdIY7FLD6+rNVU1sbsAEhq21w2NXkxpHFVtlY/W8MhL9
         4KktQGJdrz1UgcnhT6lq5DT8rHYCHZ3zWatUtaWSKbZl3TmT7q//N09MPIZgCOnVJYyt
         RQUSLFxwZn1mLMAFe1Fy5rTnoXNi1AfzPUteMqBT5UMC+Jj7rmh+1mMQnDNIuVUi9/q+
         PleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725955620; x=1726560420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz5CIdHVHvkHtiNrFTW/30ci7obg66dA0as2KpLkByU=;
        b=WdXxxkKkzxwyFsI/sZhjdLP7rgWKgTg600LNVijd9sqhLnaC8f6A0Ch/T5FLwILQwh
         l6J1VAG9dHaYrBx4jhpjEoPUiVPniYajU8Z5VKdeisOlPex1HgP1zHhf9BD7gN0RGOgH
         Q4QCAestW6OTOXszAF5UnR7IEThqH/wQyx1FlvXEhi53Uv7h1oxpbtv0eLSup11o+EYb
         UsDsH1TxGX1rGRlaDrAbnNtFzB1zkMzf645if82BkUVY2AZ05gfNXg43WuT98wKu/G+r
         ZrGfqFW7sSHgigZP6VWTQ200kUQ+lXB4NfiEFkCTmP4J0T0+5SqtOXDXeet//ZQiKlbT
         vBtA==
X-Forwarded-Encrypted: i=1; AJvYcCVRYXsPhL3Q+kdf2Q3lyxDzK7zLx3/LnA02gkIhsNaZNmbMmu/uJQcFVyEhHgVP1xIgmlT2Cl1+5ZJg@vger.kernel.org, AJvYcCW4fYVblyq2RLo+840rA7f2ZTfw9TMewxf+oqq3LSEdVjSda5toP1c/rynTU4jaZHJhyFdvRr8ozc46xw==@vger.kernel.org, AJvYcCWDhXK/PmAaqbJcO/yDmdEXgbjxhRJ7m4uP7I4gylySOLH4k0Y1W3XKN3HeBCXzN33kepBhGNnmWQzeZpow@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4clOoHPW/ZBSbCUUcVChSNhEEN2JCFA87vEPsTdxmODH2AuZx
	zTRp6RwM84vAi69KL9KvzF/HFYMyYBi3Ex8Jf64NwXXl6Ual/EcV
X-Google-Smtp-Source: AGHT+IH1aZC32vo+iln8qSrTi4KRxrtdkgJniacmqzDUfBPShm6QxI6FHwLAlx4LAs4kuShuES66Yg==
X-Received: by 2002:a05:6512:31c5:b0:52c:e07d:229c with SMTP id 2adb3069b0e04-536587b06e0mr10247610e87.22.1725955619305;
        Tue, 10 Sep 2024 01:06:59 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cacf8sm1020961e87.131.2024.09.10.01.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 01:06:58 -0700 (PDT)
Date: Tue, 10 Sep 2024 11:06:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Paul Burton <paulburton@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MIPS: cm: Probe GCR address from devicetree
Message-ID: <tyjojeubipma56cnldy3yabbiakca7bnt4efei7i4r5xme7gpq@ecz5rqwwyg5n>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <3wemwdkev7pafyfu3yxhpvvpqaplhlejbzxtmahcarrnoeelzr@747sgyl63kwj>
 <Zt745ZtuZmVH61uA@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt745ZtuZmVH61uA@alpha.franken.de>

Hi Thomas

On Mon, Sep 09, 2024 at 03:32:21PM +0200, Thomas Bogendoerfer wrote:
> On Tue, Aug 06, 2024 at 10:49:52PM +0300, Serge Semin wrote:
> > Hi Jiaxun
> > 
> > On Wed, Jun 12, 2024 at 11:08:52AM +0100, Jiaxun Yang wrote:
> > > Hi all,
> > > 
> > > This series enabled mips-cm code to probe GCR address from devicetree.
> > > 
> > > This feature has been implemented in MIPS's out-of-tree kernel for
> > > a while, and MIPS's u-boot fork on boston will generate required
> > > "mti,mips-cm" node as well.
> > > 
> > > Please review.
> > > Thanks
> > 
> > Got this tested on my P5600-based SoC implemented as non-generic
> > platform. Alas the system hangs up on the early boot-up stage with no
> > even a single char printed to the console. I'll be able to get back to
> > the problem debugging on the next week.
> 
> any news about that ?

Oops. This patch set has absolutely slipped out of my mind. I am
getting back to it immediately and will submit the debug status
shortly after I dig out the reason of the hanging up. Sorry for the
inconvenience.

-Serge(y)

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

