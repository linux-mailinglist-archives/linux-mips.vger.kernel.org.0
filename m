Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238D811F788
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 12:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfLOL5d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 06:57:33 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42546 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfLOL5d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 06:57:33 -0500
Received: by mail-ed1-f65.google.com with SMTP id e10so2723860edv.9;
        Sun, 15 Dec 2019 03:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3bFRjA9UFM72dx5MZDZ0tLg6rOZz8LMmXjc51eyWHQw=;
        b=LORjAGDMBD4G92L6A+18TwkKXPDsotX/LoXS9FsmfuEr2sfuGrrpxXJzR27mPZg4IH
         I9t7+PXKJ6RrwYyNE2gr3BABRRtVZqxWhVGkW/mvI3uk5nhulJ2DyB3nR6LS8tO7fMhr
         9xA/gsSp1MifN47pUhQA/4J946N0vTZ1VnU+jrotNSX0DRAaZwJUqNC0aVILC2jri8xe
         g7mAIfTIXsl3F24wHWLlSFwtT94FtOhG0llkzZTyoIHcLFkFUQ6uL9QaNvwUDvmJoskt
         JUjzW9o8T+xRZpgtcBxy2j6uRBFXgAKZmb6D6COZIRuS5t46FkN+yaQSE+u/zKK6yknz
         Ob/A==
X-Gm-Message-State: APjAAAUqPL1Vt+B4mEbBC94TcLvKAxJmU1u/es7/oRIar6lXrL+hnEeY
        m1FlJGFB2BAo8CpocVN25NmOhfoe
X-Google-Smtp-Source: APXvYqwZaqP3BPfUD1WWLgwtYw1XJJ7Zy4zkrjF1M4qRiNjNshTKEWnoyc7zscsZ5R0wuEWiJvnvIw==
X-Received: by 2002:aa7:d306:: with SMTP id p6mr26042390edq.72.1576411050586;
        Sun, 15 Dec 2019 03:57:30 -0800 (PST)
Received: from kozik-lap ([194.230.155.234])
        by smtp.googlemail.com with ESMTPSA id l18sm663825edw.59.2019.12.15.03.57.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 03:57:29 -0800 (PST)
Date:   Sun, 15 Dec 2019 12:57:27 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
        john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, kgene@kernel.org, mripard@kernel.org,
        wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
        shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 02/10] soc: samsung: convert to
 devm_platform_ioremap_resource
Message-ID: <20191215115727.GB30973@kozik-lap>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
 <20191214175447.25482-2-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191214175447.25482-2-tiny.windzz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Dec 14, 2019 at 05:54:39PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 4 +---

Thanks, applied.

Best regards,
Krzysztof

