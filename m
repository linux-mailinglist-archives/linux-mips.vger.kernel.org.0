Return-Path: <linux-mips+bounces-6111-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C3E9A1DAE
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2024 10:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5DDC1F21837
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2024 08:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADDD1D6DD4;
	Thu, 17 Oct 2024 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUTEi/QD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA7762EB;
	Thu, 17 Oct 2024 08:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729155491; cv=none; b=EQ5NLeeXnmR4SqXfy0rGLzZOib23RwxfgXijCD4Jroj6SA6HEiXT6sQrDss/Y4BRXrDAsGSfea9yELPCyxjOsbaBHvVYA3xeHi+OtPhCmT6KiLk5/2suhF1djU9gixN6j3DehpNtJbSCZfjzLT2+bDipPXw5nTuvVHOzGM+yZgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729155491; c=relaxed/simple;
	bh=Ag39IeYZIgnJP+0lKOwm8KkvB7IMVGZa6ut5/EY2Y5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKYRVgea9e1TDG9XcksVUpPxxHQXszuo6OWAdzzSMtjb6UwVyvREgftgabUPTCa1y77CyAWv6AgQfWt3QixzNSq5AtS6BsLdW5R9SWz9yh0q/edTPyXxDKaC5pueI8UdIXCfUEd8CQZ1fgszm8+vg2i0Y0nm2vEQoWaWL5lXRdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUTEi/QD; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3e4d624ac28so447625b6e.2;
        Thu, 17 Oct 2024 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729155489; x=1729760289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cS2ZrlCICBtkiBuIIXiYosXWwsFkqn4m2OZpO9F2lEg=;
        b=GUTEi/QD9EfKz9cJ+kcdexLuT9hsJ3Qke5GFpqzn+D80X6t7JqBN/BLYluinWlnh02
         oBtKsnnezq5Yd6KZYkCFhKmilvsMsxu88K3xFnpZYj0nORDa7CfpCOWSBWc4KR7plZY/
         RsDDR5BFAwv9JuS2fSXdylHttvGzGXJKtK4eMgSdonnbk2pcJ46VRuzrJ1lotIJJp9Rq
         qBGe3N9YQqWApuBABGRoPlQk+nNDYODw45MCRCZURU9DfT6Ephl/nXlNzyK0FgfbTMyV
         MAd5+uwpVLiA3xGpv+TyYX331ZEoHS3x9V3qpyPxYwiMrQ26UM6afp7HQGvOHvznWR9y
         E85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155489; x=1729760289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS2ZrlCICBtkiBuIIXiYosXWwsFkqn4m2OZpO9F2lEg=;
        b=OYT8cvd8xLJ5HDToodEjdvsz8QNByiKJ1mViX/dzpys+cSce5jZEHlEEwIg1v7RWT+
         /bBVDE0ZjehOvnLXrvwqYP8is9VnOhPV6q5i+PBsZEpOdzCV03e/tUgnPehncCgzt0mK
         qSJU/bOy/suL+Md9xDzyf4Yc20bdJK+bToD95d+tIeGS4CRfeMuIk3Mbnqw8W/VOOi0g
         UMu0sqrgf0Dhc91+01LszlCjVYVffeNBKB+90uNTOZ/pb9rscpoJKq2Sh8++D8Jnp70b
         0bfDLxs73BjpX1lNnCKvd9OJQUkSkni7FSv/3Ot191DWEVS9Uqae+dNyF8EEQzxrpyt2
         jhRg==
X-Forwarded-Encrypted: i=1; AJvYcCVenPjU+FCZ0z8P5OWAOWc394vsbln6b7DRDLx4x2T8781MGKOnoPJJJ7w7U0D2io6huMa5FqgjJukuHw+HVAg=@vger.kernel.org, AJvYcCWDokyUd6hoNYslp2V4qzS3Lrkie8Q3poipWPXvki48l19ZWFfM5pML/aFXdXV/bGzV4pTRwGUryzmxjw==@vger.kernel.org, AJvYcCX0dkj5e+nN8NRMwCiy/piG3fvzC0h+CbxTFK8HIgtsp37L8gtsyY24zpExJ1VpMtM5A3UCkX0nTBGNalxZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyWG1MLoerAY1tJkQt7fY+F50vKAgdx4o6H77o5nlWNS9N7hIMZ
	lek0vtahGVn2k3ih3UQl7c63lxCVkZApBK5pt34uXgE+4LpMtiXXBoIRZSXq
X-Google-Smtp-Source: AGHT+IGyolcDbGNV2mTosloiVV44sgC5UtlRgCP5m2wD8324zy9wGkRHfdWw5JtvnK5Y2cZZ4rDYJw==
X-Received: by 2002:a05:6808:1a10:b0:3e4:d768:91ed with SMTP id 5614622812f47-3e5f0515174mr6294465b6e.41.1729155489333;
        Thu, 17 Oct 2024 01:58:09 -0700 (PDT)
Received: from mail.google.com (125-239-144-11-fibre.sparkbb.co.nz. [125.239.144.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6d41e3sm4518745a12.55.2024.10.17.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:58:08 -0700 (PDT)
Date: Thu, 17 Oct 2024 21:58:02 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	zhanggenjian@kylinos.cn, ricardo@marliere.net, bvanassche@acm.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] mips: sgi-ip22: Replace "s[n]?printf" with
 sysfs_emit in sysfs callbacks
Message-ID: <ZxDRmlDbtjEaTH8z@mail.google.com>
References: <Zw2GRQkbx8Z8DlcS@mail.google.com>
 <alpine.DEB.2.21.2410150220160.40463@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2410150220160.40463@angie.orcam.me.uk>

On Tue, Oct 15, 2024 at 03:01:13AM +0100, Maciej W. Rozycki wrote:
> On Tue, 15 Oct 2024, Paulo Miguel Almeida wrote:
> 
> > snprintf() has the documented, but still rather strange trait of
> > returning the length of the data that *would have been* written to the
> > array if space were available, rather than the arguably more useful
> > length of data *actually* written, [...]
> 
>  Why do you think that just returning `n - 1' in the case of a length 
> overflow would be more useful than returning the unmet buffer length 
> requirement?  I think the opposite is the case: the value returned lets 
> you reallocate the buffer for more space and retry, and there's no other 
> way to figure out how much this would be.  And if you need to know how 
> many characters were actually written, then `min(n - 1, snprintf(...))' 
> will do (and code you propose to replace does exactly that, open-coded).
> 
>  The change itself makes sense to me, but not your proposed description 
> I'm afraid.  Just replacing open-coded pieces with calls to `sysfs_emit' 
> is enough justification.
> 
>   Maciej

Thanks for taking the time to review this patch.

Will submit a v2 with the description you pointed out.

- Paulo A.

