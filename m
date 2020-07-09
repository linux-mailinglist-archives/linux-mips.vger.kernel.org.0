Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE3821A8F9
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 22:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgGIU2n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 16:28:43 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:41640 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGIU2m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 16:28:42 -0400
Received: by mail-il1-f196.google.com with SMTP id q3so3155784ilt.8;
        Thu, 09 Jul 2020 13:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=f86UOLnCawtqhCK/Q6eF0gy2sdMy97aoXKHRFnr5wqE=;
        b=qSfbdyiNg0ZpEhW+E0tLnUJJc3dNxXbsrO7JJq+uDyftSceMPkDY1gJ4fDjVxpTxk6
         gtTkb6SY2EDkNOk0bMzIO2ZGeyn39f1ZeG9QlnrEqq5mgfnbES3WCWpUsiYRD7UOp7Km
         sZoSMaoPKVXD2WxmZTPfJP0QR1dCtIkHAq/iPcHi9aYRk62kjx8rvLQXEUHOGzGLYzsm
         YiFGOGieVwTVmXXAaQ1sg3pFS6Hn7BWIiNqAYpejuNcRFdZBe1aik53whtpq33x1t5kl
         3Zq9D0lx2i4u0BEcBhLGnvpVgrZEPPvFsfdT16fM9QHq7+hGE+292CKEi8moiN4G8dDQ
         zCXw==
X-Gm-Message-State: AOAM533d29PoMsIo/KYJGd8TAJtOPy1vtX/iqOF9IaSiwHVa/8YWqcu5
        uHD6BzLNzOPcnBe4fXiEiQ==
X-Google-Smtp-Source: ABdhPJw1ErPn0i/flIuVykZc4G9AUQr0yJoBYuG+gUne33UoponLiMSDnxOcY82bQJv9S7f+2E8S4g==
X-Received: by 2002:a05:6e02:e05:: with SMTP id a5mr45125941ilk.92.1594326521440;
        Thu, 09 Jul 2020 13:28:41 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id u65sm2619035iod.45.2020.07.09.13.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:28:40 -0700 (PDT)
Received: (nullmailer pid 834740 invoked by uid 1000);
        Thu, 09 Jul 2020 20:28:39 -0000
Date:   Thu, 9 Jul 2020 14:28:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     devicetree@vger.kernel.org, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com,
        linux-mips@vger.kernel.org, p.zabel@pengutronix.de,
        Florian Fainelli <F.fainelli@gmail.com>
Subject: Re: [PATCH v7 9/9] mips: bmips: add BCM6318 reset controller
 definitions
Message-ID: <20200709202839.GA834690@bogus>
References: <20200617105042.3824116-1-noltari@gmail.com>
 <20200617105042.3824116-10-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617105042.3824116-10-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Jun 2020 12:50:41 +0200, Álvaro Fernández Rojas wrote:
> BCM6318 SoCs have a reset controller for certain components.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <F.fainelli@gmail.com>
> ---
>  v7: no changes.
>  v6: fix BCM6318_RST_HOSTMIPS value (12 vs 11).
>  v5: no changes.
>  v4: no changes.
>  v3: add new path with BCM6318 reset controller definitions.
> 
>  include/dt-bindings/reset/bcm6318-reset.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/reset/bcm6318-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
