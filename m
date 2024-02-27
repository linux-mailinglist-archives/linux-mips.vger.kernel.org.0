Return-Path: <linux-mips+bounces-1819-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAD1869E98
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 19:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 153731C23AB3
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 18:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771BA145346;
	Tue, 27 Feb 2024 18:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d+iQnuXL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E30E145FE6
	for <linux-mips@vger.kernel.org>; Tue, 27 Feb 2024 18:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709057250; cv=none; b=XVqIbQgGnlDLwtU0pnA1ihH16uUwd6cfvA61z0it/YANNQOO4+NVURucJgaRMiIUgo4hvmqtEM7kIBqpPGffY0hUcR+DhvGraNH+Fb8L3dZ/c3E+LiAWA2bwd4WT79DjRV1a4kSijAh8KskNUJm8jPFkAnQWMFj+X5Ft49y7WRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709057250; c=relaxed/simple;
	bh=hDsO9qgv2V890oQySpFfqyCZWrqkIn/rAE/+zRviBYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRyPPQg2BZhHBlq9v0fwq5JpK9LidgZ2i4QjaNC1uznNbhfXGSgzycat7/HIcQdIMM5ySfwk1rSI0eqetkRKkGYQxcq8fqBp+uOI6OA/RaC+bmiqh4IAjFju/MKGnRzTgXWmmOEaCo5AnxL1lqIYMsv59FFs0WGp8ZrLSAyL7VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d+iQnuXL; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso225151639f.1
        for <linux-mips@vger.kernel.org>; Tue, 27 Feb 2024 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709057248; x=1709662048; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgrI9FN30eAJ2XZAfY9sJBg3TkLiivRBpbDR17SPpEo=;
        b=d+iQnuXLgKZDLaXx97j3ZKk+HiTOuQlqJBwLJEYO9svRMD4/QqZkaA9oMup/6e+RJ8
         tj+8l3QfTp2EGhMAEuxGkM8V8y4ixD2Msf+7eCEOi9siXYV9WxIwItMnFGqXWwtT4LAx
         VPJFJDLg4jyshNCHJX13Ew+uPZlcUwwIXdT4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709057248; x=1709662048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgrI9FN30eAJ2XZAfY9sJBg3TkLiivRBpbDR17SPpEo=;
        b=qf6ISDt6qow3OcsaRe6PgS4L8iqUVnQHCFyP7YPodcPZ60a3VUiwvK7MqWvwOjo8Gs
         BmgfF025y/mBDwlwq4wJvxUul1JALlrzztE2LobQnmVRn1+NOb20flu1P3sNdytq/KXx
         hI70ngvaYnYWEPhUgSJ4JCOXaTZFw7v1nbmlYJKOclD1vFaoqvApT2yVOjHa9GJgSQYC
         VhlusTlqPriFJPnxb1HRwWfua/B3n60UCXciDpb4hQyneQFNx8jp91nz4QcbUHeiNYBg
         eWFZRGREqd5voS7po+jCE01Hl8ynRhat/e8sHYoeGAroP5TaT3mXfbE8Gk/VZLoom097
         R/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW7uKGJWCR8xLJYjitN8zQxkjjx68tcG0ju3VaP8VKi/GVWenLa9ymr8eit8dJk4WJi1CWMmgJ2JERJjRI4sgzDWRaMvCUOISlqkA==
X-Gm-Message-State: AOJu0YxESByQGnUKTYlwQ4/hmcX5tlW2kIHnDpFbj6ZPdmGnFmJUF8pG
	hK2PR7sUrsT0QuklxPpHhzdrFQ/DTdZP+DT+VCdZn3wbBGXc/SSKKCWendCJNg==
X-Google-Smtp-Source: AGHT+IFpahrVJDe+RkqjDhxBgm48d+nhk6O3nvQnCIgFv/bhnbFyY12knPOFjwYUx9hP01B6x+R36g==
X-Received: by 2002:a05:6e02:522:b0:363:bb5a:3329 with SMTP id h2-20020a056e02052200b00363bb5a3329mr11593022ils.1.1709057247927;
        Tue, 27 Feb 2024 10:07:27 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fa42-20020a056a002d2a00b006e55b674e66sm10411pfb.171.2024.02.27.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:07:27 -0800 (PST)
Date: Tue, 27 Feb 2024 10:07:26 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"luto@kernel.org" <luto@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <202402271004.7145FDB53F@keescook>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>

On Tue, Feb 27, 2024 at 07:02:59AM +0000, Christophe Leroy wrote:
> 
> 
> Le 26/02/2024 à 20:09, Rick Edgecombe a écrit :
> > Future changes will need to add a field to struct vm_unmapped_area_info.
> > This would cause trouble for any archs that don't initialize the
> > struct. Currently every user sets each field, so if new fields are
> > added, the core code parsing the struct will see garbage in the new
> > field.
> > 
> > It could be possible to initialize the new field for each arch to 0, but
> > instead simply inialize the field with a C99 struct inializing syntax.
> 
> Why doing a full init of the struct when all fields are re-written a few 
> lines after ?

It's a nice change for robustness and makes future changes easier. It's
not actually wasteful since the compiler will throw away all redundant
stores.

> If I take the exemple of powerpc function slice_find_area_bottomup():
> 
> 	struct vm_unmapped_area_info info;
> 
> 	info.flags = 0;
> 	info.length = len;
> 	info.align_mask = PAGE_MASK & ((1ul << pshift) - 1);
> 	info.align_offset = 0;

But one cleanup that is possible from explicitly zero-initializing the
whole structure would be dropping all the individual "= 0" assignments.
:)

-- 
Kees Cook

