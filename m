Return-Path: <linux-mips+bounces-12898-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 81936D1B23C
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 21:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 456C9300D57E
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 20:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC8E34F481;
	Tue, 13 Jan 2026 20:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjkaNZVQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2736A027
	for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 20:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768334702; cv=none; b=K/tYZor1GfViVHd9ep1MZpp7b9lnl/IgHPX8aShYkXBla/KPq1P03Hjns4LlGcpQctXWrBRYOsjbJlzjpXH5c2xoDUf8K5CImc2/ycz30HGHqfVTrK2x6rxEYe4B6CSw8xk/OFRC+WSUGOXbTFxtAnPFwuShn95kbvChjBB2enc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768334702; c=relaxed/simple;
	bh=BOlPQfIkt/fjEJvpKRaH6vV9rI3DP+2Yxs4j/ADRLvc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uw+IqVxslqS2KkxEDj+tLGkVBzD3ipjz6RzchqpXRBPXRDrUkHX6Bj6GG7SjG5bPL4/i8IVuUkqn6fuWt6k30H/RSTq3j4YIpO4oUxFUFYhPtbFDv/AGYSztNSPOpJLihx8F0k8W77vq9aEF0nruFlwjf2jmIQEVES/zZiPpU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjkaNZVQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso55004455e9.1
        for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 12:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768334698; x=1768939498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0muJ4312EJ6gGXEPQdwyzyI8xQcdUomK1P5HrD6iP7k=;
        b=XjkaNZVQM+Y5BoEcDdJmkk6brF1Z5JDdZ6PROcCg+W8uRfNrsFK3aEqnGcCceeq4NY
         CibiU7UTj55ENIEQNLh5FZwH/08Cp7/hsTyHc0+UjJohTmHpON/DkdVZMoRitvuvX75v
         Cn7ud3lSje5kpBPNuVuyTHPBR6ZNePfsAvDQIUNplPydgdg/95FBCXFAW0jd5uhem6et
         NOdWiTi09xm6Me8xo04xo+kaJG9/miuPrW8eieQnlrZgEnKeT1euEqxQPoIyDC3661wr
         4iwgiGbqIqCILY0lEkJ6b/Yd3Tae9cWuziZwFwIF/vNqjpKuCgM/pO+avOkqpsvVgWhO
         eqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768334698; x=1768939498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0muJ4312EJ6gGXEPQdwyzyI8xQcdUomK1P5HrD6iP7k=;
        b=qZtApSGSWsUz7uZbZ9EqohtjFcMPS50jgkwRWmS6Q1QpE5IICu+vcKy76ygSmFZMnF
         ErSvHplSRsIKH+5ejTWJ/cRPPCp5JzEb4scYwsJhLpWn8Ga40N8GsBjNB7CMww8+fTUM
         ioOnn5T2sJxLJTGGl7+0SieXYodwzTpZvXBw8IZnH96uAJ0shGTyNixCdJ0MPSWqTqoy
         cNHRYAscMJwarb3tnXNXsxNzYNsbiGvQc3DhWdgIWZHL2WuIE4802ASo+cNPFBuyqPla
         XJ2ebNyaRYFkgXuO/lQeDDDiewQMQ4y4yd3lH6fhrYMTUX8kjCgyV2C+s3GFdk9yJjJu
         cvXA==
X-Forwarded-Encrypted: i=1; AJvYcCVEpHzvf0BJALlRXyXoFtIHo2718k18efRVimhwuiMuSCNvKZnRYpOZd7nqVK0LSUvREs2g9i0oqYjJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9AWcmFEOsWNmreczTQ5REfOLkyr+IUAeWlxZV33n3s8SuIMxN
	SbIEndFLGRHzh/ytx8OfxV8MJTG2as/eb58/1Wv9f10Ee78pKqqcLQ3d
X-Gm-Gg: AY/fxX4ZNaVQ/bzDGt8t4CdVscdStqQ+MxrqAX72M6/EU7sgOkp5yBE3u88zA9FB460
	8ZvmcGiGK165G9DVDylPFi74AnxWy16dqVUJ++zkw3DFHyiq2jYYrPhDBBIcls75XlmZ8GkZfAW
	3MUEA4MWxYCIJR03M902I00D0YzKiPROE3El5jN3PF7NwX0V/JMDeJnO+2APgIw5qa4vMkWG8PV
	Tvaw6bqXDL+lswx8CcDK/UiPvqm1w9WduqGJ08QJO2szFf1MMD/xE9AudVfjIu4XGv0971rre6a
	zeyJu5dyNj+i/+VO96v9KZqMyQ9H+AnsFMv99rp17Pxa+Ip/TbdsWSTHg+Aub8LG48FBb/8uKUY
	2MASNlPZq3THH624J4iAOAFaIY/TKhTg1l9ymrAShgfagIpcuYvKctyCuFLcbFgaZ9kusug5qen
	Y6a1tjwNoO7lwfdigDKIWxow8egefsegkhKKVV80Fprr93EKSim905y53VqB5/6uU=
X-Received: by 2002:a05:600c:4443:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47ee338d53fmr4231585e9.18.1768334698044;
        Tue, 13 Jan 2026 12:04:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa78sm46840666f8f.6.2026.01.13.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:04:57 -0800 (PST)
Date: Tue, 13 Jan 2026 20:04:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Nicolas Pitre <npitre@baylibre.com>,
 linux-mips@vger.kernel.org, tsbogend@alpha.franked.de
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
Message-ID: <20260113200455.3dffe121@pumpkin>
In-Reply-To: <202601140146.hMLODc6v-lkp@intel.com>
References: <202601140146.hMLODc6v-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 01:59:24 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b71e635feefc852405b14620a7fc58c4c80c0f73
> commit: d10bb374c41e4c4dced04ae7d2fe2d782a5858a0 lib: mul_u64_u64_div_u64(): optimise the divide code
> date:   8 weeks ago
> config: mips-randconfig-r113-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601140146.hMLODc6v-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
>    div64.c:(.text+0x84): undefined reference to `__multi3'
> >> mips64-linux-ld: div64.c:(.text+0x11c): undefined reference to `__multi3'  
> 

This looks like a bug in the mips 'port'.
arch/mips/lib/multi3.c has the comment:

/*
 * GCC 7 & older can suboptimally generate __multi3 calls for mips64r6, so for
 * that specific case only we implement that intrinsic here.
 *
 * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82981
 */
#if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 8)

So this code is excluded for gcc 8.5 but the compiler is generating the call.

Looking at the git log for that file there is a comment that includes:
	"we wouldn't expect any calls to __multi3 to be generated from
	 kernel code".
Not true....
Not sure why the link didn't fail before though, something subtle must
have changed.

I think the fix is just to remove the gcc version check.
The code itself just adds the results of four multiply instructions together.

	David

