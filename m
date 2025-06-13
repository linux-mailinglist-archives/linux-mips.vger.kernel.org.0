Return-Path: <linux-mips+bounces-9278-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A7AD8A74
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 13:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390C81E1D52
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 11:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48AB2C15A8;
	Fri, 13 Jun 2025 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPS98UCJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4822DA765;
	Fri, 13 Jun 2025 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814221; cv=none; b=sfsRKqVn5v/7hXrzdqc5j5S9JTTtZJauttVc2xU8mTeIK5RWdBkhNCtGAT7xHGi3hqownPvl/aBp+OvWmL3jpNfZxBf0eHmAMjFeiy32zxHalh6j1iyknI3sIMhREnX/zCNfk1bkl1Tx8HSqinnlA5r1eFS/2rPx+nKpRdV4Kig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814221; c=relaxed/simple;
	bh=HmTH70bwTVYdKhhzFkJWDj+rGc5yhYA7N7SiMyn5Iq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MI3RhDuIB5X3jxmPuvHqupZZkUtlhxhT2EWnBOtEQDX7NVE479o7AZLGd45Y+vzYRyoEO5B3kTnF3I6K1ZuWt0doVqUjioBP2sCf8XtpDe59WFjNZ3C+/ROhdBn+ZIlvFkh+qhcUKh/s/RH0bCX3pcH02nu5j7vB9HG6Ua+Bulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPS98UCJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c7a52e97so1852868b3a.3;
        Fri, 13 Jun 2025 04:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814220; x=1750419020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmTH70bwTVYdKhhzFkJWDj+rGc5yhYA7N7SiMyn5Iq4=;
        b=lPS98UCJK+1STPVYYIyKLK0ko+VMGJQ8WYMu+HxEnX0h6eFa5YlonXZukcxjf1MhOQ
         YvPd7HcsS3i/AmJIHKXpG+ZZtIUE/bJXA3RwBhd8+m3edWxPtzlmDYKPHhouC37P9VjX
         r8y5Kum5VgLb0UkMeybZwLC/ie3AFKZ2Y8S0GFaQYkSoXhpJb6d+lTICIHSu70o9/m6V
         YMH2JRch8k+fn19ifQP53Nkfkt9degUpvZZ3RxoLRxCf8BtBXXqRVXeuq6xwLvXT8QGb
         /2MAywSpoj27sQMNPo9l8jpI68snAeW0825UTMALrJYs7lbAUPSDVyyYMGJ/QifNScej
         9+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814220; x=1750419020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmTH70bwTVYdKhhzFkJWDj+rGc5yhYA7N7SiMyn5Iq4=;
        b=auvVDmKpGezggr5b3QxJhoN0Pft+CFGyKzGGDssSVCqUlTaOy5C28Om2n2Jp8ce8hj
         u53tBnKpaF/OanmIvV+VS09GwMDDSc8R3FkfTgHviE2oCM3HChwFUBdeJdSK4pXwsWBu
         FVUKtdNNa7lsss5hKfA0DPwPsBz9GMWDS6g/kQVD6QTYQYbwZ3en6JiBng7sCBywUI50
         3DmzLpMQ5VPq+8zYV9c9b3GK2Al/K6FpphBMAd+lnhgdLaNhl6eSbfxTc0dFZ5ly1Obn
         VGd1xMe3+ueFSb2zeVr2RWcRC6IeNdxXCVqeiBM9q1SVmIjprDZKN27wtyq3era9JcVB
         X0BA==
X-Forwarded-Encrypted: i=1; AJvYcCX8tS5D2AsCKgCm3FyALIVF6ME2HxUN3nd6AETCMnwN9vV+auHmpcboYAVhKOe69/hzEM9I82KnzDNy4eU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEsK93LwDKqq3Qt80cUwxD3hU01urSP4wJtnAUyLe4KzzaaD+q
	B/x9KGPZhmTaw1bWLB8rwddeGatN1VnE3EqyKGsAPZru8Z2vnwo3XqZtNZK7sLdpnsd2xgLgEBL
	EnJq+Xy6py9mideEvyzeSJtufdfKTLA0=
X-Gm-Gg: ASbGncu3gsmkrPLuyxggDrWFz5i7xsLmOtybh+jVtj+VjgrISTRM+pzuXR3i5lCtbuL
	Md9o0X0Il/Hhosn8AAVSR0GVNLlgCxi5W/Y8oge+HImok/+h4xLNut/wKfJKQvQPk9592VHKojg
	fRA76yqocpC//RXoUs0qvp8LvwcjEzAb42JGIaArhG7SM0L8H6WkhqmF+yMIb8bVRVMkswceV7v
	8/fjQ==
X-Google-Smtp-Source: AGHT+IEaF7K0lYWD/qRC6qjzQQCSi6NzXwISbPksiOJyDpIZrdNZ3BriDHd1PZooPsJor1sEW6s9LFjcZTlfyCHbxQY=
X-Received: by 2002:a05:6a20:3c8e:b0:1f0:e42e:fb1d with SMTP id
 adf61e73a8af0-21faceed350mr4155660637.36.1749814219630; Fri, 13 Jun 2025
 04:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com> <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
In-Reply-To: <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Fri, 13 Jun 2025 13:29:43 +0200
X-Gm-Features: AX0GCFulFU0If5AM7oDz-AO-al_LHNimx-YMWb9H-ga_I3tHdMdJmDX_Y7Hx6nI
Message-ID: <CAOLZvyGTRvBnpqVVWB8c2uukk0jVRar=DU_ndS+gxXvxfcM7bg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 12:39=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> +Cc: Bart.
>
> On Sat, May 31, 2025 at 10:43:46PM +0300, Andy Shevchenko wrote:
> > The 'struct gpio' is not used in the code, remove unneeded forward decl=
aration.
> > This seems to be a leftover for a 5 years.
>
> Any comments on this, please?

This is fine with me!

Manuel

