Return-Path: <linux-mips+bounces-12197-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305DC4FF63
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 23:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5DEEC4E0F87
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 22:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEAC2C326C;
	Tue, 11 Nov 2025 22:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="w+1Xe0IE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10812283FC5
	for <linux-mips@vger.kernel.org>; Tue, 11 Nov 2025 22:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762899467; cv=none; b=jsTjIiVaVYmoVkTHg0fQzIkl51oZ6oNrgD/VXy2wboV8IYSrdKy/MxyKCr+AqWT6gSb0KjHi/DqitsqNEVZVrqNHeLveF6zgYswxLGMaY/FeSfu8Qh7ABU1QkEAQ2wIA8oOcFiiRJGQEwfrjlh4MkqKdTeSV/ZySqSW6xCZEsuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762899467; c=relaxed/simple;
	bh=LUfJ0FUszw/lMWwcBkVzYmFdTPbMBBt6NZCCwh9vWDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHpYebAf4vIvObswNNMsKX6jQyliCPN9bQxsSHF5iwhf+MG7wlvpv/mvFaZMlQfWDWEH4imuJbVR+q13FJBrJ4y/KAiLfqioSifNzr71KUZEN+PJuA8qHPgaO4I5OTpZBEZFVR9SOTlTtjDM3ASXRf2N+kWfZkhHUuSFEI7Q+SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=w+1Xe0IE; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88246676008so2306076d6.3
        for <linux-mips@vger.kernel.org>; Tue, 11 Nov 2025 14:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1762899465; x=1763504265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXzEi3kwADspB9uGnAqBRmtVLn10E7o5jxATEd3rTNU=;
        b=w+1Xe0IEqnJgvJ9hDYVAbXKA9K3KNmSs8Md4i7nc0jST1OYZkHrbdtZwteTKBXA9vR
         +dtgj41GXGrsoIvUcT2VSL1H3DDpDHnEtbIKkJUIj0vA3UZK3v/M/Bt616Yavh4AlA58
         nyEsHGfgGOW5kgrNyz1DxKok3l5Wr6/O3ZzWG7TvOKTJOnkACIkFrm5wD6mzKhyNmEyO
         6S1Ik6fBEnhWUBJZiO/kIoGRhW2XAWLizB1/gVdA6UEpH8N7j5HGym9gA69ExuRB0qP3
         AJlvXXY33Nd7m5NnJXUQvv7+U/6IyxMXHKuyGcvWG/8L29nmmo+hIb5M/bGYocVPYZ6o
         vBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762899465; x=1763504265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXzEi3kwADspB9uGnAqBRmtVLn10E7o5jxATEd3rTNU=;
        b=D7DBe/VOqBs68zciW8Nin/t+GyfRJ70nUODEhBLD/3a6hqyZr8z6qrnKlZCR/36tfA
         qXUyn48NlkYDq5xFGj4gX+/KRYlVBHH04bV92HYMNbUY7N69iepi1qJEiHgkNiIMrSi7
         nu8MMZ1CIKpRKpXm4L2YoWnGJy2qdqTXUKjMg99f6FgNSpKLGl3Btv97088+opHrEPri
         qiPlksPq3OM2T/xjiL9DY4nH/TRLbpXIKxdnHU72I9FZqZi9k1OeMSsVHyd/5A+fP1gb
         1NJxuVqSVT1K1MGbFrr4OX2w/bqzust3I4VhXZdPAQIm2K6LLrOlPoQBqjzbmzXeZeC1
         LNeA==
X-Forwarded-Encrypted: i=1; AJvYcCUfr/DuQRSz+nCnZIOZCxRQ+3/VB7FU+//cw1/fOX/VhG1riCSeuqwZWbVXM0deZrN8WzxeXaT+/9Qp@vger.kernel.org
X-Gm-Message-State: AOJu0YyYJQFyQ6axXq73d/Fj+yDB4v/i7IQBvUP96EZ8WEHuZTzKvnxt
	Eo+WLLlpU9zvYqBDbN7Zwvwy+RONG+b4XyeePafseiptZgBsMbvGFU27VRq1827Wzt8=
X-Gm-Gg: ASbGnctDPcYhnUlKzKSJLewRejCTsSQRBPvbtNYZD316kZODsAjGhlrfcpfta0qxmPx
	6XTrSqvAh5N3pAs9hJYlmL2Ej0XW21S2BMksmMtg6TlGv30sJZxCrLz0o3KxVbTnup3von22z8N
	lwuXb3zI5PLEmfE/totiUpfYtd9AzVdbmhV7uJ1Hd0lZKT0xZNjgUmeMoXb3pUsMlfaCJmy9STD
	sTgALCMODd7F0xRd+lbr/QEIUMWAhpDu4SAKRPNrM5rDoXU5c+8DHXsADLPx6IY6tRWBL52mni5
	Lt3v93uzdcBYVZnz4SS0Atc+UjHFrO4aULFa4RTliLZV54Af527z9Np8b2BE32jQHgd5MgYQ0/m
	gDkTF/kq1u8TioVPbr8p4BVfhfjOZk5ScUApZ6b8j8AgdR/FMNAD8/AIdphtLCvFEdUmrhY0SOO
	Yvvij8id5wkuSO444nZGGTgZSxLb7Rmg==
X-Google-Smtp-Source: AGHT+IEia83T9DAZr1U6CtvLbgDwmCeTmKeArNboqrVpyZFeiMKt6z0RY2/FwY0aGwIMLWlwyoQYtA==
X-Received: by 2002:a05:6214:cae:b0:880:48e4:198a with SMTP id 6a1803df08f44-882719d6880mr18229316d6.32.1762899464853;
        Tue, 11 Nov 2025 14:17:44 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-88238928a8bsm80646736d6.12.2025.11.11.14.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 14:17:44 -0800 (PST)
Date: Tue, 11 Nov 2025 17:17:43 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <no3uc7kk4ohwrzoc7opcrj7poakjxqrwamt6karapdfaa3nwht@tgvacwyjj6zf>
References: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk>

On Tue, Nov 11, 2025 at 06:21:46AM +0000, Maciej W. Rozycki wrote:
>  I have verified this lightly, also with some diagnostics added so as to 
> make sure things get set up correctly, with my Malta/74Kf system for a 
> 32-bit configuration and with my SWARM/BCM1250 system for a 64-bit one.  
> Sadly the latter box does not finish booting either way, but it's to be 
> bisected separately.
> 
>  Can you please give it a try with your systems?

With this applied everything appears back to normal on my end, no
problems are immediately apparent at least.  Definitely not seeing
any kind of segfaults during boot.

Thanks, 
  Nick

