Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B9D230953
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 14:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgG1MAk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 28 Jul 2020 08:00:40 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35930 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbgG1MAk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 08:00:40 -0400
Received: by mail-ed1-f66.google.com with SMTP id c15so4949830edj.3;
        Tue, 28 Jul 2020 05:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=N54ip3P6K7rrAhhQV8AruDSsoW1C0lfDWGh1kvqActM=;
        b=du4GXW6g/icY1B0qDuoTa53IxfnoJtCXIHSiTovgl3eaOUZUD7LZsC3cK1BV269F2P
         NXHbpFPV7lrFRxBShAnx0l9PCgE0vV9eTXwJYu15QyhWT8ITDbPcvThejfrslmRlXvWk
         i2qT68uKpXkMxOQUsHI6RGrDqr1DUmAa4Tt9+NGGbEOVbp6nVmADzwb4gWa8Zc06UsmA
         TBjI7cAZ+i+/MK4WFE5nYf8Mwoc1JOmuE2hx0n8xWDruG2hPo4Hoxsm8fqgT8gBvncok
         u3ArVR6EWjIeNCD1ajnjU2Rgjrd1+E2nCtxRtrEtdJB2VPk4kV0gqDkFw02DXrDZaZlx
         YjZA==
X-Gm-Message-State: AOAM533H4lj5LDfcUFDrZLHleAL1S2UwZ/EO3YvL7cGNByhy55K1G7ak
        bQusVvneYzUVhw8Isn28RA+/FwRIX4odyw==
X-Google-Smtp-Source: ABdhPJxmXR18rWiL8qfwbc+kpXUB9TsopfbbOV//pGexFQGuS8llgQb+3TDaB0n/oJHza763yiIpVQ==
X-Received: by 2002:aa7:d78b:: with SMTP id s11mr27004038edq.319.1595937637995;
        Tue, 28 Jul 2020 05:00:37 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id k22sm5572038edo.24.2020.07.28.05.00.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 05:00:37 -0700 (PDT)
Date:   Tue, 28 Jul 2020 14:00:35 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] MIPS: ingenic: Enable JZ4780_NEMC manually
Message-ID: <20200728120035.GA28766@kozik-lap>
References: <20200728104503.23655-1-krzk@kernel.org>
 <20200728104503.23655-2-krzk@kernel.org>
 <B4F6EQ.WB2WZOY40FDR@crapouillou.net>
 <20200728111935.GA26683@kozik-lap>
 <20200728113702.GB13443@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200728113702.GB13443@alpha.franken.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 28, 2020 at 01:37:02PM +0200, Thomas Bogendoerfer wrote:
> On Tue, Jul 28, 2020 at 01:19:35PM +0200, Krzysztof Kozlowski wrote:
> > On Tue, Jul 28, 2020 at 01:12:11PM +0200, Paul Cercueil wrote:
> > > Hi Krzysztof,
> > > 
> > > Le mar. 28 juil. 2020 à 12:45, Krzysztof Kozlowski <krzk@kernel.org> a écrit
> > > :
> > > > The CONFIG_JZ4780_NEMC was previously a default on MIPS but now it has
> > > > to be enabled manually.
> > > > 
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > 
> > > I think you should swap the two so that there are no problems when
> > > bisecting.
> > 
> > Good point. I was thinking that it will go via some of MIPS trees and
> > the patch #1 will just wait a cycle.  However with acks, I can take it
> > through drivers/memory tree.
> 
> I've acked the patch.
> 
> Thomas.

Thanks but now I noticed that one of changed configs
(arch/mips/configs/rs90_defconfig) is only in MIPS tree.

I think it is easier then to take the patch #2 (configs) via MIPS and
wait with #1 for the next cycle or also take it via MIPS if it applies
cleanly.

Best regards,
Krzysztof

