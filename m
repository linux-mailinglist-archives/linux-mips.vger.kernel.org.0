Return-Path: <linux-mips+bounces-12899-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA545D1B7F4
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 22:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B52EF3035CD9
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 21:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904443502B9;
	Tue, 13 Jan 2026 21:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g21EYt2O"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D06350A0E
	for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 21:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768341493; cv=none; b=P5AIwTmqxXxdLvKR/8kWxjrKi1t4xJQBdgnpABjHYh9UHPK/LDl3Pm/1WC1wnXqMkVI0xGxGWcXksmTZQH+tCoT2YiKMDaaR9QNEypsnxu+5hkDF0vwm+UG64xUdSgy2sWBBunFofpQIHaC56aXNw3bW/X4Fmk8X9aI50tAYbo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768341493; c=relaxed/simple;
	bh=0ttUuD9yelTRfCEzlEO4mLlzeT+izPzbeZ2mAMeg75I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvG86F6VsVt2lwHTD7+YCrE1HbYFV5PMxeJYLYoE6gTNEXTe8b4IcLsSs9/BeezI+S2AQBhmErYoFKE9bY/+AP+e1Ds68nd2iD9NXXafPW2PpGsnIh5XgxRRFIb0iXuD2CJRg4BroKMqJBmjEdhi/rbNM3VnUhvOkVexB9EsTrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g21EYt2O; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso36963195e9.2
        for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 13:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768341490; x=1768946290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjQpoKoi4pzTkbGscUXDmca2AVl+LBzlv/bdYvtEAK0=;
        b=g21EYt2OfSM1BcBK5Qy4ex+z1YlMvb1kDjVk+ehRk1UJc/l6q/F7uskmLO/4Yf1qMd
         lA0ae2XGZtRjf8BeDtDrxLZ7JZLOgVycpioZeh3j/vVpojJ7BffW6NoAVGdTgFinNsrK
         wHo3Nik0eJ/H6e+JyVbo/gL6rLeyxhnuqnPvqfZlsr75wOhDLolioUUmsqNZOm7WK/WZ
         VPdGn8pCchUgkVlnhawHk/bwgeTgd3NFJxMQS6VqlSwp8nfVIScqJhvEOs87FdsYQiG1
         QxaxKFhEhc74lEaSniI+qTPWSt00sJ3fvL2A2/yAG1ZPtfTtUsJ7W7Bv/ecuAIqchPvE
         4Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768341490; x=1768946290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VjQpoKoi4pzTkbGscUXDmca2AVl+LBzlv/bdYvtEAK0=;
        b=vUpjcICV9+0XPR5ssi28OOHaTjQriO7/OG4fa/41p2lJSiArlJaZKFigUY7HFX7/k7
         Ituk9Y3QCtmb/wWY/nmIfUx6nceTr3SAU2+ABV0TFU9XP3mxB8Z7XS4kQdtEP4y+5UZS
         /rjdqyP6GXesKIr1EiiiSvTqG36DzUTJqcIpnj8U8+MJRk+sWDv2OT0Fu1lIWWiDLX/u
         OYpC6odqoodrIWtBzNZXEI7/5sA2gQ3PwVvUGeRp65GK+C6KMGRYL49YrT0Kk4o5T2QX
         JEgeylW9Gud6amQNp8n+7IwgPthNR2NZhkJmRDWi8BcTI6tcJMEU+p75LeM3MTas6IwN
         5Vmw==
X-Forwarded-Encrypted: i=1; AJvYcCWWPELBUyHkLaVV9MYXRMLNgpt0thX5l87E8qPvwXWJ0sRpUAFHisrGZWDppwY7J+cHaGowecDUtjLu@vger.kernel.org
X-Gm-Message-State: AOJu0YwyUlv1OmsiXa5eqcA9QKRssfutKza8J4hgTIpDfZ9U3eQ1rmeV
	iSsZojNk/BSqg5uYwW3mtXLvoeBGtr5JQgQzXf15s978yfYCfcf752/b
X-Gm-Gg: AY/fxX4/4nmWWgRhexXxDf7SxYrEhcMYkFTpb5uh1teWW6X4JwpZChnMMuh53uuQyha
	xaD4+gznpU8mChcnu/PC58KR0WL3F8zX+80S306O9t8yFAbzD/yAs5Vxom1/tPj3pcR/rGPUZKD
	Nk+vUnkrz2Bxmb8UZYskgBW4szOl0cMhlybazEGCWc/I2VrCyVe8b/9S4Ljotfx84xgUeGqvpf8
	gLouXMdwH8mFa02wd4FQQnclFLABSl7EjIyG7ffJnOVCyNHsIlPZ9iKhpcimlgEKy1SgbFvx+FF
	FQk5GMqSDWuEXmKJvV9Uc8OWSwNUe6L4zorbtImRkmfw7XEWz/lJxQP+7QHO0Py3i0WH7IQZ8hr
	E5q62ieBF350HWF68/bYTuDRo4ffP3IwuSivypbFuUqHalgaD0OGavKYozecEqpjqcbUNnyTA62
	eDNrTOSYM345BOtfbi0FEDPtcN+ZFpl329cHWg5dmRERFZJFtvAH9E
X-Received: by 2002:a05:600c:3487:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47ee47bbe36mr467055e9.1.1768341489984;
        Tue, 13 Jan 2026 13:58:09 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0bb3383sm8819575e9.2.2026.01.13.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:58:09 -0800 (PST)
Date: Tue, 13 Jan 2026 21:58:08 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Nicolas Pitre <npitre@baylibre.com>,
 linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
Message-ID: <20260113215808.135dc8b6@pumpkin>
In-Reply-To: <20260113200455.3dffe121@pumpkin>
References: <202601140146.hMLODc6v-lkp@intel.com>
	<20260113200455.3dffe121@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Jan 2026 20:04:55 +0000
David Laight <david.laight.linux@gmail.com> wrote:

Resend fixing Thomas's email

> On Wed, 14 Jan 2026 01:59:24 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   b71e635feefc852405b14620a7fc58c4c80c0f73
> > commit: d10bb374c41e4c4dced04ae7d2fe2d782a5858a0 lib: mul_u64_u64_div_u64(): optimise the divide code
> > date:   8 weeks ago
> > config: mips-randconfig-r113-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/config)
> > compiler: mips64-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601140146.hMLODc6v-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
> >    div64.c:(.text+0x84): undefined reference to `__multi3'  
> > >> mips64-linux-ld: div64.c:(.text+0x11c): undefined reference to `__multi3'    
> >   
> 
> This looks like a bug in the mips 'port'.
> arch/mips/lib/multi3.c has the comment:
> 
> /*
>  * GCC 7 & older can suboptimally generate __multi3 calls for mips64r6, so for
>  * that specific case only we implement that intrinsic here.
>  *
>  * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82981
>  */
> #if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 8)
> 
> So this code is excluded for gcc 8.5 but the compiler is generating the call.
> 
> Looking at the git log for that file there is a comment that includes:
> 	"we wouldn't expect any calls to __multi3 to be generated from
> 	 kernel code".
> Not true....
> Not sure why the link didn't fail before though, something subtle must
> have changed.
> 
> I think the fix is just to remove the gcc version check.
> The code itself just adds the results of four multiply instructions together.
> 
> 	David


