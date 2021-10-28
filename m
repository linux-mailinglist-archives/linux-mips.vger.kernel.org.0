Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B8543DADC
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 07:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhJ1FxQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 01:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhJ1FxQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 01:53:16 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D885AC061570;
        Wed, 27 Oct 2021 22:50:49 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id o12so12456613ybk.1;
        Wed, 27 Oct 2021 22:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VaomrYQ1d51bRDxbP3ThUOfH5GANVs2ObAPGMc2lid0=;
        b=RiAEh33TUVarWTOwHyJPeiErTuJXv3WkXZq96cRvShzC3ZwWokN4TqS6bmHCPNbomK
         O2o4Km31Tx2XKIuqsV2uWIGkvVOZag8x3GP7AKqNiFaGq1LipL2Z4WaDeUnBnSW82JyA
         0BjV/xXzBuSVyWxqy2+LDaay87/t8+kQ1ZNy9gUEylXJe0F6iU6lMG9GpsfGfxc0S5i5
         iQRqZfqSsqp1+CT2sgKI8d/vuddofPIVGR+opRxWdKjBqbTKRYSv1GhYILM8upDjFwsz
         vg+OLpuAmhf1Lpl83FHmeqkW0MXBz5gEf39g4dHBlzhrpep9YCn4cufLYTMgk2SxfY91
         7tPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VaomrYQ1d51bRDxbP3ThUOfH5GANVs2ObAPGMc2lid0=;
        b=vBNCdBH1F2dIHXZrWjKLNG8TQa0+YJkXQ45jKwCeKMjjAUCH9txExpzONy8VaMG2Z8
         1aHD5hBCbBghMppCc2AzhesSHffDGssDjsI82/uJM3H/9P1k93/VtoLXTcnfUKN4wjt2
         kL6lEWH5IbRRLSN5vt5uwTS7rX+PpxmdjWitK2ecY6s/qgeyEae7AECOWZKzg9qbLrIv
         uLAouqaTBMlLjEvt++M4WUHJ0UPEtHrSLvrOpBT2/OBjytlfp1te58MvJeRXCNm5NyxZ
         TeCHLtJ+a0SZdIrW4gtZLKh3APuOefMKQK/2bzhde/kw7YAQl80al8wVJo9jJP+BEGqY
         EKRg==
X-Gm-Message-State: AOAM532xB2+qzGvm2hbSZdYYxG60Rfb5gbBePeDRDzhMb/gEXOwHcHAf
        Htk4z8RtfJcf1UcYvVECdnljz1Lc3n+dfCJT8Gs=
X-Google-Smtp-Source: ABdhPJx8oT4ZMftk6imUoNt7UT21S+NzLHxKVEAE2R3oDQIMecOPrLZKfsdzqk3yK3cGqwBOezC9wUrMSOe1W+1Sqm8=
X-Received: by 2002:a25:ca93:: with SMTP id a141mr2259633ybg.415.1635400247862;
 Wed, 27 Oct 2021 22:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211027215531.9996-1-zajec5@gmail.com>
In-Reply-To: <20211027215531.9996-1-zajec5@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date:   Thu, 28 Oct 2021 07:50:36 +0200
Message-ID: <CACna6rwVy_XP3YzNeyzoQZQH8=JMqZfv5UV8WNp8uEWqUYpDdQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: add Broadcom's BCM63xx watchdog
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        linux-watchdog@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

=C5=9Br., 27 pa=C5=BA 2021 o 23:55 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.co=
m> napisa=C5=82(a):
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> It's a block that can be found on old MIPS devices as well as on
> relatively new BCM4908.

After receiving some feedback: please drop this patchset.
