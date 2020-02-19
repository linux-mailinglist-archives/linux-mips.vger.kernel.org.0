Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE6C1164E54
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 20:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgBSTEA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 14:04:00 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43960 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgBSTD7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 14:03:59 -0500
Received: by mail-pg1-f194.google.com with SMTP id u12so548405pgb.10;
        Wed, 19 Feb 2020 11:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=DiJoVOfQs//1PaWZFtx2QcGxz7nAwr47TsQFS3rNJQE=;
        b=PyBg1YXmPsU3qt0mtm2/q/MSn94DN4XK1POgkvqYJu429EAvsawZzE1HpBWRX1egmg
         dRZZPCeaMXU9ZgUWXs7zqprC0a2NnvmFijj/7OmTkpavVkyQ9nLlwto5Co4nE/aDUP5Y
         vN5wAzRKNWZ8mIfyyKQW5wneAsVFcN3uCVtudwEyUrvn3wa6W/eD6GDQ29OaOqr5eUtf
         zoDFmfPy6GjKRRcypnGpZCRnQ+TxEZZYrWIuoARB9VLQ60TE5tNIu6CGJeKobaNAeTde
         95cN6TiagLo08ClC07owTTL9pbL1MTBEgHBk1BOhv5Vx4aoRidqtK1jgiA+Iax5cmA+4
         NSRg==
X-Gm-Message-State: APjAAAVljcdgMQmWzsznfBHLNAKFqXFc8ihKNNRVZEkKh0r2Ly4VqWQF
        NLtweieTxM9aPVVbrKLmjN7MsrSFLyPePA==
X-Google-Smtp-Source: APXvYqx7/YKjuAjwK+VacNMDKFITTSWWqrTmLtv3O6oHG+s4MiEScrKPPtXEjw473ZTHkP0IX51N7Q==
X-Received: by 2002:a63:ec07:: with SMTP id j7mr28908332pgh.187.1582139038703;
        Wed, 19 Feb 2020 11:03:58 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id p23sm428286pgn.92.2020.02.19.11.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 11:03:57 -0800 (PST)
Message-ID: <5e4d869d.1c69fb81.aa02.151b@mx.google.com>
Date:   Wed, 19 Feb 2020 11:03:52 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Finn Thain <fthain@telegraphics.com.au>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?utf-8?q?Philippe_Math?= =?utf-8?q?ieu-Daud=C3=A9?= 
        <f4bug@amsat.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Bartlomiej Zolnierkiewicz" <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Improve MIPS Magnum support
References:  <cover.1581030073.git.fthain@telegraphics.com.au>
In-Reply-To:  <cover.1581030073.git.fthain@telegraphics.com.au>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Finn Thain wrote:
> A few minor patches are needed to more easily boot a MIPS Magnum build
> under QEMU. This series fixes a build failure in the g364fb driver and
> modifies jazz_defconfig for use with 'qemu-system-mips64el -M magnum'.
> 
> Note that QEMU's dp8393x implementation has bugs, one of which prevents
> the Linux jazzsonic driver from probing the chip. I have fixed the bugs
> that I know of in a series of patches at,
> https://github.com/fthain/qemu/commits/sonic
> 
> Changed since v1:
>  - Added reviewed-by and tested-by tags from Philippe Mathieu-Daudé.
>  - Rebased.
> 
> 
> Finn Thain (3):
>   fbdev/g364fb: Fix build failure
>   mips/jazz: Remove redundant settings and shrink jazz_defconfig
>   mips/jazz: Update jazz_defconfig for MIPS Magnum

Series applied to mips-next.

> fbdev/g364fb: Fix build failure
>   commit c584f9532115
>   https://git.kernel.org/mips/c/c584f9532115
>   
>   Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>   Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>   Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> mips/jazz: Remove redundant settings and shrink jazz_defconfig
>   commit a7047b8dd098
>   https://git.kernel.org/mips/c/a7047b8dd098
>   
>   Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> mips/jazz: Update jazz_defconfig for MIPS Magnum
>   commit 91f40e896444
>   https://git.kernel.org/mips/c/91f40e896444
>   
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
