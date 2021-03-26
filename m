Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91CB3349D8E
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 01:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhCZAS2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 20:18:28 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:37377 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhCZASV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 20:18:21 -0400
Received: by mail-il1-f170.google.com with SMTP id z9so3677341ilb.4;
        Thu, 25 Mar 2021 17:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cQ49/BRSpA+BrnKpvm9V5uM5O4PaTolvQUFp43C9TjE=;
        b=Lx4zxwTsln31qDgC3f3MULddvhpcLsYldL+ZQbnp6/tgiVRoUPCEqm+YlxATBE6BXs
         yTzoPrBi6q082NdoESLSB0wyViU1pyg/X3nrDmpZo4rXlhWGTgHj5UAtoQQL8BEErNtB
         VQrL3oqgbax/BvDY+JD+enPKaLEW3rNj1cNIuz1CXtZEUW0OzOwyYrdKZiAKalbm1T8/
         a3qrQty5mnt0xaG5GW6K4YWZaNbrksdTCE5tuL1NdtYhfvCJWuYPrD4JbADqSXa3jfK3
         m2JYRp5t0HPqZXG4dvg/ll4qP+CvjHHpDREc9U3xfrS3Fug6xNT47rPq34Bh4C5+YdcX
         tHcQ==
X-Gm-Message-State: AOAM533kuKjGEgdojMkWpmWZeeZKY20X4bX56hEGwI9LkSr7NsfHgxlI
        3sCpheRaUSw7WXPO/48xhQ==
X-Google-Smtp-Source: ABdhPJy4NEO7Ki88utGVy0098DnNN27W98R3hyOzTwTO4wxccpgj8OFq6ByDXObkcCOy2yDZaHkd+g==
X-Received: by 2002:a05:6e02:219e:: with SMTP id j30mr8461778ila.196.1616717900908;
        Thu, 25 Mar 2021 17:18:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w9sm3489521iox.20.2021.03.25.17.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 17:18:20 -0700 (PDT)
Received: (nullmailer pid 2016095 invoked by uid 1000);
        Fri, 26 Mar 2021 00:18:17 -0000
Date:   Thu, 25 Mar 2021 18:18:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     robh+dt@kernel.org, hns@goldelico.com, paul@boddie.org.uk,
        linux-gpio@vger.kernel.org, paul@crapouillou.net,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        linux-kernel@vger.kernel.org, sernia.zhou@foxmail.com,
        linux-mips@vger.kernel.org, andy.shevchenko@gmail.com,
        devicetree@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v3 05/10] dt-bindings: pinctrl: Add bindings for new
 Ingenic SoCs.
Message-ID: <20210326001817.GA2016065@robh.at.kernel.org>
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1615975084-68203-6-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1615975084-68203-6-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Mar 2021 17:57:59 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add the pinctrl bindings for the JZ4730 SoC, the JZ4750 SoC,
> the JZ4755 SoC, the JZ4775 SoC and the X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v2:
>     New patch.
> 
>     v2->v3:
>     No change.
> 
>  .../bindings/pinctrl/ingenic,pinctrl.yaml          | 23 ++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
