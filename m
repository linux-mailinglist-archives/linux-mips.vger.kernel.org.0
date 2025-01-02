Return-Path: <linux-mips+bounces-7222-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3069FFB5D
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 17:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CABA43A2DE1
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 16:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCA51ACEB4;
	Thu,  2 Jan 2025 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BwaIL4AJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70101AF4C1
	for <linux-mips@vger.kernel.org>; Thu,  2 Jan 2025 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735834240; cv=none; b=Yj4K6iv2ZU/Tk+xzj/Hnr80a0NP7kM33MUigSioK4wmXhdZhtZkKpBpCALEcUJd62hIh+GMQRetKcQA1xU8hBt9efasHBgUkwOd1HtlVBbBoAk5q5328PanX5h8dd0fb4F9NaPKob7cehgGA+8eAmgJyjdx+HloFWwDX1Aj8dZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735834240; c=relaxed/simple;
	bh=pW2Vii24duUQKNBOuRttubvCOk1O/hZ6izDua/j2GBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLCUhrmTAQ/BTAvp7WgRzkQUxpD2qY0H5hkEzxA3xlXxhLdxpKs3FD/2DfDhlKzE3TzpQ9ale4T9EhSAoMkWH/BRkjvNoYdgGNdoUlura81ggvkbYrb97ueXXpMpKV6Ul4WT5HccYPkzyORaw7pZYgIW+ocQzWh3/RZ3KG10mPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BwaIL4AJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43618283d48so83740015e9.1
        for <linux-mips@vger.kernel.org>; Thu, 02 Jan 2025 08:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735834237; x=1736439037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w2MW83ZlBEB0slMAIjVzh1uN6EJmqPsNX84g/jW2efg=;
        b=BwaIL4AJxBxAkyMh+XqnD8OhhdfqA+kkzKSj2rWEPDF3kb7W4/sfRVdMrOA01o+h0j
         zaPjOkh0he3oLs29H+coms7irY2wIVv/9Egfst3Us4nWkW5kw13fY5cdlca/23RA5lS3
         2jiUi+uJbSdgL0vAhbN4SP9IN0BKftO+bqvUHBuA0cWVXNiniTh5ch/4Jt1AoJxLsxH+
         7OehgtyXkooQ5cYrNm2lOzp7jzs16duwjkuTWGWRhI7pqhTR+EdxLTEtu+E7nkxw+Xqt
         smVxKmsXeqelceg5dSACSbukCmL62j5lftBWgGGBQIm8Pk5Qe2VvOF13isoqHumdtczb
         QZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735834237; x=1736439037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2MW83ZlBEB0slMAIjVzh1uN6EJmqPsNX84g/jW2efg=;
        b=pXdLfxHUyaoILuoS8CeMkmzaZbwujjMvB0DQ/zhwMdbHJMoYb/6q6sBOE7EvZ6fLtD
         sNFeVHdzLx1+JefxnCYIrshevTOwaZbh/2U4YVMmgCMyJqmp4V8bJ/qrVpWER+bm98xn
         tGOjej6i1KzNdJBbSTak0WDIjxkdg6/cfHdEpx0pfQkuhagwEmhtVLdbGDZ8oLG+4tUD
         5XcLM7kKqe54bhMeBFdQWp2duq5OESnzNd3yQY3u7MPfSGmfVPR/kAH2jB/aim5bNTVu
         imDSmIQp16y7zOoQZ35pkbMQD/sNumnNuFEbe04h1LgYVpZ6npOrrZ3H63+vvzc1u+ZU
         3ryw==
X-Forwarded-Encrypted: i=1; AJvYcCV1E9RtNQu7iPo4UAAi+qoSwL+iYeUoYC0TNFfLsAPsTl8BqJzIQjb927+D82KGElVqtNOeRMUqenGI@vger.kernel.org
X-Gm-Message-State: AOJu0YzZni3Bv7l31qkgP57lbmppArAp15vwcM6WO3r7xb+qLJTfuS3u
	IIYew3nhp8ONQ/RDNYo1MHc2615TXCkn3gY9e+P5Zkuk8ipSffuwH/cVhZtE3sc=
X-Gm-Gg: ASbGncsIoAj2mxGynAQHklKVtR47bcwEug7C9aAuxXiUtWvUtV5MzePlnARD4gbzDgV
	acOP4B4rY1n7ElzahQVcmVorhSWvaG7g5QDEK/rjIkT7Bm8MGHsuZM1YR6RusXihCckRDQPK5BE
	2SK+yCpXv4RQZdgmDTot5SSt7RBUyrI3Z7U3r399FoXpsyTU6oK0q2sm4L3/TjCeZaZwa9+/fO0
	xdnyIOjgBCBp7t4iA95d8iU1ole1pMzZ727aeyBl56vYD5Ds4JdnPAYlg==
X-Google-Smtp-Source: AGHT+IErl4BqanoYDVUAZsHsogjaaRwncA1U/OXvBzPwYOV5N8q9kJ/EGpWxK0q8/x1dmkcwBA2jNg==
X-Received: by 2002:a05:600c:35d2:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-436686464cemr420475395e9.18.1735834237013;
        Thu, 02 Jan 2025 08:10:37 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11aecsm489101735e9.23.2025.01.02.08.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 08:10:36 -0800 (PST)
Date: Thu, 2 Jan 2025 17:10:33 +0100
From: Petr Mladek <pmladek@suse.com>
To: wzs <wangzhengshu39@gmail.com>
Cc: dianders@chromium.org, tglx@linutronix.de, liusong@linux.alibaba.com,
	akpm@linux-foundation.org, kernelfans@gmail.com, deller@gmx.de,
	npiggin@gmail.com, tsbogend@alpha.franken.de,
	James.Bottomley@hansenpartnership.com, jan.kiszka@siemens.com,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	yaoma@linux.alibaba.com
Subject: Re: watchdog: BUG: soft lockup
Message-ID: <Z3a6eQHwjRdwnDXp@pathway.suse.cz>
References: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>

On Mon 2024-12-23 14:32:11, wzs wrote:
> Hello,
> when fuzzing the Linux kernel,
> I triggered many "watch: BUG: soft lockup" warnings.
> I am not sure whether this is an issue with the kernel or with the
> fuzzing program I ran.
> (The same fuzzing program, when tested on kernel versions from
> Linux-6.7.0 to 6.12.0, triggers the 'watchdog: BUG: soft lockup'
> warning on some versions, while others do not. Linux 6.12.0 is the
> latest stable release where this error occurs.)

I am not sure if I understand the above correctly.

Did you test also kernel versions older than 6.7.0 or newer then 6.12.0?

Was the result random? Like for example, did you saw the problem
on 6.7.0 and 6.12.0 but not on 6.9.0?

Did you try to run the test more times with the same version of the
kernel? Was it reproducible?

I guess that the problem is in all versions but it is not 100%
reproducible. So that the softlockup happens or does not happen by chance.


> The bug information I provided below is from the Linux-6.12.0 kernel.
> If you need bug information from other versions, I would be happy to provide it.
> 
> kernel config :https://pastebin.com/i4LPXNAN
> console output :https://pastebin.com/uKVpvJ78

It would be great to see at least three logs. It might help to find
a common pattern.

Also it would be great to provide a full log if possible. Or at least
the boot part and few more lines before the crash.

Best Regards,
Petr

