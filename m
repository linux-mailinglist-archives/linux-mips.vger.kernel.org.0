Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C012B230AAB
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 14:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729901AbgG1MxN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 28 Jul 2020 08:53:13 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44250 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbgG1MxN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 08:53:13 -0400
Received: by mail-ed1-f65.google.com with SMTP id l23so1025273edv.11;
        Tue, 28 Jul 2020 05:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=aoCohgM246EUm7c+IU2iz8TlLWtEE6nHvR4AuaMzzq0=;
        b=A+RWy9RG/DaVQmClxni0+PQRH0Aq7wf4TN3x02G/8HQ8wXr9ZXUJdBtQMtfhVdNjPp
         UN7CCgPdFf8gDkvGnz51TavYCuJ+FtX3T0Xhv5NEldOeDJV1d158AK+UfgntsV7T5EPF
         PeZCD8vCjN2fHHpJ2SbbUXjG4BAVVOK8BTMsEgJStxu0dS2yPwkg+Z+4+x51/gNIlR/d
         4/dtdJ7Ma8fU0825tsQ1gJe0NWwP0YCvK0nDjqPFhGX2PqtQoaV5R/HdTEw3WKP8k/Rs
         x0aW2fOgZE8CakI7IJfaSlRYxJ/Z23Kw9z3zKC7pxxKaN4FxTXAAc14zmAu+v2VAU2ZA
         dIYQ==
X-Gm-Message-State: AOAM530SED0xhSSVB6in9U2c/LqrUyLKHx04ctQOSEvm5oRPowNXK6fX
        h4H2QMqDufrevcp9u10RgmcPDPf/ETyB2g==
X-Google-Smtp-Source: ABdhPJxH8Aapziu8x9pLUdnaSQlT6hli/1SMb8+n9iq8PlALrH7ZCRzaMDSKEa4FQvyxrSaFbhW38w==
X-Received: by 2002:aa7:d607:: with SMTP id c7mr531808edr.184.1595940791369;
        Tue, 28 Jul 2020 05:53:11 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id dc12sm7681660ejb.124.2020.07.28.05.53.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 05:53:10 -0700 (PDT)
Date:   Tue, 28 Jul 2020 14:53:08 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] MIPS: ingenic: Enable JZ4780_NEMC manually
Message-ID: <20200728125308.GA344@kozik-lap>
References: <20200728104503.23655-1-krzk@kernel.org>
 <20200728104503.23655-2-krzk@kernel.org>
 <B4F6EQ.WB2WZOY40FDR@crapouillou.net>
 <20200728111935.GA26683@kozik-lap>
 <20200728113702.GB13443@alpha.franken.de>
 <20200728120035.GA28766@kozik-lap>
 <NPJ6EQ.I4K2FZ2BHH1E@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <NPJ6EQ.I4K2FZ2BHH1E@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 28, 2020 at 02:51:23PM +0200, Paul Cercueil wrote:
> 
> 
> Le mar. 28 juil. 2020 à 14:00, Krzysztof Kozlowski <krzk@kernel.org> a écrit
> :
> > On Tue, Jul 28, 2020 at 01:37:02PM +0200, Thomas Bogendoerfer wrote:
> > >  On Tue, Jul 28, 2020 at 01:19:35PM +0200, Krzysztof Kozlowski wrote:
> > >  > On Tue, Jul 28, 2020 at 01:12:11PM +0200, Paul Cercueil wrote:
> > >  > > Hi Krzysztof,
> > >  > >
> > >  > > Le mar. 28 juil. 2020 à 12:45, Krzysztof Kozlowski
> > > <krzk@kernel.org> a écrit
> > >  > > :
> > >  > > > The CONFIG_JZ4780_NEMC was previously a default on MIPS but
> > > now it has
> > >  > > > to be enabled manually.
> > >  > > >
> > >  > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >  > >
> > >  > > I think you should swap the two so that there are no problems
> > > when
> > >  > > bisecting.
> > >  >
> > >  > Good point. I was thinking that it will go via some of MIPS trees
> > > and
> > >  > the patch #1 will just wait a cycle.  However with acks, I can
> > > take it
> > >  > through drivers/memory tree.
> > > 
> > >  I've acked the patch.
> > > 
> > >  Thomas.
> > 
> > Thanks but now I noticed that one of changed configs
> > (arch/mips/configs/rs90_defconfig) is only in MIPS tree.
> > 
> > I think it is easier then to take the patch #2 (configs) via MIPS and
> > wait with #1 for the next cycle or also take it via MIPS if it applies
> > cleanly.
> 
> Why not take them both in the MIPS tree then? Would that conflict with
> changes in your tree?

Exactly (last part of my sentence). There should be no conflicts.

Best regards,
Krzysztof

