Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637273C79B0
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jul 2021 00:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235871AbhGMWev (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Jul 2021 18:34:51 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:40801 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234665AbhGMWeu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Jul 2021 18:34:50 -0400
Received: by mail-io1-f47.google.com with SMTP id l5so29200150iok.7;
        Tue, 13 Jul 2021 15:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zJOGESND0RpQd7wW/8FnMhsqA7RcGpj0uSfi8+VGwv8=;
        b=d7aiPwQwPqRFfHSabmAxGeSg7gmcJ0vOFaNLZqRKX5fLPCKBbXpaUSSgrdd6B7mVKP
         gOmk4td9Tt3d0wm7V/77h7+/I1sarObKPNptgZ++KEArxDZZrs/M1q/NugO6DIVGEmaz
         jD9LcOuXQbegKKQ3jya3ugFSBkPhwz1WPs0HtTJznIa2aSQtC83A3E1HcJ6QuvRuIkRd
         rp+jIGwFp6AXQWKT3VnPC9ryfOX5CUzyyV7zl0uMN0D/2PXKCI+EtiGjMye5K+3FtA4K
         Fa2Uk9YK6vs4w56JtKWZCLxlx+Wed0VZqQEuR4K63AtEWheUOF3tyZdPGfl1biFH+2mw
         E4mA==
X-Gm-Message-State: AOAM530C17fFJpIZB3h69cPnMxV4TdYpsVP6bMpswZScI+UJw30Muf04
        aHdUpKvnjGNMFrpIRyt7YA==
X-Google-Smtp-Source: ABdhPJz1d46pu2vcSu76a7flxKU7PsAfKfnYCiNZXRXcLD6wsgGbAfyWQKyXycrFgMpK7yb8vPTy6A==
X-Received: by 2002:a05:6602:190:: with SMTP id m16mr4939448ioo.14.1626215519919;
        Tue, 13 Jul 2021 15:31:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f3sm84676iob.30.2021.07.13.15.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 15:31:59 -0700 (PDT)
Received: (nullmailer pid 968799 invoked by uid 1000);
        Tue, 13 Jul 2021 22:31:56 -0000
Date:   Tue, 13 Jul 2021 16:31:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     sihui.liu@ingenic.com, devicetree@vger.kernel.org,
        paul@crapouillou.net, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, linux-kernel@vger.kernel.org,
        sernia.zhou@foxmail.com, mturquette@baylibre.com,
        aric.pzqi@ingenic.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        rick.tyliu@ingenic.com, sboyd@kernel.org
Subject: Re: [PATCH v6 07/11] dt-bindings: clock: Add documentation for
 JZ4775 and X2000 bindings.
Message-ID: <20210713223156.GA968744@robh.at.kernel.org>
References: <1624981102-26248-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1624981102-26248-8-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1624981102-26248-8-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 29 Jun 2021 23:38:18 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add documentation for the clock bindings of the JZ4775 SoC and the
> X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v5:
>     New patch.
> 
>     v5->v6:
>     No change.
> 
>  Documentation/devicetree/bindings/clock/ingenic,cgu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
