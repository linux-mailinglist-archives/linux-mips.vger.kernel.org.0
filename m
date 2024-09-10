Return-Path: <linux-mips+bounces-5523-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A5A974587
	for <lists+linux-mips@lfdr.de>; Wed, 11 Sep 2024 00:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711B81C21034
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 22:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17B51AC8AF;
	Tue, 10 Sep 2024 22:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3V39Y7X"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628861AC421;
	Tue, 10 Sep 2024 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726006589; cv=none; b=Yn98ULtLpn7bGqf0yjCU9JKRBq2QQGjEHQhATdUFTNgdY4ZTEKHrY8OvRQLtoK9ApwNwjz2VXl1m0RfsxGeWDF/0/148Qv1scgOf5xrBoAVweBmlVEXr0Dgoso0psLObNszEVJkHRXi4uM5msv92GwdrCVkgETUdPl3jRQhnPCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726006589; c=relaxed/simple;
	bh=QSttr2JhMVXlGbE1Qo9deB59dtCrXed0BMMThrUfqGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEqBHhh4YAh9sUFQCRDJKwI54vYVPXf/Xs/go467WPC7PgBe4bs7/6Dfs6Q9MLVQIUL3w7ZqvjeWmhHIS9ti4hWYarT9zxwAOYuzoSuV54PZEwAwizx6U2tlkIspuhA18QEb5u8doU5nHw5U5u/MoYKSsSdFViCghTlQjy6pDgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3V39Y7X; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5365c512b00so1674166e87.3;
        Tue, 10 Sep 2024 15:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726006586; x=1726611386; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pdYjqVV7NoPt38X5VJbQiOeKKRdU/zmfKbbwAgjGMD4=;
        b=i3V39Y7Xlb6vVqHaR3TiMtTT3WLmhzbwFQisYNwtTbyvPFdErUaLgsGAwgKhXzasKk
         3/KBLLmtxSDUHU0i7wRKnlchB5CZ6TwFU8n4ySXH0bKncksWvvS/OWAa7MgBtgMSM4+h
         zCm6PekK4WKEH0bwjsoNBdul2bGJriMwVn9MPeZoRK/voYkH70Y2NTC0D/+W9VBi94cU
         DglN9NwxDZ9DukXzM1BpG9o9UOpkCfF/BFcfAcFQlH0NK5kr27kucADh+SG42Uae22ll
         Uvl+0kj3tpVq9SwWWpzYdblYtKqSFrZXuHI2B0uCsE3SdByhfh/r5VjZOATO7ST1Orjz
         9MCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006586; x=1726611386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdYjqVV7NoPt38X5VJbQiOeKKRdU/zmfKbbwAgjGMD4=;
        b=IOZMDp/Wc7gIzw6C7dmHfn4+D6oznFeN4PcUufSN06QqNz7Mo/9mNmiw/GAdcGSJ54
         EaiTFJv+dih8NWhItdMQgaToT2UJtpfzT3SZGD2n23JMNJq8wEOmzP5Nh7i51AEdLw8T
         oo2nNm3rxwrJ8qOZLI3G6FIHjg9uduZFfiAXWQagUxBDGnZayVJS6+VpRT6fUQDc7XKk
         R2FuLsg7gMbMZksQPxSS1gAk7pPtCWKUgoBUD5COY+vcTc5PXUscsq0BJnOGlqvN/hv9
         uEecwbzafpbOn1qvKc2bTBqHFyyzJrpfSdjUj5ZeI6ps+ZiBFpHj3TtCgKuA6mwOkdQx
         iYqA==
X-Forwarded-Encrypted: i=1; AJvYcCUfQN4o4h5k8wK+VW9FioGd2L/zVLsQV+JSVMYwuVOgTVUbAo4Wf3qFLP33KghWpDbrGrMxNEb76jud+g==@vger.kernel.org, AJvYcCUuQewCOWh0xUIzO/6+tBxeY1lNX1LpDlqR+ed21SdQEw+qjOJWWE3fRyck55pJtTS7PHCXG70bG0mU@vger.kernel.org, AJvYcCXi5bCLG9PCDfmCw1MXOUNeX5tTDW2/nMMW8q5GTZEpbH9pBsld+yZPwBL9VzNKN6umJ6AjgSYCfGN+3JRK@vger.kernel.org
X-Gm-Message-State: AOJu0YwmEz5yoahsxSe6PFfclXGbhHOr7R+yDIvMshkeZnegsdvomqSH
	vZ+PtGK/U8GvJw3kZa3OZoUTqzOd1gkeaLwWeeGsF+p1EtZPCd6uFEpvhg==
X-Google-Smtp-Source: AGHT+IFi8j9h2IbdF01Mf3JPAdHvgT6Od37WiOHHGnHsZL6o612hM2YVY1L0w1nCJu/s9yHUJTuYBQ==
X-Received: by 2002:a05:6512:ba8:b0:52f:cffd:39f9 with SMTP id 2adb3069b0e04-53673b5f86bmr663836e87.24.1726006585737;
        Tue, 10 Sep 2024 15:16:25 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f870ae3sm1371572e87.106.2024.09.10.15.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:25 -0700 (PDT)
Date: Wed, 11 Sep 2024 01:16:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"paulburton@kernel.org" <paulburton@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] MIPS: cm: Probe GCR address from DeviceTree
Message-ID: <6oouxspgntbmn5upinbp63x5x52wluk4vg4s3oe3m7wgtk3le5@ua7dup5lkeaa>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <20240612-cm_probe-v2-6-a5b55440563c@flygoat.com>
 <ekvyyq3vzdbyi5suf4irfixyprvtko7rpkffwpc267kiex4ex2@lpu3ctysuviw>
 <79acb1b1-9c1c-4a58-91a5-5dbb286717ec@app.fastmail.com>
 <7j6cc5i4z4nwg73fowjz756eblnesglqm72jveygqfxngw26mc@sdy6xxomo3qe>
 <b4d57581-bad7-4f6f-8d6f-733f1a5d33ba@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4d57581-bad7-4f6f-8d6f-733f1a5d33ba@app.fastmail.com>

On Tue, Sep 10, 2024 at 09:48:10PM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年9月10日九月 下午9:07，Serge Semin写道：
> [...]
> > Both MIPS P5600 and P6600 databooks define the GCR_BASE field as
> > optionally R/W:
> >
> > GCR_BASE 31:15 This field sets the base address of the 32KB          R or R/W
> >                GCR block of the P5600 MPS.                           (IP Config-
> >                This register has a fixed value after reset if         uration)
> >                configured as Read-Only (an IP Configuration Option).
> >
> 

> Thanks for the pointer, I traced code history and it seems like MIPS decided
> to not expose this functionality at some point, but documents were not updated.

Got it. Thanks for clarification.

> 
> Maybe I should add a read back check here.

The check is already implemented in the mips_cm_probe() method. Just
10 lines below the mips_cm_phys_base() method call.

-Serge(y)

> 
> Thanks
> -- 
> - Jiaxun

