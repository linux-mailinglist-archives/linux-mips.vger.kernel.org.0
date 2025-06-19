Return-Path: <linux-mips+bounces-9416-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 474FCAE09DD
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 17:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD8DF7A8885
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 15:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E4D22D7A1;
	Thu, 19 Jun 2025 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqM7AO5U"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA39DDAD;
	Thu, 19 Jun 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345770; cv=none; b=bZT2xff8ku2xCowNY0Xh1O51jDC3JLBCo1tL5H/Hzm3/25asZHX3FIf7P231NqFMfj45LJYiNBqjZ1BsPsFx9WbGolmBQ2sbJ/LJj7ZtyY7OrWGtt36siPPy3kbq7KeCmfGgTp23Erc2CdyjpR/x17Y/d4590Z1p5cXWcam6tpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345770; c=relaxed/simple;
	bh=HEvp4fBuOrjvsapFDRXsKrviD9BOWcxkwsVTAxwlBg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atRqwJM4Pv4tMt6qb6sENCLQHd3vdpGmXE9gC7efLGrEp6oSnXsGA3WwV/15MkHoblIHa/hZ6wJwZzb7uiln4OzylR4vdZgu8qLDVn5DKSUZ5LujVGN6IW3+g7smEM34vOM/svBemu+AykK+NAqgZ7oEVu9cWhYo61RIk1/FATM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqM7AO5U; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2366e5e4dbaso7059245ad.1;
        Thu, 19 Jun 2025 08:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750345768; x=1750950568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGx01NHzknv7sazk+LVrYeoQMIf3jCaqKqqskaI1EIE=;
        b=hqM7AO5UgFOAXp0sO3s27zW26VeJbrdkfj6U3jvOEzBBUGEWNGK7HyhF5HIDU8mJoP
         b6KECyaLS+3NWicfrUGWn1+cOhBV80GGIGrIjLX+KyiVGTIR+hIlJKqEHgrmdSkqQIh7
         WAImcp+T1CpC5T8CBAJBvCLUpXCcDq5Kpmq0YAmQyVVssr4o556qYgyBY2OQFe1lODwA
         O/x0yPjdwm9QrCCCMy/+CiQU55jmBvkbtwtjZGxVrcYYaf/v6/WYv4LMDtpB2Xk9JO7H
         IcWOkNlkOtp081jmzPfZpEdoXH9+ktJ952HMmX0EbMfNCOeM/3miW71sPLfcjy4DsPpc
         vGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345768; x=1750950568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGx01NHzknv7sazk+LVrYeoQMIf3jCaqKqqskaI1EIE=;
        b=hPL5h5ZNB/QzHZDgFySwSHF7xpEccPDRqKiVfhWSiDQ1L030xXeMK6zLOGMDy5Oo+b
         HpBhxNszq5tkBh2RexRcNEJGrDgJ3Vz1/zJC2FwQ9uBwdjvsJ2dmfbFDAVzZvJUvwwqZ
         r4R4AmBWIHiIzI4DO7n6cvXxEABvgMtdK2NQFs6WHDLaMBqcg04tTvZOgtuXNPTnFLxJ
         FJufZqetlA37v55+/ulumg5bU5CpnmkTa5svdkI/0KspNLN5knqIziqY3II8Omo9kgeW
         Map+Y/MhtoXbG/D4SMPwkjQ84v0VuG6D6vgdge/bF9KD56GZ1Cp2nEuhsGXdYIdzF/5h
         LlQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2hkkLIBdLLsXHfxXAlleLHQ3K4ephVTVUu8lx45+vcUwbTOA3OrpdF/XZQolBzWx1g7cRxgVceSy/srk=@vger.kernel.org, AJvYcCXbo97jSImdOMbfXacZqZ0zB8uBKJTP1fyclN3Jg3M9ad0kto3j2QDcRTZnNfizXg75VbTchYZhaImLGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxnHMP1RlePQo3bAzFdilO8w+DUKzk38cirQ43fuFsP1wlUbJj
	x27CBg3rcQpguNLlGgMX9cvFx172fUFQfmDY4psq7TVyD8nXtS15b3K8YYiEjvVCu5HMXIVyewZ
	BHwepXRiPzRTktkkXg/uHtArF4I5EmcU=
X-Gm-Gg: ASbGncvWpO6aZnvysys0DKzfGv7618acCsPZsjXkzpKIb6srIRft8iBGXdMn5Gj/rEh
	D0shp233F1UQdUm0VnERSB4BfUvHdQPy9610An10CJUN1WNaFL2YA1AhcT+2obZ6CTG31u4Ry8m
	RTy0auS/bvc4PHqYLtAKkxxybgVn93g/ieAA4qkJLv
X-Google-Smtp-Source: AGHT+IEVCk58oo1QIM3vXEHImn3+adyQd1dRV6D69TpTXPNDcgqxh9l2Ve2RmgHqQ6Hj4L3GqfP4nJTdiXS6cWqY0PQ=
X-Received: by 2002:a17:90b:3802:b0:314:2cd2:595d with SMTP id
 98e67ed59e1d1-3158abf405amr6597387a91.8.1750345768311; Thu, 19 Jun 2025
 08:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121917.35899-1-wangyufei@vivo.com>
In-Reply-To: <20250618121917.35899-1-wangyufei@vivo.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 19 Jun 2025 17:09:16 +0200
X-Gm-Features: AX0GCFv90HHp8of5Ln8B0f_vuFAEXUVFRzBiOqVDxLWGwAmilCDyOvQ3xN-wjgw
Message-ID: <CAMhs-H8_FUpsAQCVRxb0yKUD66gntGKi3EJ2nAYr9TmGvTEsbg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: Use min() to simplify code in rt_timer_config()
To: wangyufei <wangyufei@vivo.com>
Cc: John Crispin <john@phrozen.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 18, 2025 at 2:21=E2=80=AFPM wangyufei <wangyufei@vivo.com> wrot=
e:
>
> Use min() to simplify rt_timer_config() and improve its readability.
>
> Signed-off-by: wangyufei <wangyufei@vivo.com>
> ---
>  arch/mips/ralink/timer.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

I personally like the code as it is because it is more readable at
least to my eyes :)

Thanks,
    Sergio Paracuellos

