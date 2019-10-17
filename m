Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E454DA557
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2019 08:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406923AbfJQGMr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Oct 2019 02:12:47 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33665 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404742AbfJQGMr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Oct 2019 02:12:47 -0400
Received: by mail-oi1-f195.google.com with SMTP id a15so1191994oic.0
        for <linux-mips@vger.kernel.org>; Wed, 16 Oct 2019 23:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6zGP7XWO1mWnff+KUL0g9XkyMVILW7Y0K8/uWlCOBz0=;
        b=m4zmf+hZVqXy9bdeZxqO1dlB7xhjjv6vvTkzJNHb+PhFPQkonyosorHPAaOlhziD5F
         pXeY349JIdUKXFmJVc51x1SpJHcWHqiIG8+ERzEYIdUtNDRKEh39nlw/6bvVsSieMWbw
         OeRKWkiNZfG078VpL6/OrLBAWdCLH23mDwGR8wVMy4xGwladaviLHstWDUXjCvOkJCMx
         Hqk138seU3eDQPBoVoqIYiRIh8RTJZhvYuXMMXsr8fa6LgH8OBc0RTibrhd9ulo+A7Gg
         LIJbtG1I2xHfCfwhU+F28EP5dTIpjoYpM25cGFjXfC5RbxIYicew4UQr+nK9AaTnmMVq
         lwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6zGP7XWO1mWnff+KUL0g9XkyMVILW7Y0K8/uWlCOBz0=;
        b=eeThs3sSFB2RlXPXr+5GyaZFSLTGhA0mAJCMfREEA2JMTZalSNQDlAfDX5cP0dptwc
         zO4pYpzgP2mnXhHibXKku15353Rv0M2nQL0yFueHZ+hJ6xJCfrdmqOolxZBpV7SiGoae
         ta4qSPZTyaQAoYj0dn1mURRalLPz9j1CHi+V5n/XgsujAx0wDj2Hz32AogWftIv3aNQo
         PITwGv4Iny8MXYDDsgM3Q4XrykTXJ27TIg4ng6fwaNC9UQDcyFnE074mH2jf6bGSlneg
         xNxAcRNlM/hxXms2MSjDFR11eY9q47X5jr025PinFdOSK++dSgCT+hS7Q7rGvUVfDP65
         Wi8w==
X-Gm-Message-State: APjAAAWbrCtfk6zs/yCORQ24jROfCVd13JIokezusT1rncJ+0o4MLoun
        mYudLcAvi55SEVLrcxjIk1c28AFIugV+geOE7ehW0BcH
X-Google-Smtp-Source: APXvYqwG67dZ/Du1xu6ACwT4FqZdAGw62Lk/iu6mBeGcJGqRwrIjOmAJYqtneFpE6ubJA/mJO8PHGiT9ld2xOWcAenQ=
X-Received: by 2002:aca:ab86:: with SMTP id u128mr1782866oie.29.1571292766182;
 Wed, 16 Oct 2019 23:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhs-H93MvRBPpR2ra33wf667V_wyDmQGWY0n_rB=puq_aBGog@mail.gmail.com>
 <87v9sopd5f.fsf@notabene.neil.brown.name>
In-Reply-To: <87v9sopd5f.fsf@notabene.neil.brown.name>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 17 Oct 2019 08:12:35 +0200
Message-ID: <CAMhs-H9p7aLah05ua5uRJMmLWjqq4DvnYsFVv6qGBaQcuQ2nVQ@mail.gmail.com>
Subject: Re: PCI support for SOC_MT7621
To:     NeilBrown <neil@brown.name>
Cc:     hauke@hauke-m.de, paul.burton@mips.com, linux-mips@vger.kernel.org,
        ralf@linux-mips.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Neil,

On Wed, Oct 16, 2019 at 11:57 PM NeilBrown <neil@brown.name> wrote:
>
> On Wed, Oct 16 2019, Sergio Paracuellos wrote:
>
> > Hi all,
> >
> > I have a concern about commit:
> >
> > c4d48cf5e2f0 ("MIPS: ralink: deactivate PCI support for SOC_MT7621")
> >
> > This commit make a regression for my kernel configuration for gnubee
> > board which is mt7621 SOC based and also has PCI. With this applied
> > PCI_DRIVERS_GENERIC is not selectable anymore and it becomes into a
> > PCI_DRIVERS_LEGACY configuration making impossible to compile
> > mt7621-pci driver for this board.
> >
> > I think this should be reverted. Am I missing something here?
>
> The commit reports a build error without the patch, and we don't want
> that.

I didn't understand properly the commit message. Yes, of course we
don't want a build
fail :).

> Maybe change the
>   select HAVE_PCI
> to
>   select HAVE_PCI if STAGING
> or
>   select HAVE_PCI if PCI_MT7621

I think the second one could be more accurate in this case.

>
> Hauke: do either of those fix your compile error?
>

If so, I don't have any problem to send a patch with this fixed if you
are busy. Just let me know.

> Thanks,
> NeilBrown

Best regards,
    Sergio Paracuellos
>
>
> >
> > Thanks in advance for your time.
> >
> > Best regards,
> >     Sergio Paracuellos
