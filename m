Return-Path: <linux-mips+bounces-12218-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49581C55986
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 04:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43ED3A486F
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 03:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCB11A5B9E;
	Thu, 13 Nov 2025 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="GeVD/1ru"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B302929D281
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763006011; cv=none; b=TFvBUHHaX+5hevTrVMyUyHN3b4DUriBJqUDfvSQenbslreqGMCej9ouL1oKV5sPqnWTyAwV5JaoYia+cctjePl0FQ6WhaHjblP6uRZWearjjL0uAP+Diudh5rNl/WGECbC43gsI2+HlnSN+52e0+Pvzcb4FJS92sYZC81mfH3pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763006011; c=relaxed/simple;
	bh=y1LSPNobZQla9NMwQ5IY+yLjCJ+5sj+5zGOH9ueavJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/oMhbmwyVJSOU4KsUmA5PHaq1qVsAKvtqr96ZQsDpR54QxHaGEl8Lxy/LjHjGaK0YCDa816rpSk8xfSWn82PTo8MfyKmhoa5HPY8+LC6hpMLFHzX5EQCjanmzOvPFG2mmvfh0eTKdWw7XpwR+OVqEAoM+7HxWp0zXcueuOjxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=GeVD/1ru; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b262add487so41201485a.1
        for <linux-mips@vger.kernel.org>; Wed, 12 Nov 2025 19:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1763006008; x=1763610808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CatzzopAdgFr+BsmM7xa/JPPEprIWTodqEFVEQgfQnQ=;
        b=GeVD/1ruUJRtJaqo5hmHR545FqUuXkmsGg92bLA4f/ORMTiC70RRihbQa72/KDD/Ql
         jUmCEa8Ek7bG5bPCIs733ZVPvLn+tX0v8MPgChGeSgXWyWbVbhq8u1+gdC602JzwkNMD
         fmsYJJUy1Q4yFOExPo5qJtQbXSx6g68qL3SHgg94An0RFLNFgDnxnd/2zzC+NxXLmDUW
         0/v3VdvClgqfBDTcrh9/DzqX+3A2tYWSRKDdAV10grbtnwuSxjErFKg3fBGdVxWrMNiu
         nQM6Y9AMCTMy1G+uzSh7FzIePJymtUoWf8+F/5rJtvqW4dIxYzuOthH54zPIXd5ERgG7
         fUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763006008; x=1763610808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CatzzopAdgFr+BsmM7xa/JPPEprIWTodqEFVEQgfQnQ=;
        b=hDnfh08FMYgtDfBemkhoc3C55d8QoE1fgVdOgGVv3ZkzUUYl1Ea+rUHTmfZJ8qW9Z6
         yw1qTOOBTxTI9fsjEJ3HRO9sxTiFk4leh3mMdxrPyziD2H2SbEN+a6q1FERnWwuSqu2D
         mZ37ljMp1D7M0kwI1I29ALRNkJguRkuryWypxP7LA30LZZcb2yicUoNwR80Dwfnx15+x
         nlVGPGcwmrC++cGbJFNUMkybB670IJfhcWtlUg9kLfWDxpWgqNO/GIoyJIFP88WwYsVN
         j5RL75SQlSLzxvPsjxKRM531YoOxpGirA2QSB+b35dxT8KgFPooncIX4+0d7dTM6SRUY
         kbMg==
X-Forwarded-Encrypted: i=1; AJvYcCV+tllOR2PBNdWa5fP0DIa/BgyJf8Oo4FSwdJXzrRBx5lEy/G0bJPrAXJLZ03sfNyhseQJrcMLp2pob@vger.kernel.org
X-Gm-Message-State: AOJu0YxvlmXifs0lLvlr1tJUiFBlj8BEve9r6QRBr3tGu6rSPGvTVOkG
	/hRyvgYKuUeUResO1UQYSm3lqUj4MYrh3B/mQYkwkAW7ASNN3pt4KxGWOMmorjsYurM=
X-Gm-Gg: ASbGncsKFNRyUdLNRwsvG1Dxq6sh+u2jaIvhDYaMHjMXFglJhUzL9rEZjeQ+GF3OMMK
	jRSUN2YTNTLyypfPuooINxy+7WU9IdrwXnK9tuxgooJScvyRlzIm3icaHJ8prruSZawK4TpQeGo
	AYdhUF4c7szP8Jo5Cd8sQzjrFf8eNO6YUzW12A7wNEb7XWTmfE8xtUogQ2BLI3pLjxoDxE+DytF
	wHPFCkwIfPwYSlSgLxnwNi118QFUOtjHba6c5w8Aa2AR65ixTvRKZXiN3h1mxVnA7blVBxnEen7
	9/+41jeZgRXjjSywg+6PCMeum7p5As4pMYpC0DIt8uZEregk1roKILgWaB8Cynvz0Xcl/DhVRjT
	Ik0kzZDKLLgtSBmcWlfxTXnxEvRQ27IU43bJc64RRO/rdhX7wgQ6PuocEMpwdqLh4EemJ0PbFWl
	YD9Hb5cCMfvPYgQ9+MVnPfpyUW6Ca70Q==
X-Google-Smtp-Source: AGHT+IGpleopjM4MDAheJaXpT7eQ+N9O9y3pHUJlCfRc6efZHo8evHnkFSfXUU+sWtqzH8WQFDcJgQ==
X-Received: by 2002:a05:620a:2902:b0:8a3:7567:bde6 with SMTP id af79cd13be357-8b29b84c1dfmr782009285a.84.1763006008363;
        Wed, 12 Nov 2025 19:53:28 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-8b2aee9e4c8sm53627285a.12.2025.11.12.19.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 19:53:28 -0800 (PST)
Date: Wed, 12 Nov 2025 22:53:26 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <tsok52tdbt3z5j3i6ht22iko3mdqeom2ojcvvb52pwfbjnzzyy@mcwnzfpvksee>
References: <alpine.DEB.2.21.2511122032400.25436@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511122032400.25436@angie.orcam.me.uk>

On Wed, Nov 12, 2025 at 11:42:11PM +0000, Maciej W. Rozycki wrote:
> This fixes (at least) R4x00 cores if TLBP hits multiple matching TLB 
> entries (SGI IP22 PROM for examples sets up all TLBs to the same virtual 
> address).
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")

I tried this one too and it also appears to work fine on my R4400SC
Indy.  The system is booting normally again.

Thanks,
  Nick

