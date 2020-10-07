Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F68285C51
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 12:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgJGKEB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Oct 2020 06:04:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:47032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727257AbgJGKEB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 7 Oct 2020 06:04:01 -0400
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 083DB2076C;
        Wed,  7 Oct 2020 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602065040;
        bh=MC7ueB1e/HcDjLEXXXivK15vF7wcTOnOf1wMHSa4/kE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ds3SU5SgxDmoZ7N1/Kf52McZBUfzER2SrS8L2n4JjR0ACDyjy7L04Prh080wMpaKp
         bDYfiyD8ng6KPUrjG71g1NZeP24WcyQd5f/gqjL4xli+LhE2LIyyuU33w8DopQuUv9
         /ID5dVP3ThcTbG6IBGaHPXX8JNnF+Plo6qX30NCo=
Received: by mail-ej1-f44.google.com with SMTP id u21so2119680eja.2;
        Wed, 07 Oct 2020 03:03:59 -0700 (PDT)
X-Gm-Message-State: AOAM530NtdDd7NT/K5vLtkAhd5vIz5bQ6Y+gNDN2Oz+83wCdnLpzA+D+
        hL9f0NizCWxph/T2qd55zjfa2qMYp3K6Np7UoWk=
X-Google-Smtp-Source: ABdhPJwY3H9UKmpfG+K/L30qRXvWtUVJPPFubw7jMRswxHqZLul7Hj2vmJISYNWQOzKFs8ryldZeYG+0fyTXaoIP6Y0=
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr2394731ejx.215.1602065038501;
 Wed, 07 Oct 2020 03:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201005203451.9985-1-post@lespocky.de> <20201005203451.9985-3-post@lespocky.de>
 <20201007100213.GA12224@duo.ucw.cz>
In-Reply-To: <20201007100213.GA12224@duo.ucw.cz>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 7 Oct 2020 12:03:46 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdFOgJ=9BgbR2Bq=QHf00SjdScMPOKPF0OAy6TVgJkkRA@mail.gmail.com>
Message-ID: <CAJKOXPdFOgJ=9BgbR2Bq=QHf00SjdScMPOKPF0OAy6TVgJkkRA@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] dt-bindings: leds: Convert pwm to yaml
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 7 Oct 2020 at 12:02, Pavel Machek <pavel@ucw.cz> wrote:
>
> On Mon 2020-10-05 22:34:41, Alexander Dahl wrote:
> > The example was adapted in the following ways:
> >
> > - make use of the now supported 'function' and 'color' properties
> > - remove pwm nodes, those are documented elsewhere
> > - align node names to new dt schema rules and dt recommendations
> >
> > License was not explicitly set before.  The license set now is
> > recommended by DT project.
> >
> > Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > Cc: Russell King <linux@armlinux.org.uk>
> > ---
> >
> > Notes:
> >     NOTE: Due to license set/change this needs Acked-by or Signed-off-b=
y from:
> >       * Peter Ujfalusi
> >       * Russell King
>
> Russell King authored two lines of the documentation. He can state
> objections now, but I'll not wait for his Acked-by.
>
> >     That was discussed already with Peter (original author), still wait=
ing
> >     for Acked-by though =E2=80=A6
>
> If Peter was okay with license change, I guess we can continue here.

Having an Ack is not too much to ask to relicense the copyrights.

Best regards,
Krzysztof
