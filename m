Return-Path: <linux-mips+bounces-12139-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E4C418E4
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 21:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C58A3ADE41
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 20:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F283093DD;
	Fri,  7 Nov 2025 20:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="vaitNBo9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3183A23A9B3
	for <linux-mips@vger.kernel.org>; Fri,  7 Nov 2025 20:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546356; cv=none; b=l4AbW9ylMfsO5124TDr+XTqGkilWMhbK9nhK6L4tOJN9XKd4elYXxXuC859CT4oJCTzFTDfDxRmdkhxJmmxhQAPuDUDgUQM4QWn8fKzfDoEYAfFDaxDkkE4LDTjqkFQKyIijxGujiQYNundIF5PWBDYVxn5D4or0PT17qz7eplE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546356; c=relaxed/simple;
	bh=xhuY738tZl353Xy0fNRI/QG1yk1TSCZTX05qyNUVL30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+FbFJ7qH7XiAwBSf9QrNB6Y/t/Z7JAr+tmp6XzcjfzmATAhf8VSWPQ64E+pbJlVulsJMQvzyKv+WaygO1/P6MSBoOMf303MuZMWrWatf31U48CNnnLrljbtCwfgW62Zsmg4NQOfdYGBupfmS/DYbVhl8slF9D3c+YD2cVB7Pwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=vaitNBo9; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b21fc25ae1so110968985a.1
        for <linux-mips@vger.kernel.org>; Fri, 07 Nov 2025 12:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1762546353; x=1763151153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPIKY3pDWsZYiW/KD6AWR+JZdgeQXYTbfkJenmEgskU=;
        b=vaitNBo9rBs66HultLferXYUElO/jsbDUQ8OEDAsnkQTpHqaQ22X9HIFivEMgAQ9Dt
         q8X2xwWIdafUEBfqsiIVy9QFFTMsSc2uN1fX0YrAm46qRZhKJzbUz2XLVbUhgI+e+JXR
         FGl67rDPCCt2X87JgJqSKeBI0xK7156IYdcfOCWV3BwyNSyILGiVXb3YRrv8mGlcmkLr
         11codF3F3zHBxGti0S/bO3wObBNodnfo709ap2+odXUCe5hNXtXuczfLgzctGc1il5eX
         kdk2lPC/O39Up/PTnq2lkz0cXLUgJ4qBbXmVYMVx7a0pUpX2UO9Nmyjlt1WKixTXsE4a
         LMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762546353; x=1763151153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPIKY3pDWsZYiW/KD6AWR+JZdgeQXYTbfkJenmEgskU=;
        b=QXms26qdKPoK7rplVODtrpIQLoJUlSzb8AY8P37LV9R1YXkT5S/TsNMLgeoRgr/LR5
         5gFKOpkLdWfSNwMhfgiSTD4/+qAOMVQLoim3e8NYzXqQYFz/0N/uw0+bMBLbhTK1i7+k
         lAQKsEQO5a7ivLxsU2IkMMw4GathbytFS02MxE80LKEOuKcTDiEGbgKkirXsBPwpS7dF
         IfDV4xWrHyJ+rHvOVMN34Dl9KCDQ+TE3PYW7pwGCBlndSkRitlMXYAqORov7k2Ge9gUB
         j4QTqjEPToh4XMrZpMG9hnRJWsXocnne+rvHk11NlC7M4H2fytONKuQA2gQDQm4cLlA0
         NTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXbibPFjqLK6RbHOOHtcBhCLafK2j79h5YXw1jOU+dQYBtwW+PSl7n31z22prOn9cHp8QjuMW2YfAC@vger.kernel.org
X-Gm-Message-State: AOJu0YxHmgo32l3WqLFP0cEhnYxbE9nZidbNVxWxL+zT11ny16ZcF8XW
	a6RCg7K4KqH5/K+Hu1hjZ3r0EhfwhdbrQ1M7Q1p/XbljVyHuLNOTkeV6jyACdxhVcKc=
X-Gm-Gg: ASbGncu2BJhY3odqPDwqXXrhiB8YRnPPgNSdMgaAnsCkTJtjOftHr6cbMyAEO/15zRk
	GcLSdHSkLkLATKuMhFr/nmtubXize/yDCjuEz2TAQkI0beoHWfB9/KDO4IOqbkXMVPF6v4G+GLE
	B8IxEa7lO2iTQdUEqXD5Ed9Db4BjplQW2ZIh8u7VQ+mObB8BQ7CdukiJxX710EMw1X1/Dtxme4J
	o4LQJeCreuA4ltdSVdK2eXRrWofiDPj5nHzxiozqJh0Av0SeyMb25iqCR+qe9h/36ZzMUJRzii0
	/6lgDJcbgLEAy4DkzR8QhXqElS1YowTEW3KP9qyPFNNuSSdtEPbSVcL4o2c+anKMN166FjdRU6T
	k5kR7/YL1q2SsiaJFZGlFoTOiYNfxsnGpoblAhmPWA+iEu8/OwujUO5mfQTizDwKHxDqaa4pkjw
	9JiUjfNxU6ACKq2VpID4tyYfHoB72qzw==
X-Google-Smtp-Source: AGHT+IFsLLiomLTVAKf0UK7Kqv+I/lwIiIqePUIuZ3D8VSGGRtsZSWpNNzYLl1SSmqIrjJUQd1Y7Lg==
X-Received: by 2002:a05:620a:44ce:b0:8b2:33bd:7331 with SMTP id af79cd13be357-8b257f68729mr69675385a.83.1762546353068;
        Fri, 07 Nov 2025 12:12:33 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-8b2355e9bb6sm476602085a.22.2025.11.07.12.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 12:12:32 -0800 (PST)
Date: Fri, 7 Nov 2025 15:12:31 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: PROBLEM: boot hang on Indy R4400SC (regression)
Message-ID: <ea6p4efuwbrlqjiwkgjcd7ofj7aahfnnvnkooo2il36ggzrlcj@n6mcofpb2jep>
References: <g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu>
 <e4ed75c7-b108-437f-b44b-69a9b340c085@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4ed75c7-b108-437f-b44b-69a9b340c085@app.fastmail.com>

On Fri, Nov 07, 2025 at 07:29:25PM +0000, Jiaxun Yang wrote:
> Unfortunately my Indy won't go over ARCS prom so I'm not in a position
> to debug this on my side. I have inspected the code again and I can't
> see anything preventing it to work on R4000 family.

I'll try adding some extra prints to at least figure out where it is
actually hanging.

Thanks,
  Nick

