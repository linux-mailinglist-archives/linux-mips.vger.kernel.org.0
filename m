Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBB832890E
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 18:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236522AbhCARtX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 1 Mar 2021 12:49:23 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:47101 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238374AbhCARpo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 12:45:44 -0500
Received: by mail-ot1-f47.google.com with SMTP id k13so17257720otn.13
        for <linux-mips@vger.kernel.org>; Mon, 01 Mar 2021 09:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JK/sXL2qJqRtgCShNOd/RYVBzSpe0D9jmeKCtKhgwtw=;
        b=auH5+7gMw0JEtOpwcoblYw1K2PxzCypMSuHXW48CM4fsr8SUD21u2Z71hU2Y+4rF8z
         16HPTAbjL4j1ps+TsW4kVdtL+GV0hl/E84iEBdUt4aQEW7Q7cub2ZNa3U+Uo6qSqTbji
         r0R2cPTCQ5i0vT48fTipJvxSHNWukqHipRlui2fmN+L3tLTxpHMhhXWK87q8+I2Qy4Q9
         w141LXrT2Wlo7bGKxgDsFZcQvfIfGXfbagLYb1wYCOSDYFkEgU688dWIT7d1Ujgtv+3h
         gSSsexFnLCiXEjX7EkmcJ9DXCATR6cqlDwP3fOV2SzcPu9ICq14ShJWUI+AEKXXlTplv
         p3DQ==
X-Gm-Message-State: AOAM530i35Sy7CH9T3ZIjdAza28trahfUcaF6tH252tSFvYsfiCLfroQ
        U/kwN4XXKi/roiLqLzvWmXufhJWgSs7+fYSMdec=
X-Google-Smtp-Source: ABdhPJzArNFbcrQkulza61CcSxGMf43KTe9KQ1tSpgvRBclUtBfwb6ych205jWREsHGKlujOZ2BKNwPZ12YfvnxTyvw=
X-Received: by 2002:a9d:69c6:: with SMTP id v6mr14784912oto.371.1614620674705;
 Mon, 01 Mar 2021 09:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20210301073832.919371-1-hch@lst.de> <20210301073832.919371-3-hch@lst.de>
In-Reply-To: <20210301073832.919371-3-hch@lst.de>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Mon, 1 Mar 2021 18:44:23 +0100
Message-ID: <CAAdtpL4qCrLthiH-ijuKCbvgw-pkNsVMBLfK6H1-CXUsCs9nxw@mail.gmail.com>
Subject: Re: [PATCH 2/3] MIPS: bmips: include <linux/dma-direct.h> for phys_to_dma
To:     Christoph Hellwig <hch@lst.de>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 1, 2021 at 8:43 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Ensure this file has a prototype for phys_to_dma and dma_to_phys.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/bmips/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
