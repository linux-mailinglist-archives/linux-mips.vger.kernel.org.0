Return-Path: <linux-mips+bounces-2442-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B54A688E8ED
	for <lists+linux-mips@lfdr.de>; Wed, 27 Mar 2024 16:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2A6D1C303EE
	for <lists+linux-mips@lfdr.de>; Wed, 27 Mar 2024 15:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9418613175F;
	Wed, 27 Mar 2024 15:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8VDp2WD"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED93131752
	for <linux-mips@vger.kernel.org>; Wed, 27 Mar 2024 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711552908; cv=none; b=QAm9FxZ3KmoRYhUpbHDquUngIclPd5pfQnt2SVxPs9iqfzRPkgCCeDzhOcFKDHsZ/Ts4zGC891KSmYLdJY8GGwjLcFbkVz695LLBfMDMV/kJw7SRP3KeTNKw1LYf/nFZ35PdiKkf4d1mjOWpQ5wv/ufPlkMpEnr6akFYeNhub64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711552908; c=relaxed/simple;
	bh=mhfoA8jCv1DDC516BG+AAL5xuYfKBZbFsPJx+Vnzofw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4jMwf8QeD4MV/1/I1jJLaQfm1y+7qnDoD2NMRYAPi7ih5tlL5Cc3wTHbwInZLKfOw8krP+eEL8yMeFKSxaN6K367oa5lB6ZzRAU7qdrfOxaF6iKEq3O9CXTQqVULJ103O30hRimgZMSahQxdlbFw7N1U0oNwDLL9AH6penUPHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a8VDp2WD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711552905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4RJOr7EzuI0DVaYxx+XjeXTwjAi2iT7d0lhMZ/VIsjg=;
	b=a8VDp2WDVgyboA8qBtWpRsUNHVKyVsc8ecB42vWPaCxi7L2I6aLlzUsd12wEni6Bz/IF9e
	0DXN5FhKemqb74DMpAYYLlKJHsHzh215527tymhMbeAWXwr+MxbzPf1WY3DZBqtdywpvhG
	TRGFzUEXQPGmKnzuovOS49QyXr5qhPA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-s39x8FFsP12QA3laQ-PDDQ-1; Wed, 27 Mar 2024 11:21:44 -0400
X-MC-Unique: s39x8FFsP12QA3laQ-PDDQ-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6e4fe655c93so2425759a34.1
        for <linux-mips@vger.kernel.org>; Wed, 27 Mar 2024 08:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711552903; x=1712157703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RJOr7EzuI0DVaYxx+XjeXTwjAi2iT7d0lhMZ/VIsjg=;
        b=HA59ItaboPUQYsf0tTXogZ4KdAP34w5CoyhCbyXvb4dEtWX6LVjKNqDPAL0tv7xU1W
         yDD0TZia0zjjZ+xK06A/J6ySLcc+4QhMFhteGNhvGajqXPWQNGXJ8LWJ8MgD4rLQDF98
         fxIgEN243Vr8a8CcF2bJeaycAHiB009sShXAAv6ueEEL3osF1hJpVv3+7fR9Sox4nhif
         vWaUwnnpH3wfXABaVy78fdTVTLIC2NKREKFvaKejFHG980CKKl9hIFybIY/Hp4POh842
         pjiHCwFf6+CdZr8W0/MRJhPD+zycyrWoFQcv1suPWVqVA09a4rvK0IGyAILtS0zedQi9
         S0Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU8yRaYA5monS0q+H8XU0zODcvlEjAiMQ17kJViexC8hT93ZHi8KrmWtE9ohUgzgzc/z/e+7Kvk8XYs3n63+chqsruNGr5HIYWd+Q==
X-Gm-Message-State: AOJu0Yx2NbUFAxmvWfhFeTsPedyLPLS4hmLTrbiDmyoLdqXNCFkuefBP
	07BFD5eOtzQQ+6ar1I/2BQAQ7meI0cu4rivUlmM9lji878uqlKClSicF5GFTRo6sGkiMrnwOu8y
	Dv3pT3YmRcs40AFcLnx3kZ4tmXfKxC8WDrexd1/K5wKDZKVvaZz6YiDON3iY=
X-Received: by 2002:a05:6808:128a:b0:3c3:d729:1d56 with SMTP id a10-20020a056808128a00b003c3d7291d56mr316749oiw.0.1711552903441;
        Wed, 27 Mar 2024 08:21:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxT5qAZWntttFMbBHTXwtvywmg90pV0zoL9F4zS7SQ4GsHwDy+Ru4KfcRdtRpsXZfeVg5bqg==
X-Received: by 2002:a05:6808:128a:b0:3c3:d729:1d56 with SMTP id a10-20020a056808128a00b003c3d7291d56mr316719oiw.0.1711552902921;
        Wed, 27 Mar 2024 08:21:42 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id r15-20020a056214212f00b0069698528727sm2350243qvc.90.2024.03.27.08.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:21:42 -0700 (PDT)
Date: Wed, 27 Mar 2024 11:21:40 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
Message-ID: <ZgQ5hNltQ2DHQXps@x1n>
References: <20240327130538.680256-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240327130538.680256-1-david@redhat.com>

On Wed, Mar 27, 2024 at 02:05:35PM +0100, David Hildenbrand wrote:
> Some cleanups around function names, comments and the config option of
> "GUP-fast" -- GUP without "lock" safety belts on.
> 
> With this cleanup it's easy to judge which functions are GUP-fast specific.
> We now consistently call it "GUP-fast", avoiding mixing it with "fast GUP",
> "lockless", or simply "gup" (which I always considered confusing in the
> ode).
> 
> So the magic now happens in functions that contain "gup_fast", whereby
> gup_fast() is the entry point into that magic. Comments consistently
> reference either "GUP-fast" or "gup_fast()".
> 
> Based on mm-unstable from today. I won't CC arch maintainers, but only
> arch mailing lists, to reduce noise.
> 
> Tested on x86_64, cross compiled on a bunch of archs, whereby some of them
> don't properly even compile on mm-unstable anymore in my usual setup
> (alpha, arc, parisc64, sh) ... maybe the cross compilers are outdated,
> but there are no new ones around. Hm.

I'm not sure what config you tried there; as I am doing some build tests
recently, I found turning off CONFIG_SAMPLES + CONFIG_GCC_PLUGINS could
avoid a lot of issues, I think it's due to libc missing.  But maybe not the
case there.

The series makes sense to me, the naming is confusing.  Btw, thanks for
posting this as RFC. This definitely has a conflict with the other gup
series that I had; I'll post v4 of that shortly.

-- 
Peter Xu


