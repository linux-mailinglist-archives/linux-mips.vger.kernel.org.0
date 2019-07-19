Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B20926E436
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jul 2019 12:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfGSKZN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jul 2019 06:25:13 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55782 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfGSKZJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Jul 2019 06:25:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id a15so28264060wmj.5
        for <linux-mips@vger.kernel.org>; Fri, 19 Jul 2019 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RE4XO5hCXlohQ4XzzvHFXjCbWVs/5lisfj2a/CobVwA=;
        b=MZ2aiez9s7BuxY5oOnftVgW6/0s5yYSqpSbqe/ZNv3lt5LuholHgjz0i39qo8Pb0+s
         dUHj8OzB1751pSlS+bD850Lcgh+d8aH6A7FbvldJGeqflGt9mdQ3K9seLKwicoLqwQ+d
         tz1i1dKD8ZtjTj6HOhBQwoUqx7yeEfPggSJpjIPNpaWe7qAEjLIhf5XCP08LbyDVcqeT
         nhiijiJFqkzAOKLfKEPbmncCRHEmoTQk78GjVjUIlEohS6z2VaOxyaskDx/c9UFuVNsS
         76v0yrZB3v8iiyYGR6QerPQlNbPj5wCdUlCwXoY99RFcl3RFg/Y9ivAj9zDavuf71YiC
         eiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RE4XO5hCXlohQ4XzzvHFXjCbWVs/5lisfj2a/CobVwA=;
        b=Tljwr+/8+0H70qGGCrz20V4KUzNpyC5FlMoMXSGJeJz//4wFD0C8Rk7TzrFipRjP1L
         O7mbwiHRbA8FJ0F9+JKZEqGorI6ssmHRkCuXynJX/r4Iwgt089FTxALsDHN+3d0jJXP+
         VsgulMsbVvvVrGMdD/nncGR2PxZBqyrR4K9MFwCYWLsoNRUsicPzPGcsqN3tcM78Rfkj
         7E2MMgIqaKiudfmDDupQylzBXqDUoSKjx86hUvqtc3JxXA8QztckgA0+XfV1Cc+dYQQQ
         MdN1xdndGxVgEXGUevoY3F4Ny5Q/xISTAqrTsdxUbhVMKE1yM3IqnFJEbbIg8oE8Y5XR
         GdhQ==
X-Gm-Message-State: APjAAAWDejzHhCvMxbSqIwmV3zy3QFK4o0SrDqwjYJjBpUOJ7IQenCZK
        FZXK9/GB7IkhKU5xKhGdiTA=
X-Google-Smtp-Source: APXvYqzFtX39u/LTTf9LpX1rQ8jjc8aXLaIGj170otP1O/m4fuBpUKB7NENA3hws+MMAj1mFVzZ+GQ==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr45928859wmi.146.1563531907454;
        Fri, 19 Jul 2019 03:25:07 -0700 (PDT)
Received: from brauner.io ([81.92.17.145])
        by smtp.gmail.com with ESMTPSA id x24sm30020307wmh.5.2019.07.19.03.25.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 03:25:06 -0700 (PDT)
Date:   Fri, 19 Jul 2019 12:25:04 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-kernel@vger.kernel.org, arnd@arndb.de,
        linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH 1/2] arch: mark syscall number 435 reserved for clone3
Message-ID: <20190719102503.tm3ahvkh4rwykmws@brauner.io>
References: <20190714192205.27190-1-christian@brauner.io>
 <20190714192205.27190-2-christian@brauner.io>
 <e14eb2f9-43cb-0b9d-dec4-b7e7dcd62091@de.ibm.com>
 <20190716130631.tohj4ub54md25dys@brauner.io>
 <874l3i8h0l.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874l3i8h0l.fsf@concordia.ellerman.id.au>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 19, 2019 at 08:18:02PM +1000, Michael Ellerman wrote:
> Christian Brauner <christian@brauner.io> writes:
> > On Mon, Jul 15, 2019 at 03:56:04PM +0200, Christian Borntraeger wrote:
> >> I think Vasily already has a clone3 patch for s390x with 435. 
> >
> > A quick follow-up on this. Helge and Michael have asked whether there
> > are any tests for clone3. Yes, there will be and I try to have them
> > ready by the end of the this or next week for review. In the meantime I
> > hope the following minimalistic test program that just verifies very
> > very basic functionality (It's not pretty.) will help you test:
> 
> Hi Christian,
> 
> Thanks for the test.
> 
> This actually oopses on powerpc, it hits the BUG_ON in CHECK_FULL_REGS
> in process.c around line 1633:
> 
> 	} else {
> 		/* user thread */
> 		struct pt_regs *regs = current_pt_regs();
> 		CHECK_FULL_REGS(regs);
> 		*childregs = *regs;
> 		if (usp)
> 
> 
> So I'll have to dig into how we fix that before we wire up clone3.
> 
> Turns out testing is good! :)

Indeed. I have a test-suite for clone3 in mind and I hope to have it
ready by the end of next week. It's just always the finding the time
part that is annoying. :)

Thanks for digging into this, Michael!
Christian
