Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC15354F6D
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 14:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbfFYM4g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 08:56:36 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38859 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729912AbfFYM4g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jun 2019 08:56:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id d18so17780757wrs.5
        for <linux-mips@vger.kernel.org>; Tue, 25 Jun 2019 05:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qkm/sR5hDVqHvpHouxyg9xpi0nH3BM7uRz/CI0HhLcc=;
        b=rRbkzdR/iSJ0T7wrnOqEN3gyZIFvxf+yrv3oOHKAj8X/giJhNNapGy0bLZvuSxWqoy
         CTDFhWWjDzlF4vY7BiTDM/avstUHEoCdYIV4ZN2mzkMDQTZM5uvqXY4puAjXMYJNqU/o
         WxyR4s6RpgtJZ9MAbr29nu6JK+HchV0ZhC6PY4avIOL5GT/pihIkZojP1PRTizuBurbn
         n/1Laf/xPS6pthwMmJiHMoVHMJjMEWmrt4IRdwoa+fVyGwVHCX1cGQ0l5PApUx8T13Ia
         OCpIrfJaq1nk4kfqi3F8cxRFkw24Q2sM5QATrVHdSSbg/4Z86pZWSNBIbf0TvX0vER3S
         8vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qkm/sR5hDVqHvpHouxyg9xpi0nH3BM7uRz/CI0HhLcc=;
        b=DRW8QWfVCYtEqhdv3dX6h78ep8CfJzAu6KXjVn155+5JgrhXTWIYymNkpXTJqA8MSY
         2rPMRBDEgTZ10ua1xgORRAb+GMaB0RUyWqlqY4PBvbbJo9J22jTF/aglTzPpFUa4Sh4V
         aVfbwk7Tk5C0T3OBwUHJ64swPV7rz8dUPoNjE7kXWrIfAx1V4lV64x5fpMylcN/GPeiU
         mcF/wdYGeksUm8T3JV30MWxcYXOMcVcx5fpPJOZOX6PFwd3QRC+fJCcvqN4CBdsoLc76
         O3iWjeeBx0aW2+bJ1z31fPcuzzWQKHRHkSWC5PJQH/Dpv7FPTQriuydolRj3DuaEbigc
         3m9g==
X-Gm-Message-State: APjAAAVxqf10Gz3ofYQDsxGevxX7FjcWDdoLe1J19VI53PszCs7KPVwk
        wHYvXf5Lskvc1Y46D9mzoVjEiwe3LZ8=
X-Google-Smtp-Source: APXvYqwKYsH2s/ZCuUhf0NqgerUa9YXoCsLcRdER1sXKnWMSunPYA+thz52eb+vjOxTEeRfQTQSw2Q==
X-Received: by 2002:a5d:50cc:: with SMTP id f12mr36721980wrt.129.1561467393906;
        Tue, 25 Jun 2019 05:56:33 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id o14sm11817057wrp.77.2019.06.25.05.56.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:56:33 -0700 (PDT)
Date:   Tue, 25 Jun 2019 13:56:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] mfd: ioc3: Add driver for SGI IOC3 chip
Message-ID: <20190625125631.GH21119@dell>
References: <20190613170636.6647-1-tbogendoerfer@suse.de>
 <20190613170636.6647-6-tbogendoerfer@suse.de>
 <20190625090451.GA9794@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190625090451.GA9794@alpha.franken.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 25 Jun 2019, Thomas Bogendoerfer wrote:

> On Thu, Jun 13, 2019 at 07:06:31PM +0200, Thomas Bogendoerfer wrote:
> > SGI IOC3 chip has integrated ethernet, keyboard and mouse interface.
> > It also supports connecting a SuperIO chip for serial and parallel
> > interfaces. IOC3 is used inside various SGI systemboards and add-on
> > cards with different equipped external interfaces.
> > 
> > Support for ethernet and serial interfaces were implemented inside
> > the network driver. This patchset moves out the not network related
> > parts to a new MFD driver, which takes care of card detection,
> > setup of platform devices and interrupt distribution for the subdevices.
> > 
> > Serial portion: Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> > ---
> >  arch/mips/include/asm/sn/ioc3.h     |  345 +++----
> >  arch/mips/sgi-ip27/ip27-timer.c     |   20 -
> >  drivers/mfd/Kconfig                 |   13 +
> >  drivers/mfd/Makefile                |    1 +
> >  drivers/mfd/ioc3.c                  |  683 +++++++++++++
> 
> Lee,
> 
> can you give me an indication, if the MFD changes are ok now
> or if I need to improve it further.

I will do, when I get to them.

My review list currently runs into the 50s.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
