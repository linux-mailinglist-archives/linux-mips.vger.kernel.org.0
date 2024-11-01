Return-Path: <linux-mips+bounces-6610-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E19769B919F
	for <lists+linux-mips@lfdr.de>; Fri,  1 Nov 2024 14:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5999283C66
	for <lists+linux-mips@lfdr.de>; Fri,  1 Nov 2024 13:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C626619F117;
	Fri,  1 Nov 2024 13:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jegx8+0E"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969319F424
	for <linux-mips@vger.kernel.org>; Fri,  1 Nov 2024 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730466773; cv=none; b=V/Fg/kE1YlTGOVu8zERA015SGrSfVr7PtccDlG4n4hFB7j+YLtMs4/O2wj/4y7fYWhd7qSci8AqorI2PT/WiTWTl/WB+RGDgBOOBzpMEZ2NvnWCAOqXYX2Hr9E9R927FrUw0bCsqf5rar4OxYwqutya/bHHOgbtJ3R0iSIJ7ar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730466773; c=relaxed/simple;
	bh=4cN1JlM2Dy7gkEB1Xf/m1hys8/YrHFUZnov1ClF8ucM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3B9rNrLW0/Zqco3OOxsdj+Po0N5n9bx+WLFQGU4WczZ/O02e2TMY3osLy7D9s9UCEJJ5Z4/G+u9cAMUGd2E8hIwWT9n3ei3SATaV6NuQQmdi+5F0oNwEIZroJPCW6cxi0TlfC5Owjdifa6acVjmUKvk+1JPa8XA6NOBsWC92j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jegx8+0E; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cec7cde922so82345a12.3
        for <linux-mips@vger.kernel.org>; Fri, 01 Nov 2024 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730466770; x=1731071570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cN1JlM2Dy7gkEB1Xf/m1hys8/YrHFUZnov1ClF8ucM=;
        b=Jegx8+0EZ/RLK2YdWtoA5N8BJOs+GYBCG5pbHr4Fl52Tv9l7kAUVnWOEndbJhmJJFz
         icmwysncFTuXfehKsa77rgELt+hZG7CwrDzXnhhF6tPQzifiVQuHpJ6TWeqnp5d//BDs
         ss+1YgePxqqcUlapwQHg1Kz/3r6MaD4IxkEnnX+HQ5wF7KTCtpJq4hMhhwCkLd86XWvN
         Iks98dCaB5ejZC8rdP0vVXTdtevASDgbimuYm8Gy4JwZ8g7k/k2HYNQmNTwimU2t1Poa
         0ncoK7PtZJfFXXjbzaNRgVwiTQo0nX5HEoDd/mGIz9UL6Y5rsP2NPNuRhHnR/AeB46WZ
         OsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730466770; x=1731071570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cN1JlM2Dy7gkEB1Xf/m1hys8/YrHFUZnov1ClF8ucM=;
        b=YpGEe3w/RRJKqM0MFun2u/tVCdlOzOlnr16Kr08bjn8lUvXufyTvSYdgrCYECgE+rV
         IFw/1aCc3VMxvUrc1M40HXhzx5I/GpeMYb0kdds09gbp/6D7DBRonu0N0EA6p1+l986m
         oEyh17kBhSdzOIeaXiXSoThPdUW9YkP/SOW/+oHh6V90KDqBUzV8Z+8qrq/p3jcPK7oW
         c2OShe7acBE53BtpHkm7ELimAriZfND0K536vPuoUIH3kWry4w1O0UnA7yVM6EKhItyD
         2Ani724F6g82JpErA3i+11rbDFTsX0JTSTq1diNS7OYWk0m+OEpQtjgSkZrLgaLTWe0x
         AFew==
X-Gm-Message-State: AOJu0Yw0TemmzIUFcaIRS5BY1eOBDvcUNmT8CN2BUm6dN7pS96XlYkQW
	dGFDNiqfwkucGAX3awit+SJCj8YAHrWot9IBLJe5T0mz5tbS1UAYf7l8Oew4MK3Qqmt14mTVRs3
	FDkhvs9cojFI1lom9fCvSmf7xbdA/doGl
X-Google-Smtp-Source: AGHT+IHJ6eYVwx0YQE2DVzHdW/fZ/+9JSxGuFG4w4jF9phPqbJj16t/TmzbFvwYiDDBLI/CxFXaQb21fUlItZRsnsVU=
X-Received: by 2002:a05:6402:524f:b0:5c9:7f8b:4e3d with SMTP id
 4fb4d7f45d1cf-5cd54af10dcmr8778585a12.23.1730466769556; Fri, 01 Nov 2024
 06:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAZ8i80GGmwy5u1dPoG+f43PxGgD_pFhOrQkEr=5bhmLfn6sSQ@mail.gmail.com>
 <3105ecf0-f00c-4d36-8813-ec7aeb1dfd08@app.fastmail.com> <c90da3b6-4c13-4d52-a0e7-b2247beddc09@app.fastmail.com>
In-Reply-To: <c90da3b6-4c13-4d52-a0e7-b2247beddc09@app.fastmail.com>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Fri, 1 Nov 2024 14:12:44 +0100
Message-ID: <CAAZ8i83oMyoCYPmkX1CWWouE=AGfp7K=nOAqS2+7n6bT7sEDNw@mail.gmail.com>
Subject: Re: SGI MIPS, Speculative Execution issue
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi
thanks for your clarifications.

I bought this book
UNIX Systems for Modern Architectures (1994), by Curt Schimmel
(found a few on Amazon and eBay com, ex library books)

Yesterday I also printed a copy of the MIPS R10K user manual.

There are a lot of things I don't know, to learn of course the fact
that not all R10K CPUs work the same, as Kumba pointed out, is an
additional complication in systems like IP28 that are not
cache-coherent

On Wed, Oct 30, 2024 at 12:59=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
>
>
>
> =E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=888:56=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> [...]
> >> Worse still, if the speculative approach involved a Conditional Store
> >> (SC): will it be restored? No, because - the manual says - if the
> >> cache is involved, then it won't be restored, so this is a real mess
> >> that needs at least a sw barrier.
> >
> > I don't really know R10k implementation details, but IMHO since SC can
> > only change a cacheline between two exclusive states, it doesn't matter
> > that much....
>
> For LLSC I'm wrong.
>
> See: https://inbox.sourceware.org/gcc-patches/490A90F4.6040601@gentoo.org=
/
>
> Thanks
>
> --
> - Jiaxun

