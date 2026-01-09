Return-Path: <linux-mips+bounces-12808-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B09A4D0B89C
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 18:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34C203023B7D
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 17:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F82364EA5;
	Fri,  9 Jan 2026 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h0Vp5pVU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yfz7W8Ts"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C884423ABA1
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 17:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978684; cv=none; b=Gb1DWfh0zzZ9RAhwJTWUr49HPd8Ew05hfr+omOCbC5JKz8GOeEMIxV+2JnTDMh7e0dEv7FDLH9pFx2qSLy7XB2UQtdR0MhaKmGm8GR1JDbKgsh9E6/yezb3d+y/4XOzXq7TUpPvvmXMuVRu2K+MEZ71C/OpIWmDx+k1+BdUJFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978684; c=relaxed/simple;
	bh=hZlthMs16BIBk/qMEDIm108LDyrd8Ui+nEJqQrdF1jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXYn7eZPm7AezAhp1vZ7UtkaaPJuDMce0uRomxLWO5K3+SN9NjCx8sskfznuVhkt+lTPHdXpVMLrJTvboF4Z67Xx5yF9x0IfS9FbKEY5IJMgHmYkbBL6LBtGygrO8DxhUs7cEeTC5ESJX2EBvSg9dhrek65ITqVRZDvFSFsjeZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h0Vp5pVU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yfz7W8Ts; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767978682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iaNh1aOnh2JoHokgzqjtqefBtdcVeVnfRZ9qQn4NnSA=;
	b=h0Vp5pVUcJLcfm1bB0LRv8t+uRYwFDT6blsv08iHAe/+YPAyMwmsYnwSkcM8ATBZ4o+ox+
	MXVmGrGMq3YIiCuo2663f2JDUBmuhr5c2ztoOYSR0Ydd/0keOsyUWjXrpKt7hYNyA2TijM
	P/nQyDqSJsur/GEuAwV4VBchOih1r3g=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-dBt7B-wdMDmiveyEu9VwTw-1; Fri, 09 Jan 2026 12:11:19 -0500
X-MC-Unique: dBt7B-wdMDmiveyEu9VwTw-1
X-Mimecast-MFC-AGG-ID: dBt7B-wdMDmiveyEu9VwTw_1767978679
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee416413a8so50886881cf.1
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 09:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767978679; x=1768583479; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaNh1aOnh2JoHokgzqjtqefBtdcVeVnfRZ9qQn4NnSA=;
        b=Yfz7W8TstWPVmqnMPL4PfwIlAJaNYLfe23Bfy7zWhawDT/vpjf9HOq1l2T9RyJtXri
         JNUbQoxUkk3HVV6NPwCSzdWD9rJWxfDE5SsUjO7G2cHhrdeZy4TgeeKp/zleR250CY14
         zq5X+uHs1yn09jtW8hG8YvJUEShn+1KbePqaD+Vih4fBBR2dVHHP3eBHjIgD7npBQ1w8
         91cuArzg6Pmv1DsOBTd9Y97SlEqtTt29grsyeJTbJ73mVIbfqGILcJ/KVOF/FJv9s8jM
         EEyk/lggZtSoWe+ISh0/lKKhQauuKiPsKRDPUZgFjGwQJLBXTg83VNqsln/y+mWfOXp5
         fONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767978679; x=1768583479;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iaNh1aOnh2JoHokgzqjtqefBtdcVeVnfRZ9qQn4NnSA=;
        b=MIdIazuXT+rQKjak89tqjY2VBO+sAuj9zoWHd4lVmUPsnoPdwVsx1ej4Lth/pne8xD
         Cg2aNN3szYvxYf32Ot09+kjZ8+NN+UtPEQx2PN4nPikbema9cr61iprmaNApDcixyvRe
         kD1m2YVCRD+J7iyVz/HKdqc9qoRwL+tAS7mD3zy5EMLToRdYEgK2aUV8WszqJVajsuBR
         MZSVVHI9EFbCOecerIkMcMiBhOAzHq2zkCMhsWj5DYLOZOGLgyn8s/lTSduAzU1nwrPu
         LCexNcekgHopA4cYNMvHZgtAVUPtlz7dIHw04ZJPb743f6uHjwwmr9uRnbLezxz4LY+v
         LGNA==
X-Forwarded-Encrypted: i=1; AJvYcCU7dOZFRweleNYXQa1/6kmGxpEwZ19CHrLUuXRc+ORxLnvMln2XzCJSuI/xa1wFhZmUXght5q9X/VtB@vger.kernel.org
X-Gm-Message-State: AOJu0YyPm3aeralYd5TLCLRUPQQtdN+5JumH0UzVQhiocrmKEm3FI02A
	nSlJPYzmz8NB4uBsihteiGVYxN8G/2fML+lFQHIGhlyO44QfD8qX3mLUlX7bisAGSad4kHvuWJ3
	q84SIIAXb6ohrCHTz6PuZnulSNdEeM+rJO3ZUJc/LfadIkqaQea2W/3Q/5eQZi44=
X-Gm-Gg: AY/fxX5Jq+n5I1UjTGDB6+60VJrm2eM2og3c9bZZVZ38m6yzaeCCo7gDbtqRWSjGBWn
	8cQ+yGpRoEN5FzzL2pgDU0uBtZ6yXH9IFoD/7OeeQTXeLKBt/gbjzO7DlCXeeoQNtvV6RyxGUNy
	gJqUq7EE2CU1qTzYLjht47WixtvsmsZ0Gz1KTsD5YqefEvSz456oAvazY9gEsw+K6NQMBUldXx5
	FOUqPfpJ+lo9YT5k7+eGWEomi+0RVisjxZv57yTvV0a7XsZLbDVffccw9DMuXMDVlpp3wYO7Kev
	huJ9dlOf9/ATUG1/KgmS9XUhQeCMa24lKQw3x8sDBqbmLxuKgdLEXUBvPLSQ6GAKKVRaTW46p9d
	4gpWWrK5Ccq9JQqiY6fA1NjID7XVwEFXY4e5cRpC/2BMs
X-Received: by 2002:a05:622a:1983:b0:501:13ce:4e0a with SMTP id d75a77b69052e-50115a22b10mr15947111cf.10.1767978679071;
        Fri, 09 Jan 2026 09:11:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6W3jQ4EC1equ15tu9ss8Q0f0JXrCzzklWOJCr9z6Xp7FJh/1DVrZv/v2VWVLfcJHtLX86uQ==
X-Received: by 2002:a05:622a:1983:b0:501:13ce:4e0a with SMTP id d75a77b69052e-50115a22b10mr15946481cf.10.1767978678490;
        Fri, 09 Jan 2026 09:11:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e8cfasm78669306d6.21.2026.01.09.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:11:17 -0800 (PST)
Date: Fri, 9 Jan 2026 12:11:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 10/13] watchdog: pic32-dmt: update include to use pic32.h
 from platform_data
Message-ID: <aWE2tCUkePX8Cls-@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-10-99859c55783d@redhat.com>
 <76129cc9-345b-4866-8cb9-b36e4374cf8b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76129cc9-345b-4866-8cb9-b36e4374cf8b@roeck-us.net>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 09, 2026 at 09:08:37AM -0800, Guenter Roeck wrote:
> On Fri, Jan 09, 2026 at 11:41:23AM -0500, Brian Masney wrote:
> > Use the linux/platform_data/pic32.h include instead of
> > asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> > is in preparation for allowing some drivers to be compiled on other
> > architectures with COMPILE_TEST enabled.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> 
> linux/platform_data/pic32.h doesn't exist upstream, and I was not
> copied on the patch introducing it, so I'll just blindly asume that
> this works.
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

I didn't CC everyone on all of the patches to reduce the spam in your
mailboxes.

It was introduced in patch 1 of this series when I copied it over
from the asm directory. I'll reply to the cover letter as a heads up to
everyone else.

Thanks!

Brian


